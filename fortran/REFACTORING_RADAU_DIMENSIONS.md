# P2/P5 — Dimensões de posição e velocidade no RA15

Plano: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: implementado e validado. Prioridade: pré-requisito de P2, antecipado de P5.

O RA15 declarava os argumentos `X(1)` e `V(1)`, embora acessasse até `NV`
elementos. O chamador fornece 12 posições e 12 velocidades. As declarações
passam a `X(NV)` e `V(NV)`, mantendo o argumento NV existente e a mesma
passagem dos dados, sem cópia, mudança de índices ou de operações numéricas.

Ajustar esses contratos permite interfaces explícitas e elimina os avisos de
que as chamadas Force/Output receberam argumentos com apenas um elemento.
Os buffers internos de 18 elementos continuam intactos. O simulador atual
usa NV=12; não está validado como integrador genérico de outras dimensões.
As questões de inicialização e precisão continuam separadas.

Validação: testes unitários aprovados; 27/27 arquivos byte a byte em 1, 5 e
30 dias. Os três logs de compilação não apresentam mais os avisos de tamanho.
`build/regression-20260909-033741-33535f4a7c9e4f8595bfdcad8043b25a/regression.json`.
