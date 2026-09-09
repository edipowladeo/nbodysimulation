# P2 — Densidade atmosférica US76

Plano: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Etapa: [Módulos e testes](REFACTORING_MODULES_TESTS.md).
Estado: extração concluída e validada. Prioridade: P2.

A rotina pura `us76_density(h,R,de)`, em `src/atmosphere_density.f90`,
recebe altitude em km e o denominador efetivo R de Arrasto. O bloco de
faixas foi transferido literalmente, preservando os tipos double precision,
literais de precisão simples/mista, expressões, ordem e comparações.
Arrasto mantém transformações, cálculo de altitude/raio, escrita USS76 e
aceleração; sua única mudança executável é a chamada da rotina extraída.

R começa como 287.053 no legado, mas é sobrescrito pelo raio geocêntrico em
metros antes do cálculo P/(R*TMo). Esse comportamento foi preservado pelo
argumento explícito; não houve correção do modelo físico. A faixa superior
usa o polinômio exponencial e não depende de R.

O domínio com atribuição é [0,1000] km. Fora dele o legado não atribui de;
a interface usa intent(inout) e preserva o valor recebido. Arrasto continua
sem inicializar de nesses casos. Não foram acrescentados fallback, sentinela
na produção ou validação de entradas; futuras correções exigem tarefa própria.

O teste `unit/test_atmosphere_density.f90` contém 54 valores congelados,
obtidos antes da extração a partir do bloco original com o mesmo compilador
GNU Fortran 16.2.0 e flags legadas. Exercita as 18 fronteiras 0, 11, 20, 32,
47, 51, 71, 86, 91, 100, 110, 120, 150, 200, 300, 500, 750 e 1000 km, cada
uma no limite e com deslocamentos de ±1e-6 km. Exige igualdade exata, valores
positivos/finitos no domínio e preservação de sentinela fora dele. Verifica
ainda dependência inversa de R a 10 km e independência de R a 100 km.
Esses valores caracterizam o legado, inclusive descontinuidades; não se
impõe continuidade nem se declara validação física US76.

Suíte unitária aprovada em 2026-09-09 (quatro programas):
`build/unit-5642794e7a7a422b87982402ad763b46/`.
A captura original e os backups documentais ficam em
`build/task-handoff/p2-density/`.

Regressão aprovada: **27/27 arquivos idênticos byte a byte**, US76/SD6,
1, 5 e 30 dias. Relatório:
`build/regression-20260909-134016-8fefa99fe331434398cf8559682b064c/regression.json`.
O diagnóstico numérico não foi necessário; igualdade byte a byte implica
erro zero nos valores escritos. Não amplia cobertura para outros SDs.
O bloco extraído foi conferido como cópia literal do original. A verificação
global de whitespace aponta somente alterações preexistentes preservadas em
`TODO-Human-inputs.md`; o diff do fonte modificado está limpo.
