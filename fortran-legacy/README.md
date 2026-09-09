# Versões do simulador Fortran

Os três fontes usam RADAU15 e estão configurados com `SD = 6` (Sol, Terra, Lua e espaçonave, com perturbações). Os nomes indicam modelo atmosférico, tempo de simulação e massa da nave.

| Arquivo | Principal diferença | Área da nave | Órbita inicial |
| --- | --- | --- | --- |
| [traj_td88_30dias_420000kg.for](traj_td88_30dias_420000kg.for) | Atmosfera TD88; 30 dias; 420.000 kg. | 2.000 m² | a ≈ 6.795,74 km; e ≈ 0,001097; i ≈ 42,6648°. |
| [traj_us76_30dias_420000kg.for](traj_us76_30dias_420000kg.for) | Atmosfera US76; mesmo cenário inicial do TD88. | 2.000 m² | a ≈ 6.795,74 km; e ≈ 0,001097; i ≈ 42,6648°. |
| [traj_us76_1dia_260kg.for](traj_us76_1dia_260kg.for) | Atmosfera US76; cenário de 1 dia e nave de 260 kg. | 38,4 m² | a = 6.811 km; e = 0; i = 53°. |

TD88 inclui parâmetros de atividade solar e geomagnética; US76 calcula a atmosfera por faixas de altitude. As rotinas também diferem no tratamento da velocidade para o arrasto. Os dois US76 têm diferenças de continuação de linhas (`&` no cenário de 30 dias e `+` no de 1 dia), além dos parâmetros orbitais.

Origem: TD88 e US76 de 30 dias vieram de `DVE Arquivos do teams`; US76 de 1 dia veio de `Fortran/Arquivos Fortran Fornecidos`. A segunda cópia TD88 foi removida desta pasta após confirmar igualdade por SHA-256. Os fontes não foram alterados; o material original da disciplina permanece preservado em `Dinamica-Veiculos-Espaciais/`.
