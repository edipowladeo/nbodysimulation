$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path $PSScriptRoot -Parent
$compiler = Join-Path $repoRoot '.tools/mingw64/bin/gfortran.exe'
$compilerPath = "$(Split-Path $compiler);$env:PATH"
Remove-Item Env:PATH -ErrorAction SilentlyContinue
$env:Path = $compilerPath
$work = Join-Path $repoRoot ('build/unit-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory $work | Out-Null
$modules = @(Get-ChildItem "$PSScriptRoot/src" -Filter '*.f90' | Sort-Object Name | ForEach-Object FullName)
foreach ($test in (Get-ChildItem "$PSScriptRoot/unit" -Filter 'test_*.f90' | Sort-Object Name)) {
    $exe = Join-Path $work ($test.BaseName + '.exe')
    $compileArgs = @('-std=legacy', '-ffree-line-length-none', '-O0', '-Wall', '-Wextra', '-Wno-compare-reals', '-fcheck=all', '-J', ('"' + $work + '"'), '-o', ('"' + $exe + '"')) + @($modules | ForEach-Object { '"' + $_ + '"' }) + @('"' + $test.FullName + '"')
    $compile = Start-Process -FilePath $compiler -ArgumentList $compileArgs -WindowStyle Hidden -Wait -PassThru -RedirectStandardError (Join-Path $work ($test.BaseName + '.compile.log'))
    if ($compile.ExitCode -ne 0) { throw "Compilation failed: $($test.Name). See $work" }
    $stdout = Join-Path $work ($test.BaseName + '.stdout.txt')
    $run = Start-Process -FilePath $exe -WindowStyle Hidden -Wait -PassThru -RedirectStandardOutput $stdout -RedirectStandardError (Join-Path $work ($test.BaseName + '.stderr.txt'))
    Get-Content $stdout | Write-Host
    if ($run.ExitCode -ne 0) { throw "Unit test failed: $($test.Name). See $work" }
}
Write-Host "PASS: unit tests. Logs: $work"
