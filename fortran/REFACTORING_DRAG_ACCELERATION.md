# P2 — Aceleração de arrasto

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: concluído e validado na rodada 14. Prioridade: P2.

Extração das quatro atribuições de magnitude e componentes SI de Arrasto
para drag_acceleration_si, pura, com entradas explícitas de densidade,
coeficiente, área, massa, componentes da velocidade e módulo já calculado.
Preservar double precision, literal 0.5, expressões e ordem das operações.
Não tratar a singularidade legada em velocidade zero. Densidade, I/O USS76,
cálculo de V e Deg e transformações permanecem no wrapper.

Aceitação: magnitude controlada, direção oposta, escala de área e massa,
arrasto nulo com densidade/área zero e velocidade não nula; testes nos dois
executores e regressão obrigatória de 1, 5 e 30 dias, 27/27 byte a byte.

## Evidências de 2026-09-09

- Módulo: fortran/src/drag_acceleration.f90; somente as quatro atribuições
  Ac/Ax/Ay/Az foram extraídas. A interface mantém entradas e saídas double precision.
- Suíte test_drag_acceleration compartilhada com os dois executores, incluindo
  checagens de finitude nos casos não nulos; cinco suítes aprovadas em ambos.
- Unitários: build/unit-b602bae0f4e24b128780cf60868ca86b.
- fpm build/test-drive: build/fpm-b6ed5158a7bb47489204751923d326a9.
- Regressão: build/regression-20260909-191115-37880e6f45f14d6bab99b61d8f559119/regression.json.
  As 27 comparações de 1, 5 e 30 dias passaram byte a byte. Diferença nas
  saídas: zero; diagnóstico numérico adicional não solicitado/não executado.
- Cobertura restrita a US76/SD6; não constitui validação física. Avisos legados
  IEEE_UNDERFLOW_FLAG/IEEE_DENORMAL permanecem. Singularidade V=0 preservada.
- Diff revisado; checagem dos arquivos da tarefa aprovada. A checagem global
  aponta somente espaços finais/linha vazia preexistentes em TODO-Human-inputs.md.

Backups dos três documentos compartilhados em build/task-handoff/p2-drag/;
reorganização documental local preservada. Publicação a cargo do coordenador.
