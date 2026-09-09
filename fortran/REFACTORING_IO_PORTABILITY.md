# P6 — Isolar I/O e preparar a migração

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: pendente. Prioridade: P6.

- [ ] Abrir arquivos uma vez, controlar fechamento e erros no escritor,
  preservando o conteúdo e a frequência dos nove arquivos existentes.
- [ ] Injetar observação/diagnóstico por interfaces explícitas para que o
  integrador e o arrasto possam ser testados sem escrever arquivos.
- [ ] Documentar contrato das funções, unidades, convenções de coordenadas,
  formatos de saída e casos singulares, utilizável por Kotlin ou Rust.
- [ ] Exportar casos unitários independentes do framework Fortran para reuso
  na linguagem de destino, além das referências completas existentes.
- [ ] Avaliar otimização e escolha da linguagem depois de estabelecer a
  biblioteca modular e as comparações numéricas reproduzíveis.
