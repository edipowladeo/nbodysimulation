# Round 1 — execução e revisão

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: em andamento. Prioridade: seguir P1 a P7 na ordem do plano principal.

## Branch e pull request

- Branch de trabalho: `refactor/round-1`.
- Base do PR: `main`, a partir de `e2cbc40` (preparação e executor de regressão).
- Manter um único PR aberto para este round. Não fazer merge nem fechar o PR.
- Fazer os próximos commits e pushes neste branch, atualizando o mesmo PR.

## Regra por rodada

1. Implementar uma mudança isolada e atualizar o detalhamento correspondente.
2. Executar `powershell -NoProfile -ExecutionPolicy Bypass -File fortran/test-regression.ps1`.
3. Exigir igualdade byte a byte nos nove arquivos de cada cenário: 1, 5 e 30 dias.
4. Se passar nos 27 arquivos, registrar a evidência, fazer commit e push no branch.
5. Se falhar, interromper a sequência e investigar a significância da divergência
   e tentar uma correção breve. Se não houver correção ou se o erro for pequeno,
   preservar a tentativa e um MD de análise em branch `investigation/round-1-*`.
   Retornar ao último estado aprovado de `refactor/round-1` e seguir com o próximo
   passo independente. Não atualizar referências nem relaxar o critério para aprovar.

Não incluir alterações locais alheias à refatoração. Os testes unitários das
rotinas extraídas complementam a regressão e devem passar antes do commit.

## Acompanhamento

- Rodada 10: [contratos de argumentos](REFACTORING_ARGUMENT_CONTRACTS.md),
  testes unitários e regressão 27/27 byte a byte aprovados.

- Rodada 9: [tipos explícitos do RA15](REFACTORING_RADAU_TYPES.md), precisão
  preservada; testes unitários e regressão 27/27 byte a byte aprovados.

- Rodada 8: [programa separado do módulo de dinâmica](REFACTORING_DYNAMICS_MODULE.md),
  testes unitários e regressão 27/27 byte a byte aprovados.

- Rodada 7: [dimensões do RA15](REFACTORING_RADAU_DIMENSIONS.md), sem mudança
  de cálculos; testes unitários e regressão 27/27 byte a byte aprovados.

- Rodada 6: diagnóstico numérico sob demanda, testes do comparador/unitários
  e regressão de 1, 5 e 30 dias aprovados; 27/27 byte a byte.

- Rodada 5: [normalização de tempo](REFACTORING_TIME_NORMALIZATION.md), testes
  unitários e regressão de 1, 5 e 30 dias aprovados, 27/27 byte a byte.

- Rodada 2: nomes e caminhos organizados, commit `1371e4d`, regressão 27/27.
- Rodada 3 isolada: cobertura SD1–SD7, commit `5306de5` no branch
  `investigation/round-1-sd-coverage`; análise vinculada em [Cenários](REFACTORING_SCENARIOS.md).
- Rodada 4: extração de posições em [módulo de coordenadas](REFACTORING_COORDINATE_TRANSFORMS.md),
  quatro testes unitários e regressão de 1, 5 e 30 dias, 27/27 byte a byte.

- Preparação anterior: `e2cbc40`, já em `main`, com 27/27 arquivos byte a byte.
- Rodada inicial do branch: registro deste fluxo; cálculos permanecem intactos.
  Validação em 2026-09-08: 1, 5 e 30 dias aprovados, 27/27 arquivos byte a byte.
  Relatório local: `build/regression-20260909-004945-e300c272fa1845cbbde15da0a0b2e1ce/regression.json`.
- Rodada técnica 1: [diagnóstico numérico em Fortran](REFACTORING_NUMERIC_DIAGNOSTICS.md)
  integrado ao executor; 11 casos controlados aprovados. P1 permanece em andamento.
  Regressão aprovada: 1, 5 e 30 dias, 27/27 arquivos byte a byte e diagnósticos
  numéricos com código 0. Relatório local:
  `build/regression-20260909-011850-e72b6175c3a24b1f8ee5f488f9aadd66/regression.json`.
