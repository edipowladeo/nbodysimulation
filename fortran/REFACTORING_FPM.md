# P2 — Configuração de fpm e test-drive

Plano principal: [REFACTORING_PLAN.md](REFACTORING_PLAN.md).
Estado: concluído e validado na rodada 13. Prioridade: P2.
Retorno: [Módulos e testes](REFACTORING_MODULES_TESTS.md).

## Rodada 13 — fpm e test-drive

Manifesto `fpm.toml` na raiz: biblioteca em `fortran/src`, executável `us76`
com o candidato no caminho histórico e alvo `unit-tests` em `fortran/unit`.
Descoberta automática de executáveis, testes e exemplos desativada; a lista de
compilação conferida não inclui legado, comparador nem referências.
A biblioteca ainda contém I/O, pendente de P6.

`test-drive` 0.5.0 está fixado no commit
`fd66b4bca683c5fa5d92536075734f0792824d37`, apenas como dependência do teste.
As quatro suítes agora são módulos reutilizados pelo adaptador `tester.f90`
e pelo executor independente `test-unit.ps1`. Preservados dados, tolerâncias
e expressões das verificações; falhas são contadas e propagadas aos runners.
Nenhum cálculo da biblioteca ou do candidato foi alterado.

Execução na raiz:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File fortran/test-fpm.ps1
```

O script baixa, se ausente, o binário oficial Windows fpm 0.13.0 em
`.tools/fpm/fpm.exe`, verifica SHA-256
`89f34d8cc3cface54a06785e9e1d7a2c16a07e6acd18f7c5d7e5cf95a5eaa671`
e usa o gfortran local, sem modificar PATH global. Primeiro uso requer rede
para fpm/test-drive; dependências e artefatos ficam em `build/`.
Compila biblioteca, candidato e testes com `-std=legacy
-ffree-line-length-none -O0 -Wall -Wextra -Wno-compare-reals -fcheck=all`.
O executor independente continua disponível sem fpm ou rede.

Validação em 2026-09-09:

- fpm build e test-drive: quatro suítes aprovadas;
  `build/fpm-539eec36b81c47a5b599a33e10c230e1/`.
- `test-unit.ps1`: quatro suítes aprovadas;
  `build/unit-df2ec4c2dacc40728e1ca5e365ee2574/`.
- Regressão 1, 5 e 30 dias: **27/27 byte a byte**;
  `build/regression-20260909-182623-871c5fab69b64c5fb00bcb56ff90dd86/regression.json`.
  Sem divergências; diagnóstico numérico adicional não solicitado.
  A evidência continua limitada a US76/SD6, sem validação física.

Fontes oficiais consultadas: [manifesto fpm](https://fpm.fortran-lang.org/pt/spec/manifest.html),
[API test-drive](https://github.com/fortran-lang/test-drive/tree/fd66b4bca683c5fa5d92536075734f0792824d37),
[binário fpm 0.13.0](https://github.com/fortran-lang/fpm/releases/tag/v0.13.0)
e ajuda local `fpm build --help`.

Propagação de falha conferida em cópia isolada sob
`build/task-handoff/p2-fpm/failure-fixture/`: uma expectativa de tempo zero
foi alterada para 1; ambos os runners retornaram código 1 e identificaram
`time_normalization`, enquanto as outras três suítes passaram.
Logs `unit.stderr.log` e `fpm.stderr.log`; fontes de produção preservados.
