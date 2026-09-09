# Referências do cenário US76

A cópia de trabalho para refatoração é `traj_us76.f90`, inicialmente idêntica
ao legado. Etapas e critérios de validação estão em
[REFACTORING_PLAN.md](REFACTORING_PLAN.md).

`legacy_traj_us76_30dias_420000kg.for` é uma cópia byte a byte de
`../fortran-legacy/traj_us76_30dias_420000kg.for`: massa de 420.000 kg,
área de 2.000 m², SD = 6 e duração original de 30 dias. Não foi refatorado.

## Compilador

GNU Fortran 16.2.0, distribuição WinLibs x86_64 / UCRT / POSIX, instalado
localmente em `../.tools/mingw64`. A origem e o SHA-256 publicado pelo
GitHub estão em `compiler-download.json`; o arquivo baixado foi conferido
antes da extração. O compilador não foi adicionado ao PATH global.

Para reinstalar a mesma distribuição, execute na raiz do repositório:

```powershell
$metadata = Get-Content .\fortran\compiler-download.json -Raw | ConvertFrom-Json
New-Item -ItemType Directory -Force .tools | Out-Null
Invoke-WebRequest $metadata.browser_download_url -OutFile .tools/winlibs.zip
$hash = (Get-FileHash .tools/winlibs.zip).Hash.ToLowerInvariant()
if ("sha256:$hash" -ne $metadata.digest) { throw 'Checksum incorreto' }
tar -xf .tools/winlibs.zip -C .tools
```

## Gerar resultados

Na raiz do repositório:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\fortran\generate-references.ps1
```

O script compila separadamente 1, 5 e 30 dias, substituindo somente `TINTE`
em cópias de trabalho em `build/`. Flags:
`-std=legacy -ffree-form -ffree-line-length-none -O0`.

As referências estão em `tests/reference/gfortran/us76_{1,5,30}day/`.
Cada pasta contém os nove arquivos numéricos originais (`ECI`, `EOG`, `V24`,
`Lua`, `ECEF`, `GRT`, `TPH`, `IAA`, `USS76`), logs e `manifest.json` com
compilador, flags, duração, hashes e dimensões dos arquivos. A validação
confere colunas, valores finitos e tempo final em dias no arquivo ECI.

O script recusa sobrescrever referências existentes. Para uma nova execução:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\fortran\generate-references.ps1 -OutputRoot .\build\reference-repeat
```

Estas são referências produzidas pelo **gfortran**, não pelo PowerStation.
Não foi feita comparação entre os dois compiladores nem validação física.
Os avisos sobre vetores declarados com tamanho 1 no integrador foram
preservados em `compile.log`; o fonte continua intacto.
As três execuções terminaram com código 0 e sinalizaram `IEEE_UNDERFLOW_FLAG`
e `IEEE_DENORMAL` em `stderr.txt`. As saídas passaram pela verificação de
valores finitos; esses avisos devem ser investigados durante a refatoração.

`FIXED = .false.` foi preservado: os tempos de saída acompanham o integrador
adaptativo e não devem ser presumidos uniformes. Muitos campos usam cinco
casas decimais. As futuras comparações precisam considerar tempos, unidades,
precisão de escrita e periodicidade angular ao definir tolerâncias.

Para validar cada passo da refatoração do candidato:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\fortran\test-regression.ps1
```

Esse comando sempre executa 1, 5 e 30 dias, exige igualdade byte a byte dos
27 arquivos e salva o relatório em `build/regression-*/regression.json`.
Uma divergência bloqueia commit/push e exige investigação antes de continuar.
