# nbodysimulation

O objetivo deste projeto é portar para uma linguagem de programação mais recente o código original em Fortran utilizado na matéria **Dinâmica de Veículos Espaciais**.

O código calcula trajetórias gravitacionais de N corpos, com aplicações na simulação de trajetórias de espaçonaves e na previsão de órbitas de corpos celestes. A implementação original servirá como referência para o desenvolvimento e a validação da versão moderna.

A pasta [`Dinamica-Veiculos-Espaciais/`](Dinamica-Veiculos-Espaciais/) foi adicionada ao repositório e contém o material da matéria, incluindo aulas, informações de apoio e o código original em Fortran.

O projeto está na etapa inicial de organização do material de referência. A linguagem de destino do port ainda será definida.

Os códigos da simulação também estão disponíveis na raiz para facilitar o port:

- [`fortran-legacy/`](fortran-legacy/): três fontes únicos, nomeados pelo modelo atmosférico, duração e massa da nave. Veja as [diferenças entre as versões](fortran-legacy/README.md).
- [`matlab/`](matlab/): cinco MATLAB Live Scripts relacionados à disciplina DVE; não fazem parte desta implementação.

A versão escolhida para refatoração é US76, 30 dias, massa de 420.000 kg:
[fonte legado](fortran/traj_us76_30dias_420000kg_legacy.for) e
[fonte em refatoração](fortran/traj_us76_30dias_420000kg_updated.f90).

Essas pastas contêm cópias dos arquivos originais, preservados junto ao material da matéria. Os exemplos e ferramentas do compilador permanecem na pasta da matéria.
