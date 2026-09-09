# P4 — Remover todos os GOTO do candidato

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: pendente. Prioridade: P4.

- [ ] Inventariar saltos por rotina e caracterizar as condições de cada caminho.
- [ ] Começar pelos saltos locais em `Output` e `Force`, usando `if`/`else`
  ou retorno local quando equivalente; adicionar testes dos ramos envolvidos.
- [ ] Converter `DO` com rótulo em `do ... end do`, preservando instruções que
  compartilham o rótulo final e a ordem de atualização dos índices.
- [ ] Substituir os dois `GO TO (...) ,J` de RA15 por `select case (J)`.
  Preservar os limites e o comportamento dos ramos, sem reordenar expressões.
- [ ] Substituir saltos para fim de iteração por `cycle`, com laços nomeados
  onde houver aninhamento, e saídas de laço por `exit`.
- [ ] Estruturar reinício da primeira sequência (`4000`), avanço (`722`),
  aceitação/redução do passo e término da integração como laços e procedimentos.
  Testar reinícios, limite de tentativas, último passo, passo fixo/adaptativo
  e integração reversa quando suportada.
- [ ] Remover rótulos de fluxo sem uso; rótulos de `FORMAT` não são GOTO e
  podem ser substituídos separadamente por formatos nomeados.
- [ ] Confirmar ausência de GOTO executável no candidato e em seus módulos,
  sem exigir alteração do arquivo legado preservado.
