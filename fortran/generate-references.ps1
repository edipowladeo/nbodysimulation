param(
    [int[]]$Days = @(1, 5, 30),
    [string]$Compiler = '',
    [string]$OutputRoot = '',
    [string]$Source = ''
)
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path $PSScriptRoot -Parent
if (!$Compiler) { $Compiler = Join-Path $repoRoot '.tools/mingw64/bin/gfortran.exe' }
if (!$OutputRoot) { $OutputRoot = Join-Path $repoRoot 'tests/reference/gfortran' }
$Compiler = (Resolve-Path $Compiler).Path
$compilerPath = "$(Split-Path $Compiler);$env:PATH"
Remove-Item Env:PATH -ErrorAction SilentlyContinue
$env:Path = $compilerPath
if (!$Source) { $Source = Join-Path $PSScriptRoot 'legacy_traj_us76_30dias_420000kg.for' }
$source = (Resolve-Path $Source).Path
if ($source -ne (Join-Path $PSScriptRoot 'legacy_traj_us76_30dias_420000kg.for') -and
    [IO.Path]::GetFullPath($OutputRoot).StartsWith((Join-Path $repoRoot 'tests/reference'), [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Candidate runs must not write into tests/reference.'
}
$sourceHash = (Get-FileHash $source -Algorithm SHA256).Hash
$encoding = [Text.Encoding]::GetEncoding(28591)
$original = [IO.File]::ReadAllText($source, $encoding)
$pattern = '(?m)^(\s*TINTE\s*=\s*)30\.000000D\+00'
if ([regex]::Matches($original, $pattern).Count -ne 1) { throw 'Expected exactly one original TINTE assignment.' }
$flags = @('-std=legacy', '-ffree-form', '-ffree-line-length-none', '-O0')
$version = (& $Compiler --version | Out-String).Trim()
if ($LASTEXITCODE -ne 0) { throw 'Compiler version check failed.' }
foreach ($day in $Days) {
    if ($day -notin @(1, 5, 30)) { throw 'Supported durations: 1, 5, 30 days.' }
    $destination = Join-Path $OutputRoot "us76_${day}day"
    if (Test-Path $destination) { throw "Reference already exists: $destination. Choose a new OutputRoot." }
    $buildDir = Join-Path $repoRoot "build/reference-us76-${day}day"
    New-Item -ItemType Directory -Force $buildDir | Out-Null
    New-Item -ItemType Directory $destination | Out-Null
    $destination = (Resolve-Path $destination).Path
    $scenarioSource = Join-Path $buildDir 'scenario.for'
    $scenario = [regex]::Replace($original, $pattern, ('${1}' + "$day.000000D+00"))
    [IO.File]::WriteAllText($scenarioSource, $scenario, $encoding)
    $exe = Join-Path $buildDir 'simulation.exe'
    $compileArgs = $flags + @(('"' + $scenarioSource + '"'), '-o', ('"' + $exe + '"'))
    $compile = Start-Process -FilePath $Compiler -ArgumentList $compileArgs -WindowStyle Hidden -Wait -PassThru -RedirectStandardError (Join-Path $destination 'compile.log')
    if ($compile.ExitCode -ne 0) { throw "Compilation failed for $day days." }
    $timer = [Diagnostics.Stopwatch]::StartNew()
    $run = Start-Process -FilePath $exe -WorkingDirectory $destination -WindowStyle Hidden -Wait -PassThru -RedirectStandardOutput (Join-Path $destination 'stdout.txt') -RedirectStandardError (Join-Path $destination 'stderr.txt')
    if ($run.ExitCode -ne 0) { throw "Simulation failed for $day days." }
    $timer.Stop()
    $expected = @{ ECI=5; EOG=15; V24=6; Lua=3; ECEF=5; GRT=3; TPH=9; IAA=6; USS76=2 }
    $outputs = @()
    foreach ($name in ($expected.Keys | Sort-Object)) {
        $path = Join-Path $destination $name
        if (!(Test-Path $path)) { throw "Missing output: $name" }
        $count = 0
        $lastLine = ''
        foreach ($line in [IO.File]::ReadLines($path)) {
            $tokens = $line.Trim() -split '\s+'
            if ($tokens.Count -ne $expected[$name]) { throw "Invalid column count in ${name}: $line" }
            foreach ($token in $tokens) {
                $number = 0.0
                if (![double]::TryParse($token.Replace('D','E'), [Globalization.NumberStyles]::Float, [Globalization.CultureInfo]::InvariantCulture, [ref]$number) -or [double]::IsNaN($number) -or [double]::IsInfinity($number)) { throw "Invalid number in ${name}: $token" }
            }
            $count++
            $lastLine = $line
        }
        if ($count -eq 0) { throw "Empty output: $name" }
        if ($name -eq 'ECI') {
            $lastTime = [double]::Parse(($lastLine.Trim() -split '\s+')[4], [Globalization.CultureInfo]::InvariantCulture)
            if ([Math]::Abs($lastTime - $day) -gt 0.00001) { throw "Simulation did not reach $day days: $lastTime" }
        }
        $outputs += [ordered]@{ name=$name; rows=$count; columns=$expected[$name]; bytes=(Get-Item $path).Length; sha256=(Get-FileHash $path).Hash }
    }
    [ordered]@{
        duration_days=$day; generated_utc=[DateTime]::UtcNow.ToString('o'); compiler=$version
        flags=$flags; source=$source; source_sha256=$sourceHash
        scenario_source_sha256=(Get-FileHash $scenarioSource).Hash; source_change="TINTE = $day.000000D+00"
        elapsed_seconds=$timer.Elapsed.TotalSeconds; final_time_days=$lastTime; outputs=$outputs
    } | ConvertTo-Json -Depth 6 | Set-Content (Join-Path $destination 'manifest.json') -Encoding UTF8
    Write-Host "Validated $day days: $destination ($($timer.Elapsed.TotalSeconds) seconds)."
}
