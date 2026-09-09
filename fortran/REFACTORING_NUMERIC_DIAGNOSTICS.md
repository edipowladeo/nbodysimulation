# P1 — Diagnóstico numérico das saídas

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Etapa: [Regressão](REFACTORING_REGRESSION.md).
Estado: implementado. Prioridade: P1.

`compare-numeric.f90` é um executável Fortran independente do simulador.
Lê dois arquivos por linhas e valida quantidade de colunas, sintaxe numérica
e finitude. Usa `real64` somente para analisar valores já escritos nos arquivos;
não modifica a precisão do simulador nem substitui a comparação de bytes.

Argumentos: `referencia candidato numero_colunas coluna_tempo`.
A coluna de tempo é 0 quando o arquivo não contém tempo explícito.
Códigos de saída: 0 para igualdade numérica, 1 para diferença numérica,
2 para erro estrutural, entrada inválida ou erro de leitura/cálculo diagnóstico.

O executor de regressão roda esse diagnóstico para os 27 arquivos e salva
`NOME.numeric.txt` e `NOME.numeric.stderr.txt` junto às saídas de cada cenário.
O relatório JSON inclui o código de saída do comparador. Aprovação exige
simultaneamente igualdade de bytes e diagnóstico sem erros.

## Interpretação

- Informa primeiro registro/coluna divergente e primeiro registro divergente
  por coluna, erro absoluto máximo e erro relativo máximo por coluna.
- Erro relativo: `abs(candidato-referencia)/abs(referencia)`, excluindo referências
  iguais a zero; nesses registros usar o erro absoluto. Não usa denominador artificial.
- Conferência temporal: ECI/ECEF coluna 5, EOG/V24/IAA coluna 1, TPH coluna 9,
  GRT coluna 3. Lua e USS76 não têm coluna temporal explícita.
- Se os tempos divergem, emite aviso: os erros são por índice de registro e
  não devem ser interpretados como diferenças no mesmo instante. Não interpola.
- Quantidades diferentes de linhas encerram o diagnóstico no primeiro registro
  sem par; não calcula estatísticas de séries desalinhadas ou ignora linhas extras.
- Não classifica a significância física automaticamente. Tolerâncias por unidade
  e distância angular periódica permanecem para análise específica quando houver
  divergência. A aprovação continua estritamente byte a byte.

## Validação

`powershell -NoProfile -ExecutionPolicy Bypass -File fortran/test-comparator.ps1`
compila com avisos e verificações de execução e testa 11 casos: igualdade com
formatação diferente, diferença de valor, diferença temporal, referência zero,
quantidade de linhas, coluna extra, coluna ausente, NaN, overflow, sintaxe de
lista inválida e entrada vazia. Formatação diferente pode ter igualdade numérica,
mas continuará reprovada pelo requisito de bytes do executor de regressão.
