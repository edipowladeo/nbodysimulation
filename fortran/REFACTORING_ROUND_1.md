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
   antes de prosseguir. Não atualizar referências nem relaxar o critério para aprovar.

Não incluir alterações locais alheias à refatoração. Os testes unitários das
rotinas extraídas complementam a regressão e devem passar antes do commit.

## Acompanhamento

- Preparação anterior: `e2cbc40`, já em `main`, com 27/27 arquivos byte a byte.
- Rodada inicial do branch: registro deste fluxo; cálculos permanecem intactos.
  Validação em 2026-09-08: 1, 5 e 30 dias aprovados, 27/27 arquivos byte a byte.
  Relatório local: `build/regression-20260909-004945-e300c272fa1845cbbde15da0a0b2e1ce/regression.json`.
- Próximo passo técnico: continuar P1 com diagnóstico numérico de divergências,
  antes das extrações de P2. P1 permanece em andamento.
