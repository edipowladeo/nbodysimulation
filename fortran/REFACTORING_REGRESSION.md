# P1 — Criar a proteção de regressão antes de alterar cálculos

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: em andamento. Prioridade: P1.

- [x] Criar executor do candidato com duração configurável e saída isolada.
- [x] Compilar a cópia inicial com as mesmas flags das referências:
  `-std=legacy -ffree-form -ffree-line-length-none -O0`.
- [x] Executar 1, 5 e 30 dias e estabelecer a comparação byte a byte dos nove arquivos.
- [x] Implementar comparador numérico em Fortran, conferindo
  arquivos presentes, registros, colunas, tempos, valores finitos e diferenças.
- [x] Registrar erro absoluto/relativo máximo e primeiro registro divergente
  por arquivo e coluna. Detalhes: [Diagnóstico numérico](REFACTORING_NUMERIC_DIAGNOSTICS.md).
- [ ] Definir tolerâncias por grandeza e unidade, respeitando as cinco casas
  decimais de várias saídas; usar distância angular periódica quando aplicável.
  Inicialmente procurar igualdade exata dos números com o mesmo compilador.
  Não relaxar tolerâncias automaticamente para fazer uma alteração passar.
- [ ] Preservar `FIXED = .false.` e a ordem das chamadas de saída. Conferir a
  malha temporal antes dos valores: não interpolar silenciosamente divergências
  de passo adaptativo. `Lua`, `GRT` e `USS76` têm esquemas diferentes; `USS76`
  acompanha avaliações do arrasto, não a mesma sequência de registros de ECI.
- [x] Automatizar os três cenários (1, 5 e 30 dias) após cada passo. Commit e
  push somente com igualdade byte a byte; divergências exigem investigação.
- [x] Fixar compilador/flags nas comparações. Preservar manifestos e hashes.

## Primeiro passo implementado

Executar `powershell -NoProfile -ExecutionPolicy Bypass -File fortran/test-regression.ps1`.
O executor compila o candidato, valida formato, finitude e duração usando o
gerador existente e compara os 27 arquivos, incluindo espaços e quebras de linha.
Confere compilador/flags e hashes das referências antes da comparação.
Os resultados e `regression.json` ficam em diretório único sob `build/`.
Logs de compilação/execução e manifestos não são saídas numéricas comparáveis
byte a byte, pois contêm caminhos e tempos de execução.

O `.gitattributes` preserva os bytes dos arquivos de referência em novos checkouts.
O comparador numérico diagnóstico foi implementado em Fortran. As tolerâncias
por grandeza continuam pendentes; não são utilizadas para aprovar divergências
de bytes. Qualquer futura análise por `abs(a-b) <= atol + rtol*abs(b)` deve
justificar tolerâncias e alinhamento temporal antes de interpretar os erros.

Validação em 2026-09-08: **27/27 arquivos idênticos byte a byte**, cenários
de 1, 5 e 30 dias, gfortran 16.2.0 e flags originais. Candidato sem mudanças
nos cálculos. Relatório local:
`build/regression-20260909-001413-639134f3d08e47a69f6bf6cfd9d25dcf/regression.json`.
