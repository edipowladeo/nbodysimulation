/*
 *    STATS.H	- Declare single-precision IMSL STAT/LIBRARY routines
 *
 *    Copyright (c) 1994 by Visual Numerics, Inc.  All Rights Reserved.
 */


#ifndef IMSL_STAT_SINGLE

#ifndef IMSL_COMMON

typedef struct {
    float	re;
    float	im;
} f_complex;

typedef struct {
    double	re;
    double	im;
} d_complex;

#endif

#if defined(__cplusplus)
extern "C" {
#endif

/*
 *    Chapter 1:  Basic Statistics
 */

void	__stdcall OWFRQ(long*, float*, long*, long*, float*, float*, float*,
		float*, float*);
void	__stdcall TWFRQ(long*, float*, float*, long*, long*, long*, float*,
		float*, float*, float*, float*, float*, float*, float*, float*,
		long*);
void	__stdcall FREQ(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, long*, float*, float*);
void	__stdcall F2EQ(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, long*, float*, float*, long*, float*);
void	__stdcall UVSTA(long*, long*, long*, float*, long*, long*, long*, long*,
		float*, float*, long*, float*, long*, long*);
void	__stdcall U2STA(long*, long*, long*, float*, long*, long*, long*, long*,
		float*, float*, long*, float*, long*, long*, float*);
void	__stdcall RANKS(long*, float*, float*, long*, long*, float*);
void	__stdcall R2NKS(long*, float*, float*, long*, long*, float*, long*);
void	__stdcall LETTR(long*, float*, long*, float*, long*);
void	__stdcall L2TTR(long*, float*, long*, float*, long*, float*);
void	__stdcall ORDST(long*, float*, long*, long*, long*, float*, long*);
void	__stdcall O2DST(long*, float*, long*, long*, long*, float*, long*,
		float*);
void	__stdcall EQTIL(long*, float*, long*, float*, float*, float*, float*,
		long*);
void	__stdcall E2TIL(long*, float*, long*, float*, float*, float*, float*,
		long*, float*);
void	__stdcall TWOMV(long*, long*, float*, long*, float*, float*, float*,
		long*, float*);
void	__stdcall BINES(long*, long*, float*, float*, float*, float*);
void	__stdcall POIES(long*, long*, float*, float*, float*, float*);
void	__stdcall NRCES(long*, float*, float*, long*, float*, float*, long*,
		long*, float*, float*, float*, float*, float*, long*);
void	__stdcall GRPES(long*, float*, float*, float*, long*, float*);
void	__stdcall CSTAT(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, long*, long*, float*, long*);
void	__stdcall MEDPL(long*, long*, float*, long*, long*, float*, long*,
		long*);
void	__stdcall M2DPL(long*, long*, float*, long*, long*, float*, long*,
		long*, float*);

/*
 *    Chapter 2:  Regression
 */

void	__stdcall RONE(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, float*, float*, long*, float*, float*, long*,
		float*, long*, float*, float*, long*, long*);
void	__stdcall R2NE(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, float*, float*, long*, float*, float*, long*,
		float*, long*, float*, float*, long*, long*, long*, float*);
void	__stdcall RINCF(float*, float*, long*, float*, float*, float*, float*,
		float*, float*, float*, float*, float*, float*);
void	__stdcall RINPF(float*, float*, long*, float*, float*, float*, float*,
		float*, long*, float*, float*, float*, float*, float*);
void	__stdcall RLSE(long*, float*, long*, float*, long*, long*, float*,
		float*, float*);
void	__stdcall R2SE(long*, float*, long*, float*, long*, long*, float*,
		float*, float*, float*, long*, float*, long*, float*);
void	__stdcall RCOV(long*, long*, long*, float*, long*, float*, float*,
		float*, float*, long*, float*, long*, long*, float*, long*);
void	__stdcall RGIVN(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, float*, float*, long*,
		float*, long*, float*, long*, float*, float*, long*, long*,
		float*, float*);
void	__stdcall R2IVN(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, float*, float*, long*,
		float*, long*, float*, long*, float*, float*, long*, long*,
		float*, float*, float*);
void	__stdcall RGLM(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*, long*,
		float*, long*, long*, float*, long*, float*, long*, float*,
		long*, float*, long*, float*, float*, long*, long*, float*,
		float*);
void	__stdcall R2LM(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*, long*,
		float*, long*, long*, float*, long*, float*, long*, float*,
		long*, float*, long*, float*, float*, long*, long*, float*,
		float*, long*, float*);
void	__stdcall RLEQU(long*, long*, long*, float*, long*, long*, long*,
		float*, long*, float*, float*, long*, float*, long*, float*,
		long*, float*, float*, long*, long*);
void	__stdcall R2EQU(long*, long*, long*, float*, long*, long*, long*,
		float*, long*, float*, float*, long*, float*, long*, float*,
		long*, float*, float*, long*, long*, float*);
void	__stdcall RSTAT(long*, long*, long*, float*, float*, long*, float*,
		float*, char*, unsigned int, float*, float*, long*, float*,
		long*, float*, long*);
void	__stdcall RCOVB(long*, float*, long*, float*, float*, long*);
void	__stdcall CESTI(long*, long*, float*, long*, long*, long*, float*,
		long*, float*, long*, long*, long*, float*, long*, float*,
		long*);
void	__stdcall C2STI(long*, long*, float*, long*, long*, long*, float*,
		long*, float*, long*, long*, long*, float*, long*, float*,
		long*, long*, float*);
void	__stdcall RHPSS(long*, long*, float*, long*, long*, float*, long*,
		long*, float*, long*, float*, long*, float*, long*, float*,
		float*, long*);
void	__stdcall R2PSS(long*, long*, float*, long*, long*, float*, long*,
		long*, float*, long*, float*, long*, float*, long*, float*,
		float*, long*, long*, float*);
void	__stdcall RHPTE(float*, long*, float*, long*, long*, float*, long*,
		float*, float*, long*, float*);
void	__stdcall R2PTE(float*, long*, float*, long*, long*, float*, long*,
		float*, float*, long*, float*, float*);
void	__stdcall RLOFE(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, float*, long*, long*, float*);
void	__stdcall R2OFE(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, float*, long*, long*, float*, long*, float*);
void	__stdcall RLOFN(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, float*, float*, long*, float*, float*, long*,
		long*, float*, long*, long*, float*);
void	__stdcall R2OFN(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, float*, float*, long*, float*, float*, long*,
		long*, float*, long*, long*, float*, long*, float*);
void	__stdcall RCASE(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, float*, long*, long*, long*, long*, long*, long*,
		float*, float*, char*, unsigned int, long*, long*, float*,
		float*, long*, float*, float*, float*, long*, long*);
void	__stdcall R2ASE(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, float*, long*, long*, long*, long*, long*, long*,
		float*, float*, char*, unsigned int, long*, long*, float*,
		float*, long*, float*, float*, float*, long*, long*, float*);
void	__stdcall ROTIN(long*, long*, float*, long*, long*, long*, long*, long*,
		float*, long*, float*, float*, float*, float*, long*, long*);
void	__stdcall R2TIN(long*, long*, float*, long*, long*, long*, long*, long*,
		float*, long*, float*, float*, float*, float*, long*, long*,
		float*);
void	__stdcall GCLAS(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, float*, long*);
void	__stdcall GRGLM(long*, long*, float*, long*, long*, long*, long*,
		float*, long*, long*, long*, long*, long*, float*, long*,
		long*);
void	__stdcall RBEST(long*, float*, long*, long*, long*, long*, long*, long*,
		long*, float*, long*, long*, long*, float*, long*);
void	__stdcall R2EST(long*, float*, long*, long*, long*, long*, long*, long*,
		long*, float*, long*, long*, long*, float*, long*, float*,
		long*);
void	__stdcall RSTEP(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, float*, float*, long*, float*, float*, long*,
		float*, float*, long*, float*, long*);
void	__stdcall R2TEP(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, float*, float*, long*, float*, float*, long*,
		float*, float*, long*, float*, long*, float*, long*);
void	__stdcall GSWEP(long*, long*, float*, long*, long*, float*, float*,
		float*);
void	__stdcall RSUBM(long*, float*, long*, float*, long*, float*, long*);
void	__stdcall R2UBM(long*, float*, long*, float*, long*, float*, long*,
		long*);
void	__stdcall RPOLY(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, float*, long*, long*, float*, long*, long*,
		long*, float*, float*, long*, float*, long*, float*, long*,
		float*, long*, long*);
void	__stdcall R2OLY(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, float*, long*, long*, float*, long*, long*,
		long*, float*, float*, long*, float*, long*, float*, long*,
		float*, long*, long*, float*, long*);
void	__stdcall RCOMP(long*, float*, float*, long*, long*, long*, float*,
		long*);
void	__stdcall RFORP(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, float*, long*, long*, float*, float*, float*,
		float*, float*, float*, float*, float*, float*, float*, long*);
void	__stdcall R2ORP(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, float*, long*, long*, float*, float*, float*,
		float*, float*, float*, float*, float*, float*, float*, long*,
		float*, long*);
void	__stdcall RSTAP(long*, float*, float*, float*, float*, float*, float*,
		float*, float*, long*, float*, float*, long*, float*, float*,
		long*, float*, long*, float*, long*);
void	__stdcall R2TAP(long*, float*, float*, float*, float*, float*, float*,
		float*, float*, long*, float*, float*, long*, float*, float*,
		long*, float*, long*, float*, long*, float*);
void	__stdcall RCASP(long*, long*, float*, long*, long*, long*, long*, long*,
		float*, float*, long*, float*, float*, float*, float*, float*,
		float*, float*, float*, char*, unsigned int, float*, long*,
		long*);
void	__stdcall R2ASP(long*, long*, float*, long*, long*, long*, long*, long*,
		float*, float*, long*, float*, float*, float*, float*, float*,
		float*, float*, float*, char*, unsigned int, float*, long*,
		long*, float*);
void	__stdcall OPOLY(long*, float*, long*, float*, long*, float*, float*,
		float*, float*, float*, float*, long*);
void	__stdcall GCSCP(long*, long*, long*, float*, long*, long*, float*,
		float*, float*, long*, long*, long*);
void	__stdcall TCSCP(long*, float*, float*, float*, float*);
void	__stdcall RNLIN(void(__stdcall *)(long*, float*, long*, long*, float*,
		float*, float*, float*, long*), long*, long*, float*, float*,
		long*, long*, float*, float*);
void	__stdcall R2LIN(void(__stdcall *)(long*, float*, long*, long*, float*,
		float*, float*, float*, long*), long*, long*, float*, float*,
		long*, long*, float*, float*, long*, float*, float*, long*,
		float*);
void	__stdcall R8LIN(long*, float*);
void	__stdcall RLAV(long*, long*, float*, long*, long*, long*, long*, long*,
		float*, long*, float*, long*, long*);
void	__stdcall R2AV(long*, long*, float*, long*, long*, long*, long*, long*,
		float*, long*, float*, long*, long*, long*, float*);
void	__stdcall RLLP(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, float*, float*, long*, float*, float*, float*,
		long*, long*, float*, float*, float*, float*, long*, long*);
void	__stdcall R2LP(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, float*, float*, long*, float*, float*, float*,
		long*, long*, float*, float*, float*, float*, long*, long*,
		long*, float*);
void	__stdcall RLMV(long*, long*, float*, long*, long*, long*, long*, long*,
		float*, long*, float*, long*, long*);
void	__stdcall R2MV(long*, long*, float*, long*, long*, long*, long*, long*,
		float*, long*, float*, long*, long*, float*);

#ifndef IMSL_COMMON_SINGLE

void	__stdcall RLINE(long*, float*, float*, float*, float*, float*);
void	__stdcall RCURV(long*, float*, float*, long*, float*, float*, float*);
void	__stdcall R2URV(long*, float*, float*, long*, float*, float*, float*,
		float*, long*);

#endif

/*
 *    Chapter 3:  Correlation
 */

void	__stdcall CORVC(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, float*, float*, long*, long*, long*, long*, long*,
		float*);
void	__stdcall C2RVC(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, float*, float*, long*, long*, long*, long*, long*,
		float*, float*);
void	__stdcall COVPL(long*, long*, long*, long*, float*, long*, long*, long*,
		long*, long*, long*, long*, float*, float*, long*, float*,
		long*, long*);
void	__stdcall C2VPL(long*, long*, long*, long*, float*, long*, long*, long*,
		long*, long*, long*, long*, float*, float*, long*, float*,
		long*, long*, float*, float*, float*, float*);
void	__stdcall PCORR(long*, float*, long*, long*, long*, long*, long*, long*,
		long*, float*, long*, long*, float*, long*);
void	__stdcall P2ORR(long*, float*, long*, long*, long*, long*, long*,
		long*, long*, float*, long*, long*, float*, long*, float*,
		float*, long*, long*, long*);
void	__stdcall RBCOV(void(__stdcall *)(float*, long*, float*, float*, float*,
		float*), long*, long*, long*, float*, long*, long*, long*,
		long*, long*, long*, long*, long*, float*, long*, float*, long*,
		float*, float*, long*, float*, long*, float*, long*);
void	__stdcall R2COV(void(__stdcall *)(float*, long*, float*, float*, float*,
		float*), long*, long*, long*, float*, long*, long*, long*,
		long*, long*, long*, long*, long*, float*, long*, float*, long*,
		float*, float*, long*, float*, long*, float*, long*, float*,
		float*, float*, float*, float*, float*, float*, float*, long*,
		long*);
void	__stdcall R5COV(float*, long*, float*, float*, float*, float*);
void	__stdcall CTRHO(long*, long*, float*, long*, float*, float*, float*,
		float*, float*, long*, float*, long*);
void	__stdcall TETCC(long*, long*, float*, float*, float*, float*, long*,
		long*, long*, float*, float*);
void	__stdcall BSPBS(long*, float*, long*, float*);
void	__stdcall BSCAT(long*, float*, long*, float*);
void	__stdcall CNCRD(long*, long*, float*, long*, float*, float*, float*);
void	__stdcall C2CRD(long*, long*, float*, long*, float*, float*, float*,
		long*, float*);
void	__stdcall KENDL(long*, float*, float*, float*, float*, float*);
void	__stdcall K2NDL(long*, float*, float*, float*, float*, float*, long*,
		float*, float*, float*);
void	__stdcall KENDP(long*, long*, float*, float*);
void	__stdcall K2NDP(long*, long*, float*, float*, float*);

/*
 *    Chapter 4:  Analysis of Variance
 */

void	__stdcall AONEW(long*, long*, float*, long*, float*, float*, long*,
		long*);
void	__stdcall AONEC(long*, long*, long*, float*, long*, long*, long*,
		float*, long*, float*, long*, float*, float*, float*, float*,
		long*, float*, long*, float*, long*, long*);
void	__stdcall A2NEC(long*, long*, long*, float*, long*, long*, long*,
		float*, long*, float*, long*, float*, float*, float*, float*,
		long*, float*, long*, float*, long*, long*, float*);
void	__stdcall ATWOB(long*, long*, long*, float*, long*, float*, float*,
		float*, float*);
void	__stdcall ABIBD(long*, long*, long*, long*, long*, float*, long*, long*,
		long*, float*, float*, float*, float*, float*, float*, float*);
void	__stdcall A2IBD(long*, long*, long*, long*, long*, float*, long*, long*,
		long*, float*, float*, float*, float*, float*,
		float*, float*, float*);
void	__stdcall ALATN(long*, long*, float*, long*, long*, float*, float*,
		float*, float*);
void	__stdcall ANWAY(long*, long*, float*, long*, long*, float*, float*,
		long*, float*);
void	__stdcall A2WAY(long*, long*, float*, long*, long*, float*, float*,
		long*, float*, float*, long*);
void	__stdcall ABALD(long*, long*, float*, long*, long*, long*, long*, long*,
		float*, long*, long*, float*, float*, float*, long*, float*);
void	__stdcall A2ALD(long*, long*, float*, long*, long*, long*, long*, long*,
		float*, long*, long*, float*, float*, float*, long*, float*,
		float*, long*, char*, unsigned int);
void	__stdcall ANEST(long*, long*, long*, float*, float*, long*, float*,
		float*, float*, long*, float*, long*);
void	__stdcall A2EST(long*, long*, long*, float*, float*, long*, float*,
		float*, float*, long*, float*, long*, float*, long*, char*,
		unsigned int);
void	__stdcall CTRST(long*, long*, float*, long*, float*, long*, float*,
		float*);
void	__stdcall SCIPM(long*, long*, float*, float*, float*, long*, float*,
		long*, float*, long*);
void	__stdcall S2IPM(long*, long*, float*, float*, float*, long*, float*,
		long*, float*, long*, float*, long*);
void	__stdcall SNKMC(long*, float*, float*, float*, float*, long*, long*);
void	__stdcall S2KMC(long*, float*, float*, float*, float*, long*, long*,
		float*, long*);
void	__stdcall CIDMS(float*, float*, float*, float*, float*, float*, long*,
		float*);
void	__stdcall ROREX(long*, long*, long*, float*, long*, float*);
void	__stdcall R2REX(long*, long*, long*, float*, long*, float*, long*);

/*
 *    Chapter 5:  Categorical and Discrete Data Analysis
 */

void	__stdcall CTTWO(float*, long*, long*, long*, float*, long*, float*,
		long*, float*, float*, long*);
void	__stdcall CTCHI(long*, long*, float*, long*, long*, long*, float*,
		long*, float*, long*, float*, float*, long*);
void	__stdcall CTPRB(long*, long*, float*, long*, float*, float*, float*);
void	__stdcall C2PRB(long*, long*, float*, long*, float*, float*, float*,
		long*);
void	__stdcall CTEPR(long*, long*, float*, long*, float*, float*, float*,
		float*, float*);
void	__stdcall C2EPR(long*, long*, float*, long*, float*, float*, float*,
		float*, float*, float*, long*, long*, long*, long*, long*,
		long*, long*, long*, float*, long*, long*, float*, float*,
		float*, long*, long*, float*);
void	__stdcall PRPFT(long*, long*, float*, long*, long*, long*, float*,
		long*, float*);
void	__stdcall P2PFT(long*, long*, float*, long*, long*, long*, float*,
		long*, float*, float*, long*, float*, long*);
void	__stdcall CTLLN(long*, long*, float*, long*, long*, long*, float*,
		long*, float*, long*, float*, long*, float*, long*, float*,
		long*, float*, long*, float*);
void	__stdcall C2LLN(long*, long*, float*, long*, long*, long*, float*,
		long*, float*, long*, float*, long*, float*, long*, float*,
		long*, float*, long*, float*, float*, long*, long*, long*,
		long*, long*, long*, float*, float*, float*, float*, float*,
		float*, float*, float*, long*);
void	__stdcall CTPAR(long*, long*, long*, long*, long*, float*, float*,
		long*, long*, float*, long*, float*, long*);
void	__stdcall C2PAR(long*, long*, long*, long*, long*, float*, float*,
		long*, long*, float*, long*, float*, long*, long*, long*, long*,
		long*, long*, long*, float*, float*, float*, float*, float*,
		float*, float*);
void	__stdcall CTASC(long*, long*, float*, float*, float*, long*, long*,
		float*, long*, float*, long*, float*, long*);
void	__stdcall C2ASC(long*, long*, float*, float*, float*, long*, long*,
		float*, long*, float*, long*, float*, long*, float*, long*,
		long*, float*, long*, float*, long*, float*);
void	__stdcall CTSTP(long*, long*, long*, float*, float*, float*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*, float*,
		float*, long*);
void	__stdcall C2STP(long*, long*, long*, float*, float*, float*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*, float*,
		float*, long*, long*, float*, long*, long*, long*, float*,
		float*, long*);
void	__stdcall CTRAN(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, float*, float*, long*);
void	__stdcall C2RAN(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, float*, float*, long*, long*, float*, float*,
		float*, float*, float*, float*, float*, float*, float*);
void	__stdcall CTGLM(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, float*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, float*, long*,
		float*, long*, float*, float*, long*, float*, float*, long*,
		float*, long*, long*);
void	__stdcall C2GLM(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, float*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, float*, long*,
		float*, long*, float*, float*, long*, float*, float*, long*,
		float*, long*, long*, long*, float*, long*, float*, float*,
		long*);
void	__stdcall CTWLS(long*, long*, float*, long*, long*, long*, long*,
		float*, long*, float*, long*, long*, long*, float*, long*,
		long*, float*, long*, float*, long*, float*, long*, float*,
		float*, long*, float*, long*);
void	__stdcall C2WLS(long*, long*, float*, long*, long*, long*, long*,
		float*, long*, float*, long*, long*, long*, float*, long*,
		long*, float*, long*, float*, long*, float*, long*, float*,
		float*, long*, float*, long*, float*, float*, float*, float*,
		float*, long*, float*);

/*
 *    Chapter 6:  Nonparametric Statistics
 */

void	__stdcall SIGNT(long*, float*, float*, float*, long*, long*, float*,
		long*);
void	__stdcall SNRNK(long*, float*, float*, float*, long*);
void	__stdcall S2RNK(long*, float*, float*, float*, long*, long*, float*);
void	__stdcall NCTRD(long*, float*, float*, long*, float*, long*);
void	__stdcall SDPLC(long*, float*, long*, long*, long*, float*, long*,
		float*, long*);
void	__stdcall S2PLC(long*, float*, long*, long*, long*, float*, long*,
		float*, long*, float*);
void	__stdcall NTIES(long*, float*, float*, float*);
void	__stdcall RNKSM(long*, float*, long*, float*, float*, float*, long*,
		long*);
void	__stdcall R2KSM(long*, float*, long*, float*, float*, float*, long*,
		long*, long*, float*);
void	__stdcall INCLD(long*, float*, long*, float*, long*, long*, float*,
		float*, long*, long*);
void	__stdcall I2CLD(long*, float*, long*, float*, long*, long*, float*,
		float*, long*, long*, float*);
void	__stdcall KRSKL(long*, long*, float*, float*, float*);
void	__stdcall K2SKL(long*, long*, float*, float*, float*, long*, float*,
		float*);
void	__stdcall BHAKV(long*, long*, float*, float*, float*);
void	__stdcall B2AKV(long*, long*, float*, float*, float*, long*, float*,
		float*);
void	__stdcall FRDMN(long*, long*, float*, float*, float*, float*, float*,
		float*);
void	__stdcall F2DMN(long*, long*, float*, float*, float*, float*, float*,
		float*, long*, float*);
void	__stdcall QTEST(long*, long*, float*, long*, float*, float*);
void	__stdcall KTRND(long*, long*, float*, float*);

/*
 *    Chapter 7:  Tests of Goodness of Fit and Randomness
 */

void	__stdcall KSONE(float(__stdcall *)(float*), long*, float*, float*,
		long*);
void	__stdcall K2ONE(float(__stdcall *)(float*), long*, float*, float*,
		long*, float*);
void	__stdcall CHIGF(long*, float(__stdcall *)(float*), long*, float*,
		float*, long*, float*, long*, float*, float*, float*, float*,
		float*, float*);
void	__stdcall SPWLK(long*, float*, float*, float*, long*);
void	__stdcall S2WLK(long*, float*, float*, float*, long*, float*);
void	__stdcall LILLF(long*, float*, long*, float*, float*, float*, float*,
		long*);
void	__stdcall L2LLF(long*, float*, long*, float*, float*, float*, float*,
		long*, float*);
void	__stdcall MVMMT(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, float*, float*, float*, long*, float*, long*);
void	__stdcall M2MMT(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, float*, float*, float*, long*, float*, long*,
		float*, float*, float*);
void	__stdcall KSTWO(long*, float*, long*, float*, float*, long*, long*);
void	__stdcall K2TWO(long*, float*, long*, float*, float*, long*, long*,
		float*, float*);
void	__stdcall RUNS(long*, long*, float*, long*, float*, float*, float*,
		long*, float*, float*, float*);
void	__stdcall R2NS(long*, long*, float*, long*, float*, float*, float*,
		long*, float*, float*, float*, float*, float*, long*, long*,
		float*);
void	__stdcall PAIRS(long*, long*, float*, long*, long*, float*, long*,
		float*, float*, float*, float*);
void	__stdcall DSQAR(long*, long*, float*, long*, float*, float*, float*,
		float*, float*);
void	__stdcall DCUBE(long*, long*, float*, long*, float*, long*, float*,
		float*, float*, float*);

/*
 *    Chapter 8:  Time Series Analysis and Forecasting
 */

void	__stdcall BCTR(long*, float*, long*, long*, float*, float*, float*);
void	__stdcall DIFF(long*, float*, long*, long*, long*, long*, long*, long*,
		long*, float*);
void	__stdcall D2FF(long*, float*, long*, long*, long*, long*, long*, long*,
		long*, float*, float*);
void	__stdcall ACF(long*, float*, long*, long*, long*, float*, long*,
		float*, float*, float*);
void	__stdcall PACF(long*, float*, float*);
void	__stdcall P2CF(long*, float*, float*, float*);
void	__stdcall CCF(long*, float*, float*, long*, long*, long*, long*, float*,
		float*, float*, float*, float*, float*, float*);
void	__stdcall C2F(long*, float*, float*, long*, long*, long*, long*, float*,
		float*, float*, float*, float*, float*, float*, float*, float*);
void	__stdcall MCCF(long*, long*, float*, long*, long*, long*, float*, long*,
		long*, long*, long*, float*, float*, float*, float*, float*,
		long*, long*, float*, long*, long*);
void	__stdcall ARMME(long*, float*, long*, long*, long*, float*);
void	__stdcall A2MME(long*, float*, long*, long*, long*, float*, float*,
		float*, long*, float*);
void	__stdcall MAMME(long*, float*, long*, long*, float*, float*, long*,
		long*, float*);
void	__stdcall M2MME(long*, float*, long*, long*, float*, float*, long*,
		long*, float*, float*, float*, float*, float*, float*, float*,
		float*, float*, float*);
void	__stdcall NSPE(long*, float*, long*, long*, float*, long*, long*,
		float*, long*, float*, float*, float*, float*);
void	__stdcall N2PE(long*, float*, long*, long*, float*, long*, long*,
		float*, long*, float*, float*, float*, float*, float*, float*,
		float*, float*, float*, float*, float*, float*, float*, float*,
		float*, float*, long*, float*);
void	__stdcall NSLSE(long*, float*, long*, long*, float*, long*, float*,
		long*, long*, float*, long*, long*, float*, float*, float*,
		float*, long*, long*, float*, float*);
void	__stdcall N2LSE(long*, float*, long*, long*, float*, long*, float*,
		long*, long*, float*, long*, long*, float*, float*, float*,
		float*, long*, long*, float*, float*, float*, float*, float*,
		float*, float*, float*, long*, float*, long*, float*, float*,
		float*);
void	__stdcall SPWF(long*, float*, long*, float*, float*, float*, long*,
		long*, float*);
void	__stdcall S2WF(long*, float*, long*, float*, float*, float*, long*,
		long*, float*, float*, float*);
void	__stdcall NSBJF(long*, float*, long*, long*, float*, long*, long*,
		float*, long*, long*, float*, float*, float*, long*, long*,
		float*, long*);
void	__stdcall N2BJF(long*, float*, long*, long*, float*, long*, long*,
		float*, long*, long*, float*, float*, float*, long*, long*,
		float*, long*, float*, float*, float*, float*, long*);
void	__stdcall IRNSE(long*, float*, float*, long*, long*, float*, long*,
		float*, long*, long*, float*, float*, float*, float*);
void	__stdcall I2NSE(long*, float*, float*, long*, long*, float*, long*,
		float*, long*, long*, float*, float*, float*, float*, float*,
		float*, float*);
void	__stdcall TFPE(long*, long*, long*, long*, long*, long*, long*, float*,
		long*, float*, float*, long*, float*, float*, float*, float*,
		float*);
void	__stdcall T2PE(long*, long*, long*, long*, long*, long*, long*, float*,
		long*, float*, float*, long*, float*, float*, float*, float*,
		float*, float*, float*, long*, float*, float*, float*, float*,
		float*, float*, float*, float*, float*, float*, float*, float*);
void	__stdcall MLSE(long*, long*, float*, long*, long*, float*, long*, long*,
		long*, float*, long*, float*);
void	__stdcall M2SE(long*, long*, float*, long*, long*, float*, long*, long*,
		long*, float*, long*, float*, float*, long*);
void	__stdcall MWFE(long*, long*, float*, long*, long*, long*, float*, long*,
		long*, float*, float*, long*, float*, long*, long*, float*);
void	__stdcall M2FE(long*, long*, float*, long*, long*, long*, float*, long*,
		long*, float*, float*, long*, float*, long*, long*, float*,
		long*, float*);
void	__stdcall KALMN(long*, float*, long*, float*, long*, float*, long*,
		long*, float*, long*, long*, float*, long*, float*, float*,
		float*, long*, long*, float*, float*, float*, float*, long*);
void	__stdcall K2LMN(long*, float*, long*, float*, long*, float*, long*,
		long*, float*, long*, long*, float*, long*, float*, float*,
		float*, long*, long*, float*, float*, float*, float*, long*,
		float*, float*, float*);
void	__stdcall LOFCF(long*, long*, long*, float*, long*, float*, float*);
float	__stdcall DIRIC(long*, float*, float*);
float	__stdcall FEJER(long*, float*, float*);
void	__stdcall PFFT(long*, float*, long*, float*, long*, long*, long*,
		float*, long*);
void	__stdcall P2FT(long*, float*, long*, float*, long*, long*, long*,
		float*, long*, f_complex*, f_complex*, float*, float*);
void	__stdcall SSWD(long*, float*, long*, float*, long*, long*, long*,
		float*, float*, long*, long*, long*, float*, long*, float*,
		long*);
void	__stdcall S2WD(long*, float*, long*, float*, long*, long*, long*,
		float*, float*, long*, long*, long*, float*, long*, float*,
		long*, f_complex*, f_complex*, float*, float*);
void	__stdcall SSWP(long*, float*, long*, float*, long*, long*, float*);
void	__stdcall SWED(long*, float*, long*, float*, long*, long*, long*,
		float*, float*, long*, float*, float*, long*, float*, long*);
void	__stdcall S2ED(long*, float*, long*, float*, long*, long*, long*,
		float*, float*, long*, float*, float*, long*, float*, long*,
		f_complex*, f_complex*, float*, float*);
void	__stdcall SWEP(long*, float*, long*, float*, long*, float*, float*);
void	__stdcall CPFFT(long*, float*, float*, long*, float*, float*, long*,
		long*, long*, float*, long*);
void	__stdcall C2FFT(long*, float*, float*, long*, float*, float*, long*,
		long*, long*, float*, long*, f_complex*, f_complex*, float*,
		float*);
void	__stdcall CSSWD(long*, float*, float*, long*, float*, float*, long*,
		long*, long*, float*, float*, long*, long*, long*, float*,
		long*, float*, long*);
void	__stdcall C2SWD(long*, float*, float*, long*, float*, float*, long*,
		long*, long*, float*, float*, long*, long*, long*, float*,
		long*, float*, long*, f_complex*, f_complex*, float*, float*);
void	__stdcall CSSWP(long*, float*, float*, float*, float*, long*, float*,
		long*, long*, float*, float*, float*, float*, float*);
void	__stdcall CSWED(long*, float*, float*, long*, float*, float*, long*,
		long*, long*, float*, float*, long*, float*, float*, long*,
		float*, long*);
void	__stdcall C2WED(long*, float*, float*, long*, float*, float*, long*,
		long*, long*, float*, float*, long*, float*, float*, long*,
		float*, long*, f_complex*, f_complex*, float*, float*);
void	__stdcall CSWEP(long*, float*, float*, float*, float*, long*, float*,
		long*, float*, float*, float*, float*, float*, float*);

/*
 *    Chapter 9:  Covariance Structures and Factor Analysis
 */

void	__stdcall PRINC(long*, long*, float*, long*, long*, float*, float*,
		float*, float*, long*, float*, long*);
void	__stdcall KPRIN(long*, long*, float*, long*, float*, long*, float*,
		long*);
void	__stdcall K2RIN(long*, long*, float*, long*, float*, long*, float*,
		long*, float*, float*, float*, float*, float*);
void	__stdcall FACTR(long*, float*, long*, long*, long*, long*, long*, long*,
		long*, float*, float*, long*, float*, float*, long*, float*,
		float*, float*);
void	__stdcall F2CTR(long*, float*, long*, long*, long*, long*, long*, long*,
		long*, float*, float*, long*, float*, float*, long*, float*,
		float*, float*, long*, float*, float*, float*, float*, float*);
void	__stdcall FROTA(long*, long*, float*, long*, long*, long*, float*,
		float*, float*, long*, float*, long*);
void	__stdcall F2OTA(long*, long*, float*, long*, long*, long*, float*,
		float*, float*, long*, float*, long*, float*);
void	__stdcall FOPCS(long*, long*, float*, long*, float*, long*, float*,
		long*, float*, long*);
void	__stdcall F2PCS(long*, long*, float*, long*, float*, long*, float*,
		long*, float*, long*, float*, float*);
void	__stdcall FDOBL(long*, long*, float*, long*, long*, float*, long*,
		float*, float*, long*, float*, long*, float*, long*);
void	__stdcall F2OBL(long*, long*, float*, long*, long*, float*, long*,
		float*, float*, long*, float*, long*, float*, long*, float*,
		float*, float*);
void	__stdcall FPRMX(long*, long*, float*, long*, long*, long*, float*,
		long*, float*, float*, float*, long*, float*, long*, float*,
		long*, float*, long*);
void	__stdcall F2RMX(long*, long*, float*, long*, long*, long*, float*,
		long*, float*, float*, float*, long*, float*, long*, float*,
		long*, float*, long*, float*, float*, long*, float*);
void	__stdcall FHARR(long*, long*, float*, long*, long*, long*, float*,
		float*, float*, float*, float*, long*, float*, long*, float*,
		long*);
void	__stdcall F2ARR(long*, long*, float*, long*, long*, long*, float*,
		float*, float*, float*, float*, long*, float*, long*, float*,
		long*, float*, float*);
void	__stdcall FGCRF(long*, long*, float*, long*, long*, float*, long*,
		float*, float*, long*, float*, long*, float*, long*);
void	__stdcall F2CRF(long*, long*, float*, long*, long*, float*, long*,
		float*, float*, long*, float*, long*, float*, long*, float*,
		float*, float*);
void	__stdcall FIMAG(long*, float*, long*, float*, long*);
void	__stdcall F2MAG(long*, float*, long*, float*, long*, float*, long*);
void	__stdcall FRVAR(long*, long*, float*, long*, float*, long*, float*,
		float*, long*, float*);
void	__stdcall F2VAR(long*, long*, float*, long*, float*, long*, float*,
		float*, long*, float*, float*, float*, long*);
void	__stdcall FCOEF(long*, long*, float*, long*, long*, float*, long*,
		float*, long*, float*, long*);
void	__stdcall F2OEF(long*, long*, float*, long*, long*, float*, long*,
		float*, long*, float*, long*, float*, float*, float*, float*,
		float*);
void	__stdcall FSCOR(long*, long*, float*, long*, long*, float*, long*,
		float*, float*, float*, long*);
void	__stdcall F2COR(long*, long*, float*, long*, long*, float*, long*,
		float*, float*, float*, long*, float*);
void	__stdcall FRESI(long*, float*, long*, long*, float*, long*, float*,
		float*, long*);
void	__stdcall MVIND(long*, long*, float*, long*, long*, long*, float*);
void	__stdcall M2IND(long*, long*, float*, long*, long*, long*, float*,
		float*, float*, long*);
void	__stdcall CANCR(long*, long*, long*, long*, float*, long*, long*, long*,
		long*, long*, float*, long*, float*, long*, float*, long*,
		float*, long*, float*, long*, float*, long*, float*, long*,
		float*, long*);
void	__stdcall C2NCR(long*, long*, long*, long*, float*, long*, long*, long*,
		long*, long*, float*, long*, float*, long*, float*, long*,
		float*, long*, float*, long*, float*, long*, float*, long*,
		float*, long*, float*, float*, long*, float*, float*, float*);
void	__stdcall CANVC(long*, long*, long*, float*, long*, long*, long*, long*,
		float*, long*, float*, long*, float*, long*, float*, long*,
		float*, long*);
void	__stdcall C2NVC(long*, long*, long*, float*, long*, long*, long*, long*,
		float*, long*, float*, long*, float*, long*, float*, long*,
		float*, long*, float*, float*, float*, float*, float*, float*);

/*
 *    Chapter 10:  Discriminant Analysis
 */

void	__stdcall DSCRM(long*, long*, long*, long*, float*, long*, long*, long*,
		long*, long*, long*, long*, long*, float*, long*, float*, long*,
		float*, long*, float*, long*, long*, float*, long*, float*,
		long*, float*, long*, float*, long*);
void	__stdcall D2CRM(long*, long*, long*, long*, float*, long*, long*, long*,
		long*, long*, long*, long*, long*, float*, long*, float*, long*,
		float*, long*, float*, long*, long*, float*, long*, float*,
		long*, float*, long*, float*, long*, float*, float*, float*);
void	__stdcall DMSCR(long*, long*, float*, long*, float*, float*, long*,
		long*, float*, float*, long*, float*, long*);
void	__stdcall D2SCR(long*, long*, float*, long*, float*, float*, long*,
		long*, float*, float*, long*, float*, long*, float*, float*,
		float*, float*, float*);
void	__stdcall NNBRD(long*, long*, long*, float*, long*, long*, long*,
		long*, long*, long*, long*, long*, float*, float*, float*,
		long*, long*, long*, float*, long*, float*, long*);
void	__stdcall N2BRD(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, long*, long*, float*, float*, float*, long*,
		long*, long*, float*, long*, float*, long*, float*, long*,
		long*, long*, long*, float*, float*, float*, long*, float*);

/*
 *    Chapter 11:  Cluster Analysis
 */

void	__stdcall CDIST(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, long*);
void	__stdcall C2IST(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, long*, float*, float*, float*, float*, long*);
void	__stdcall CLINK(long*, long*, long*, float*, long*, float*, long*,
		long*);
void	__stdcall C2INK(long*, long*, long*, float*, long*, float*, long*,
		long*, long*, long*, float*, float*);
void	__stdcall KMEAN(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, float*, long*, float*, long*, long*, long*,
		float*);
void	__stdcall K2EAN(long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, float*, long*, float*, long*, long*, long*,
		float*, long*, long*, float*, long*, long*);

#ifndef IMSL_STAT_COMMON

void	__stdcall CNUMB(long*, long*, long*, long*, long*, long*);
void	__stdcall C2UMB(long*, long*, long*, long*, long*, long*, long*);

#endif

/*
 *    Chapter 12:  Sampling
 */

void	__stdcall SMPPR(long*, long*, long*, float*, float*);
void	__stdcall SMPPS(long*, long*, long*, long*, float*, float*, float*);
void	__stdcall SMPRR(long*, long*, float*, float*, long*, long*, float*,
		float*, float*, float*);
void	__stdcall SMPRS(long*, long*, long*, float*, float*, long*, long*,
		long*, float*, float*, float*, float*, float*, float*, float*,
		float*, float*, float*, long*, float*);
void	__stdcall SMPSC(long*, long*, long*, float*, long*, long*, long*,
		float*, float*, float*, float*, float*, long*, float*);
void	__stdcall SMPSR(long*, long*, float*, long*, long*, long*, float*,
		float*);
void	__stdcall SMPSS(long*, long*, long*, float*, long*, long*, float*,
		float*, float*, long*, float*);
void	__stdcall SMPST(long*, long*, long*, long*, float*, long*, long*,
		float*, float*, float*, float*);

/*
 *    Chapter 13:  Survival Analysis, Life Testing and Reliability
 */

void	__stdcall KAPMR(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, long*, long*);
void	__stdcall K2PMR(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, long*, long*, long*, long*, long*, long*, float*,
		long*);
void	__stdcall KTBLE(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, long*);
void	__stdcall K2BLE(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, long*, float*, long*, long*, float*, float*,
		long*);
void	__stdcall TRNBL(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, long*, long*, float*, long*, float*, long*);
void	__stdcall T2NBL(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, long*, long*, float*, long*, float*, long*,
		float*, long*, long*, float*, long*);
void	__stdcall PHGLM(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, float*, float*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, float*, long*, float*, long*,
		float*, float*, long*, float*, float*, long*, float*, long*,
		long*);
void	__stdcall P2GLM(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, float*, float*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, float*, long*, float*, long*,
		float*, float*, long*, float*, float*, long*, float*, long*,
		long*, float*, float*, float*, long*, long*, long*);
void	__stdcall SVGLM(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, float*, long*, float*,
		long*, float*, float*, long*, float*, float*, long*, float*,
		long*, long*);
void	__stdcall S2GLM(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, float*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, float*, long*, float*,
		long*, float*, float*, long*, float*, float*, long*, float*,
		long*, long*, long*, float*, long*, float*, float*, long*,
		float*, long*);
void	__stdcall STBLE(long*, long*, float*, long*, long*, float*, long*,
		float*, long*, long*, long*, long*, long*, float*, long*, long*,
		long*, long*, float*, long*, float*, long*, float*);
void	__stdcall S2BLE(long*, long*, float*, long*, long*, float*, long*,
		float*, long*, long*, long*, long*, long*, float*, long*, long*,
		long*, long*, float*, long*, float*, long*, float*, char*,
		unsigned int, float*, float*);
void	__stdcall ACTBL(long*, long*, long*, float*, float*, long*, long*,
		long*, float*, long*);

/*
 *    Chapter 14:  Multidimensional Scaling
 */

void	__stdcall MSIDV(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, float*, long*, float*, long*, float*, float*,
		float*, float*, float*, float*);
void	__stdcall M2IDV(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, float*, float*, long*, float*, long*, float*, float*,
		float*, float*, float*, float*, float*, float*, float*, float*,
		float*, float*, float*, long*, float*, float*, float*, float*,
		long*, float*, double*, double*, float*, long*, float*);
void	__stdcall MSDST(long*, long*, float*, long*, long*, long*, long*, long*,
		float*, long*, float*, long*, float*);
void	__stdcall MSSTN(long*, long*, long*, long*, float*, long*, long*, long*,
		long*, long*, float*);
void	__stdcall M2STN(long*, long*, long*, long*, float*, long*, long*, long*,
		long*, long*, float*, long*, float*, float*);
void	__stdcall MSDBL(long*, long*, long*, float*, long*, long*, float*,
		long*, float*, long*, float*, long*);
void	__stdcall MSINI(long*, long*, long*, float*, long*, long*, long*,
		float*, long*, float*, long*, float*, long*, float*, float*);
void	__stdcall M2INI(long*, long*, long*, float*, long*, long*, long*,
		float*, long*, float*, long*, float*, long*, float*, float*,
		float*, float*, float*, float*, float*, float*, long*, float*);
void	__stdcall MSTRS(long*, float*, float*, long*, float*, long*, float*,
		float*, long*, float*, float*);

/*
 *    Chapter 15:  Density and Hazard Estimation
 */

void	__stdcall DESPL(long*, float*, long*, float*, long*, float*, long*,
		float*, float*, float*, long*);
void	__stdcall D2SPL(long*, float*, long*, float*, long*, float*, long*,
		float*, float*, float*, long*, float*, long*, long*, float*,
		float*, long*, float*, float*);
void	__stdcall DESKN(float(__stdcall *)(float*), long*, float*, float*,
		float*, long*, float*, float*, long*);
void	__stdcall DNFFT(long*, float*, float*, float*, float*, long*, long*,
		float*, float*, long*);
void	__stdcall D2FFT(long*, float*, float*, float*, float*, long*, long*,
		float*, float*, long*, float*);
void	__stdcall DESPT(long*, float*, long*, long*, float*, float*, float*);
void	__stdcall D2SPT(long*, float*, long*, long*, float*, float*, float*,
		float*, float*, float*);
void	__stdcall HAZRD(long*, float*, long*, long*, long*, long*, long*,
		float*, float*, long*, long*, long*, long*, long*, float*,
		long*, float*, float*, long*, float*, float*, long*);
void	__stdcall HAZEZ(long*, float*, long*, long*, long*, long*, float*,
		long*, float*, float*, long*, float*, float*, long*);
void	__stdcall HAZST(long*, float*, long*, long*, long*, float*, float*,
		float*, float*, long*, long*, float*, float*);

/*
 *    Chapter 16:  Line Printer Graphics
 */

void	__stdcall VHSTP(long*, float*, long*, char*, unsigned int);
void	__stdcall VHS2P(long*, float*, float*, long*, char*, unsigned int);
void	__stdcall V2S2P(long*, float*, float*, long*, char*, unsigned int,
		float*);
void	__stdcall HHSTP(long*, float*, long*, long*, long*, long*, long*, char*,
		unsigned int);
void	__stdcall SCTP(long*, long*, float*, long*, long*, float*, char*,
		unsigned int, char*, unsigned int, char*, unsigned int, char*,
		unsigned int);
void	__stdcall BOXP(long*, long*, float*, char*, unsigned int);
void	__stdcall B2XP(long*, long*, float*, char*, unsigned int, float*);
void	__stdcall STMLP(long*, float*, float*, char*, unsigned int);
void	__stdcall S2MLP(long*, float*, float*, char*, unsigned int, long*,
		long*, float*);
void	__stdcall CDFP(float(__stdcall *)(float*), long*, float*, long*, long*,
		long*);
void	__stdcall C2FP(float(__stdcall *)(float*), long*, float*, long*, long*,
		long*, float*, float*);
void	__stdcall CDF2P(long*, long*, float*);
void	__stdcall C2F2P(long*, long*, float*, float*, long*);
void	__stdcall PROBP(long*, long*, long*, float*, long*);
void	__stdcall P2OBP(long*, long*, long*, float*, long*, long*, long*,
		float*);
void	__stdcall TREEP(long*, long*, long*, long*, float*, long*, long*, long*,
		float*, char*, unsigned int);
void	__stdcall T2EEP(long*, long*, long*, long*, float*, long*, long*, long*,
		float*, char*, unsigned int, long*, long*, long*, long*,
		float*);

#ifndef IMSL_COMMON_SINGLE

void	__stdcall PLOTP(long*, long*, float*, float*, long*, long*, float*,
		char*, unsigned int, char*, unsigned int, char*, unsigned int,
		char*, unsigned int);

#endif

/*
 *    Chapter 17:  Probability Distribution Functions and Inverses
 */

float	__stdcall CSNIN(float*, float*, float*);
float	__stdcall GAMIN(float*, float*);
float	__stdcall TNIN(float*, long*, float*);
float	__stdcall GFNIN(float(__stdcall *)(float*), float*, float*, float*);

#ifndef IMSL_COMMON_SINGLE

float	__stdcall BINDF(long*, long*, float*);
float	__stdcall BINPR(long*, long*, float*);
float	__stdcall HYPDF(long*, long*, long*, long*);
float	__stdcall HYPPR(long*, long*, long*, long*);
float	__stdcall POIDF(long*, float*);
float	__stdcall POIPR(long*, float*);
float	__stdcall AKS1DF(long*, float*);
float	__stdcall AK21DF(long*, float*, float*);
float	__stdcall AKS2DF(long*, long*, float*);
float	__stdcall AK22DF(long*, long*, float*, float*);
float	__stdcall ANORDF(float*);
float	__stdcall ANORIN(float*);
float	__stdcall BETDF(float*, float*, float*);
float	__stdcall BETIN(float*, float*, float*);
float	__stdcall BNRDF(float*, float*, float*);
float	__stdcall CHIDF(float*, float*);
float	__stdcall CHIIN(float*, float*);
float	__stdcall CSNDF(float*, float*, float*);
float	__stdcall FDF(float*, float*, float*);
float	__stdcall FIN(float*, float*, float*);
float	__stdcall GAMDF(float*, float*);
float	__stdcall TDF(float*, float*);
float	__stdcall TIN(float*, float*);
float	__stdcall TNDF(float*, long*, float*);
float	__stdcall GCDF(float*, long*, long*, float*, float*);
float	__stdcall G4DF(float*, long*, long*, float*, float*, float*, long*);
float	__stdcall GCIN(float*, long*, long*, float*, float*);
float	__stdcall G3IN(float*, long*, long*, float*, float*, float*, long*);

#endif

/*
 *    Chapter 18:  Random Number Generation
 */

void	__stdcall RNSES(float*);
void	__stdcall RNGES(float*);
void	__stdcall RNGDA(long*, long*, long*, long*, float*, long*, float*,
		long*);
void	__stdcall RNGDS(float(__stdcall *)(long*), long*, float*, long*, long*,
		long*, float*, long*);
void	__stdcall RNGDT(long*, long*, long*, float*, long*);
void	__stdcall RNBET(long*, float*, float*, float*);
void	__stdcall RNCHI(long*, float*, float*);
void	__stdcall RNCHY(long*, float*);
void	__stdcall RNEXP(long*, float*);
void	__stdcall RNEXT(long*, float*, float*, float*, float*);
void	__stdcall RNGAM(long*, float*, float*);
void	__stdcall RNGCS(float(__stdcall *)(float*), long*, long*, float*,
		long*);
void	__stdcall RNGCT(long*, long*, float*, long*, float*);
void	__stdcall RNLNL(long*, float*, float*, float*);
void	__stdcall RNNOA(long*, float*);
float	__stdcall RNNOF(void);
void	__stdcall RNNOR(long*, float*);
void	__stdcall RNSTA(long*, float*, float*, float*);
void	__stdcall RNSTT(long*, float*, float*);
void	__stdcall RNTRI(long*, float*);
void	__stdcall RNVMS(long*, float*, float*);
void	__stdcall RNWIB(long*, float*, float*);
void	__stdcall RNCOR(long*, long*, float*, float*, long*, float*, long*);
void	__stdcall R2COR(long*, long*, float*, float*, long*, float*, long*,
		long*, float*);
void	__stdcall RNDAT(long*, long*, long*, long*, float*, long*, long*,
		float*, long*);
void	__stdcall R2DAT(long*, long*, long*, long*, float*, long*, long*,
		float*, long*, long*, float*);
void	__stdcall RNMVN(long*, long*, float*, long*, float*, long*);
void	__stdcall RNSPH(long*, long*, float*, long*);
void	__stdcall RNNOS(long*, long*, long*, float*);
void	__stdcall RNUNO(long*, long*, long*, float*);
void	__stdcall RNARM(long*, float*, long*, float*, long*, long*, float*,
		long*, long*, float*, float*, float*, float*);
void	__stdcall RNNPP(float*, float*, float(__stdcall *)(float*), float*,
		float*, long*, long*, float*);
void	__stdcall RNSRS(long*, long*, long*, float*, long*, long*, long*,
		float*, long*, long*);

#ifndef IMSL_STAT_COMMON

void	__stdcall RNOPG(long*);
void	__stdcall RNSEF(long*);
void	__stdcall RNGEF(long*);
void	__stdcall RNISD(long*, long*);
void	__stdcall RNBIN(long*, long*, float*, long*);
void	__stdcall RNGEO(long*, float*, long*);
void	__stdcall RNHYP(long*, long*, long*, long*, long*);
void	__stdcall RNLGR(long*, float*, long*);
void	__stdcall RNNBN(long*, float*, float*, long*);
void	__stdcall RNPOI(long*, float*, long*);
void	__stdcall RNUND(long*, long*, long*);
void	__stdcall RNMTN(long*, long*, long*, float*, long*, long*);
void	__stdcall RNTAB(long*, long*, long*, long*, long*, long*, long*);
void	__stdcall R2TAB(long*, long*, long*, long*, long*, long*, long*, long*,
		long*, long*, float*);
void	__stdcall RNPER(long*, long*);
void	__stdcall RNSRI(long*, long*, long*);

#endif

#ifndef IMSL_COMMON

void	__stdcall RNOPT(long*);
void	__stdcall RNSET(long*);
void	__stdcall RNGET(long*);

#endif

#ifndef IMSL_COMMON_SINGLE

void	__stdcall RNUN(long*, float*);
float	__stdcall RNUNF(void);

#endif

/*
 *    Chapter 19:  Utilities
 */

void	__stdcall RORDM(long*, float*, long*, long*, long*, float*, long*);
void	__stdcall R2RDM(long*, float*, long*, long*, long*, float*, long*,
		long*);
void	__stdcall MVNAN(long*, long*, long*, long*, float*, long*, long*,
		long*);
void	__stdcall SCOLR(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*);
void	__stdcall S2OLR(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, float*, long*);
void	__stdcall SROWR(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*);
void	__stdcall S2OWR(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, float*, long*);
void	__stdcall GDATA(long*, long*, long*, long*, float*, long*, long*);

#ifndef IMSL_STAT_COMMON

void	__stdcall VERSL(char*, unsigned int, long*);

#endif

#ifndef IMSL_COMMON

void	__stdcall WRIRN(char*, unsigned int, long*, long*, long*, long*, long*);
void	__stdcall WRIRL(char*, unsigned int, long*, long*, long*, long*, long*,
		char*, unsigned int, char*, unsigned int, char*, unsigned int);
void	__stdcall WROPT(long*, long*, long*);
void	__stdcall PGOPT(long*, long*);
void	__stdcall SVIGN(long*, long*, long*);
void	__stdcall SVIGP(long*, long*, long*, long*);
void	__stdcall ISRCH(long*, long*, long*, long*, long*);
void	__stdcall SSRCH(long*, char*, unsigned int, char*, unsigned int, long*,
		long*);
void	__stdcall ACHAR(char*, unsigned int, long*);
long	__stdcall IACHAR(char*, unsigned int);
long	__stdcall ICASE(char*, unsigned int);
long	__stdcall IICSR(char*, unsigned int, char*, unsigned int);
long	__stdcall IIDEX(char*, unsigned int, char*, unsigned int);
void	__stdcall CVTSI(char*, unsigned int, long*);
float	__stdcall CPSEC(void);
void	__stdcall TIMDY(long*, long*, long*);
void	__stdcall TDATE(long*, long*, long*);
long	__stdcall NDAYS(long*, long*, long*);
void	__stdcall NDYIN(long*, long*, long*, long*);
long	__stdcall IDYWK(long*, long*, long*);

#endif

#ifndef IMSL_COMMON_SINGLE

void	__stdcall WRRRN(char*, unsigned int, long*, long*, float*, long*,
		long*);
void	__stdcall WRRRL(char*, unsigned int, long*, long*, float*, long*, long*,
		char*, unsigned int, char*, unsigned int, char*, unsigned int);
void	__stdcall W2RRL(char*, unsigned int, long*, long*, float*, long*, long*,
		char*, unsigned int, char*, unsigned int, char*, unsigned int,
		char*, unsigned int);
void	__stdcall PERMU(long*, float*, long*, long*, float*);
void	__stdcall PERMA(long*, long*, float*, long*, long*, long*, float*,
		long*);
void	__stdcall P2RMA(long*, long*, float*, long*, long*, long*, float*,
		long*, float*);
void	__stdcall SVRGN(long*, float*, float*);
void	__stdcall SVRGP(long*, float*, float*, long*);
void	__stdcall SRCH(long*, float*, float*, long*, long*);

#endif

/*
 *    Chapter 20:  Mathematical Support
 */

void	__stdcall CHFAC(long*, float*, long*, float*, long*, float*, long*);
void	__stdcall MCHOL(long*, float*, long*, float*, long*, float*, long*,
		float*, long*);
void	__stdcall GIRTS(long*, float*, long*, long*, float*, long*, long*,
		long*, float*, long*, float*, long*);
float	__stdcall ENOS(long*, long*);
float	__stdcall AMILLR(float*);
void	__stdcall QUADT(long*, long*, long*, float*, long*, long*, long*, long*,
		float*);
void	__stdcall Q2ADT(long*, long*, long*, float*, long*, long*, long*, long*,
		float*, long*, long*, float*, long*);
void	__stdcall NGHBR(long*, float*, long*, long*, long*, float*, long*,
		long*, long*, long*, float*, long*, long*, float*);
void	__stdcall N2HBR(long*, float*, long*, long*, long*, float*, long*,
		long*, long*, long*, float*, long*, long*, float*, long*, long*,
		long*, float*, float*);

#ifndef IMSL_COMMON_SINGLE

void	__stdcall LINRG(long*, float*, long*, float*, long*);
void	__stdcall L2NRG(long*, float*, long*, float*, long*, float*, long*);
void	__stdcall LSLRG(long*, float*, long*, float*, long*, float*);
void	__stdcall L2LRG(long*, float*, long*, float*, long*, float*, float*,
		long*, float*);
void	__stdcall LFTRG(long*, float*, long*, float*, long*, long*);
void	__stdcall L2TRG(long*, float*, long*, float*, long*, long*, float*);
void	__stdcall LFSRG(long*, float*, long*, long*, float*, long*, float*);
void	__stdcall LFDRG(long*, float*, long*, long*, float*, float*);
void	__stdcall LSGRR(long*, long*, float*, long*, float*, long*, float*,
		long*);
void	__stdcall L2GRR(long*, long*, float*, long*, float*, long*, float*,
		long*, float*, float*);
void	__stdcall LSBRR(long*, long*, float*, long*, float*, float*, float*,
		float*, long*);
void	__stdcall L2BRR(long*, long*, float*, long*, float*, float*, float*,
		float*, long*, float*, float*, long*, float*);
void	__stdcall LSQRR(long*, long*, float*, long*, float*, float*, float*,
		float*, long*);
void	__stdcall L2QRR(long*, long*, float*, long*, float*, float*, float*,
		float*, long*, float*, float*, long*, float*);
void	__stdcall LSVRR(long*, long*, float*, long*, long*, float*, long*,
		float*, float*, long*, float*, long*);
void	__stdcall L2VRR(long*, long*, float*, long*, long*, float*, long*,
		float*, float*, long*, float*, long*, float*, float*);
void	__stdcall EVCSF(long*, float*, long*, float*, float*, long*);
void	__stdcall E5CSF(long*, float*, long*, float*, float*, long*, float*,
		long*);
float	__stdcall EPISF(long*, long*, float*, long*, float*, float*, long*);
float	__stdcall E2ISF(long*, long*, float*, long*, float*, float*, long*,
		float*);
void	__stdcall GVLSP(long*, float*, long*, float*, long*, float*);
void	__stdcall G3LSP(long*, float*, long*, float*, long*, float*, long*,
		float*, float*);
void	__stdcall QDAGS(float(__stdcall *)(float*), float*, float*, float*,
		float*, float*, float*);
void	__stdcall Q2AGS(float(__stdcall *)(float*), float*, float*, float*,
		float*, float*, float*, long*, long*, long*, float*, float*,
		float*, float*, long*);
void	__stdcall FFTRI(long*, float*);
void	__stdcall FFTRF(long*, float*, float*);
void	__stdcall F2TRF(long*, float*, float*, float*);
void	__stdcall FFTRB(long*, float*, float*);
void	__stdcall F2TRB(long*, float*, float*, float*);
void	__stdcall UMINF(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, long*, float*, float*, float*);
void	__stdcall U2INF(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, long*, float*, float*, float*, float*);
void	__stdcall U4INF(long*, float*);
void	__stdcall MXTXF(long*, long*, float*, long*, long*, float*, long*);
void	__stdcall MXTYF(long*, long*, float*, long*, long*, long*, float*,
		long*, long*, long*, float*, long*);
void	__stdcall TRNRR(long*, long*, float*, long*, long*, long*, float*,
		long*);
void	__stdcall MRRRR(long*, long*, float*, long*, long*, long*, float*,
		long*, long*, long*, float*, long*);
float	__stdcall BLINF(long*, long*, float*, long*, float*, float*);
float	__stdcall BETA(float*, float*);
float	__stdcall BINOM(long*, long*);
float	__stdcall GAMMA(float*);
void	__stdcall R9GAML(float*, float*);

#endif

/*
 *    Level 1 BLAS
 */

#ifndef IMSL_COMMON

void	__stdcall ISET(long*, long*, long*, long*);
void	__stdcall ICOPY(long*, long*, long*, long*, long*);
void	__stdcall IADD(long*, long*, long*, long*);
void	__stdcall ISUB(long*, long*, long*, long*);
void	__stdcall ISWAP(long*, long*, long*, long*, long*);
double	__stdcall DSDOT(long*, float*, long*, float*, long*);
long	__stdcall ISUM(long*, long*, long*);
long	__stdcall IIMIN(long*, long*, long*);
long	__stdcall IIMAX(long*, long*, long*);

#endif

#ifndef IMSL_COMMON_SINGLE

void	__stdcall SSET(long*, float*, float*, long*);
void	__stdcall CSET(long*, f_complex*, f_complex*, long*);
void	__stdcall SCOPY(long*, float*, long*, float*, long*);
void	__stdcall CCOPY(long*, f_complex*, long*, f_complex*, long*);
void	__stdcall SSCAL(long*, float*, float*, long*);
void	__stdcall CSCAL(long*, f_complex*, f_complex*, long*);
void	__stdcall CSSCAL(long*, float*, f_complex*, long*);
void	__stdcall SVCAL(long*, float*, float*, long*, float*, long*);
void	__stdcall CVCAL(long*, f_complex*, f_complex*, long*, f_complex*,
		long*);
void	__stdcall CSVCAL(long*, float*, f_complex*, long*, f_complex*, long*);
void	__stdcall SADD(long*, float*, float*, long*);
void	__stdcall CADD(long*, f_complex*, f_complex*, long*);
void	__stdcall SSUB(long*, float*, float*, long*);
void	__stdcall CSUB(long*, f_complex*, f_complex*, long*);
void	__stdcall SAXPY(long*, float*, float*, long*, float*, long*);
void	__stdcall CAXPY(long*, f_complex*, f_complex*, long*, f_complex*,
		long*);
void	__stdcall SSWAP(long*, float*, long*, float*, long*);
void	__stdcall CSWAP(long*, f_complex*, long*, f_complex*, long*);
float	__stdcall SDOT(long*, float*, long*, float*, long*);
void	__stdcall CDOTU(f_complex*, long*, f_complex*, long*, f_complex*,
		long*);
void	__stdcall CDOTC(f_complex*, long*, f_complex*, long*, f_complex*,
		long*);
void	__stdcall CZDOTC(f_complex*, long*, f_complex*, long*, f_complex*,
		long*);
void	__stdcall CZDOTU(f_complex*, long*, f_complex*, long*, f_complex*,
		long*);
float	__stdcall SDSDOT(long*, float*, float*, long*, float*, long*);
void	__stdcall CZCDOT(f_complex*, long*, f_complex*, f_complex*, long*,
		f_complex*, long*);
void	__stdcall CZUDOT(f_complex*, long*, f_complex*, f_complex*, long*,
		f_complex*, long*);
float	__stdcall SDDOTI(long*, float*, double*, float*, long*, float*, long*);
float	__stdcall SDDOTA(long*, float*, double*, float*, long*, float*, long*);
void	__stdcall CZDOTI(f_complex*, long*, f_complex*, double*, f_complex*,
		long*, f_complex*, long*);
void	__stdcall CZDOTA(f_complex*, long*, f_complex*, double*, f_complex*,
		long*, f_complex*, long*);
void	__stdcall SHPROD(long*, float*, long*, float*, long*, float*, long*);
float	__stdcall SXYZ(long*, float*, long*, float*, long*, float*, long*);
float	__stdcall SSUM(long*, float*, long*);
float	__stdcall SASUM(long*, float*, long*);
float	__stdcall SCASUM(long*, f_complex*, long*);
float	__stdcall SNRM2(long*, float*, long*);
float	__stdcall SCNRM2(long*, f_complex*, long*);
float	__stdcall SPRDCT(long*, float*, long*);
long	__stdcall ISMIN(long*, float*, long*);
long	__stdcall ISMAX(long*, float*, long*);
long	__stdcall ISAMIN(long*, float*, long*);
long	__stdcall ICAMIN(long*, f_complex*, long*);
long	__stdcall ISAMAX(long*, float*, long*);
long	__stdcall ICAMAX(long*, f_complex*, long*);
void	__stdcall SROTG(float*, float*, float*, float*);
void	__stdcall SROT(long*, float*, long*, float*, long*, float*, float*);
void	__stdcall CSROT(long*, f_complex*, long*, f_complex*, long*, float*,
		float*);
void	__stdcall SROTMG(float*, float*, float*, float*, float*);
void	__stdcall SROTM(long*, float*, long*, float*, long*, float*);
void	__stdcall CSROTM(long*, f_complex*, long*, f_complex*, long*, float*);

#endif

/*
 *    Level 2 BLAS
 */

#ifndef IMSL_COMMON_SINGLE

void	__stdcall SGEMV(char*, unsigned int, long*, long*, float*, float*,
		long*, float*, long*, float*, float*, long*);
void	__stdcall CGEMV(char*, unsigned int, long*, long*, f_complex*,
		f_complex*, long*, f_complex*, long*, f_complex*, f_complex*,
		long*);
void	__stdcall SGBMV(char*, unsigned int, long*, long*, long*, long*, float*,
		float*, long*, float*, long*, float*, float*, long*);
void	__stdcall CGBMV(char*, unsigned int, long*, long*, long*, long*,
		f_complex*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, long*);
void	__stdcall CHEMV(char*, unsigned int, long*, f_complex*, f_complex*,
		long*, f_complex*, long*, f_complex*, f_complex*, long*);
void	__stdcall CHBMV(char*, unsigned int, long*, long*, f_complex*,
		f_complex*, long*, f_complex*, long*, f_complex*, f_complex*,
		long*);
void	__stdcall SSYMV(char*, unsigned int, long*, float*, float*, long*,
		float*, long*, float*, float*, long*);
void	__stdcall SSBMV(char*, unsigned int, long*, long*, float*, float*,
		long*, float*, long*, float*, float*, long*);
void	__stdcall STRMV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, float*, long*, float*, long*);
void	__stdcall CTRMV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, f_complex*, long*, f_complex*, long*);
void	__stdcall STBMV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, long*, float*, long*, float*, long*);
void	__stdcall CTBMV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, long*, f_complex*, long*, f_complex*,
		long*);
void	__stdcall STRSV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, float*, long*, float*, long*);
void	__stdcall CTRSV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, f_complex*, long*, f_complex*, long*);
void	__stdcall STBSV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, long*, float*, long*, float*, long*);
void	__stdcall CTBSV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, long*, f_complex*, long*, f_complex*,
		long*);
void	__stdcall SGER(long*, long*, float*, float*, long*, float*, long*,
		float*, long*);
void	__stdcall CGERU(long*, long*, f_complex*, f_complex*, long*, f_complex*,
		long*, f_complex*, long*);
void	__stdcall CGERC(long*, long*, f_complex*, f_complex*, long*, f_complex*,
		long*, f_complex*, long*);
void	__stdcall CHER(char*, unsigned int, long*, float*, f_complex*, long*,
		f_complex*, long*);
void	__stdcall CHER2(char*, unsigned int, long*, f_complex*, f_complex*,
		long*, f_complex*, long*, f_complex*, long*);
void	__stdcall SSYR(char*, unsigned int, long*, float*, float*, long*,
		float*, long*);
void	__stdcall SSYR2(char*, unsigned int, long*, float*, float*, long*,
		float*, long*, float*, long*);

#endif

/*
 *    Level 3 BLAS
 */

#ifndef IMSL_COMMON_SINGLE

void	__stdcall SGEMM(char*, unsigned int, char*, unsigned int, long*, long*,
		long*, float*, float*, long*, float*, long*, float*, float*,
		long*);
void	__stdcall CGEMM(char*, unsigned int, char*, unsigned int, long*, long*,
		long*, f_complex*, f_complex*, long*, f_complex*, long*,
		f_complex*, f_complex*, long*);
void	__stdcall SSYMM(char*, unsigned int, char*, unsigned int, long*, long*,
		float*, float*, long*, float*, long*, float*, float*, long*);
void	__stdcall CSYMM(char*, unsigned int, char*, unsigned int, long*, long*,
		f_complex*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, long*);
void	__stdcall CHEMM(char*, unsigned int, char*, unsigned int, long*, long*,
		f_complex*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, long*);
void	__stdcall SSYRK(char*, unsigned int, char*, unsigned int, long*, long*,
		float*, float*, long*, float*, float*, long*);
void	__stdcall CSYRK(char*, unsigned int, char*, unsigned int, long*, long*,
		f_complex*, f_complex*, long*, f_complex*, f_complex*, long*);
void	__stdcall CHERK(char*, unsigned int, char*, unsigned int, long*, long*,
		float*, f_complex*, long*, float*, f_complex*, long*);
void	__stdcall SSYR2K(char*, unsigned int, char*, unsigned int, long*, long*,
		float*, float*, long*, float*, long*, float*, float*, long*);
void	__stdcall CSYR2K(char*, unsigned int, char*, unsigned int, long*, long*,
		f_complex*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, long*);
void	__stdcall CHER2K(char*, unsigned int, char*, unsigned int, long*, long*,
		f_complex*, f_complex*, long*, f_complex*, long*, float*,
		f_complex*, long*);
void	__stdcall STRMM(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, char*, unsigned int, long*, long*, float*, float*,
		long*, float*, long*);
void	__stdcall CTRMM(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, char*, unsigned int, long*, long*, f_complex*,
		f_complex*, long*, f_complex*, long*);
void	__stdcall STRSM(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, char*, unsigned int, long*, long*, float*, float*,
		long*, float*, long*);
void	__stdcall CTRSM(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, char*, unsigned int, long*, long*, f_complex*,
		f_complex*, long*, f_complex*, long*);

#endif

/*
 *    Reference Material
 */

#ifndef IMSL_COMMON

void	__stdcall ERSET(long*, long*, long*);
long	__stdcall IERCD(void);
long	__stdcall N1RTY(long*);
void	__stdcall IWKCIN(long*, long*);
void	__stdcall IWKIN(long*);
long	__stdcall IMACH(long*);
void	__stdcall UMACH(long*, long*);

#endif

#ifndef IMSL_COMMON_SINGLE

float	__stdcall AMACH(long*);
long	__stdcall IFNAN(float*);

#endif

/*
 *    Deprecated Routines
 */

#ifndef IMSL_COMMON_SINGLE

float	__stdcall G2DF(float*, long*, long*, float*, float*, float*);
float	__stdcall G3DF(float*, long*, long*, float*, float*, float*);
float	__stdcall G2IN(float*, long*, long*, float*, float*, float*);
void	__stdcall SHOUAP(long*, float*, long*, long*, float*, long*, long*,
		float*, long*);
void	__stdcall SHOUTR(long*, float*, long*, long*, float*, float*);

#endif

#if defined(__cplusplus)
}
#endif

#define IMSL_STAT_SINGLE	/* Single-precision STAT/LIBRARY routines */

#ifndef IMSL_STAT_COMMON
#define IMSL_STAT_COMMON	/* STAT/LIBRARY routines common to both */
#endif				/* single- and double-precision */

#ifndef IMSL_COMMON_SINGLE
#define IMSL_COMMON_SINGLE	/* Single-precision routines common to */
#endif				/* both MATH/LIBRARY and STAT/LIBRARY */

#ifndef IMSL_COMMON
#define IMSL_COMMON		/* Routines common to both MATH/LIBRARY */
#endif				/* and STAT/LIBRARY */

#endif
