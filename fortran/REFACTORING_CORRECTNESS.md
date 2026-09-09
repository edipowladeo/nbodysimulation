# P5 — Corrigir dimensões, inicialização e persistência

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: pendente. Prioridade: P5.

- [ ] Corrigir declarações `X(1)`/`V(1)` de RA15 para dimensões compatíveis
  com NV e interfaces explícitas, verificando também o limite dos buffers de 18.
- [ ] Auditar tipos implícitos, inicializações e persistência de variáveis
  `DATA`/`SAVE`. Não introduzir inicialização global com zero para ocultar defeitos.
- [ ] Criar build de diagnóstico com avisos e verificações de limites após
  ajustar as interfaces. Não exigir trap de underflow para o legado conhecido.
- [ ] Separar correções físicas, novas constantes e otimizações de refatorações
  estruturais. Registrar impacto e justificativa; não substituir referências
  históricas para esconder diferenças.

Preservar a precisão efetiva nesta etapa. A revisão de precisão e dos eventos
IEEE está em [P7 — Precisão](REFACTORING_PRECISION.md), última prioridade.
