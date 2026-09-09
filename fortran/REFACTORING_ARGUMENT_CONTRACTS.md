# P2 — Contratos de entrada, saída e mutação

Plano: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Etapa: [Módulos e testes](REFACTORING_MODULES_TESTS.md).
Estado: implementado e validado. Prioridade: P2.

Os procedimentos Output, Force, PotGrav, Arrasto, PRS e RA15 declaram agora
`intent(in)`, `intent(out)` e `intent(inout)` nos argumentos, mantendo seus
tipos e dimensões. O compilador verifica que os argumentos de entrada não
são modificados pelos procedimentos.

Output recebe apenas entradas. Force retorna F; PotGrav, Arrasto e PRS
retornam suas componentes de aceleração. RA15 modifica X, V e XL, retorna
TINST e recebe os demais parâmetros como entradas. XL permanece mutável porque
o legado aplica a direção temporal ao passo inicial dentro do integrador.

As anotações não eliminam I/O, STOP, dados persistentes nem variáveis locais
sem inicialização. Não tornam as rotinas puras; apenas explicitam seus contratos.

Validação: testes unitários e regressão de 1, 5 e 30 dias aprovados; 27/27
arquivos byte a byte. Relatório:
`build/regression-20260909-034740-2bdb78a8d9cc42e5bc281b8923a3edae/regression.json`.
