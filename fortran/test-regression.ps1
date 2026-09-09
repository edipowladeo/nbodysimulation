param([string]$Compiler = '')
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path $PSScriptRoot -Parent
$runRoot = Join-Path $repoRoot ('build/regression-' + [DateTime]::UtcNow.ToString('yyyyMMdd-HHmmss') + '-' + [Guid]::NewGuid().ToString('N'))
$references = Join-Path $repoRoot 'tests/reference/gfortran'
$source = Join-Path $PSScriptRoot 'traj_us76.f90'
if (!$Compiler) { $Compiler = Join-Path $repoRoot '.tools/mingw64/bin/gfortran.exe' }
$Compiler = (Resolve-Path $Compiler).Path
New-Item -ItemType Directory -Path $runRoot | Out-Null
$comparator = Join-Path $runRoot 'compare-numeric.exe'
& $Compiler -std=f2008 -Wall -Wextra -Wno-compare-reals -fcheck=all -o $comparator "$PSScriptRoot/compare-numeric.f90"
if ($LASTEXITCODE -ne 0) { throw 'Diagnostic comparator compilation failed.' }
$schemas = @{ ECI=@(5,5); ECEF=@(5,5); EOG=@(15,1); GRT=@(3,3); IAA=@(6,1); Lua=@(3,0); TPH=@(9,9); USS76=@(2,0); V24=@(6,1) }
$names = @('ECI', 'ECEF', 'EOG', 'GRT', 'IAA', 'Lua', 'TPH', 'USS76', 'V24')
$results = @()
foreach ($day in @(1, 5, 30)) {
    & "$PSScriptRoot/generate-references.ps1" -Days $day -Compiler $Compiler -Source $source -OutputRoot $runRoot
    $actualDir = Join-Path $runRoot "us76_${day}day"
    $referenceDir = Join-Path $references "us76_${day}day"
    $baseline = Get-Content -Raw (Join-Path $referenceDir 'manifest.json') | ConvertFrom-Json
    $actual = Get-Content -Raw (Join-Path $actualDir 'manifest.json') | ConvertFrom-Json
    if ($actual.compiler -cne $baseline.compiler -or ($actual.flags -join ' ') -cne ($baseline.flags -join ' ')) {
        throw "Compiler/flags differ from baseline. Inspect $actualDir"
    }
    foreach ($name in $names) {
        $expectedPath = Join-Path $referenceDir $name
        $actualPath = Join-Path $actualDir $name
        $record = @($baseline.outputs | Where-Object name -CEQ $name)
        if ($record.Count -ne 1 -or (Get-FileHash $expectedPath).Hash -ine $record[0].sha256) {
            throw "Reference integrity failure: $expectedPath"
        }
        # Base64 is a lossless encoding: equality checks every byte, including whitespace.
        $equal = [Convert]::ToBase64String([IO.File]::ReadAllBytes($expectedPath)) -ceq [Convert]::ToBase64String([IO.File]::ReadAllBytes($actualPath))
        $diagnosticPath = Join-Path $actualDir "$name.numeric.txt"
        $diagnostic = Start-Process -FilePath $comparator -ArgumentList @(('"' + $expectedPath + '"'), ('"' + $actualPath + '"'), $schemas[$name][0], $schemas[$name][1]) -WindowStyle Hidden -Wait -PassThru -RedirectStandardOutput $diagnosticPath -RedirectStandardError (Join-Path $actualDir "$name.numeric.stderr.txt")
        $results += [ordered]@{ days=$day; file=$name; byte_exact=$equal; numeric_exit_code=$diagnostic.ExitCode; actual_sha256=(Get-FileHash $actualPath).Hash }
    }
    Write-Host "Compared $day days against immutable references."
}
$passed = @($results | Where-Object { !$_.byte_exact -or $_.numeric_exit_code -ne 0 }).Count -eq 0
[ordered]@{ passed=$passed; source_sha256=(Get-FileHash $source).Hash; comparisons=$results } |
    ConvertTo-Json -Depth 6 | Set-Content (Join-Path $runRoot 'regression.json') -Encoding UTF8
if (!$passed) { throw "Byte differences found. Stop refactoring and investigate: $runRoot/regression.json" }
Write-Host "PASS: all 27 files are byte-exact. Report: $runRoot/regression.json"
