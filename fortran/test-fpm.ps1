$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path $PSScriptRoot -Parent
$fpm = Join-Path $repoRoot '.tools/fpm/fpm.exe'
$digest = '89f34d8cc3cface54a06785e9e1d7a2c16a07e6acd18f7c5d7e5cf95a5eaa671'
if (-not (Test-Path -LiteralPath $fpm)) {
    New-Item -ItemType Directory -Force (Split-Path $fpm) | Out-Null
    Invoke-WebRequest 'https://github.com/fortran-lang/fpm/releases/download/v0.13.0/fpm-0.13.0-windows-x86_64-gcc-12.exe' -OutFile $fpm
}
if ((Get-FileHash -LiteralPath $fpm -Algorithm SHA256).Hash.ToLowerInvariant() -ne $digest) {
    throw 'fpm SHA-256 mismatch; expected official Windows fpm 0.13.0.'
}
$savedPath = $env:Path
Remove-Item Env:PATH -ErrorAction SilentlyContinue
$env:Path = "$(Join-Path $repoRoot '.tools/mingw64/bin');$savedPath"
$work = Join-Path $repoRoot ('build/fpm-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory $work | Out-Null
Push-Location $repoRoot
try {
    # The root manifest keeps dependency and compiler artifacts under build/.
    $flags = '-std=legacy -ffree-line-length-none -O0 -Wall -Wextra -Wno-compare-reals -fcheck=all'
    foreach ($command in @('build', 'test')) {
        $arguments = @($command, '--build-dir', 'build', '--compiler', 'gfortran', '--flag', ('"' + $flags + '"'))
        if ($command -eq 'build') { $arguments += '--tests' }
        $stdout = Join-Path $work ($command + '.stdout.log')
        $stderr = Join-Path $work ($command + '.stderr.log')
        $process = Start-Process -FilePath $fpm -ArgumentList $arguments -WindowStyle Hidden -Wait -PassThru -RedirectStandardOutput $stdout -RedirectStandardError $stderr
        Get-Content $stdout, $stderr | Write-Host
        if ($process.ExitCode -ne 0) { throw "fpm $command failed. See $work" }
    }
    Write-Host "PASS: fpm build and test-drive. Logs: $work"
} finally {
    Pop-Location
    $env:Path = $savedPath
}
