# P2 — Separação do programa e das rotinas de dinâmica

Plano: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Etapa: [Módulos e testes](REFACTORING_MODULES_TESTS.md).
Estado: implementado e validado. Prioridade: P2.

`traj_us76_30dias_420000kg_updated.f90` contém agora somente o programa principal.
Output, Force, PotGrav, Arrasto, PRS e RA15 foram movidas para o módulo
`src/us76_dynamics.f90`. Seus corpos foram preservados sem mudanças nesta rodada.
O programa importa RA15; as chamadas entre procedimentos do módulo têm
interfaces explícitas verificadas pelo compilador.

Ajustes prévios de `X(NV)`/`V(NV)` permitem essa separação sem mascarar erros
de argumentos. Não foram introduzidas classes, herança, polimorfismo, alterações
de precisão, mudanças de física ou de arquivos de saída.

O executor compila coordenadas, normalização de tempo e dinâmica nessa ordem.
Os testes unitários compilam a biblioteca completa com verificações de execução;
os avisos do código preservado ficam nos logs de compilação, sem serem
confundidos com falha de compilação. Os programas de teste continuam independentes
do programa de simulação. A biblioteca ainda contém I/O e condições STOP;
sua separação permanece em P2/P6.

RA15 ainda utiliza a declaração implícita histórica. Sua explicitação deve ser
uma rodada separada, preservando inclusive TVAL/PW em REAL*4 até P7.

Validação: testes unitários e regressão de 1, 5 e 30 dias aprovados; 27/27
arquivos byte a byte. Programa principal com 254 linhas. Relatório:
`build/regression-20260909-034026-3b76b5cb0529437ba223ea6e42f99420/regression.json`.
