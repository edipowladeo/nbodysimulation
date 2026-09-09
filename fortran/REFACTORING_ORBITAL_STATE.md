# P2 — Estado orbital relativo

Plano: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Etapa: [Módulos e testes](REFACTORING_MODULES_TESTS.md).
Estado: extração da Lua e sonda concluída e validada. Prioridade: P2.

Extração isolada dos blocos idênticos da Lua e da sonda para o procedimento
puro `elements_to_relative_state`, em `src/orbital_state.f90`. Recebe semieixo
maior normalizado, excentricidade, inclinação, nodo, argumento do pericentro,
anomalia verdadeira (ângulos em graus) e parâmetro gravitacional normalizado.
Retorna parâmetro orbital, raio, módulo da velocidade e as seis componentes
do estado relativo equatorial. Mantém `double precision`, `Dcosd`/`Dsind`,
expressões e ordem das operações; usa `implicit none` e `intent(in/out)`.

A conversão da Terra fica no programa: a ordem dos produtos e as translações
embutidas diferem desses dois blocos. Rotação/translação do estado relativo
e a leitura preexistente de `V(9)` também permanecem no programa, sem correção
de inicialização nesta extração. A rotina mantém o domínio do legado; não
acrescenta validação de elementos inválidos nem trata órbitas parabólicas.

Os executores existentes descobrem o módulo e o teste automaticamente.
`unit/test_orbital_state.f90` verifica estados analíticos circular equatorial,
pericentro excêntrico e polar, além de energia, norma e direção do momento
angular em órbita excêntrica inclinada. O limite absoluto de `1D-13` cobre
arredondamento dessas identidades e não altera o critério byte a byte.

Validação unitária aprovada em 2026-09-09, incluindo as suítes anteriores:
`build/unit-65742f3390e346faa7c926e0ded6bd45/`.
A regressão cobre somente US76/SD6 em 1, 5 e 30 dias; não é validação física
nem ampliação da cobertura SD1–SD7.

Regressão final aprovada: **27/27 arquivos idênticos byte a byte**.
Relatório: `build/regression-20260909-133339-d280af3d5fec44b5bb756c75378c3b3f/regression.json`.
O diagnóstico numérico não foi executado porque não houve divergências;
a igualdade dos bytes implica diferença zero nos valores escritos.
O diff da tarefa passou na verificação de whitespace; a verificação global
aponta apenas espaços preexistentes em `TODO-Human-inputs.md`, preservados.
