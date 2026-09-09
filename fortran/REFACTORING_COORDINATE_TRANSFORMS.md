# P2 — Transformações de coordenadas testáveis

Plano: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Etapa: [Módulos e testes](REFACTORING_MODULES_TESTS.md).
Estado: em andamento. Prioridade: P2.

Primeira extração: `src/coordinate_transforms.f90`, procedimento puro
`translate_to_ecliptic`. Converte coordenadas relativas equatoriais em posições
absolutas eclípticas, usando obliquidade em graus. Usado nas posições iniciais
da Lua e da nave. Preserva `double precision`, Dcosd/Dsind e a sequência
`origem + y*cos + z*sin` / `origem - y*sin + z*cos` do legado.

Não agrupa a rotação em uma matriz nem move a translação para depois da soma,
pois isso mudaria a ordem de arredondamento. Usa interface explícita,
`implicit none`, `intent(in/out)` e composição por chamadas de procedimentos.

`test-unit.ps1` compila a biblioteca e programas de teste independentes com
gfortran e verificações de execução. Os quatro testes verificam identidade com
translação, rotação de 90 graus, conservação de norma e rotação inversa.
O pequeno limite dos testes geométricos cobre arredondamento dessas identidades;
o critério das saídas da simulação continua sendo igualdade byte a byte.
fpm/test-drive permanecem planejados; a execução atual não depende de downloads.

O gerador compila módulos de `src/` antes do candidato e registra seus hashes
no manifesto. O legado continua compilado sem esses módulos. Há somente um
módulo nesta rodada; ordenar dependências adicionais explicitamente ao crescer.

A transformação das velocidades ainda permanece no programa principal.
A leitura inicial de `V(9)` é um problema de inicialização separado e não foi
alterada durante a extração de posições.

Validação da extração: quatro testes unitários aprovados e 27/27 arquivos
byte a byte nos cenários de 1, 5 e 30 dias. Relatório:
`build/regression-20260909-032648-f5a0f8ce4e1641af9797af72321ca039/regression.json`.
