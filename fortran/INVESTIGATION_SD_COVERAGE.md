# Investigação — cobertura SD1 a SD7

Plano: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Ponto: [Cenários](REFACTORING_SCENARIOS.md). Prioridade: P1/P5.
Estado: tentativa isolada, não aprovada para `refactor/round-1`.
Branch: `investigation/round-1-sd-coverage`.

## Falha e reprodução

O gerador desta tentativa aceita `-Systems 1,2,3,4,5,6,7` e distingue os oito
arquivos comuns do USS76, presente somente em SD4 e SD6.
Com o fonte legado original, SD1, SD2, SD3, SD4, SD5 e SD7 terminam com código
de processo 0, mas ECI contém somente a amostra inicial, em 0 dias.
O cenário SD6 completa 1 dia. As referências históricas de SD6 não foram alteradas.

Comando de reprodução, usando PowerShell com ExecutionPolicy Bypass:
`./fortran/generate-references.ps1 -Systems 1 -Days 1 -OutputRoot ./build/reproduce-sd1`

No SD1, stdout apresentou `Tempo de estabilidade = 8.1520831563805680E-322`.
Stderr indicou IEEE_INVALID_FLAG, IEEE_DIVIDE_BY_ZERO, IEEE_UNDERFLOW_FLAG e
IEEE_DENORMAL. A validação recusou a saída: `Simulation did not reach 1 days: 0`.
Resultados locais do probe dos sete modos:
`build/scenario-probe-ef58e29259a047c7bf6ebb70c6a69913/`.

## Causa identificada e tentativa de correção

Em Force, Acx/Acy/Acz, Arx/Ary/Arz e Aprx/Apry/Aprz recebem valores apenas
quando suas respectivas perturbações estão ativadas. Porém as nove componentes
são usadas nas transformações e na soma final das acelerações em todos os modos.
SD6 chama as três perturbações; os outros modos deixam ao menos um grupo sem
atribuição. Esses usos de valores indefinidos tornam o resultado não confiável.

A cópia candidata deste branch inicializa as nove componentes com `0D0` antes
da seleção PERT. Com essa mudança, todos os seis modos que falhavam completaram
1 dia e passaram nas verificações de colunas, finitude e tempo final.
Resultados locais: `build/zero-perturbations-probe-62000f6fa26b44f7966faea23d049b52/`.

## Significância e decisão

Não é erro pequeno de arredondamento: o legado não entrega a trajetória pedida.
Não existe correspondência temporal entre sua única amostra e a série corrigida;
um erro máximo de posições não representaria uma comparação de trajetórias.
As saídas corrigidas não podem ser rotuladas como referências do legado intacto.
Não foram geradas referências oficiais para esses modos nem afrouxadas tolerâncias.

Não foram executados 5/30 dias corrigidos nem validada a física nesta investigação
breve. Também há uma leitura de V(9) na própria primeira atribuição no programa
principal, que deve ser investigada separadamente. Zerar perturbações não prova
que todas as inicializações foram corrigidas.

Preservar esta tentativa fora do round 1. Próxima decisão necessária para
incorporar a cobertura: definir uma família de referências explicitamente
corrigida, validar os novos cenários e sua estabilidade; não substituir SD6.
O round 1 continua com regressão byte a byte de SD6 em 1, 5 e 30 dias.
