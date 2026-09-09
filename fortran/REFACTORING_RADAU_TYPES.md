# P2 — Tipos explícitos no RA15

Plano: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Etapa: [Módulos e testes](REFACTORING_MODULES_TESTS.md).
Estado: implementado e validado. Prioridade: P2.

Substituir `IMPLICIT REAL*8(A-H,O-Z)` por `implicit none` e declarações
explícitas. O inventário foi conferido pelo compilador: nomes iniciados em
I–N que não tinham declaração mantêm tipo inteiro; os demais mantêm precisão
dupla. Declarações explícitas existentes de massas e parâmetros foram preservadas.
`TVAL` e `PW` continuam `REAL*4`, e a expressão `PW=1./9.` permanece intacta.

O módulo `us76_dynamics` também passa a usar `implicit none`. Todas as unidades
do candidato e dos módulos têm então tipos explícitos, sem alterar cálculos,
constantes, persistência por DATA ou ordem das operações.

Esta rodada não resolve valores usados antes de serem inicializados: declarar
o tipo não define um valor. Os problemas de inicialização permanecem em P5.

Validação: testes unitários e regressão de 1, 5 e 30 dias aprovados; 27/27
arquivos byte a byte. Relatório:
`build/regression-20260909-034351-6544760906a34528933e1c1d73c5e9ee/regression.json`.
