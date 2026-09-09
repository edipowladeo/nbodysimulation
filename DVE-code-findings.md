# Investigação de código — Dinâmica de Veículos Espaciais

## Escopo e método

Investigação estática do material em `Dinamica-Veiculos-Espaciais/`, em 08/09/2026. Foram enumerados todos os arquivos, inclusive sem extensão; lidos os fontes principais, comparadas as versões Fortran por SHA-256 e diff, e extraídos os blocos de código dos cinco MATLAB Live Scripts (`matlab/document.xml`, CDATA). O texto dos seis DOCX também foi inspecionado. Nenhum código ou instalador foi executado.

O inventário abaixo lista individualmente fontes, includes, scripts, recursos, projetos, possíveis fontes compactados, documentos e binários que podem encapsular código. A classificação de exemplos e arquivos auxiliares combina extensão, diretório e declarações encontradas; não equivale a uma auditoria funcional de cada exemplo.

Limitações: PDFs não tiveram texto extraído nem OCR; imagens nos documentos não foram interpretadas; pacotes de instalação, ajuda legada e fontes compactados não foram descompactados. Esses casos são candidatos, não código-fonte confirmado. Não há conclusão de ausência de código nesses contêineres.

## Achados prioritários para o port

Os quatro arquivos `TRAJ*.for` implementam variantes do simulador da disciplina. O cabeçalho descreve problemas de **2, 3 e 4 corpos**, com Sol, Terra, Lua e espaçonave, vetores de dimensão 12 e integração RADAU15 (`RA15`). Não se trata ainda de uma implementação genérica para uma quantidade arbitrária de corpos.

O seletor `SD` configura gravitação e perturbações. As rotinas centrais são `Output` (saídas e grandezas orbitais), `Force` (acelerações), `PotGrav` (potencial gravitacional), `Arrasto` ou `TD88` (arrasto atmosférico), `PRS` (pressão de radiação solar) e `RA15` (integração numérica).

| Arquivo (relativo a Dinamica-Veiculos-Espaciais/DVE/) | Breve descrição |
| --- | --- |
| `DVE Arquivos do teams/TRAJ(TD88)R.for` | Simulador com rotina atmosférica TD88. Idêntico, byte a byte, à cópia em Arquivos Fortran Fornecidos. |
| `Fortran/Arquivos Fortran Fornecidos/TRAJ(TD88)R.for` | Segunda cópia do mesmo fonte TD88; SHA-256 6148E9F0892C1B307B9BCE568F646F4E85F3F1C0B859B4CB69F664CAD2EAB818. |
| `DVE Arquivos do teams/TRAJ(US76)R.for` | Variante US76 com rotina Arrasto; configuração observada: 30 dias, massa 420000 kg, área 2000 m². Usa continuações com & em vários trechos. |
| `Fortran/Arquivos Fortran Fornecidos/TRAJ(US76)R.for` | Variante diferente: 1 dia, massa 260 kg, área 38,4 m² e condições orbitais alteradas; continuações legadas com +. Não descartar como duplicata. |
| `matlab/influenciaTerraSolLua.mlx` | Calcula e compara acelerações gravitacionais G*m/r² de Sol, Terra e Lua para distâncias definidas. |
| `matlab/molnya.mlx` | Calcula inclinação crítica, semieixo maior, excentricidade, regressão nodal e período de uma órbita Molniya; omega=270°. |
| `matlab/molnyapolosul.mlx` | Variante com omega=90° e comparação de regressão nodal analítica com valor experimental em 100 dias. |
| `matlab/molnyaDoSlide.mlx` | Usa meio dia sideral, varre excentricidades e plota regressão nodal; contém função local Omega_dot e adota e_ideal=0,74. |
| `matlab/tentativaOtimizacaoMolniya.mlx` | Usa fzero para buscar excentricidade que atinja a regressão nodal desejada; contém função local Omega_dot. |
| `DVE Arquivos do teams/dve.kt` | Arquivo vazio (0 bytes). A extensão sugere Kotlin, mas não há implementação. |
| `Fortran/BIN/CELSIUS.FOR` e `Fortran/PROJECTS/CELSIUS/CELSIUS.FOR` | Programa de tabela Fahrenheit–Celsius; exercício independente da dinâmica orbital. |

Os dois US76 têm SHA-256 distintos: `D4FDDCD6FE17EA9045C99183810A6311441A6B1C27761FAB7B95080F5B8FAAB5` (Teams) e `6E13C9AA80DAB38FFE310951ADB031CBDC46E58A9A591450A676D810C6FCF042` (Fornecidos). Além dos parâmetros, há diferenças de formatação e continuação; equivalência numérica não foi testada.

Também foram confirmados quatro arquivos sem extensão chamados `MAKEFILE`, com regras de compilação dos exemplos IMSL, e `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/LOCS`, uma listagem com trechos Fortran. Eles estão na seção de arquivos sem extensão do inventário.

## Dados e material de apoio

`Atmosfera` é uma tabela atmosférica, não um fonte sem extensão. `world_50m.txt` é candidato a dados cartográficos. Em `Fortran/Arquivos Fortran Fornecidos/`, os nomes `ECI`, `ECEF`, `EOG`, `GRT`, `IAA`, `Lua`, `TPH` e `V24` aparecem nas instruções OPEN do simulador como arquivos de saída. `USS76` também aparece em OPEN na rotina atmosférica. Esses arquivos devem ser examinados como dados para validação, sem confundi-los com código.

Os DOCX contêm anotações, parâmetros, resultados e enunciados de atividades (Molniya, Starlink, arrasto e outros temas); não foi identificada uma implementação no texto extraído. PDFs e imagens podem conter trechos de código ou algoritmos e permanecem pendentes de inspeção visual/OCR.

## Exemplos, ferramentas e código empacotado

A árvore `Fortran/SAMPLES/` contém exemplos do ambiente Fortran PowerStation: linguagem Fortran, bibliotecas numéricas IMSL, gráficos, interfaces Windows e integração com C/C++, Assembly e Visual Basic. `Fortran/INCLUDE/` e demais diretórios de suporte contêm declarações e recursos do ambiente. Esses materiais não devem ser confundidos com o simulador da disciplina.

Extensões `.C_`, `.CP_`, `.H_`, `.AS_`, `.RC_` e `.MA_` são candidatas a fontes/recursos de instalação compactados; a classificação é inferida pelo nome. EXE, DLL, LIB e OBJ contêm ou podem conter código compilado; MOD e arquivos de projeto apoiam a compilação, mas não substituem fontes legíveis. Planilhas XLS/XLM e ajuda HLP/MVB podem conter macros ou exemplos; conteúdo não confirmado.

## Inventário por arquivo

Todos os caminhos das tabelas seguintes são relativos a `Dinamica-Veiculos-Espaciais/DVE/`. Declarações extraídas dos fontes servem como pistas breves sobre seu conteúdo, não como lista completa de rotinas.

Total de arquivos do material enumerados: **1754**. Cada arquivo aparece uma vez no inventário, inclusive os artefatos sem evidência de código.


### Fontes, includes, scripts e recursos (604)

| Arquivo | Breve descrição / classificação |
| --- | --- |
| `DVE Arquivos do teams/dve.kt` | Vazio; nenhum código |
| `DVE Arquivos do teams/TRAJ(TD88)R.for` | Fonte Fortran; declarações: Output, Force, PotGrav, TD88 |
| `DVE Arquivos do teams/TRAJ(US76)R.for` | Fonte Fortran; declarações: Output, Force, PotGrav, Arrasto |
| `Fortran/Arquivos Fortran Fornecidos/TRAJ(TD88)R.for` | Fonte Fortran; declarações: Output, Force, PotGrav, TD88 |
| `Fortran/Arquivos Fortran Fornecidos/TRAJ(US76)R.for` | Fonte Fortran; declarações: Output, Force, PotGrav, Arrasto |
| `Fortran/BIN/CELSIUS.FOR` | Fonte Fortran; declarações: celsius_table |
| `Fortran/BIN/FCOUNT.BAT` | Script Windows de ferramentas/compilação |
| `Fortran/BIN/FCOVER.BAT` | Script Windows de ferramentas/compilação |
| `Fortran/BIN/FPSVARS.BAT` | Script Windows de ferramentas/compilação |
| `Fortran/BIN/FTIME.BAT` | Script Windows de ferramentas/compilação |
| `Fortran/BIN/LCOUNT.BAT` | Script Windows de ferramentas/compilação |
| `Fortran/BIN/LCOVER.BAT` | Script Windows de ferramentas/compilação |
| `Fortran/FPSSETUP/NETWORK.BAT` | Script Windows de ferramentas/compilação |
| `Fortran/INCLUDE/AFXRES.H` | Fonte ou cabeçalho C/C++ |
| `Fortran/INCLUDE/DIALOGM.F90` | Fonte Fortran |
| `Fortran/INCLUDE/FGRAPH.FD` | Include/declarações Fortran |
| `Fortran/INCLUDE/FGRAPH.FI` | Include/declarações Fortran |
| `Fortran/INCLUDE/FLIB.FD` | Include/declarações Fortran |
| `Fortran/INCLUDE/FLIB.FI` | Include/declarações Fortran |
| `Fortran/INCLUDE/MATHD.FI` | Include/declarações Fortran |
| `Fortran/INCLUDE/MATHD.H` | Fonte ou cabeçalho C/C++ |
| `Fortran/INCLUDE/MATHS.FI` | Include/declarações Fortran |
| `Fortran/INCLUDE/MATHS.H` | Fonte ou cabeçalho C/C++ |
| `Fortran/INCLUDE/MSFLIB.F90` | Fonte Fortran; declarações: msflib, arc, arc_w, getarcinfo |
| `Fortran/INCLUDE/MSFLIB.FD` | Include/declarações Fortran; declarações: arc, arc_w, getarcinfo, clearscreen |
| `Fortran/INCLUDE/MSFNLS.F90` | Fonte Fortran; declarações: msfnls, NLSGetLocale, NLSEnumLocales, NLSEnumCodePages |
| `Fortran/INCLUDE/MSFWIN.C` | Fonte ou cabeçalho C/C++ |
| `Fortran/INCLUDE/MSFWIN.F90` | Fonte Fortran; declarações: msfwin, RtlCopyMemory, RtlMoveMemory, RtlFillMemory |
| `Fortran/INCLUDE/MSFWINTY.F90` | Fonte Fortran; declarações: msfwinty |
| `Fortran/INCLUDE/MSIMSL.F90` | Fonte Fortran; declarações: msimsl |
| `Fortran/INCLUDE/MSIMSL.FI` | Include/declarações Fortran |
| `Fortran/INCLUDE/MSIMSL.H` | Fonte ou cabeçalho C/C++ |
| `Fortran/INCLUDE/MSIMSLC.F90` | Fonte Fortran; declarações: msimslc, iset, icopy, iadd |
| `Fortran/INCLUDE/MSIMSLMD.F90` | Fonte Fortran; declarações: msimslmd, dlsarg, dl2arg, dlfcrg |
| `Fortran/INCLUDE/MSIMSLMS.F90` | Fonte Fortran; declarações: msimslms, lsarg, l2arg, lfcrg |
| `Fortran/INCLUDE/MSIMSLSD.F90` | Fonte Fortran; declarações: msimslsd, dowfrq, dtwfrq, dfreq |
| `Fortran/INCLUDE/MSIMSLSS.F90` | Fonte Fortran; declarações: msimslss, owfrq, twfrq, freq |
| `Fortran/INCLUDE/MT.F90` | Fonte Fortran; declarações: mt |
| `Fortran/INCLUDE/MT.FD` | Include/declarações Fortran; declarações: DeleteCriticalSection, EnterCriticalSection, ExitProcess, ExitThread |
| `Fortran/INCLUDE/MT.FI` | Include/declarações Fortran |
| `Fortran/INCLUDE/OPENGL.F90` | Fonte Fortran; declarações: opengl, fglAccum, fglAlphaFunc, fglBegin |
| `Fortran/INCLUDE/OPENGLTY.F90` | Fonte Fortran; declarações: openglty |
| `Fortran/INCLUDE/PORTLIB.F90` | Fonte Fortran; declarações: portlib, gerror, perror, idate |
| `Fortran/INCLUDE/STATD.FI` | Include/declarações Fortran |
| `Fortran/INCLUDE/STATD.H` | Fonte ou cabeçalho C/C++ |
| `Fortran/INCLUDE/STATS.FI` | Include/declarações Fortran |
| `Fortran/INCLUDE/STATS.H` | Fonte ou cabeçalho C/C++ |
| `Fortran/INCLUDE/WINRES.H` | Fonte ou cabeçalho C/C++ |
| `Fortran/INCLUDE/WINVER.H` | Fonte ou cabeçalho C/C++ |
| `Fortran/PROJECTS/CELSIUS/CELSIUS.FOR` | Fonte Fortran; declarações: celsius_table |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/BITMAP.F90` | Fonte Fortran; declarações: BitmapTypes, BitmapDraw, bapointerloc, BitmapAllocate; exemplo do compilador: DESCRIPT |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/CASSIGNC.C` | Fonte ou cabeçalho C/C++; exemplo do compilador: DESCRIPT |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/CASSIGNF.F90` | Fonte Fortran; declarações: cassign, CCreateDescriptor; exemplo do compilador: DESCRIPT |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/CUBE.F90` | Fonte Fortran; declarações: go, CubeDraw; exemplo do compilador: DESCRIPT |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/DESCRIPT.F90` | Fonte Fortran; declarações: descript, DescriptorLoc; exemplo do compilador: DESCRIPT |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/DESCRIPT.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: DESCRIPT |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/FASSIGNC.C` | Fonte ou cabeçalho C/C++; exemplo do compilador: DESCRIPT |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/FASSIGNF.F90` | Fonte Fortran; declarações: fassign, CUseDescriptor; exemplo do compilador: DESCRIPT |
| `Fortran/SAMPLES/FPS/ADVANCED/DIALOGM/DIALOGM.F90` | Fonte Fortran; declarações: dialogt, dialogm, DlgCastFunc2Int, DlgDoCallBack; exemplo do compilador: DIALOGM |
| `Fortran/SAMPLES/FPS/ADVANCED/DIALOGM/DLGLOW.CPP` | Fonte ou cabeçalho C/C++; exemplo do compilador: DIALOGM |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/3DCUBE/CUBE.F90` | Fonte Fortran; declarações: myReshape, myinit, display; exemplo do compilador: 3DCUBE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/3DCUBE/CUBEA.F90` | Fonte Fortran; declarações: myinit, display; exemplo do compilador: 3DCUBE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/CUBE5/CUBE5.F90` | Fonte Fortran; declarações: SetDCPixelFormat, DrawScene; exemplo do compilador: CUBE5 |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/CUBE5/CUBE5A.F90` | Fonte Fortran; declarações: SetDCPixelFormat, InitializeRC; exemplo do compilador: CUBE5 |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/CUBE5/CUBE5B.F90` | Fonte Fortran; declarações: CreateDisplayList, DrawScene; exemplo do compilador: CUBE5 |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/CUBE5/CUBEINC.F90` | Fonte Fortran; declarações: cubeinc; exemplo do compilador: CUBE5 |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/OLYMPIC/OLYMPINC.F90` | Fonte Fortran; declarações: olympinc; exemplo do compilador: OLYMPIC |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/OLYMPIC/TOLYMPA.F90` | Fonte Fortran; declarações: FillTorus; exemplo do compilador: OLYMPIC |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/OLYMPIC/TOLYMPB.F90` | Fonte Fortran; declarações: DrawScene; exemplo do compilador: OLYMPIC |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/OLYMPIC/TOLYMPC.F90` | Fonte Fortran; declarações: ReInit, Init, GETARG, FillTorus; exemplo do compilador: OLYMPIC |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/OLYMPIC/TOLYMPD.F90` | Fonte Fortran; declarações: ReshapeFunction, Key_SPACE; exemplo do compilador: OLYMPIC |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/OLYMPIC/TOLYMPE.F90` | Fonte Fortran; declarações: GETARG; exemplo do compilador: OLYMPIC |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/OLYMPIC/TOLYMPIC.F90` | Fonte Fortran; declarações: DrawScene, ReshapeFunction, Key_SPACE; exemplo do compilador: OLYMPIC |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/PUZZLE/CUBE.F90` | Fonte Fortran; declarações: cubeInit, initCubeInfo, newCubes, randomRotate; exemplo do compilador: PUZZLE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/PUZZLE/MAIN.F90` | Fonte Fortran; declarações: WinMain, WndProc, Commands, SetDCPixelFormat; exemplo do compilador: PUZZLE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/PUZZLE/MENU.RC` | Recurso/interface/definição de ligação; exemplo do compilador: PUZZLE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/PUZZLE/SHAREDAT.F90` | Fonte Fortran; declarações: sharedata; exemplo do compilador: PUZZLE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/SIMPLE/SIMPLE.F90` | Fonte Fortran; exemplo do compilador: SIMPLE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/WAVE/TWAVE.F90` | Fonte Fortran; declarações: ReshapeFunction, Animate, Key_c, Key_s; exemplo do compilador: WAVE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/WAVE/TWAVEA.F90` | Fonte Fortran; declarações: Animate, SetColorMap; exemplo do compilador: WAVE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/WAVE/TWAVEB.F90` | Fonte Fortran; declarações: InitMesh, InitMaterials; exemplo do compilador: WAVE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/WAVE/TWAVEC.F90` | Fonte Fortran; declarações: InitTexture, Init; exemplo do compilador: WAVE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/WAVE/TWAVED.F90` | Fonte Fortran; declarações: ReshapeFunction, Key_c, Key_s; exemplo do compilador: WAVE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/WAVE/TWAVEE.F90` | Fonte Fortran; declarações: Key_l, Key_d; exemplo do compilador: WAVE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/WAVE/TWAVEF.F90` | Fonte Fortran; declarações: Key_SPACE, Animate, Key_n, Key_a; exemplo do compilador: WAVE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/WAVE/TWAVEG.F90` | Fonte Fortran; declarações: GETARG; exemplo do compilador: WAVE |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/WAVE/TWAVEINC.F90` | Fonte Fortran; declarações: twaveinc; exemplo do compilador: WAVE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/ANGLE/ANGINC.F90` | Fonte Fortran; declarações: anginc; exemplo do compilador: ANGLE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/ANGLE/ANGLE.F90` | Fonte Fortran; exemplo do compilador: ANGLE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/ANGLE/ANGLE.FI` | Include/declarações Fortran; exemplo do compilador: ANGLE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/ANGLE/ANGLE.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: ANGLE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/ANGLE/ANGLE.RC` | Recurso/interface/definição de ligação; exemplo do compilador: ANGLE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/ANGLE/ANGLEA.F90` | Fonte Fortran; exemplo do compilador: ANGLE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/BOUNCE/B2.F90` | Fonte Fortran; declarações: WriteTitle, ClearScreen; exemplo do compilador: BOUNCE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/BOUNCE/B3.F90` | Fonte Fortran; declarações: KbdFunc, getrandom, ClearScreen, Shut_Down; exemplo do compilador: BOUNCE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/BOUNCE/B4.F90` | Fonte Fortran; declarações: BounceProc; exemplo do compilador: BOUNCE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/BOUNCE/BOUNCE.F90` | Fonte Fortran; declarações: Shut_Down, getrandom, KbdFunc, BounceProc; exemplo do compilador: BOUNCE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/BOUNCE/BOUNCE.FI` | Include/declarações Fortran; declarações: getrandom, KbdFunc, BounceProc, ClearScreen; exemplo do compilador: BOUNCE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/BOUNCE/BOUNCEIN.F90` | Fonte Fortran; declarações: bouncein; exemplo do compilador: BOUNCE |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CHECK_SD/CHECK_SD.F90` | Fonte Fortran; exemplo do compilador: CHECK_SD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CHECK_SD/CHECK_SD.FI` | Include/declarações Fortran; declarações: ExamineAccessToken; exemplo do compilador: CHECK_SD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CHECK_SD/CHEK_SDA.F90` | Fonte Fortran; declarações: ExamineSD; exemplo do compilador: CHECK_SD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CHECK_SD/CHEK_SDB.F90` | Fonte Fortran; declarações: ExamineMask; exemplo do compilador: CHECK_SD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CHECK_SD/CHEK_SDC.F90` | Fonte Fortran; declarações: ExamineAccessToken; exemplo do compilador: CHECK_SD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CHECK_SD/CHEK_SDD.F90` | Fonte Fortran; declarações: InitializeWellKnownSIDs; exemplo do compilador: CHECK_SD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CHECK_SD/CHEK_SDE.F90` | Fonte Fortran; declarações: DisplayHelp, PERR, PMSG; exemplo do compilador: CHECK_SD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CHECK_SD/CHKSDINC.F90` | Fonte Fortran; declarações: chksdinc; exemplo do compilador: CHECK_SD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CHECK_SD/DATA.F90` | Fonte Fortran; exemplo do compilador: CHECK_SD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CLIPTEXT/CLIPINC.F90` | Fonte Fortran; declarações: clipinc; exemplo do compilador: CLIPTEXT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CLIPTEXT/CLIPTEXT.F90` | Fonte Fortran; exemplo do compilador: CLIPTEXT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CLIPTEXT/CLIPTEXT.FI` | Include/declarações Fortran; declarações: OutOf_Memory; exemplo do compilador: CLIPTEXT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CLIPTEXT/CLIPTEXT.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: CLIPTEXT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CLIPTEXT/CLIPTEXT.RC` | Recurso/interface/definição de ligação; exemplo do compilador: CLIPTEXT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CLIPTEXT/CLIPTXTA.F90` | Fonte Fortran; declarações: OutOf_Memory; exemplo do compilador: CLIPTEXT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CDERR.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG.F90` | Fonte Fortran; declarações: WinMain; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG.FI` | Include/declarações Fortran; declarações: About, EnterNew, FileOpenHookProc, FileSaveHookProc; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG.RC` | Recurso/interface/definição de ligação; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG10.F90` | Fonte Fortran; declarações: About, EnterNew, FileOpenHookProc, FileSaveHookProc; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG2.F90` | Fonte Fortran; declarações: CallFindText, FindTextHookProc, CallReplaceText, ReplaceTextHookProc; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG3.F90` | Fonte Fortran; declarações: About, EnterNew, FileOpenHookProc, FileSaveHookProc; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG4.F90` | Fonte Fortran; declarações: About, EnterNew, FileOpenHookProc, FileSaveHookProc; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG5.F90` | Fonte Fortran; declarações: FindTextHookProc, ReplaceTextHookProc, PrintSetupHookProc, InitApplication; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG6.F90` | Fonte Fortran; declarações: About, EnterNew, FileOpenHookProc, FileSaveHookProc; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG7.F90` | Fonte Fortran; declarações: FileOpenHookProc, About, EnterNew, ChooseColorHookProc; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG8.F90` | Fonte Fortran; declarações: EnterNew, FileOpenHookProc, FileSaveHookProc, ChooseColorHookProc; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG9.F90` | Fonte Fortran; declarações: MainWndProc, About, EnterNew, FileOpenHookProc; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLGIN.F90` | Fonte Fortran; declarações: cmndlgin; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/DLGS.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: CMNDLG |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CONSOLEC/COL2.F90` | Fonte Fortran; exemplo do compilador: CONSOLEC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CONSOLEC/COLOR.F90` | Fonte Fortran; declarações: Syntax; exemplo do compilador: CONSOLEC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CONSOLEC/COLOR.FD` | Include/declarações Fortran; declarações: colorin; exemplo do compilador: CONSOLEC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CONSOLEC/COLOR.FI` | Include/declarações Fortran; declarações: Syntax, GetConsoleTextAttribute; exemplo do compilador: CONSOLEC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CONSOLEC/COLORIN.F90` | Fonte Fortran; declarações: colorin; exemplo do compilador: CONSOLEC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CURSOR/CUR2.F90` | Fonte Fortran; declarações: MainWndProc, About, sieve; exemplo do compilador: CURSOR |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CURSOR/CUR3.F90` | Fonte Fortran; declarações: About, sieve; exemplo do compilador: CURSOR |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CURSOR/CURSOR.F90` | Fonte Fortran; declarações: WinMain, MPOINT2POINT, POINT2MPOINT; exemplo do compilador: CURSOR |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CURSOR/CURSOR.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: CURSOR |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CURSOR/CURSOR.RC` | Recurso/interface/definição de ligação; exemplo do compilador: CURSOR |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CURSOR/CURSORFN.F90` | Fonte Fortran; declarações: cursorfn, MainWndProc, About, sieve; exemplo do compilador: CURSOR |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CURSOR/CURSORIN.F90` | Fonte Fortran; declarações: cursorin; exemplo do compilador: CURSOR |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/DRIVES/DRIVES.F90` | Fonte Fortran; exemplo do compilador: DRIVES |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/DRIVES/DRIVES.FI` | Include/declarações Fortran; declarações: GVI; exemplo do compilador: DRIVES |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/DRIVES/DRIVESA.F90` | Fonte Fortran; declarações: GVI; exemplo do compilador: DRIVES |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/DRIVES/DRIVINC.F90` | Fonte Fortran; declarações: drivinc; exemplo do compilador: DRIVES |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/EVENT/ASYN_IO.F90` | Fonte Fortran; declarações: asyn_io, ErrorMsg, Do_BackgroundTask; exemplo do compilador: EVENT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/EVENT/ASYN_IO.FI` | Include/declarações Fortran; declarações: ErrorMsg, Do_BackgroundTask; exemplo do compilador: EVENT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/EVENT/ASYNIOIN.F90` | Fonte Fortran; declarações: asynioin; exemplo do compilador: EVENT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/EXITWIN/EXITWIN.F90` | Fonte Fortran; declarações: WinMain; exemplo do compilador: EXITWIN |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/EXITWIN/EXITWIN.FD` | Include/declarações Fortran; exemplo do compilador: EXITWIN |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/EXITWIN/EXITWINI.F90` | Fonte Fortran; declarações: exitinc; exemplo do compilador: EXITWIN |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/FLOPPY/MFMT.F90` | Fonte Fortran; declarações: PrintGeometry; exemplo do compilador: FLOPPY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/FLOPPY/MFMT.FI` | Include/declarações Fortran; declarações: PrintGeometry; exemplo do compilador: FLOPPY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/FLOPPY/MFMTA.F90` | Fonte Fortran; exemplo do compilador: FLOPPY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/FLOPPY/MFMTB.F90` | Fonte Fortran; declarações: PrintGeometry; exemplo do compilador: FLOPPY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/FLOPPY/MFMTC.F90` | Fonte Fortran; declarações: LockVolume, UnlockVolume; exemplo do compilador: FLOPPY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/FLOPPY/MFMTD.F90` | Fonte Fortran; declarações: DismountVolume; exemplo do compilador: FLOPPY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/FLOPPY/MFMTINC.F90` | Fonte Fortran; declarações: mfmtinc; exemplo do compilador: FLOPPY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENE_INC.F90` | Fonte Fortran; declarações: gene_inc; exemplo do compilador: GENERIC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC.DLG` | Recurso/interface/definição de ligação; exemplo do compilador: GENERIC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC.F90` | Fonte Fortran; declarações: WinMain, MainWndProc; exemplo do compilador: GENERIC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC.FI` | Include/declarações Fortran; declarações: MainWndProc; exemplo do compilador: GENERIC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: GENERIC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC.RC` | Recurso/interface/definição de ligação; exemplo do compilador: GENERIC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC1.F90` | Fonte Fortran; declarações: CenterWindow; exemplo do compilador: GENERIC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETDEV/DATA.F90` | Fonte Fortran; exemplo do compilador: GETDEV |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETDEV/GETDEV.F90` | Fonte Fortran; declarações: WinMain, ExpandInfo; exemplo do compilador: GETDEV |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETDEV/GETDEV.FI` | Include/declarações Fortran; declarações: ExpandInfo; exemplo do compilador: GETDEV |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETDEV/GETDEV.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: GETDEV |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETDEV/GETDEV.RC` | Recurso/interface/definição de ligação; exemplo do compilador: GETDEV |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETDEV/GETDEVA.F90` | Fonte Fortran; declarações: ExpandInfo; exemplo do compilador: GETDEV |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETDEV/GETDVINC.F90` | Fonte Fortran; declarações: getdvinc; exemplo do compilador: GETDEV |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/DATA.F90` | Fonte Fortran; exemplo do compilador: GETSYS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/GETSYS.F90` | Fonte Fortran; exemplo do compilador: GETSYS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/GETSYS.FI` | Include/declarações Fortran; declarações: doSysColors, doInfo, doDirectory, doMetrics; exemplo do compilador: GETSYS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/GETSYS.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: GETSYS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/GETSYS.RC` | Recurso/interface/definição de ligação; exemplo do compilador: GETSYS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/GETSYSA.F90` | Fonte Fortran; declarações: doSysColors; exemplo do compilador: GETSYS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/GETSYSB.F90` | Fonte Fortran; declarações: doDirectory, doInfo; exemplo do compilador: GETSYS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/GETSYSC.F90` | Fonte Fortran; declarações: doMetrics, doPalette; exemplo do compilador: GETSYS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/GETSYSD.F90` | Fonte Fortran; declarações: doLocalTime, doTime; exemplo do compilador: GETSYS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/GTSYSINC.F90` | Fonte Fortran; declarações: gtsysinc; exemplo do compilador: GETSYS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INHERIT/CHILD.F90` | Fonte Fortran; declarações: child, myError; exemplo do compilador: INHERIT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INHERIT/INHERIT.F90` | Fonte Fortran; declarações: PERR; exemplo do compilador: INHERIT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INPUT/INPUT.F90` | Fonte Fortran; declarações: InitInstance, MainWndProc, About; exemplo do compilador: INPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INPUT/INPUT.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: INPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INPUT/INPUT.RC` | Recurso/interface/definição de ligação; exemplo do compilador: INPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INPUT/INPUT1.F90` | Fonte Fortran; declarações: InitApplication, InitInstance, dummy, About; exemplo do compilador: INPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INPUT/INPUT3.F90` | Fonte Fortran; declarações: InitApplication, MainWndProc, About, dummy; exemplo do compilador: INPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INPUT/INPUTGL.F90` | Fonte Fortran; declarações: inputgl; exemplo do compilador: INPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INPUT/INPUTIN.F90` | Fonte Fortran; declarações: inputin, InitApplication, InitInstance, MainWndProc; exemplo do compilador: INPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/BITMAP.F90` | Fonte Fortran; declarações: DrawBitmap; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/BITMAP.FI` | Include/declarações Fortran; declarações: DrawBitmap; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/BITMAP.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MASK2.F90` | Fonte Fortran; declarações: DrawGrids; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MASK21.F90` | Fonte Fortran; declarações: DrawGrids; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MASKBLT.F90` | Fonte Fortran; declarações: doTrackObject, DrawGrids, DrawBitmap; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MASKBLT.FD` | Include/declarações Fortran; declarações: mskbltin; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MASKBLT.FI` | Include/declarações Fortran; declarações: DrawGrids; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MASKBLT.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MASKBLT.RC` | Recurso/interface/definição de ligação; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MSKBLTIN.F90` | Fonte Fortran; declarações: mskbltin; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/TRACK.F90` | Fonte Fortran; declarações: doTrackObject; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/TRACK.FD` | Include/declarações Fortran; declarações: trackin; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/TRACK.FI` | Include/declarações Fortran; declarações: doTrackObject; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/TRACK.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/TRACKIN.F90` | Fonte Fortran; declarações: trackin; exemplo do compilador: MASKBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MDI/MDI.F90` | Fonte Fortran; exemplo do compilador: MDI |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MDI/MDI.FI` | Include/declarações Fortran; declarações: vTest; exemplo do compilador: MDI |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MDI/MDI.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: MDI |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MDI/MDI.RC` | Recurso/interface/definição de ligação; exemplo do compilador: MDI |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MDI/MDIA.F90` | Fonte Fortran; exemplo do compilador: MDI |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MDI/MDIB.F90` | Fonte Fortran; exemplo do compilador: MDI |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MDI/MDIC.F90` | Fonte Fortran; declarações: vTest; exemplo do compilador: MDI |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MDI/MDIINC.F90` | Fonte Fortran; declarações: mdiinc; exemplo do compilador: MDI |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MDI/MDITYPES.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: MDI |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENU.DLG` | Recurso/interface/definição de ligação; exemplo do compilador: MENU |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENU.F90` | Fonte Fortran; exemplo do compilador: MENU |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENU.FI` | Include/declarações Fortran; declarações: HandlePopupMenu, HandleCreate; exemplo do compilador: MENU |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENU.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: MENU |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENU.RC` | Recurso/interface/definição de ligação; exemplo do compilador: MENU |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENUA.F90` | Fonte Fortran; declarações: HandleCreate, HandlePaint; exemplo do compilador: MENU |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENUB.F90` | Fonte Fortran; declarações: HandleChangeColors; exemplo do compilador: MENU |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENUC.F90` | Fonte Fortran; declarações: HandlePopupMenu; exemplo do compilador: MENU |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENUD.F90` | Fonte Fortran; declarações: HandleChangeColors, HandlePopupMenu, HandleCreate; exemplo do compilador: MENU |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENUINC.F90` | Fonte Fortran; declarações: menuinc; exemplo do compilador: MENU |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/DATA.F90` | Fonte Fortran; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTITHRD.F90` | Fonte Fortran; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTITHRD.FD` | Include/declarações Fortran; declarações: thrdinc; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTITHRD.FI` | Include/declarações Fortran; declarações: MainWndProc, ThreadWndProc, About, StartBounce; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTITHRD.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTITHRD.RC` | Recurso/interface/definição de ligação; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTTHRDA.F90` | Fonte Fortran; declarações: ThreadWndProc; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTTHRDB.F90` | Fonte Fortran; declarações: ThreadWndProc; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTTHRDC.F90` | Fonte Fortran; declarações: InitializeBoxes; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTTHRDD.F90` | Fonte Fortran; declarações: BounceProc, DrawBox, MoveBox; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTTHRDE.F90` | Fonte Fortran; declarações: MoveBox, BounceProc; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTTHRDF.F90` | Fonte Fortran; declarações: DrawBox; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/THRDINC.F90` | Fonte Fortran; declarações: thrdinc; exemplo do compilador: MLTITHRD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MYPAL/MYPAL.F90` | Fonte Fortran; declarações: ShowColor; exemplo do compilador: MYPAL |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MYPAL/MYPAL.FI` | Include/declarações Fortran; declarações: ShowColor, setptrtorgpt; exemplo do compilador: MYPAL |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MYPAL/MYPAL.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: MYPAL |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MYPAL/MYPAL.RC` | Recurso/interface/definição de ligação; exemplo do compilador: MYPAL |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MYPAL/MYPAL2.F90` | Fonte Fortran; declarações: ShowColor; exemplo do compilador: MYPAL |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MYPAL/MYPALINC.F90` | Fonte Fortran; declarações: mypalinc; exemplo do compilador: MYPAL |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OUTPUT/OUTINC.F90` | Fonte Fortran; declarações: outinc; exemplo do compilador: OUTPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OUTPUT/OUTPUT.F90` | Fonte Fortran; exemplo do compilador: OUTPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OUTPUT/OUTPUT.FI` | Include/declarações Fortran; exemplo do compilador: OUTPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OUTPUT/OUTPUT.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: OUTPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OUTPUT/OUTPUT.RC` | Recurso/interface/definição de ligação; exemplo do compilador: OUTPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OUTPUT/OUTPUTA.F90` | Fonte Fortran; exemplo do compilador: OUTPUT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCMBOA.F90` | Fonte Fortran; exemplo do compilador: OWNCOMBO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCMBOB.F90` | Fonte Fortran; declarações: HandleSelectionState; exemplo do compilador: OWNCOMBO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCMBOC.F90` | Fonte Fortran; declarações: HandleFocusState, DrawEntireItem, HandleSelectionState; exemplo do compilador: OWNCOMBO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCMBOD.F90` | Fonte Fortran; declarações: DrawEntireItem, HandleSelectionState, HandleFocusState; exemplo do compilador: OWNCOMBO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCMBOE.F90` | Fonte Fortran; declarações: DrawEntireItem, HandleSelectionState, HandleFocusState; exemplo do compilador: OWNCOMBO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCOMBO.DLG` | Recurso/interface/definição de ligação; exemplo do compilador: OWNCOMBO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCOMBO.F90` | Fonte Fortran; exemplo do compilador: OWNCOMBO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCOMBO.FI` | Include/declarações Fortran; exemplo do compilador: OWNCOMBO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCOMBO.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: OWNCOMBO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCOMBO.RC` | Recurso/interface/definição de ligação; exemplo do compilador: OWNCOMBO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNINC.F90` | Fonte Fortran; declarações: owncbinc; exemplo do compilador: OWNCOMBO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PATHS/PATHS.F90` | Fonte Fortran; declarações: DrawPath; exemplo do compilador: PATHS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PATHS/PATHS.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: PATHS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PATHS/PATHS.RC` | Recurso/interface/definição de ligação; exemplo do compilador: PATHS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PATHS/PATHS1.F90` | Fonte Fortran; declarações: DrawPath; exemplo do compilador: PATHS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PATHS/PATHSINC.F90` | Fonte Fortran; declarações: pathsinc; exemplo do compilador: PATHS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLATFORM/PLATFORM.F90` | Fonte Fortran; declarações: WinMain, MainWndProc; exemplo do compilador: PLATFORM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLATFORM/PLATFORM.FI` | Include/declarações Fortran; exemplo do compilador: PLATFORM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLATFORM/PLATFORM.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: PLATFORM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLATFORM/PLATFORM.RC` | Recurso/interface/definição de ligação; exemplo do compilador: PLATFORM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLATFORM/PLATINC.F90` | Fonte Fortran; declarações: platinc; exemplo do compilador: PLATFORM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLATFORM/PLTFORM1.F90` | Fonte Fortran; exemplo do compilador: PLATFORM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/BITMAP.F90` | Fonte Fortran; declarações: DrawBitmap; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/BITMAP.FI` | Include/declarações Fortran; declarações: DrawBitmap; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/BITMAP.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/PLGBLT.F90` | Fonte Fortran; declarações: About, doTrackObject; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/PLGBLT.FI` | Include/declarações Fortran; declarações: About, DrawGrids; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/PLGBLT.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/PLGBLT.RC` | Recurso/interface/definição de ligação; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/PLGBLT2.F90` | Fonte Fortran; declarações: DrawGrids; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/PLGBLT3.F90` | Fonte Fortran; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/PLGBLTIN.F90` | Fonte Fortran; declarações: plgbltin; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/TRACK.F90` | Fonte Fortran; declarações: doTrackObject; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/TRACK.FI` | Include/declarações Fortran; declarações: doTrackObject; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/TRACK.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/TRACKIN.F90` | Fonte Fortran; declarações: trackin; exemplo do compilador: PLGDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/POLYDRAW/POLYDRAW.F90` | Fonte Fortran; exemplo do compilador: POLYDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/POLYDRAW/POLYDRAW.FI` | Include/declarações Fortran; exemplo do compilador: POLYDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/POLYDRAW/POLYDRAW.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: POLYDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/POLYDRAW/POLYDRAW.RC` | Recurso/interface/definição de ligação; exemplo do compilador: POLYDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/POLYDRAW/POLYINC.F90` | Fonte Fortran; declarações: polyinc; exemplo do compilador: POLYDRAW |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PROCESS/PROCESS.F90` | Fonte Fortran; declarações: WinMain, doCreate, doTerminate; exemplo do compilador: PROCESS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PROCESS/PROCESS.FI` | Include/declarações Fortran; declarações: doCreate, doTerminate; exemplo do compilador: PROCESS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PROCESS/PROCESS.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: PROCESS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PROCESS/PROCESS.RC` | Recurso/interface/definição de ligação; exemplo do compilador: PROCESS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PROCESS/PROCESS1.F90` | Fonte Fortran; declarações: doCreate, doTerminate; exemplo do compilador: PROCESS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PROCESS/PROCINC.F90` | Fonte Fortran; declarações: procinc; exemplo do compilador: PROCESS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/MONKEY.F90` | Fonte Fortran; declarações: EnumerateLevel, QueryKey, DisplayKeyData; exemplo do compilador: REGISTRY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/MONKEY.FD` | Include/declarações Fortran; declarações: monkeyin; exemplo do compilador: REGISTRY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/MONKEY.FI` | Include/declarações Fortran; declarações: MonkeyDlgProc, EnumerateLevel, QueryKey, DisplayKeyData; exemplo do compilador: REGISTRY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/MONKEY.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: REGISTRY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/MONKEY.RC` | Recurso/interface/definição de ligação; exemplo do compilador: REGISTRY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/MONKEY1.F90` | Fonte Fortran; declarações: DisplayKeyData, QueryKey; exemplo do compilador: REGISTRY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/MONKEY2.F90` | Fonte Fortran; declarações: EnumerateLevel, QueryKey; exemplo do compilador: REGISTRY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/MONKEYIN.F90` | Fonte Fortran; declarações: monkeyin; exemplo do compilador: REGISTRY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/RESOURCE.FD` | Include/declarações Fortran; exemplo do compilador: REGISTRY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/RESOURCE.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: REGISTRY |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/DEMO.F90` | Fonte Fortran; declarações: DemoWndProc, About; exemplo do compilador: SELECT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/DEMO.FI` | Include/declarações Fortran; declarações: DemoInit, DemoWndProc, About; exemplo do compilador: SELECT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/DEMO.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: SELECT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/DEMO.RC` | Recurso/interface/definição de ligação; exemplo do compilador: SELECT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/DEMO1.F90` | Fonte Fortran; declarações: DemoInit, About; exemplo do compilador: SELECT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/DEMOIN.F90` | Fonte Fortran; declarações: demoin; exemplo do compilador: SELECT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/SELECT.DEF` | Recurso/interface/definição de ligação; exemplo do compilador: SELECT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/SELECT.F90` | Fonte Fortran; exemplo do compilador: SELECT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/SELECT.FD` | Include/declarações Fortran; exemplo do compilador: SELECT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/SELECT.FI` | Include/declarações Fortran; declarações: DllMain, StartSelection, UpdateSelection, EndSelection; exemplo do compilador: SELECT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/SELECT1.F90` | Fonte Fortran; exemplo do compilador: SELECT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/SELECTIN.F90` | Fonte Fortran; declarações: selectin; exemplo do compilador: SELECT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SETINFO/SETINC.F90` | Fonte Fortran; declarações: setinc; exemplo do compilador: SETINFO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SETINFO/SETINFO.F90` | Fonte Fortran; exemplo do compilador: SETINFO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SETINFO/SETINFO.FI` | Include/declarações Fortran; exemplo do compilador: SETINFO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SETINFO/SETINFO.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: SETINFO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SETINFO/SETINFO.RC` | Recurso/interface/definição de ligação; exemplo do compilador: SETINFO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SETINFO/SETINFOA.F90` | Fonte Fortran; exemplo do compilador: SETINFO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SETINFO/SETINFOB.F90` | Fonte Fortran; exemplo do compilador: SETINFO |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/OTHERINC.F90` | Fonte Fortran; declarações: otherinc; exemplo do compilador: SHAREMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/OTHRPRC2.F90` | Fonte Fortran; declarações: ReadProc; exemplo do compilador: SHAREMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/OTHRPROC.F90` | Fonte Fortran; declarações: ReadProc; exemplo do compilador: SHAREMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/OTHRPROC.FI` | Include/declarações Fortran; exemplo do compilador: SHAREMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/OTHRPROC.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: SHAREMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/OTHRPROC.RC` | Recurso/interface/definição de ligação; exemplo do compilador: SHAREMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/SHAREINC.F90` | Fonte Fortran; declarações: shareinc; exemplo do compilador: SHAREMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/SHAREMEM.F90` | Fonte Fortran; declarações: WERR; exemplo do compilador: SHAREMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/SHAREMEM.FI` | Include/declarações Fortran; exemplo do compilador: SHAREMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/SHAREMEM.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: SHAREMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/SHAREMEM.RC` | Recurso/interface/definição de ligação; exemplo do compilador: SHAREMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STARTP/STARTP.F90` | Fonte Fortran; declarações: help; exemplo do compilador: STARTP |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STARTP/STARTPA.F90` | Fonte Fortran; declarações: help; exemplo do compilador: STARTP |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/BITMAP.F90` | Fonte Fortran; declarações: DrawBitmap; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/BITMAP.FI` | Include/declarações Fortran; declarações: DrawBitmap; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/BITMAP.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/STRBLTIN.F90` | Fonte Fortran; declarações: strbltin; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/STREBLT.F90` | Fonte Fortran; declarações: doTrackObject, DlgProc, DrawGrids; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/STREBLT.FD` | Include/declarações Fortran; declarações: strbltin; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/STREBLT.FI` | Include/declarações Fortran; declarações: MainWndProc, DlgProc, DrawGrids; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/STREBLT.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/STREBLT.RC` | Recurso/interface/definição de ligação; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/STREBLT2.F90` | Fonte Fortran; declarações: MainWndProc, DrawGrids, doTrackObject; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/TRACK.F90` | Fonte Fortran; declarações: doTrackObject; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/TRACK.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/TRACKIN.F90` | Fonte Fortran; declarações: trackin; exemplo do compilador: STREBLT |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SUBCLASS/SUBCLASA.F90` | Fonte Fortran; declarações: SubclassWindow, QueryWindowPos, PaintRect; exemplo do compilador: SUBCLASS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SUBCLASS/SUBCLASB.F90` | Fonte Fortran; declarações: SubclassWindow, QueryWindowPos; exemplo do compilador: SUBCLASS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SUBCLASS/SUBCLASC.F90` | Fonte Fortran; declarações: PaintRect; exemplo do compilador: SUBCLASS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SUBCLASS/SUBCLASS.F90` | Fonte Fortran; exemplo do compilador: SUBCLASS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SUBCLASS/SUBCLASS.FI` | Include/declarações Fortran; declarações: QueryWindowPos, PaintRect, SubclassWindow; exemplo do compilador: SUBCLASS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SUBCLASS/SUBCLASS.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: SUBCLASS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SUBCLASS/SUBCLASS.RC` | Recurso/interface/definição de ligação; exemplo do compilador: SUBCLASS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SUBCLASS/SUBCLINC.F90` | Fonte Fortran; declarações: subclinc; exemplo do compilador: SUBCLASS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TAKEOWN/DATA.F90` | Fonte Fortran; exemplo do compilador: TAKEOWN |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TAKEOWN/TAKEINC.F90` | Fonte Fortran; declarações: takeinc; exemplo do compilador: TAKEOWN |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TAKEOWN/TAKEOWN.F90` | Fonte Fortran; exemplo do compilador: TAKEOWN |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TAKEOWN/TAKEOWN1.F90` | Fonte Fortran; exemplo do compilador: TAKEOWN |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TERMPROC/TERMPROC.F90` | Fonte Fortran; declarações: ErrorOut; exemplo do compilador: TERMPROC |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/THREADS/THREADIN.F90` | Fonte Fortran; declarações: threadin; exemplo do compilador: THREADS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/THREADS/THREADS.F90` | Fonte Fortran; declarações: MainWndProc; exemplo do compilador: THREADS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/THREADS/THREADS.FI` | Include/declarações Fortran; declarações: MainWndProc, ThreadProc, WinMain; exemplo do compilador: THREADS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/THREADS/THREADS.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: THREADS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/THREADS/THREADS.RC` | Recurso/interface/definição de ligação; exemplo do compilador: THREADS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/THREADS/THREADS1.F90` | Fonte Fortran; exemplo do compilador: THREADS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TIMERS/TIMERINC.F90` | Fonte Fortran; declarações: timerinc; exemplo do compilador: TIMERS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TIMERS/TIMERS.F90` | Fonte Fortran; declarações: TimerFunc, NULLSUBROUTINE, DrawStuff, SetFlashRectPositions; exemplo do compilador: TIMERS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TIMERS/TIMERS.FI` | Include/declarações Fortran; declarações: TimerFunc, NULLSUBROUTINE, SetButtonPositions, SetFlashRectPositions; exemplo do compilador: TIMERS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TIMERS/TIMERS.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: TIMERS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TIMERS/TIMERS1.F90` | Fonte Fortran; declarações: SetFlashRectPositions, DrawStuff; exemplo do compilador: TIMERS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TIMERS/TIMERS2.F90` | Fonte Fortran; declarações: TimerFunc, SetButtonPositions; exemplo do compilador: TIMERS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TIMERS/TIMERS3.F90` | Fonte Fortran; declarações: NULLSUBROUTINE; exemplo do compilador: TIMERS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLS.FI` | Include/declarações Fortran; declarações: TlsInit, TlsRetrieve, ErrorOut, DllMain; exemplo do compilador: TLS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLSCALL.F90` | Fonte Fortran; declarações: ErrorOut; exemplo do compilador: TLS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLSCALL2.F90` | Fonte Fortran; exemplo do compilador: TLS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLSDLL.DEF` | Recurso/interface/definição de ligação; exemplo do compilador: TLS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLSDLL.F90` | Fonte Fortran; declarações: TlsRetrieve, TlsInit; exemplo do compilador: TLS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLSDLL2.F90` | Fonte Fortran; declarações: ErrorOut, TlsInit, TlsRetrieve; exemplo do compilador: TLS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLSIN.F90` | Fonte Fortran; declarações: tlsin; exemplo do compilador: TLS |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/VIRTMEM/VIRTMEM.F90` | Fonte Fortran; declarações: MainWndProc; exemplo do compilador: VIRTMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/VIRTMEM/VIRTMEM.FI` | Include/declarações Fortran; declarações: ResetMenu, WERR; exemplo do compilador: VIRTMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/VIRTMEM/VIRTMEM.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: VIRTMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/VIRTMEM/VIRTMEM.RC` | Recurso/interface/definição de ligação; exemplo do compilador: VIRTMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/VIRTMEM/VIRTMEMA.F90` | Fonte Fortran; declarações: ResetMenu, ShowDlgProc, WERR; exemplo do compilador: VIRTMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/VIRTMEM/VMEMINC.F90` | Fonte Fortran; declarações: vmeminc; exemplo do compilador: VIRTMEM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/DLG.F90` | Fonte Fortran; declarações: ScaleDlgProc; exemplo do compilador: WORLD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/WORLD.DLG` | Recurso/interface/definição de ligação; exemplo do compilador: WORLD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/WORLD.F90` | Fonte Fortran; declarações: WinMain, MainWndProc, AboutDlgProc, ScaleDlgProc; exemplo do compilador: WORLD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/WORLD.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: WORLD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/WORLD.RC` | Recurso/interface/definição de ligação; exemplo do compilador: WORLD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/WORLD1.F90` | Fonte Fortran; declarações: MainWndProc, ScaleDlgProc, SetUnityXform, OpenMetaFl; exemplo do compilador: WORLD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/WORLDFNC.F90` | Fonte Fortran; declarações: worldfnc, MainWndProc, AboutDlgProc, ScaleDlgProc; exemplo do compilador: WORLD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/WORLDINC.F90` | Fonte Fortran; declarações: worldinc; exemplo do compilador: WORLD |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WXFORM/WXFORM.F90` | Fonte Fortran; declarações: doTrackObject, CenterOrigin; exemplo do compilador: WXFORM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WXFORM/WXFORM.FI` | Include/declarações Fortran; declarações: CenterOrigin; exemplo do compilador: WXFORM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WXFORM/WXFORM.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: WXFORM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WXFORM/WXFORM.RC` | Recurso/interface/definição de ligação; exemplo do compilador: WXFORM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WXFORM/WXFORM1.F90` | Fonte Fortran; declarações: CenterOrigin, doTrackObject, doTrackObjectDum; exemplo do compilador: WXFORM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WXFORM/WXFORM2.F90` | Fonte Fortran; declarações: doTrackObject; exemplo do compilador: WXFORM |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WXFORM/WXFRMINC.F90` | Fonte Fortran; declarações: wxfrminc; exemplo do compilador: WXFORM |
| `Fortran/SAMPLES/FPS/GENERAL/CALENDAR/DATAMOD.F90` | Fonte Fortran; declarações: datamod; exemplo do compilador: CALENDAR |
| `Fortran/SAMPLES/FPS/GENERAL/CALENDAR/TEST.F90` | Fonte Fortran; declarações: qwin_test, PrintBox, PRINTTHISMONTH, Get1stDayWeek; exemplo do compilador: CALENDAR |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/AXIS.F90` | Fonte Fortran; declarações: AXIS; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/CHAOS.F90` | Fonte Fortran; declarações: CHAOS; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/CHAOS3.F90` | Fonte Fortran; declarações: CHAOS3; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/CHAOS4.F90` | Fonte Fortran; declarações: CHAOS4; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/CHAOS5.F90` | Fonte Fortran; declarações: CHAOS5; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/CHAOSCOM.F90` | Fonte Fortran; declarações: CHAOSCOM; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/CHAOSDRV.F90` | Fonte Fortran; declarações: CHAOSDRV; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/CHAOSINP.RC` | Recurso/interface/definição de ligação; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/COMDLGER.F90` | Fonte Fortran; declarações: COMDLGER; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/CRETPALT.F90` | Fonte Fortran; declarações: CREATE_PALLET; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/DEMOLOP.F90` | Fonte Fortran; declarações: DEMOLOP; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/EXITPROG.F90` | Fonte Fortran; declarações: EXITPROG; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/FONTCOM.F90` | Fonte Fortran; declarações: FONTCOM; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/GETWIN.F90` | Fonte Fortran; declarações: GETWIN; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/GOCHSDRV.F90` | Fonte Fortran; declarações: GO_CHAOSDRV; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/GODEMO.F90` | Fonte Fortran; declarações: GO_DEMO; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/HLPINFO.F90` | Fonte Fortran; declarações: HELP_INFO_SRC3; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/IMAGE.F90` | Fonte Fortran; declarações: IMAGE, IMAGE_HELP, IMAGE_OK; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/INITLXY.F90` | Fonte Fortran; declarações: INITIALXY, INITIALXY_HELP, INITIALXY_OK; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/INPCHFIL.F90` | Fonte Fortran; declarações: INPCHAOSFIL; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/INPPALFL.F90` | Fonte Fortran; declarações: INPPALLETFIL; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/INPTINFO.F90` | Fonte Fortran; declarações: INPUTINFO; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/LCHCHSDR.F90` | Fonte Fortran; declarações: LAUNCH_CHAOSDRV; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/LNCHDEMO.F90` | Fonte Fortran; declarações: LAUNCH_DEMO; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/LOOK.F90` | Fonte Fortran; declarações: LOOK, LOOK_HELP; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/MATHERQQ.F90` | Fonte Fortran; declarações: MATHERRQQ; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/MINMAX.F90` | Fonte Fortran; declarações: MINMAX, MINMAX_HELP, MINMAX_OK; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/MINMAXC.F90` | Fonte Fortran; declarações: MINMAXC; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PALET.F90` | Fonte Fortran; declarações: PALET; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PALETPRM.F90` | Fonte Fortran; declarações: PALLET_PARMS, PALLET_PARMS_HELP, PALLET_PARMS_OK, PALLET_PARMS_DEG; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PALLET.F90` | Fonte Fortran; declarações: PALLET; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PLOT.F90` | Fonte Fortran; declarações: PLOT; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PLOTPIX.F90` | Fonte Fortran; declarações: PLOTPIX; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PLOTTIC.F90` | Fonte Fortran; declarações: PLOTTIC; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PLOTVAL.F90` | Fonte Fortran; declarações: PLOTVAL; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/QANTCOL.F90` | Fonte Fortran; declarações: QUANTCOL, QUANTCOL_HELP, QUANTCOL_OK; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/READCHS.F90` | Fonte Fortran; declarações: READ_CHAOS; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/READPAL.F90` | Fonte Fortran; declarações: READ_PALLET; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/RESOURCE.FD` | Include/declarações Fortran; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/RESOURCE.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/RGB.F90` | Fonte Fortran; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/ROTATE.F90` | Fonte Fortran; declarações: ROTATE, ROTATE_HELP, ROTATE_OK, ROTATE_DEG; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVCHAOS.F90` | Fonte Fortran; declarações: SAV_CHAOS; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVCHFIL.F90` | Fonte Fortran; declarações: SAVCHAOSFIL; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVPALFL.F90` | Fonte Fortran; declarações: SAVPALLETFIL; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVPALL.F90` | Fonte Fortran; declarações: SAV_PALLET; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SCALE.F90` | Fonte Fortran; declarações: SCALE, SCALE_HELP, SCALE_OK; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SELCHSYM.F90` | Fonte Fortran; declarações: SELECT_CHAOS_SYM, SELECT_CHAOS_SYM_HELP, SELECT_CHAOS_SYM_OK; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SETCHCOF.F90` | Fonte Fortran; declarações: SET_CHAOS_COEFF, SET_CHAOS_COEFF_HELP, SET_CHAOS_COEFF_OK; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SETPIXEL.F90` | Fonte Fortran; declarações: SETPIXELFLUSH; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SETVIDEO.F90` | Fonte Fortran; declarações: SET_VIDEO; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SHWPALLT.F90` | Fonte Fortran; declarações: SHOW_PALLET; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/STPDRW.F90` | Fonte Fortran; declarações: STPDRW; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/STVIDPRM.F90` | Fonte Fortran; declarações: SET_VID_PARAMS, SET_VID_PARAMS_HELP, SET_VID_PARAMS_OK; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/TOTINIT.F90` | Fonte Fortran; declarações: TOTAL_INIT; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/VIDCONF.F90` | Fonte Fortran; declarações: VIDCONF; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/VIEWPALT.F90` | Fonte Fortran; declarações: VIEWVIDMODE; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/WASTEIT.F90` | Fonte Fortran; declarações: WASTE_IT, WASTE_IT_HELP, WASTE_IT_OK; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/WASTEPTS.F90` | Fonte Fortran; declarações: WASTEPTS; exemplo do compilador: CHAOS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHD/BSINT_EX.FOR` | Fonte Fortran; exemplo do compilador: MATHD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHD/DLPRS_EX.FOR` | Fonte Fortran; exemplo do compilador: MATHD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHD/EVCRG_EX.FOR` | Fonte Fortran; exemplo do compilador: MATHD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHD/FFTCF_EX.FOR` | Fonte Fortran; exemplo do compilador: MATHD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHD/IVPRK_EX.FOR` | Fonte Fortran; declarações: FCN; exemplo do compilador: MATHD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHD/LSARG_EX.FOR` | Fonte Fortran; exemplo do compilador: MATHD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHD/QDAG_EX.FOR` | Fonte Fortran; declarações: F; exemplo do compilador: MATHD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHS/BSINT_EX.FOR` | Fonte Fortran; exemplo do compilador: MATHS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHS/DLPRS_EX.FOR` | Fonte Fortran; exemplo do compilador: MATHS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHS/EVCRG_EX.FOR` | Fonte Fortran; exemplo do compilador: MATHS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHS/FFTCF_EX.FOR` | Fonte Fortran; exemplo do compilador: MATHS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHS/IVPRK_EX.FOR` | Fonte Fortran; declarações: FCN; exemplo do compilador: MATHS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHS/LSARG_EX.FOR` | Fonte Fortran; exemplo do compilador: MATHS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHS/QDAG_EX.FOR` | Fonte Fortran; declarações: F; exemplo do compilador: MATHS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATD/ARMME_EX.FOR` | Fonte Fortran; exemplo do compilador: STATD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATD/CHIGF_EX.FOR` | Fonte Fortran; declarações: CDF; exemplo do compilador: STATD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATD/DSCRM_EX.FOR` | Fonte Fortran; exemplo do compilador: STATD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATD/KTBLE_EX.FOR` | Fonte Fortran; exemplo do compilador: STATD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATD/RNEXP_EX.FOR` | Fonte Fortran; exemplo do compilador: STATD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATD/RNLIN_EX.FOR` | Fonte Fortran; declarações: EXAMPL; exemplo do compilador: STATD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATD/RSTAT_EX.FOR` | Fonte Fortran; exemplo do compilador: STATD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATD/RSTEP_EX.FOR` | Fonte Fortran; exemplo do compilador: STATD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATD/SMPSR_EX.FOR` | Fonte Fortran; exemplo do compilador: STATD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATD/UVSTA_EX.FOR` | Fonte Fortran; exemplo do compilador: STATD |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATS/ARMME_EX.FOR` | Fonte Fortran; exemplo do compilador: STATS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATS/CHIGF_EX.FOR` | Fonte Fortran; declarações: CDF; exemplo do compilador: STATS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATS/DSCRM_EX.FOR` | Fonte Fortran; exemplo do compilador: STATS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATS/KTBLE_EX.FOR` | Fonte Fortran; exemplo do compilador: STATS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATS/RNEXP_EX.FOR` | Fonte Fortran; exemplo do compilador: STATS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATS/RNLIN_EX.FOR` | Fonte Fortran; declarações: EXAMPL; exemplo do compilador: STATS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATS/RSTAT_EX.FOR` | Fonte Fortran; exemplo do compilador: STATS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATS/RSTEP_EX.FOR` | Fonte Fortran; exemplo do compilador: STATS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATS/SMPSR_EX.FOR` | Fonte Fortran; exemplo do compilador: STATS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATS/UVSTA_EX.FOR` | Fonte Fortran; exemplo do compilador: STATS |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/SYSTEM/CPSEC.FOR` | Fonte Fortran; declarações: CPSEC; exemplo do compilador: SYSTEM |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/SYSTEM/TDATE.FOR` | Fonte Fortran; declarações: TDATE; exemplo do compilador: SYSTEM |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/SYSTEM/TIMDY.FOR` | Fonte Fortran; declarações: TIMDY; exemplo do compilador: SYSTEM |
| `Fortran/SAMPLES/FPS/GENERAL/LCINFO/LCINFO.FOR` | Fonte Fortran; declarações: lcinfo, LocaleInfo, Partition, Quicksort; exemplo do compilador: LCINFO |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/BITMAP.F90` | Fonte Fortran; declarações: BitmapTypes, BitmapDraw, bapointerloc, BitmapAllocate; exemplo do compilador: POKER |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/BUTTON.F90` | Fonte Fortran; declarações: ButtonMod, ButtonInit, ButtonWord, ButtonPress; exemplo do compilador: POKER |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/CARDS.F90` | Fonte Fortran; declarações: CardBasic, CardHand, FindSame, CardDeck; exemplo do compilador: POKER |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/DESCRIPT.F90` | Fonte Fortran; declarações: descript, DescriptorLoc; exemplo do compilador: POKER |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/MISC.F90` | Fonte Fortran; declarações: layout, cardx, cardy, dlock; exemplo do compilador: POKER |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/POKER.F90` | Fonte Fortran; declarações: poker, PokerStart, Message, WinnerSign; exemplo do compilador: POKER |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/POKER.RC` | Recurso/interface/definição de ligação; exemplo do compilador: POKER |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/REGISTRY.F90` | Fonte Fortran; declarações: pokerregistry, ReadRegistry, WriteRegistry, SaveRegistry; exemplo do compilador: POKER |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/RESOURCE.FD` | Include/declarações Fortran; exemplo do compilador: POKER |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/RESOURCE.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: POKER |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/SCORING.F90` | Fonte Fortran; declarações: scoring, FindHighestHand, LabelRedraw, DrawLabel; exemplo do compilador: POKER |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/SUBCLASS.F90` | Fonte Fortran; declarações: subclass, SubclassInit; exemplo do compilador: POKER |
| `Fortran/SAMPLES/FPS/GENERAL/QWPAINT/PAINTMOD.F90` | Fonte Fortran; declarações: QWPAINT, DrawTriangle; exemplo do compilador: QWPAINT |
| `Fortran/SAMPLES/FPS/GENERAL/QWPAINT/QWPAINT.F90` | Fonte Fortran; declarações: BrushControl, CanvasControl, DrawControlGrid, UpdateCursor; exemplo do compilador: QWPAINT |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/PDRAW.F90` | Fonte Fortran; declarações: DrawKeyboard, Bigger, Smaller, Highlight; exemplo do compilador: QWPIANO |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/PIANOMOD.F90` | Fonte Fortran; declarações: PIANOMOD; exemplo do compilador: QWPIANO |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/PMEM.F90` | Fonte Fortran; declarações: Load, SaveNotes, RecordNotes, Playback; exemplo do compilador: QWPIANO |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/PTEMPO.F90` | Fonte Fortran; declarações: Andante, Moderato, Allegro; exemplo do compilador: QWPIANO |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/QWPIANO.F90` | Fonte Fortran; declarações: QWPiano, KeyboardControl, ThreadPlay, Instructions; exemplo do compilador: QWPIANO |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SCIGRAPH.F90` | Fonte Fortran; declarações: SCIGRAPH; exemplo do compilador: SCIGRAPH |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGADMIN.F90` | Fonte Fortran; declarações: SGADMIN, GetGraphDefaults, GetDataDefaults, GetMultiDataDefaults; exemplo do compilador: SCIGRAPH |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGDATA.F90` | Fonte Fortran; declarações: SGDATA; exemplo do compilador: SCIGRAPH |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGDEMO.F90` | Fonte Fortran; declarações: SciGraphDemo, SciGraphDemoStart, LineDemo, BarDemo; exemplo do compilador: SCIGRAPH |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGDRAW.F90` | Fonte Fortran; declarações: SGDRAW, SciGetDataOffset, SciSetFillType, SciDrawBar; exemplo do compilador: SCIGRAPH |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGLOWLVL.F90` | Fonte Fortran; declarações: SGLOWLVL, SciMoveto_w, SciLine_w, SciCircle_w; exemplo do compilador: SCIGRAPH |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGPLOT.F90` | Fonte Fortran; declarações: SGPLOT, PlotGraph, PlotData, PlotMultiData; exemplo do compilador: SCIGRAPH |
| `Fortran/SAMPLES/FPS/GENERAL/WHIZZY/WHIZZY.F90` | Fonte Fortran; declarações: whizzy, DoDialog, EnableClick, UpdateTemp; exemplo do compilador: WHIZZY |
| `Fortran/SAMPLES/FPS/GENERAL/WHIZZY/WHIZZY.FD` | Include/declarações Fortran; exemplo do compilador: WHIZZY |
| `Fortran/SAMPLES/FPS/GENERAL/WHIZZY/WHIZZY.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: WHIZZY |
| `Fortran/SAMPLES/FPS/GENERAL/WHIZZY/WHIZZY.RC` | Recurso/interface/definição de ligação; exemplo do compilador: WHIZZY |
| `Fortran/SAMPLES/FPS/MIXLANG/MASM/POWER2_A.ASM` | Assembly; exemplo do compilador: MASM |
| `Fortran/SAMPLES/FPS/MIXLANG/MASM/POWER2_F.FOR` | Fonte Fortran; exemplo do compilador: MASM |
| `Fortran/SAMPLES/FPS/MIXLANG/MASM/POWR2C_A.ASM` | Assembly; exemplo do compilador: MASM |
| `Fortran/SAMPLES/FPS/MIXLANG/MASM/POWR2C_F.FOR` | Fonte Fortran; exemplo do compilador: MASM |
| `Fortran/SAMPLES/FPS/MIXLANG/MASM/RETURN_A.ASM` | Assembly; exemplo do compilador: MASM |
| `Fortran/SAMPLES/FPS/MIXLANG/MASM/RETURN_F.FOR` | Fonte Fortran; declarações: treturn; exemplo do compilador: MASM |
| `Fortran/SAMPLES/FPS/MIXLANG/MASM/SUMCV_A.ASM` | Assembly; exemplo do compilador: MASM |
| `Fortran/SAMPLES/FPS/MIXLANG/MASM/SUMCV_F.FOR` | Fonte Fortran; declarações: tsumcv; exemplo do compilador: MASM |
| `Fortran/SAMPLES/FPS/MIXLANG/MASM/UPERFN_A.ASM` | Assembly; exemplo do compilador: MASM |
| `Fortran/SAMPLES/FPS/MIXLANG/MASM/UPERFN_F.FOR` | Fonte Fortran; declarações: tupperfn; exemplo do compilador: MASM |
| `Fortran/SAMPLES/FPS/MIXLANG/MASM/UPPER_A.ASM` | Assembly; exemplo do compilador: MASM |
| `Fortran/SAMPLES/FPS/MIXLANG/MASM/UPPER_F.FOR` | Fonte Fortran; declarações: tupper; exemplo do compilador: MASM |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/CONSOLE/FSPLINE.FOR` | Fonte Fortran; declarações: fspline; exemplo do compilador: CONSOLE |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/CONSOLE/SPLINE.FOR` | Fonte Fortran; declarações: SplineCalculate, SplineEvaluate; exemplo do compilador: CONSOLE |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/QUICKWIN/FSPLINE.F90` | Fonte Fortran; declarações: fspline, FsplineGo, PointEvent, Redraw; exemplo do compilador: QUICKWIN |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/QUICKWIN/SPLINE.FOR` | Fonte Fortran; declarações: SplineCalculate, SplineEvaluate; exemplo do compilador: QUICKWIN |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/SPLINE.FOR` | Fonte Fortran; declarações: SplineCalculate, SplineEvaluate; exemplo do compilador: SPLINE |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB16/BSPLINE.BAS` | Módulo/formulário Visual Basic; exemplo do compilador: VB16 |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB16/BSPLINE.FRM` | Módulo/formulário Visual Basic; exemplo do compilador: VB16 |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB32/BSPLINE.FRM` | Módulo/formulário Visual Basic; exemplo do compilador: VB32 |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/MAINFRM.CPP` | Fonte ou cabeçalho C/C++; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/MAINFRM.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/RES/SCRIBBLE.RC2` | Recurso/interface/definição de ligação; exemplo do compilador: RES |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/RESOURCE.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/SCRIBBLE.CPP` | Fonte ou cabeçalho C/C++; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/SCRIBBLE.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/SCRIBBLE.RC` | Recurso/interface/definição de ligação; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/SCRIBDOC.CPP` | Fonte ou cabeçalho C/C++; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/SCRIBDOC.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/SCRIBVW.CPP` | Fonte ou cabeçalho C/C++; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/SCRIBVW.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/SPLINE.FOR` | Fonte Fortran; declarações: SplineCalculate, SplineEvaluate; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/STDAFX.CPP` | Fonte ou cabeçalho C/C++; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/STDAFX.H` | Fonte ou cabeçalho C/C++; exemplo do compilador: VC |
| `Fortran/SAMPLES/FPS/TUTORIAL/ASSOC.F90` | Fonte Fortran; declarações: assoc; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/CYCLE.F90` | Fonte Fortran; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/DERIVED.F90` | Fonte Fortran; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/DTYPEARG.F90` | Fonte Fortran; declarações: jones; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/DTYPECOM.F90` | Fonte Fortran; declarações: structure_in_common, sub1, sub2; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/DTYPEMOD.F90` | Fonte Fortran; declarações: m, jones; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/EPSILON.F90` | Fonte Fortran; declarações: epsilon, fpprecis; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/INTERNAL.F90` | Fonte Fortran; declarações: INTERNAL, find; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/INTERVAL.F90` | Fonte Fortran; declarações: interval, fpcontrl, fpprecis, fpround; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/KEYNAMES.F90` | Fonte Fortran; declarações: key_names; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/MATHERR.F90` | Fonte Fortran; declarações: MATHERRQQ; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/MATHTEST.F90` | Fonte Fortran; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/MBCOMP.FOR` | Fonte Fortran; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/NAME_SSN.F90` | Fonte Fortran; declarações: name_ssn, check_ssn; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/NAMELIST.F90` | Fonte Fortran; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/PERCENT.F90` | Fonte Fortran; declarações: CENT; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/POINTER.F90` | Fonte Fortran; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/POINTER2.F90` | Fonte Fortran; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/REALG.F90` | Fonte Fortran; declarações: threegraphs, gridshape; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/RECURS.F90` | Fonte Fortran; declarações: Inc, Out; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/SHOWFONT.F90` | Fonte Fortran; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/SIGTEST.F90` | Fonte Fortran; declarações: hand_fpe; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/SINE.F90` | Fonte Fortran; declarações: graphicsmode, drawlines, sinewave, drawshapes; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/TESTGET.F90` | Fonte Fortran; declarações: testget; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/THREADS.F90` | Fonte Fortran; declarações: BounceModule, BounceStart, BounceCreate, BounceProc; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/UNCLEAR.F90` | Fonte Fortran; declarações: UN_MOD, dup1, dup2, unclear; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/UNFSEQ.F90` | Fonte Fortran; declarações: UnformattedSequentialConverter; exemplo do compilador: TUTORIAL |
| `Fortran/SAMPLES/FPS/TUTORIAL/WHERE.FOR` | Fonte Fortran; exemplo do compilador: TUTORIAL |
| `matlab/influenciaTerraSolLua.mlx` | MATLAB Live Script; código confirmado em CDATA |
| `matlab/molnya.mlx` | MATLAB Live Script; código confirmado em CDATA |
| `matlab/molnyaDoSlide.mlx` | MATLAB Live Script; código confirmado em CDATA |
| `matlab/molnyapolosul.mlx` | MATLAB Live Script; código confirmado em CDATA |
| `matlab/tentativaOtimizacaoMolniya.mlx` | MATLAB Live Script; código confirmado em CDATA |

### Projetos e instruções de ferramentas (158)

| Arquivo | Breve descrição / classificação |
| --- | --- |
| `Fortran/Arquivos Fortran Fornecidos/TRAJ(US76)R.mdp` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/AUTORUN.INF` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/BIN/PROFILER.INI` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/BIN/SYSINCL.FPS` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/FPSSETUP/NETWORK.STF` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/FPSSETUP/SETUP.INF` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/FPSSETUP/SETUP.STF` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/PROJECTS/CELSIUS/CELSIUS.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/PROJECTS/CELSIUS/CELSIUS.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/ROADMAP/ACDEMO/CHKLIST.MS` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/ROADMAP/ACDEMO/LINGO.INI` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/ROADMAP/MFCKIT/SETUP.LST` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/ROADMAP/NTEVAL/SETUP.INS` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/ROADMAP/NTWSEVAL/SETUP.INS` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/ROADMAP/RMSETUP.INI` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/ROADMAP/VFW/SETUP.INI` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/ROADMAP/VFW/SETUP.MST` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/ROADMAP/VFW/VFWSETUP.LST` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/CASSIGN.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/CASSIGN.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/CUBE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/CUBE.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/FASSIGN.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/DIALOGM/DIALOGM.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/3DCUBE/CUBE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/3DCUBE/CUBE.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/CUBE5/CUBE5.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/CUBE5/CUBE5.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/OLYMPIC/OLYMPIC.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/OLYMPIC/OLYMPIC.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/PUZZLE/CUBE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/PUZZLE/CUBE.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/SIMPLE/SIMPLE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/SIMPLE/SIMPLE.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/WAVE/WAVE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/WAVE/WAVE.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/ANGLE/ANGLE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/ANGLE/ANGLE.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/BOUNCE/BOUNCE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/BOUNCE/BOUNCE.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CHECK_SD/CHECK_SD.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CHECK_SD/CHECK_SD.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CLIPTEXT/CLIPTEXT.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CLIPTEXT/CLIPTEXT.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CONSOLEC/CONSOLEC.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CONSOLEC/CONSOLEC.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CURSOR/CURSOR.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CURSOR/CURSOR.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/DRIVES/DRIVES.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/DRIVES/DRIVES.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/EVENT/EVENT.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/EVENT/EVENT.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/EXITWIN/EXITWIN.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/EXITWIN/EXITWIN.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/FLOPPY/FLOPPY.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/FLOPPY/FLOPPY.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETDEV/GETDEV.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETDEV/GETDEV.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/GETSYS.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/GETSYS.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INHERIT/CHILD.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INHERIT/CHILD.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INHERIT/INHERIT.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INHERIT/INHERIT.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INPUT/INPUT.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INPUT/INPUT.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MASKBLT.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MASKBLT.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MDI/MDI.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MDI/MDI.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENU.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENU.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTITHRD.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTITHRD.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MYPAL/MYPAL.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MYPAL/MYPAL.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OUTPUT/OUTPUT.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OUTPUT/OUTPUT.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCOMBO.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCOMBO.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PATHS/PATHS.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PATHS/PATHS.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLATFORM/PLATFORM.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLATFORM/PLATFORM.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/PLGBLT.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/PLGBLT.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/POLYDRAW/POLYDRAW.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/POLYDRAW/POLYDRAW.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PROCESS/PROCESS.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PROCESS/PROCESS.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/REGISTRY.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/REGISTRY.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/DEMO.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/DEMO.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/SELECT.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/SELECT.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SETINFO/SETINFO.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SETINFO/SETINFO.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/OTHRPROC.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/OTHRPROC.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/SHAREMEM.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/SHAREMEM.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STARTP/STARTP.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STARTP/STARTP.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/STREBLT.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/STREBLT.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SUBCLASS/SUBCLASS.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SUBCLASS/SUBCLASS.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TAKEOWN/TAKEOWN.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TAKEOWN/TAKEOWN.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TERMPROC/TERMPROC.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TERMPROC/TERMPROC.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/THREADS/THREADS.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/THREADS/THREADS.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TIMERS/TIMERS.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TIMERS/TIMERS.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLS.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLS.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLSDLL.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLSDLL.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/VIRTMEM/VIRTMEM.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/VIRTMEM/VIRTMEM.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/WORLD.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/WORLD.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WXFORM/WXFORM.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WXFORM/WXFORM.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/CALENDAR/CALENDAR.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/CALENDAR/CALENDAR.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/CHAOS.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/CHAOS.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/LCINFO/LCINFO.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/LCINFO/LCINFO.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/POKER.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/POKER.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/QWPAINT/QWPAINT.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/QWPAINT/QWPAINT.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/QWPIANO.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/QWPIANO.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SCIGRAPH.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SCIGRAPH.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGDEMO.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGDEMO.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/WHIZZY/WHIZZY.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/GENERAL/WHIZZY/WHIZZY.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/CONSOLE/FSPLINE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/QUICKWIN/FSPLINE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/SPLINE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB16/BSPLINE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB32/BSPLINE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/CSPLINE.MAK` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/CSPLINE.MDP` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SETUP.INI` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SETUP.LST` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |
| `Fortran/SETUP.TDF` | Configuração/projeto/instalação; possível conteúdo declarativo, não simulador |

### Possíveis fontes e recursos compactados (73)

| Arquivo | Breve descrição / classificação |
| --- | --- |
| `Fortran/ROADMAP/MFCKIT/0AINFRM.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0AINFRM.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0ESOURCE.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWD.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWD.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWD.MA_` | Candidato compactado de instalação (.ma_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWD.RC_` | Candidato compactado de instalação (.rc_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWD6.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWD6.DE_` | Candidato compactado de instalação (.de_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWD6.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWD6.MA_` | Candidato compactado de instalação (.ma_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWD6.RC_` | Candidato compactado de instalação (.rc_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWDDOC.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWDDOC.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWDIB.C_` | Candidato compactado de instalação (.c_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWDIB.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWDIB.DE_` | Candidato compactado de instalação (.de_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWDIB.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWDIB.MA_` | Candidato compactado de instalação (.ma_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWDIB.RC_` | Candidato compactado de instalação (.rc_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWDVW.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0HOWDVW.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0IB.C_` | Candidato compactado de instalação (.c_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0IB.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0LGOPEN.C_` | Candidato compactado de instalação (.c_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0LGOPEN.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0LGOPENA.AS_` | Candidato compactado de instalação (.as_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0RAWDIB.C_` | Candidato compactado de instalação (.c_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0RAWDIB.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0RINT.C_` | Candidato compactado de instalação (.c_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0RINT.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0TDAFX.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/0TDAFX.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1AINFRM.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1AINFRM.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1ESOURCE.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1HOWD.RC_` | Candidato compactado de instalação (.rc_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1HOWD6.RC_` | Candidato compactado de instalação (.rc_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1HOWDDOC.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1HOWDDOC.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1HOWDIB.C_` | Candidato compactado de instalação (.c_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1HOWDIB.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1HOWDIB.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1HOWDIB.RC_` | Candidato compactado de instalação (.rc_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1HOWDVW.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1HOWDVW.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1IB.C_` | Candidato compactado de instalação (.c_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1IB.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1LGOPEN.C_` | Candidato compactado de instalação (.c_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1LGOPEN.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1LGOPENA.AS_` | Candidato compactado de instalação (.as_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1RAWDIB.C_` | Candidato compactado de instalação (.c_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1RAWDIB.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1RINT.C_` | Candidato compactado de instalação (.c_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1RINT.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1TDAFX.CP_` | Candidato compactado de instalação (.cp_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/1TDAFX.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/2ESOURCE.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/2HOWDIB.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/3ESOURCE.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/3HOWDIB.H_` | Candidato compactado de instalação (.h_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/C_MFC.PT_` | Candidato compactado de instalação (.pt_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/C16_C32.PT_` | Candidato compactado de instalação (.pt_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/MIGRATE.PC_` | Candidato compactado de instalação (.pc_); conteúdo não extraído |
| `Fortran/ROADMAP/MFCKIT/SETUP.IN_` | Candidato compactado de instalação (.in_); conteúdo não extraído |
| `Fortran/ROADMAP/VFW/IMAADPCM.AC_` | Candidato compactado de instalação (.ac_); conteúdo não extraído |
| `Fortran/ROADMAP/VFW/MSADPCM.AC_` | Candidato compactado de instalação (.ac_); conteúdo não extraído |
| `Fortran/ROADMAP/VFW/MSCPYDIS.IN_` | Candidato compactado de instalação (.in_); conteúdo não extraído |
| `Fortran/ROADMAP/VFW/MSDETECT.IN_` | Candidato compactado de instalação (.in_); conteúdo não extraído |
| `Fortran/ROADMAP/VFW/MSVIDEO.NT_` | Candidato compactado de instalação (.nt_); conteúdo não extraído |
| `Fortran/ROADMAP/VFW/SETUP.IN_` | Candidato compactado de instalação (.in_); conteúdo não extraído |
| `Fortran/ROADMAP/VFW/SETUPAPI.IN_` | Candidato compactado de instalação (.in_); conteúdo não extraído |
| `Fortran/ROADMAP/VFW/STDOLE.TL_` | Candidato compactado de instalação (.tl_); conteúdo não extraído |

### Código compilado e contêineres binários (318)

| Arquivo | Breve descrição / classificação |
| --- | --- |
| `Fortran/Arquivos Fortran Fornecidos/TRAJ(US76)R.exe` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/Arquivos Fortran Fornecidos/TRAJ(US76)R.obj` | Binário/módulo/pacote (.obj); não é fonte legível; não executado |
| `Fortran/BIN/BITVIEW.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/BSCMAKE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/CVPACK.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/CVTRES.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/DMN0.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/DUMPBIN.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/EDITBIN.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/EEN0CXX.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/EEN0F90.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/EEN0SWT.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/EMN0N0.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/F13232.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/F23232.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/F90COM.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/FL32.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/FPSCDROM.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/FRMTEDIT.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/FSRC.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/GUTILS.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/HOOK.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/IDE/MSVCBLD.PKG` | Binário/módulo/pacote (.pkg); não é fonte legível; não executado |
| `Fortran/BIN/IDE/MSVCFOR.PKG` | Binário/módulo/pacote (.pkg); não é fonte legível; não executado |
| `Fortran/BIN/IDE/MSVCX86.PKG` | Binário/módulo/pacote (.pkg); não é fonte legível; não executado |
| `Fortran/BIN/LIB.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/LINK.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/MSDEV.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/MSPDB40.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/MSVCIN.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/MSVCMON.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/MSVCPRJ.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/MSVCRES.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/MSVCSHL.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/MSVCSRC.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/NMAKE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/PLIST.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/PREP.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/PROFILE.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/PROFILE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/RC.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/RCDLL.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/RCXDTI.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/SHN0.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/SPY.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/SYSTEM/CTL3D32.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/SYSTEM/IMAGEHLP.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/SYSTEM/MFC40.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/TLN0COM.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/TLN0LOC.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/TLN0T.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/BIN/VCSPAWN.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/WIN95/PVIEW95.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/WINDIFF.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/BIN/WINNT/PVIEW.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/FPSSETUP/ACMSETUP.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/FPSSETUP/AUTORUN.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/FPSSETUP/COMPLINC.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/FPSSETUP/F90SETUP.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/FPSSETUP/FPS40CRD.CRD` | Binário/módulo/pacote (.crd); não é fonte legível; não executado |
| `Fortran/FPSSETUP/MSDEVCRD.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/FPSSETUP/MSSETUP.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/FPSSETUP/MSVCRT20.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/FPSSETUP/NETPID.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/HELP/CBTLIB3.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/HELP/PLAY.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/INCLUDE/DIALOGM.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/DIALOGT.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSFLIB.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSFNLS.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSFWIN.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSFWINA.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSFWINTY.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSIMSL.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSIMSLC.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSIMSLCD.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSIMSLCS.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSIMSLMC.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSIMSLMD.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSIMSLMS.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSIMSLSC.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSIMSLSD.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MSIMSLSS.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/MT.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/OPENGL.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/OPENGLTY.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/INCLUDE/PORTLIB.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/LIB/ADVAPI32.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/COMDLG32.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/CONSOLE.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/DIALOGM.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/FP10.OBJ` | Binário/módulo/pacote (.obj); não é fonte legível; não executado |
| `Fortran/LIB/GDI32.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/GLAUX.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/GLU32.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/KERNEL32.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/LIBC.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/LIBCMT.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/LIBF.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/LIBFMT.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/LZ32.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/MATHD.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/MATHS.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/MPR.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/MSFNLS.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/MSFRT.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/MSFWIN.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/MSVCRT.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/OLDNAMES.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/OPENGL32.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/PORTLIB.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/QWIN.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/QWIN_MDI.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/QWIN_SDI.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/SCRNSAVE.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/SHELL32.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/STATD.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/STATS.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/USER32.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/VERSION.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/WINMM.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/WINSPOOL.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/LIB/WSOCK32.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/NUMREC/NR2DP.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/NUMREC/NRCOPY.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/REDIST/MSFRT40.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/REDIST/MSVCRT40.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/ROADMAP/ACDEMO/ACDEMO.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/ACROREAD.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/ATX30H.VBX` | Binário/módulo/pacote (.vbx); não é fonte legível; não executado |
| `Fortran/ROADMAP/CMDIALOG.VBX` | Binário/módulo/pacote (.vbx); não é fonte legível; não executado |
| `Fortran/ROADMAP/CSCMD.VBX` | Binário/módulo/pacote (.vbx); não é fonte legível; não executado |
| `Fortran/ROADMAP/CSHT.VBX` | Binário/módulo/pacote (.vbx); não é fonte legível; não executado |
| `Fortran/ROADMAP/CTL3D.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/ROADMAP/FPTAB11.VBX` | Binário/módulo/pacote (.vbx); não é fonte legível; não executado |
| `Fortran/ROADMAP/FTS.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/ROADMAP/GETVOL.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/ROADMAP/GRID.VBX` | Binário/módulo/pacote (.vbx); não é fonte legível; não executado |
| `Fortran/ROADMAP/MCIWNDX.VBX` | Binário/módulo/pacote (.vbx); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/0LGOPENA.OB_` | Binário/módulo/pacote (.ob_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/1LGOPENA.OB_` | Binário/módulo/pacote (.ob_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/MIGRAT32.EX_` | Binário/módulo/pacote (.ex_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/MIGRATE.EX_` | Binário/módulo/pacote (.ex_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/MSCOMSTF.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/MSCUISTF.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/MSDETSTF.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/MSINSSTF.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/MSSHLSTF.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/MSTEST.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/MSTVIEW.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/MSUILSTF.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/RBHEAP.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/SETUP.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/TESTEXIT.EX_` | Binário/módulo/pacote (.ex_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/WBEXEC20.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/WBRUN20.EX_` | Binário/módulo/pacote (.ex_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MFCKIT/WINBAS20.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/MSABC110.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/ROADMAP/MSAJT112.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/ROADMAP/MSAJT200.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/ROADMAP/MSDNDEMO/MSDNDEMO.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/MSDNDEMO/MSIN.OVL` | Binário/módulo/pacote (.ovl); não é fonte legível; não executado |
| `Fortran/ROADMAP/NTEVAL/D2HLINK.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/NTEVAL/D2HTOOLS.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/NTEVAL/INS0762.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/ROADMAP/NTEVAL/SETUP.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/NTEVAL/SETUP.PKG` | Binário/módulo/pacote (.pkg); não é fonte legível; não executado |
| `Fortran/ROADMAP/NTWSEVAL/D2HLINK.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/NTWSEVAL/D2HTOOLS.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/NTWSEVAL/INS0762.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/ROADMAP/NTWSEVAL/SETUP.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/NTWSEVAL/SETUP.PKG` | Binário/módulo/pacote (.pkg); não é fonte legível; não executado |
| `Fortran/ROADMAP/QPRO200.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/ROADMAP/RMAP1.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/ROADMAP.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/RUNT_2A.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/ROADMAP/SETUP.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/THREED.VBX` | Binário/módulo/pacote (.vbx); não é fonte legível; não executado |
| `Fortran/ROADMAP/TLIST.VBX` | Binário/módulo/pacote (.vbx); não é fonte legível; não executado |
| `Fortran/ROADMAP/TNDEMO/DEMO.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/TNDEMO/MSIN.OVL` | Binário/módulo/pacote (.ovl); não é fonte legível; não executado |
| `Fortran/ROADMAP/UNINSTAL.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/VB4DEMO/INIUPD.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/ROADMAP/VB4DEMO/SETUP.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/VB4DEMO/UNINSTW.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/VB4DEMO/WACGDEMO.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/VBDB300.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/ROADMAP/VBRUN300.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/_MSSETUP.EX_` | Binário/módulo/pacote (.ex_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/_MSTEST.EX_` | Binário/módulo/pacote (.ex_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/ACMCMPRS.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/AVICAP.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/AVIFILE.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/COMPOBJ.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/CTL3D.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/DISPDIB.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/DVA.38_` | Binário/módulo/pacote (.38_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/INIUPD.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/IR21_R.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/IR32.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/MCIOLE.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/MPLAYER.EX_` | Binário/módulo/pacote (.ex_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/MSACM.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/MSCOMSTF.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/MSCPYDIS.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/MSCUISTF.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/MSDETSTF.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/MSINSSTF.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/MSSHLSTF.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/MSUILSTF.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/MSVIDEO.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/OLE2.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/OLE2CONV.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/OLE2DISP.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/OLE2NLS.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/OLE2PROX.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/PROFDISP.EX_` | Binário/módulo/pacote (.ex_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/STORAGE.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/TYPELIB.DL_` | Binário/módulo/pacote (.dl_); não é fonte legível; não executado |
| `Fortran/ROADMAP/VFW/VFWSETUP.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/ROADMAP/WFOXDEMO/WFOXDEMO.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/CASSIGN.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/CUBE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/DESCRIPT/FASSIGN.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/DIALOGM/DLGLOW.OBJ` | Binário/módulo/pacote (.obj); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/3DCUBE/CUBE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/CUBE5/CUBE5.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/OLYMPIC/OLYMPIC.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/PUZZLE/CUBE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/SIMPLE/SIMPLE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/WAVE/WAVE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/ANGLE/ANGLE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/BOUNCE/BOUNCE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CHECK_SD/CHECK_SD.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CLIPTEXT/CLIPTEXT.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CMNDLG/CMNDLG.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CONSOLEC/CONSOLEC.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CURSOR/CURSOR.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/DRIVES/DRIVES.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/EVENT/EVENT.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/EXITWIN/EXITWIN.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/FLOPPY/FLOPPY.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETDEV/GETDEV.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GETSYS/GETSYS.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INHERIT/CHILD.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INHERIT/INHERIT.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/INPUT/INPUT.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MASKBLT.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MDI/MDI.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENU.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTITHRD.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MYPAL/MYPAL.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OUTPUT/OUTPUT.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCOMBO.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PATHS/PATHS.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLATFORM/PLATFORM.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/PLGBLT.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/POLYDRAW/POLYDRAW.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PROCESS/PROCESS.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/REGISTRY/REGISTRY.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/DEMO.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SELECT/SELECT.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SETINFO/SETINFO.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/OTHRPROC.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/SHAREMEM.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STARTP/STARTP.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/STREBLT.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SUBCLASS/SUBCLASS.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TAKEOWN/TAKEOWN.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TERMPROC/TERMPROC.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/THREADS/THREADS.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TIMERS/TIMERS.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLS.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLSDLL.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/VIRTMEM/VIRTMEM.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/WORLD.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WXFORM/WXFORM.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/CALENDAR/CALENDAR.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/CHAOS.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHD/BSINT_EX.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHS/BSINT_EX.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATD/UVSTA_EX.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATS/UVSTA_EX.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/LCINFO/LCINFO.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/POKER.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/QWPAINT/QWPAINT.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/QWPIANO.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SCIGRAPH.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SCIGRAPH.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGADMIN.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGDATA.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGDEMO.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGDRAW.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGLOWLVL.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SGPLOT.MOD` | Binário/módulo/pacote (.mod); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/GENERAL/WHIZZY/WHIZZY.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/CONSOLE/FSPL_DLL.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/CONSOLE/FSPLINE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/CONSOLE/SPLINE.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/CONSOLE/SPLINE.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/EXCEL95/SPLINE.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/QUICKWIN/FSPL_DLL.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/QUICKWIN/FSPLINE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/QUICKWIN/SPLINE.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/QUICKWIN/SPLINE.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/SPLINE.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/SPLINE.LIB` | Binário/módulo/pacote (.lib); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB16/BSPLINE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB16/SPLINE.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB16/VBRUN300.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB32/BSPLINE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB32/OLEPRO32.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB32/SPLINE.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB32/VB40032.DLL` | Binário/módulo/pacote (.dll); não é fonte legível; não executado |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/CSPLINE.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `Fortran/SETUP.EXE` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |
| `gnuplot/gp543-win64-mingw.exe` | Binário/módulo/pacote (.exe); não é fonte legível; não executado |

### Documentação e possíveis trechos ou macros (77)

| Arquivo | Breve descrição / classificação |
| --- | --- |
| `anotacoes.docx` | Texto XML inspecionado: material didático/resultados; imagens não inspecionadas |
| `atividade pra entregar/Tarefa 1.docx` | Texto XML inspecionado: material didático/resultados; imagens não inspecionadas |
| `atividades.docx` | Texto XML inspecionado: material didático/resultados; imagens não inspecionadas |
| `atividades.txt` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `DVE - conclusoes sobre o arrasto 09-05-22.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/Atividades sobre o capítulo 5, 6, 7, Shames e Curtis.docx` | Texto XML inspecionado: material didático/resultados; imagens não inspecionadas |
| `DVE Arquivos do teams/Aula 11.01.22.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/Aula 14.12.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/Aula 15.12.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/Aula 16.11.21.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/Aula 18.01 DVE.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/Cap 8.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/Constellations of Elliptical Inclined Lunar Orbits.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/DCV 1.1.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/DCV 2.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/DCV 3.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/DCV 4.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/DCV 5.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/DCV 6.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/DCV 7.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/Equação do Foguete.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/PE EHE Dinâmica de Veículos Espaciais 2.2021.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/The Effects of Moon_s Uneven Mass Distribution on the Critical Inclinations of a Lunar Orbiter.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/Trabalhos numéricos 02.20.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `DVE Arquivos do teams/world_50m.txt` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Estudo Arrasto Starlink p 26-04.docx` | Texto XML inspecionado: material didático/resultados; imagens não inspecionadas |
| `Estudo Orbitas Molniya p 26-04.docx` | Texto XML inspecionado: material didático/resultados; imagens não inspecionadas |
| `Fortran/BIN/FL32.TXT` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/BIN/PROFILER.XLM` | Planilha; possível macro, não verificada |
| `Fortran/BIN/WINDIFF.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/fortran.pdf` | Documento PDF; código embutido não verificado por extração/OCR |
| `Fortran/FPSSETUP/ACMSETUP.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/HELP/BITVIEW.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/HELP/FPS40.MVB` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/HELP/FPSBKS40.MVB` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/HELP/FQWIN.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/HELP/FRMTEDIT.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/HELP/INTROFPS.LES` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/HELP/MSDEV40.MVB` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/HELP/PSS.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/HELP/WIN32SDK.MVB` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/NUMREC/NRF207.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/README.TXT` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/REDIST/FQWIN.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/DB9503.PDF` | Documento PDF; código embutido não verificado por extração/OCR |
| `Fortran/ROADMAP/DIREC.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/FALLON.PDF` | Documento PDF; código embutido não verificado por extração/OCR |
| `Fortran/ROADMAP/MAR95HCL.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/MAY95HCL.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/MCDONN.PDF` | Documento PDF; código embutido não verificado por extração/OCR |
| `Fortran/ROADMAP/MFCKIT/0EADME.TX_` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/MFCKIT/1EADME.TX_` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/MFCKIT/MIGRATE.HL_` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/MFCKIT/README.TX_` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/MSDNDEMO/MSDNCD.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/MSDNDEMO/MSDNDEMO.MVB` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/MULLIN.PDF` | Documento PDF; código embutido não verificado por extração/OCR |
| `Fortran/ROADMAP/ODBC.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/ROADMAP.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/STDCOMP.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/TNDEMO/TNETDEMO.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/TNDEMO/TNETDEMO.MVB` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/VFW/MAP_WIN.HL_` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/ROADMAP/VFW/MPLAYER.HL_` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC.HLP` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC.RTF` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/README.TXT` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/SAMPLES/FPS/GENERAL/LCINFO/DATA.TXT` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/ENTERTNR.TXT` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/FIGURINE.TXT` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/GNOME.TXT` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/MENUET.TXT` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/MUSICBOX.TXT` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/SAMPLES/FPS/GENERAL/QWPIANO/POLONAIS.TXT` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/SAMPLES/FPS/GENERAL/SCIGRAPH/SCIGRAPH.WRI` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/EXCEL95/XLSPLINE.XLS` | Planilha; possível macro, não verificada |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VB16/GENTHUNK.TXT` | Texto/ajuda/material de apoio; pode conter exemplos ou comandos |

### Arquivos sem extensão (18)

| Arquivo | Breve descrição / classificação |
| --- | --- |
| `DVE Arquivos do teams/Atmosfera` | Tabela atmosférica; dados, não código |
| `Fortran/Arquivos Fortran Fornecidos/ECEF` | Dados associados ao simulador; nome referenciado nas rotinas de saída/atmosfera |
| `Fortran/Arquivos Fortran Fornecidos/ECI` | Dados associados ao simulador; nome referenciado nas rotinas de saída/atmosfera |
| `Fortran/Arquivos Fortran Fornecidos/EOG` | Dados associados ao simulador; nome referenciado nas rotinas de saída/atmosfera |
| `Fortran/Arquivos Fortran Fornecidos/GRT` | Dados associados ao simulador; nome referenciado nas rotinas de saída/atmosfera |
| `Fortran/Arquivos Fortran Fornecidos/IAA` | Dados associados ao simulador; nome referenciado nas rotinas de saída/atmosfera |
| `Fortran/Arquivos Fortran Fornecidos/Lua` | Dados associados ao simulador; nome referenciado nas rotinas de saída/atmosfera |
| `Fortran/Arquivos Fortran Fornecidos/TPH` | Dados associados ao simulador; nome referenciado nas rotinas de saída/atmosfera |
| `Fortran/Arquivos Fortran Fornecidos/USS76` | Dados associados ao simulador; nome referenciado nas rotinas de saída/atmosfera |
| `Fortran/Arquivos Fortran Fornecidos/V24` | Dados associados ao simulador; nome referenciado nas rotinas de saída/atmosfera |
| `Fortran/ROADMAP/TNDEMO/MSIN3391` | Arquivo binário de suporte à ajuda TNETDEMO.MVB; assinatura MSIN |
| `Fortran/ROADMAP/TNDEMO/MSIN4550` | Arquivo binário de suporte à ajuda TNETDEMO.MVB; assinatura MSIN |
| `Fortran/ROADMAP/TNDEMO/MSIN5175` | Arquivo binário de suporte à ajuda TNETDEMO.MVB; assinatura MSIN |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/LOCS` | Listagem com trechos Fortran e referências a BITMAP.F90, incluindo GetObject e LOC |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHD/MAKEFILE` | Makefile confirmado; regras de compilação dos exemplos IMSL |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/MATHS/MAKEFILE` | Makefile confirmado; regras de compilação dos exemplos IMSL |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATD/MAKEFILE` | Makefile confirmado; regras de compilação dos exemplos IMSL |
| `Fortran/SAMPLES/FPS/GENERAL/IMSL/STATS/MAKEFILE` | Makefile confirmado; regras de compilação dos exemplos IMSL |

### Outros artefatos (506)

| Arquivo | Breve descrição / classificação |
| --- | --- |
| `Fortran/Arquivos Fortran Fornecidos/TRAJ(US76)R.ilk` | Extensão .ilk; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/Arquivos Fortran Fornecidos/TRAJ(US76)R.pdb` | Extensão .pdb; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/BIN/BSCMAKE.ERR` | Extensão .err; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/BIN/CVPACK.ERR` | Extensão .err; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/BIN/CVTRES.ERR` | Extensão .err; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/BIN/F132.ERR` | Extensão .err; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/BIN/F232.ERR` | Extensão .err; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/BIN/IDE/FPS.TIP` | Extensão .tip; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/BIN/IDE/MSDEV.TIP` | Extensão .tip; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/BIN/IDE/TOOLS.TIP` | Extensão .tip; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/BIN/NMAKE.ERR` | Extensão .err; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/FPS40.AUX` | Extensão .aux; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/FPS40.CAC` | Extensão .cac; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/FPSBKS40.AUX` | Extensão .aux; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/FPSBKS40.CAC` | Extensão .cac; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/FPSBKS40.CS1` | Extensão .cs1; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/FPSBKS40.CSC` | Extensão .csc; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/FPSBKS40.IDX` | Extensão .idx; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/FPSBKS40.KWD` | Extensão .kwd; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/MSDEV40.AUX` | Extensão .aux; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/MSDEV40.CAC` | Extensão .cac; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/PSS.CNT` | Extensão .cnt; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/WIN32SDK.AUX` | Extensão .aux; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/WIN32SDK.CAC` | Extensão .cac; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/WIN32SDK.IDX` | Extensão .idx; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/HELP/WIN32SDK.KWD` | Extensão .kwd; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/NUMREC/NR2DP.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/ACDEMO/ACC01.DIR` | Extensão .dir; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/ACDEMO/ACC02.DIR` | Extensão .dir; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/ACDEMO/ACC03.DIR` | Extensão .dir; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/ACDEMO/ACC04.DIR` | Extensão .dir; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/ACDEMO/ACMENU.DIR` | Extensão .dir; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/ACDEMO/CLOSER.DIR` | Extensão .dir; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/ACDEMO/SHARED.DIR` | Extensão .dir; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/0AKEFILE._` | Extensão ._; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/0AT.BM_` | Extensão .bm_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/0EST.BM_` | Extensão .bm_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/0HOWD.IC_` | Extensão .ic_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/0HOWD6.IC_` | Extensão .ic_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/0HOWDIB.IC_` | Extensão .ic_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/0OG.BM_` | Extensão .bm_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/0RAK1.BM_` | Extensão .bm_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/1AT.BM_` | Extensão .bm_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/1HOWDIB.IC_` | Extensão .ic_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/1OG.BM_` | Extensão .bm_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/1RAK1.BM_` | Extensão .bm_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/2AT.BM_` | Extensão .bm_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/2HOWDIB.IC_` | Extensão .ic_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/2OG.BM_` | Extensão .bm_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/2RAK1.BM_` | Extensão .bm_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/3HOWDIB.IC_` | Extensão .ic_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MFCKIT/4HOWDIB.IC_` | Extensão .ic_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MSDNDEMO/MSDNDEMO.AUX` | Extensão .aux; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MSDNDEMO/MSDNDEMO.CAC` | Extensão .cac; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MSDNDEMO/MSDNDEMO.CS1` | Extensão .cs1; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MSDNDEMO/MSDNDEMO.CSC` | Extensão .csc; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MSDNDEMO/MSDNDEMO.FLT` | Extensão .flt; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MSDNDEMO/MSDNDEMO.HST` | Extensão .hst; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MSDNDEMO/MSDNDEMO.IDX` | Extensão .idx; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MSDNDEMO/MSDNDEMO.KWD` | Extensão .kwd; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/MVFPDEMO/MVFP.AVI` | Extensão .avi; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/NTEVAL/DATA.1` | Extensão .1; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/NTEVAL/SETUP.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/NTWSEVAL/DATA.1` | Extensão .1; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2108_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2108_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2108_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2110_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2110_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2111_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2111_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2115_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2124_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2124_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2124_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2124_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2127_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2127_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2131_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2131_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2131_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2131_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2131_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2139_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2210_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2211_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2211_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2212_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2212_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2213_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2213_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_11.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_12.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_13.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_14.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_15.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_16.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_17.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_18.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_19.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_20.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_21.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_22.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_23.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_24.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_25.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_26.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_27.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_28.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_29.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2216_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2218_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2218_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2218_11.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2218_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2218_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2218_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2218_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2218_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2218_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2218_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2218_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2220_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2220_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2220_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2220_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2225_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2225_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2227_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_11.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_12.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_13.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_14.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_15.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_16.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_17.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_18.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_19.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_20.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_21.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_22.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_23.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_24.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_25.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_26.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_27.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2246_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2247_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2247_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2247_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2247_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2248_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2248_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2248_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2248_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2250_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2251_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2251_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2251_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2251_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2251_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2251_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_11.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_12.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_13.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_14.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_15.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_16.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_17.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_18.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_19.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_20.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_21.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_22.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_23.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_24.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_25.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_26.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2253_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2254_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2255_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2255_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2255_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2255_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2257_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2257_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2257_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2257_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2257_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2257_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2257_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2257_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2258_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2258_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2258_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2258_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2258_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2258_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2259_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2259_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2259_11.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2259_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2259_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2259_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2259_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2259_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2259_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2259_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2259_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2260_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2260_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2260_11.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2260_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2260_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2260_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2260_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2260_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2260_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2260_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2260_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_11.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_12.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_13.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_14.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_15.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_16.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_17.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_18.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_19.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_20.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_21.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_22.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_23.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_24.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_25.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_26.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_27.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_4A.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_4B.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2304_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2307_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2307_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2307_11.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2307_12.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2307_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2307_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2307_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2307_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2307_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2307_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2307_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2307_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2309_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2309_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2309_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2309_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2309_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2309_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2312_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2312_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2315_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2315_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2315_11.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2315_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2315_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2315_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2315_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2315_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2315_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2315_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2315_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2319_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2319_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2319_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2319_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2321_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2321_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2321_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2321_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2321_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2321_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2321_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2321_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2321_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2321_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2324_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2324_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2326_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2326_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2326_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2326_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2327_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2327_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2327_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2327_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2327_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2327_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2327_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2327_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2327_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2327_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2407_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2407_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2407_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2414_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2414_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2414_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2414_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2417_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2417_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2418_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2418_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2419_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2419_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2421_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2421_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2421_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2421_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2421_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2424_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2424_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2428_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2428_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2428_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2428_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2428_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2429_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2429_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2429_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2430_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2430_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2431_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2431_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2431_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2431_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2434_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2434_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2434_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2435_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2435_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2435_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2436_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2436_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2436_11.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2436_12.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2436_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2436_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2436_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2436_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2436_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2436_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2436_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2436_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2439_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2439_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2439_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2439_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2441_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2441_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2441_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2441_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2441_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2703_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2703_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2703_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2703_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_10.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_11.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_12.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_13.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_14.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_15.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_8.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/2704_9.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/531_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/562_1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/562_2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/6DDSPLSH.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/6S1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/6S2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/6S3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/6S4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/6S5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/6S6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/6S7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/DDSPLSH.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/S1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/S2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/S3.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/S4.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/S5.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/S6.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/PICS/S7.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/RMAP.IA` | Extensão .ia; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/RUNT2A.MDB` | Extensão .mdb; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/TNDEMO/TNETDEMO.AUX` | Extensão .aux; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/TNDEMO/TNETDEMO.CAC` | Extensão .cac; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/TNDEMO/TNETDEMO.FLT` | Extensão .flt; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/TNDEMO/TNETDEMO.HST` | Extensão .hst; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/TNDEMO/TNETDEMO.IDX` | Extensão .idx; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/VFW/CLEANUP.RE_` | Extensão .re_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/VFW/ICCVID.DR_` | Extensão .dr_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/VFW/MCIAVI.DR_` | Extensão .dr_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/VFW/MPLAYER.RE_` | Extensão .re_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/VFW/MSACM.DR_` | Extensão .dr_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/VFW/MSRLE.DR_` | Extensão .dr_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/VFW/MSVIDC.DR_` | Extensão .dr_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/ROADMAP/VFW/OLE2.RE_` | Extensão .re_; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/OPENGL/PUZZLE/CUBE.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/ANGLE/ANGLE.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/CURSOR/BULLSEYE.CUR` | Extensão .cur; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/GENERIC/GENERIC.RCV` | Extensão .rcv; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MASKBLT.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MONO1.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MASKBLT/MONO2.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/CHECKOFF.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/CHECKON.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MENU/MENU.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MLTITHRD/MLTITHRD.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/MYPAL/MYPAL.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/OWNCOMBO/OWNCOMBO.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PATHS/PATHS.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/PLGDRAW/PLGBLT.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/POLYDRAW/POLYDRAW.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SHAREMEM/HAIR.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/STREBLT/STREBLT.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/SUBCLASS/SUBCLASS.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/TLS/TLSDLL.EXP` | Extensão .exp; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/SAMPLE.EMF` | Extensão .emf; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WORLD/WORLD.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/ADVANCED/WIN32/WXFORM/WXFORM.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/ICON1.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PAL1.PAL` | Extensão .pal; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PAL2.PAL` | Extensão .pal; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PAL3.PAL` | Extensão .pal; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PAL4.PAL` | Extensão .pal; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PAL5.PAL` | Extensão .pal; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/PAL6.PAL` | Extensão .pal; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE3A.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE3B.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE3C.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE3D.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE3E.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE3F.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE3X.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE4A.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE4B.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE4C.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE4D.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE4E.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE4Q.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE5A.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE5B.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE5C.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE5D.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE5E.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/CHAOS/SAVE5F.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/POINTER.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/GENERAL/POKER/POKER.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/CONSOLE/FSPLINE.DAT` | Extensão .dat; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/RES/SCRIBBLE.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/RES/SCRIBDOC.ICO` | Extensão .ico; imagem, dados ou suporte; não identificado como fonte |
| `Fortran/SAMPLES/FPS/MIXLANG/SPLINE/VC/RES/TOOLBAR.BMP` | Extensão .bmp; imagem, dados ou suporte; não identificado como fonte |

## Próximos passos para o port

1. Escolher e registrar a variante TRAJ que servirá de referência, preservando as diferenças US76/TD88.
2. Separar condições iniciais, modelos de força, mudanças de coordenadas, integração e saídas.
3. Usar os cenários e resultados da disciplina para comparar a implementação moderna com a original.
4. Inspecionar PDFs e conteúdos compactados se for necessário recuperar algoritmos adicionais.

