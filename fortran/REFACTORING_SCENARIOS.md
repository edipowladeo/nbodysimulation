# P1 — Organização e cobertura de cenários

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: em andamento. Prioridade: P1, antes de extrair cálculos.

## Rodada 2 — nomes e diretórios

- Fonte preservado: `traj_us76_30dias_420000kg_legacy.for`.
- Candidato: `traj_us76_30dias_420000kg_updated.f90`.
- Referências: `tests/reference/gfortran/us76/420000kg/SD6/{1,5,30}Day/`.
- Os arquivos foram movidos, sem regenerar resultados nem alterar seus bytes.
  Os manifestos históricos mantêm os caminhos usados na geração original.
- READMEs apontam diretamente para a versão escolhida; scripts seguem os novos caminhos.
- Validação: 27/27 arquivos byte a byte em 1, 5 e 30 dias. Relatório:
  `build/regression-20260909-031644-e548dac6ed904a638d1145cb795b2d6a/regression.json`.

## Próxima rodada

Ampliar geração e regressão para SD1 a SD7, sempre 1, 5 e 30 dias.
Cada referência nova deve vir do legado, mudando apenas SD e TINTE na cópia
temporária. Modos sem arrasto não produzem USS76; verificar saídas conforme o modo.
Se um cenário legado não for válido/reproduzível, documentar a investigação
em branch separado, sem acrescentar referências inválidas ao round 1.
