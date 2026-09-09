# P3 — Separar inputs, configuração, constantes e estado

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: pendente. Prioridade: P3.

**Diretriz de arquitetura: preferir composição a herança.** Aplicar essa
preferência tanto na refatoração Fortran quanto na futura portabilidade para
Kotlin ou Rust. Reutilizar comportamento e agrupar dados por componentes e
procedimentos, evitando hierarquias de herança como solução padrão.

Fortran suporta tipos derivados (`type`) e orientação a objetos. Para agrupar
entradas, usar tipos de dados por composição e procedimentos de módulo.
Herança e despacho polimórfico não são necessários nesta etapa. `class(...)`
é usado para entidades polimórficas, não é o equivalente direto da declaração
de uma classe Kotlin. Um tipo derivado não gera automaticamente os métodos
`equals`, `hashCode`, `copy` e `toString` de uma `data class` Kotlin.

Referência: [tipos derivados em Fortran](https://fortran-lang.org/fr/learn/quickstart/derived_types/).

| Tipo proposto | Conteúdo |
| --- | --- |
| `spacecraft_config` | Massa, área, coeficiente de arrasto e reflexão |
| `orbital_elements` | Semieixo maior, excentricidade e ângulos com unidades documentadas |
| `observer_config` | Latitude, longitude e elevação mínima |
| `integrator_config` | LL, passo inicial, intervalo de saída e FIXED |
| `simulation_config` | Duração, cenário dinâmico e composição das configurações anteriores |
| `physical_model` | Massas dos corpos e parâmetros físicos selecionados para o modelo |
| `normalization_scales` | Escalas de comprimento, velocidade e tempo |
| `simulation_state` | Posições, velocidades e tempo, separados das entradas |
| `radau_workspace` | Buffers e estado interno do integrador, separados das configurações |

- [ ] Passar configuração com `intent(in)` e modificar somente estado/workspace
  explicitamente. Evitar uma única estrutura global contendo todos os dados.
- [ ] Ler cenários de arquivos `NAMELIST` de 1, 5 e 30 dias, sem recompilar.
  Usar variáveis de leitura e convertê-las em tipos validados, se necessário.
- [ ] Validar duração, massas, área, excentricidade, códigos de cenário e
  parâmetros do integrador; emitir erros claros em configurações inválidas.
- [ ] Nomear campos com unidade quando útil (`mass_kg`, `duration_days`,
  `semi_major_axis_km`); documentar graus/radianos e estado normalizado.
- [ ] Centralizar constantes matemáticas, conversões de unidades e constantes
  físicas, distinguindo-as de parâmetros editáveis e coeficientes dos modelos.
- [ ] Transformar tabelas US76 e coeficientes gravitacionais/Radau em arrays
  nomeados, preservando todos os dígitos, índices e intervalos originais.
- [ ] Substituir códigos SD/PERT/NCLASS e índices dos corpos por constantes
  nomeadas; distinguir modos físicos, tipos de equação e seleção de perturbações.
- [ ] Conferir valores repetidos antes de unificá-los. Exemplo: inclinação lunar
  aparece com 22 graus na inicialização e 23 em Force; registrar e investigar
  a diferença em vez de corrigi-la junto com a extração de constantes.
