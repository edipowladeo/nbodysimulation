# P2 — Introduzir módulos, interfaces e testes unitários

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: em andamento. Prioridade: P2.

Primeira extração e testes: [Transformações de coordenadas](REFACTORING_COORDINATE_TRANSFORMS.md).
Executor unitário disponível: `powershell -NoProfile -ExecutionPolicy Bypass -File fortran/test-unit.ps1`.

- [ ] Organizar biblioteca de cálculo separada do executável e dos testes.
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
