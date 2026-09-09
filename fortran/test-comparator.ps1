$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path $PSScriptRoot -Parent
$compiler = Join-Path $repoRoot '.tools/mingw64/bin/gfortran.exe'
$compilerPath = "$(Split-Path $compiler);$env:PATH"
Remove-Item Env:PATH -ErrorAction SilentlyContinue
$env:Path = $compilerPath
$work = Join-Path $repoRoot ('build/comparator-tests-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory $work | Out-Null
$exe = Join-Path $work 'compare.exe'
& $compiler -std=f2008 -Wall -Wextra -Wno-compare-reals -fcheck=all -o $exe "$PSScriptRoot/compare-numeric.f90"
if ($LASTEXITCODE -ne 0) { throw 'Compilation failed' }
$cases = @(
    @{ name='equal'; reference="1 2`n3 4"; candidate="1D0  2.0`n3 4"; code=0; evidence='first_different_row=0' },
    @{ name='value'; reference='1 2'; candidate='1 3'; code=1; evidence='first_different_column=2' },
    @{ name='time'; reference='1 2'; candidate='2 2'; code=1; evidence='first_different_time_row=1' },
    @{ name='zero'; reference='0 0'; candidate='0 1'; code=1; evidence='1.0000000000000000E+000' },
    @{ name='rows'; reference="1 2`n3 4"; candidate='1 2'; code=2; evidence='row_count_mismatch_at=2' },
    @{ name='extra-column'; reference='1 2'; candidate='1 2 3'; code=2 },
    @{ name='missing-column'; reference='1 2'; candidate='1'; code=2 },
    @{ name='nonfinite'; reference='1 2'; candidate='1 NaN'; code=2 },
    @{ name='overflow'; reference='1 2'; candidate='1 1E999'; code=2 },
    @{ name='list-syntax'; reference='1 2'; candidate='1 2,3'; code=2 },
    @{ name='empty'; reference=''; candidate=''; code=2 }
)
foreach ($case in $cases) {
    $reference = Join-Path $work 'reference.txt'
    $candidate = Join-Path $work 'candidate.txt'
    [IO.File]::WriteAllText($reference, $case.reference)
    [IO.File]::WriteAllText($candidate, $case.candidate)
    $stdout = Join-Path $work ($case.name + '.txt')
    $run = Start-Process -FilePath $exe -ArgumentList @(('"' + $reference + '"'), ('"' + $candidate + '"'), 2, 1) -WindowStyle Hidden -Wait -PassThru -RedirectStandardOutput $stdout -RedirectStandardError (Join-Path $work ($case.name + '.stderr.txt'))
    if ($run.ExitCode -ne $case.code) { throw "$($case.name): expected $($case.code), got $($run.ExitCode). See $work" }
    if ($case.evidence -and !([IO.File]::ReadAllText($stdout).Contains($case.evidence))) { throw "Missing evidence: $($case.name)" }
}
Write-Host "PASS: $($cases.Count) comparator cases. Logs: $work"
