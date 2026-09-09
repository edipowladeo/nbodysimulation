# P7 — Revisar a precisão numérica

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: pendente. Prioridade: última etapa, após P1–P6.

## Objetivo

Usar o máximo da precisão nativa disponível na plataforma de execução para
os cálculos reais, com tipos, constantes e operações consistentes. Não limitar
antecipadamente a solução a 64 bits: identificar o que o hardware, compilador
e linguagem de destino oferecem nativamente e documentar a escolha.
Suporte do compilador a um tipo maior não comprova execução nativa pelo
hardware; distinguir precisão nativa de precisão estendida por software.
Inteiros, índices e valores lógicos devem manter tipos adequados à sua função.

## Evidência no legado

RA15 usa `IMPLICIT REAL*8 (A-H,O-Z)`, mas declara `TVAL` e `PW` como
`REAL*4`. A atribuição `TVAL=DABS(T)` reduz a precisão do passo, e
`TVAL**7` é calculado em precisão simples. `PW=1./9.` calcula a divisão
na precisão real padrão. Esses valores participam de `HV` e do cálculo
adaptativo `TP=(SS/HV)**PW*DIR`.

Alterar somente o tipo de destino não recupera a precisão perdida na
expressão. Promover esses cálculos pode mudar os passos aceitos, a malha
temporal, o número de avaliações e os resultados acumulados.

## Execução

- [ ] Concluir as etapas estruturais P1–P6 preservando a precisão efetiva atual.
- [ ] Inventariar tipos reais, literais, conversões, expressões intermediárias,
  interfaces e precisão dos arquivos de entrada/saída.
- [ ] Investigar as operações que geram `IEEE_UNDERFLOW_FLAG` e
  `IEEE_DENORMAL` nas referências; não assumir que promover tipos as resolve.
- [ ] Identificar a maior precisão nativa disponível no ambiente alvo e
  registrar hardware, compilador, flags, dígitos significativos e faixa
  de expoentes. Avaliar também a representação correspondente em Kotlin/Rust.
- [ ] Definir um kind central para cálculos reais, escolhido explicitamente
  conforme esse levantamento, sem presumir que o número do kind indica bytes.
- [ ] Aplicar o kind a variáveis, argumentos, constantes e expressões.
  Por exemplo, usar `1.0_rk / 9.0_rk` com `rk` definido no módulo de precisão.
- [ ] Promover uma mudança numérica por vez, começando pelos pontos mapeados
  de RA15, sem combinar correções físicas ou mudanças de algoritmo.
- [ ] Evitar promoção indiscriminada por flags globais: verificar interfaces,
  literais e comportamento real do compilador explicitamente.

## Validação e conclusão

- [ ] Executar os cenários de 1, 5 e 30 dias e registrar erros absolutos e
  relativos por grandeza, divergências de tempos e quantidade de registros.
- [ ] Quando as malhas divergirem, explicitar a metodologia para comparar
  estados em tempos comuns; não interpolar silenciosamente no comparador.
- [ ] Executar testes com solução conhecida e estudos de convergência;
  verificar conservação apenas nos modelos conservativos apropriados.
- [ ] Usar diagnósticos com dígitos suficientes para avaliar a precisão interna;
  os arquivos históricos arredondados não demonstram ganho de precisão.
- [ ] Justificar tolerâncias e diferenças aceitas com evidência numérica,
  sem considerar toda divergência do legado um erro ou toda promoção uma melhoria.
- [ ] Preservar as referências históricas; se necessário, versionar novas
  referências separadamente com a justificativa e configuração de precisão.
- [ ] Atualizar o estado de P7 no plano principal com resultados e limitações.

A etapa só termina quando a escolha de precisão nativa estiver documentada,
os cálculos estiverem consistentes com ela e o impacto numérico estiver validado.
