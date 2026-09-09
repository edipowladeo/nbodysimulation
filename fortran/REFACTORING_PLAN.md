# Plano de refatoração do simulador US76

## Objetivo e ponto de partida

Preparar o simulador para testes unitários e futura migração para Kotlin ou
Rust, preservando o comportamento numérico a cada alteração estrutural.

- [x] Criar `traj_us76_30dias_420000kg_updated.f90`, cópia byte a byte de `traj_us76_30dias_420000kg_legacy.for`.
- [x] Preservar o legado e as referências de 1, 5 e 30 dias em `../tests/reference/gfortran/`.
- [x] Documentar este plano. A implementação começou pelo executor de regressão P1.

O nome `.f90` identifica o formato livre; não significa que o código já foi
modernizado. O script `generate-references.ps1` continua usando o arquivo
`..._legacy.for`. As futuras execuções do candidato devem usar `traj_us76_30dias_420000kg_updated.f90`
e gravar em `build/`, sem regenerar ou sobrescrever as referências.

## Mapa do fonte inicial

As linhas são as da cópia inicial e mudarão durante a refatoração.

| Trecho | Responsabilidade atual | Separação desejada |
| --- | --- | --- |
| Programa principal, linhas 22–254 | Entradas, escolha de SD, constantes, normalização, estado inicial e execução | Configuração, validação, criação do estado e programa principal pequeno |
| `Output`, linha 256 | Transformações, elementos orbitais, observação e escrita | Funções de cálculo e escritor de arquivos separados |
| `Force`, linha 639 | Gravitação, perturbações, transformações e colisões | Composição das acelerações e detecção de eventos |
| `PotGrav`, linha 829 | Potencial gravitacional expandido | Modelo gravitacional com coeficientes explícitos |
| `Arrasto`, linha 1047 | Atmosfera US76, arrasto e escrita de USS76 | Densidade atmosférica, aceleração de arrasto e diagnóstico separados |
| `PRS`, linha 1244 | Pressão de radiação solar e condições geométricas | Geometria/iluminação e aceleração testáveis |
| `RA15`, linha 1300 | Integrador, controle de passo e chamadas de saída | Integrador com interfaces explícitas para forças e observação |

## Prioridades e acompanhamento

Round ativo: [Round 1 — branch, PR e validação por rodada](REFACTORING_ROUND_1.md).
Todas as próximas rodadas deste round devem usar `refactor/round-1` e o mesmo
PR aberto, com destino a `main`. Não fazer merge nem encerrar o PR durante o round.

Executar na ordem abaixo. A revisão de precisão é a última etapa; nas etapas
P1–P6, preservar a precisão efetiva, as expressões e a ordem das operações.
Ajustes de interfaces/dimensões necessários para a compilação de P2 devem ser
antecipados de P5 como mudanças isoladas e registrados nos dois pontos.

**Diretriz de arquitetura: preferir composição a herança**, tanto em Fortran
quanto na futura migração para Kotlin ou Rust.

| Prioridade | Ponto | Estado | Detalhamento |
| --- | --- | --- | --- |
| P1 | Proteção de regressão e comparação com referências | Em andamento | [Regressão](REFACTORING_REGRESSION.md) |
| P2 | Módulos, interfaces e extração de procedimentos testáveis | Em andamento | [Módulos e testes](REFACTORING_MODULES_TESTS.md) |
| P3 | Separação de inputs, configurações, constantes e estado | Pendente | [Configuração e composição](REFACTORING_CONFIGURATION.md) |
| P4 | Eliminação de todos os GOTOs do candidato | Pendente | [Fluxo estruturado](REFACTORING_CONTROL_FLOW.md) |
| P5 | Dimensões, inicialização e persistência das variáveis | Pendente | [Correção das declarações e estado](REFACTORING_CORRECTNESS.md) |
| P6 | Isolamento de I/O e contratos para portabilidade | Pendente | [I/O e portabilidade](REFACTORING_IO_PORTABILITY.md) |
| P7 — última | Revisão da precisão: usar o máximo da precisão nativa disponível | Pendente | [Precisão numérica](REFACTORING_PRECISION.md) |

Detalhamento adicional de P1: [Diagnóstico numérico](REFACTORING_NUMERIC_DIAGNOSTICS.md).
Cobertura e organização: [Cenários SD1 a SD7](REFACTORING_SCENARIOS.md).
Extração de P2: [Transformações de coordenadas](REFACTORING_COORDINATE_TRANSFORMS.md).
Extração de P2: [Normalização do tempo](REFACTORING_TIME_NORMALIZATION.md).
Pré-requisito de P2 antecipado de P5: [Dimensões do RA15](REFACTORING_RADAU_DIMENSIONS.md).
P2 prossegue com a proteção byte a byte de SD6; a ampliação de P1 foi isolada
por falhas de inicialização no legado, conforme o detalhamento de cenários.

## Regra para detalhamento e rastreabilidade

Todo ponto de refatoração que receber detalhamento deve ter um arquivo `.md`
próprio, vinculado na tabela deste plano principal. Os detalhamentos existentes
foram separados seguindo essa regra; aplicar o mesmo padrão aos novos pontos.
Cada arquivo deve indicar sua prioridade, estado e link de retorno a este plano.

Manter neste plano a ordem, o escopo resumido e o estado de cada ponto.
Manter no arquivo específico os passos, decisões, evidências, testes e critérios
de aceitação. Ao iniciar, concluir ou bloquear uma etapa, atualizar ambos;
registrar dependências e qualquer alteração de prioridade sem perder o vínculo.

## Critério de conclusão de cada alteração

Após cada passo, executar regressão de **1, 5 e 30 dias**, exigindo igualdade
**byte a byte** dos nove arquivos de saída. Somente após aprovação executar
commit e push. Se houver divergência, interromper as refatorações e investigar
a significância do erro antes de decidir como prosseguir, sem atualizar as
referências ou relaxar o critério automaticamente.

Registrar o que mudou, testes unitários relevantes, cenário de regressão
executado, maior erro encontrado e eventuais limitações. Uma diferença
inesperada interrompe a sequência de refatorações até ser entendida.
As referências atuais cobrem US76/SD=6; outros modos precisam de casos
próprios. Compatibilidade com o legado não constitui validação física.
