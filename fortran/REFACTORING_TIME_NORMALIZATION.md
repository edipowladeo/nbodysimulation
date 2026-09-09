# P2 — Conversões de tempo testáveis

Plano: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Etapa: [Módulos e testes](REFACTORING_MODULES_TESTS.md).
Estado: implementado e validado. Prioridade: P2.

`src/time_normalization.f90` contém funções puras de conversão entre dias e
tempo normalizado. `period_days` e `pi` são entradas explícitas; nenhuma
constante física nem espécie de precisão foi alterada.

As funções preservam `(2*pi/period_days)*days` e `(period_days*time)/(2*pi)`.
São usadas na duração da integração, na conversão do tempo final e nos tempos
calculados por Force. O produto final por 24 continua fora da função quando
o chamador precisa de horas. A expressão `TM*TN/(2*PI)` de Output permanece
no lugar, para preservar a ordem dos operandos nesta extração.

Os testes Fortran verificam zero, um período completo equivalente a `2*pi`
e 61 conversões de ida e volta de -30 a 30 dias. Período válido e positivo
permanece uma pré-condição; validação das configurações pertence a P3.

Validação: testes unitários de coordenadas e tempo aprovados; regressão de
1, 5 e 30 dias com 27/27 arquivos byte a byte. Relatório:
`build/regression-20260909-033116-fedcf79e63cb4774889d315af71db5e8/regression.json`.
