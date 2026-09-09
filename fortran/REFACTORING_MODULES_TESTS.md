# P2 — Introduzir módulos, interfaces e testes unitários

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: em andamento. Prioridade: P2.

Primeira extração e testes: [Transformações de coordenadas](REFACTORING_COORDINATE_TRANSFORMS.md).
Extração validada da Lua e sonda: [Estado orbital relativo](REFACTORING_ORBITAL_STATE.md).
Segunda extração: [Normalização do tempo](REFACTORING_TIME_NORMALIZATION.md).
Pré-requisito para interfaces: [Dimensões do RA15](REFACTORING_RADAU_DIMENSIONS.md), antecipado de P5.
Declarações: [Tipos explícitos do RA15](REFACTORING_RADAU_TYPES.md).
Interfaces: [Contratos dos argumentos](REFACTORING_ARGUMENT_CONTRACTS.md).
Executor unitário disponível: `powershell -NoProfile -ExecutionPolicy Bypass -File fortran/test-unit.ps1`.

- [ ] Organizar biblioteca de cálculo separada do executável e dos testes.
  Programa e rotinas separados em [módulo de dinâmica](REFACTORING_DYNAMICS_MODULE.md);
  I/O ainda presente na biblioteca, a isolar em P6.
- [ ] Configurar `fpm` e `test-drive` para testes unitários em Fortran.
  Manter fontes de referência fora dos alvos compilados, evitando dois programas principais.
- [ ] Extrair uma rotina por alteração, preservando expressões, ordem de soma,
  unidades e precisão. Adicionar interfaces explícitas, `intent(in/out/inout)`
  e `implicit none` em todas as unidades, incluindo RA15.
- [ ] Extrair normalização/desnormalização, rotações de coordenadas, conversão
  de elementos orbitais em estado, cálculo dos elementos orbitais e geometria
  do observador. Marcar como `pure` apenas rotinas sem efeitos colaterais.
- [ ] Testar rotações inversas e conservação de norma, conversões de unidades,
  órbitas circulares/equatoriais e singularidades dos elementos orbitais.
- [ ] Isolar densidade US76 e testar fronteiras das faixas de altitude, com
  valores nos dois lados e no limite; verificar o comportamento previsto pelo modelo.
- [ ] Isolar cada aceleração e testar casos controlados: gravitação de dois
  corpos, arrasto nulo e direção oposta à velocidade relativa atmosférica,
  pressão solar e condições de iluminação.
- [ ] Separar `STOP`/`PRINT` das funções físicas: retornar estado de execução
  ou evento de colisão para o programa principal decidir como encerrar.
- [ ] Testar o integrador com problemas de solução conhecida, além da regressão.
  Verificar energia/momento em cenário conservativo; não exigir conservação
  de energia mecânica no cenário com arrasto.

## Rodada 12 — densidade US76

- [x] Isolar densidade e verificar fronteiras e ambos os lados: [detalhamento](REFACTORING_ATMOSPHERE_DENSITY.md).
  Extração validada com 54 amostras do legado, suíte unitária e regressão
  27/27 byte a byte; o item de densidade acima está atendido quanto à
  compatibilidade legada. Validação física do modelo não foi realizada.

## Rodada 13 — fpm e test-drive

- [x] Configurar fpm e test-drive: [detalhamento](REFACTORING_FPM.md).
  Biblioteca, candidato e quatro suítes com alvos explícitos e dependência
  fixada; executor independente preservado. Testes e regressão 27/27 byte
  a byte aprovados. O item de configuração acima está atendido nesta rodada.

## Rodada 14 — aceleração de arrasto

- [x] Extração validada: [detalhamento](REFACTORING_DRAG_ACCELERATION.md).
Magnitude e componentes SI isolados; transformações e I/O permanecem em Arrasto.
Cinco suítes aprovadas nos executores independente e test-drive; regressão
27/27 byte a byte. Demais acelerações permanecem pendentes.
