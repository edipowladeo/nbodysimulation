/*
 *    STATD.H	- Declare double-precision IMSL STAT/LIBRARY routines
 *
 *    Copyright (c) 1994 by Visual Numerics, Inc.  All Rights Reserved.
 */

#ifndef IMSL_STAT_DOUBLE

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

void	__stdcall DOWFRQ(long*, double*, long*, long*, double*, double*,
		double*, double*, double*);
void	__stdcall DTWFRQ(long*, double*, double*, long*, long*, long*, double*,
		double*, double*, double*, double*, double*, double*, double*,
		double*, long*);
void	__stdcall DFREQ(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, long*, double*, double*);
void	__stdcall DF2EQ(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, long*, double*, double*, long*, double*);
void	__stdcall DUVSTA(long*, long*, long*, double*, long*, long*, long*,
		long*, double*, double*, long*, double*, long*, long*);
void	__stdcall DU2STA(long*, long*, long*, double*, long*, long*, long*,
		long*, double*, double*, long*, double*, long*, long*, double*);
void	__stdcall DRANKS(long*, double*, double*, long*, long*, double*);
void	__stdcall DR2NKS(long*, double*, double*, long*, long*, double*, long*);
void	__stdcall DLETTR(long*, double*, long*, double*, long*);
void	__stdcall DL2TTR(long*, double*, long*, double*, long*, double*);
void	__stdcall DORDST(long*, double*, long*, long*, long*, double*, long*);
void	__stdcall DO2DST(long*, double*, long*, long*, long*, double*, long*,
		double*);
void	__stdcall DEQTIL(long*, double*, long*, double*, double*, double*,
		double*, long*);
void	__stdcall DE2TIL(long*, double*, long*, double*, double*, double*,
		double*, long*, double*);
void	__stdcall DTWOMV(long*, long*, double*, long*, double*, double*,
		double*, long*, double*);
void	__stdcall DBINES(long*, long*, double*, double*, double*, double*);
void	__stdcall DPOIES(long*, long*, double*, double*, double*, double*);
void	__stdcall DNRCES(long*, double*, double*, long*, double*, double*,
		long*, long*, double*, double*, double*, double*, double*,
		long*);
void	__stdcall DGRPES(long*, double*, double*, double*, long*, double*);
void	__stdcall DCSTAT(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, long*, long*, double*, long*);
void	__stdcall DMEDPL(long*, long*, double*, long*, long*, double*, long*,
		long*);
void	__stdcall DM2DPL(long*, long*, double*, long*, long*, double*, long*,
		long*, double*);

/*
 *    Chapter 2:  Regression
 */

void	__stdcall DRONE(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, double*, double*, long*, double*, double*,
		long*, double*, long*, double*, double*, long*, long*);
void	__stdcall DR2NE(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, double*, double*, long*, double*, double*,
		long*, double*, long*, double*, double*, long*, long*, long*,
		double*);
void	__stdcall DRINCF(double*, double*, long*, double*, double*, double*,
		double*, double*, double*, double*, double*, double*, double*);
void	__stdcall DRINPF(double*, double*, long*, double*, double*, double*,
		double*, double*, long*, double*, double*, double*, double*,
		double*);
void	__stdcall DRLSE(long*, double*, long*, double*, long*, long*, double*,
		double*, double*);
void	__stdcall DR2SE(long*, double*, long*, double*, long*, long*, double*,
		double*, double*, double*, long*, double*, long*, double*);
void	__stdcall DRCOV(long*, long*, long*, double*, long*, double*, double*,
		double*, double*, long*, double*, long*, long*, double*, long*);
void	__stdcall DRGIVN(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, double*, double*,
		long*, double*, long*, double*, long*, double*, double*, long*,
		long*, double*, double*);
void	__stdcall DR2IVN(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, double*, double*,
		long*, double*, long*, double*, long*, double*, double*, long*,
		long*, double*, double*, double*);
void	__stdcall DRGLM(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*, long*,
		long*, double*, long*, long*, double*, long*, double*, long*,
		double*, long*, double*, long*, double*, double*, long*, long*,
		double*, double*);
void	__stdcall DR2LM(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*, long*,
		long*, double*, long*, long*, double*, long*, double*, long*,
		double*, long*, double*, long*, double*, double*, long*, long*,
		double*, double*, long*, double*);
void	__stdcall DRLEQU(long*, long*, long*, double*, long*, long*, long*,
		double*, long*, double*, double*, long*, double*, long*,
		double*, long*, double*, double*, long*, long*);
void	__stdcall DR2EQU(long*, long*, long*, double*, long*, long*, long*,
		double*, long*, double*, double*, long*, double*, long*,
		double*, long*, double*, double*, long*, long*, double*);
void	__stdcall DRSTAT(long*, long*, long*, double*, double*, long*, double*,
		double*, char*, unsigned int, double*, double*, long*, double*,
		long*, double*, long*);
void	__stdcall DRCOVB(long*, double*, long*, double*, double*, long*);
void	__stdcall DCESTI(long*, long*, double*, long*, long*, long*, double*,
		long*, double*, long*, long*, long*, double*, long*, double*,
		long*);
void	__stdcall DC2STI(long*, long*, double*, long*, long*, long*, double*,
		long*, double*, long*, long*, long*, double*, long*, double*,
		long*, long*, double*);
void	__stdcall DRHPSS(long*, long*, double*, long*, long*, double*, long*,
		long*, double*, long*, double*, long*, double*, long*, double*,
		double*, long*);
void	__stdcall DR2PSS(long*, long*, double*, long*, long*, double*, long*,
		long*, double*, long*, double*, long*, double*, long*, double*,
		double*, long*, long*, double*);
void	__stdcall DRHPTE(double*, long*, double*, long*, long*, double*, long*,
		double*, double*, long*, double*);
void	__stdcall DR2PTE(double*, long*, double*, long*, long*, double*, long*,
		double*, double*, long*, double*, double*);
void	__stdcall DRLOFE(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, double*, long*, long*, double*);
void	__stdcall DR2OFE(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, double*, long*, long*, double*, long*,
		double*);
void	__stdcall DRLOFN(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, double*, double*, long*, double*, double*,
		long*, long*, double*, long*, long*, double*);
void	__stdcall DR2OFN(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, double*, double*, long*, double*, double*,
		long*, long*, double*, long*, long*, double*, long*, double*);
void	__stdcall DRCASE(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, double*, long*, long*, long*, long*, long*,
		long*, double*, double*, char*, unsigned int, long*, long*,
		double*, double*, long*, double*, double*, double*, long*,
		long*);
void	__stdcall DR2ASE(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, double*, long*, long*, long*, long*, long*,
		long*, double*, double*, char*, unsigned int, long*, long*,
		double*, double*, long*, double*, double*, double*, long*,
		long*, double*);
void	__stdcall DROTIN(long*, long*, double*, long*, long*, long*, long*,
		long*, double*, long*, double*, double*, double*, double*,
		long*, long*);
void	__stdcall DR2TIN(long*, long*, double*, long*, long*, long*, long*,
		long*, double*, long*, double*, double*, double*, double*,
		long*, long*, double*);
void	__stdcall DGCLAS(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, double*, long*);
void	__stdcall DGRGLM(long*, long*, double*, long*, long*, long*, long*,
		double*, long*, long*, long*, long*, long*, double*, long*,
		long*);
void	__stdcall DRBEST(long*, double*, long*, long*, long*, long*, long*,
		long*, long*, double*, long*, long*, long*, double*, long*);
void	__stdcall DR2EST(long*, double*, long*, long*, long*, long*, long*,
		long*, long*, double*, long*, long*, long*, double*, long*,
		double*, long*);
void	__stdcall DRSTEP(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, double*, double*, long*, double*,
		double*, long*, double*, double*, long*, double*, long*);
void	__stdcall DR2TEP(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, double*, double*, long*, double*,
		double*, long*, double*, double*, long*, double*, long*,
		double*, long*);
void	__stdcall DGSWEP(long*, long*, double*, long*, long*, double*, double*,
		double*);
void	__stdcall DRSUBM(long*, double*, long*, double*, long*, double*, long*);
void	__stdcall DR2UBM(long*, double*, long*, double*, long*, double*, long*,
		long*);
void	__stdcall DRPOLY(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, double*, long*, long*, double*, long*,
		long*, long*, double*, double*, long*, double*, long*, double*,
		long*, double*, long*, long*);
void	__stdcall DR2OLY(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, double*, long*, long*, double*, long*,
		long*, long*, double*, double*, long*, double*, long*, double*,
		long*, double*, long*, long*, double*, long*);
void	__stdcall DRCOMP(long*, double*, double*, long*, long*, long*, double*,
		long*);
void	__stdcall DRFORP(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, double*, long*, long*, double*, double*,
		double*, double*, double*, double*, double*, double*, double*,
		double*, long*);
void	__stdcall DR2ORP(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, double*, long*, long*, double*, double*,
		double*, double*, double*, double*, double*, double*, double*,
		double*, long*, double*, long*);
void	__stdcall DRSTAP(long*, double*, double*, double*, double*, double*,
		double*, double*, double*, long*, double*, double*, long*,
		double*, double*, long*, double*, long*, double*, long*);
void	__stdcall DR2TAP(long*, double*, double*, double*, double*, double*,
		double*, double*, double*, long*, double*, double*, long*,
		double*, double*, long*, double*, long*, double*, long*,
		double*);
void	__stdcall DRCASP(long*, long*, double*, long*, long*, long*, long*,
		long*, double*, double*, long*, double*, double*, double*,
		double*, double*, double*, double*, double*, char*,
		unsigned int, double*, long*, long*);
void	__stdcall DR2ASP(long*, long*, double*, long*, long*, long*, long*,
		long*, double*, double*, long*, double*, double*, double*,
		double*, double*, double*, double*, double*, char*,
		unsigned int, double*, long*, long*, double*);
void	__stdcall DOPOLY(long*, double*, long*, double*, long*, double*,
		double*, double*, double*, double*, double*, long*);
void	__stdcall DGCSCP(long*, long*, long*, double*, long*, long*, double*,
		double*, double*, long*, long*, long*);
void	__stdcall DTCSCP(long*, double*, double*, double*, double*);
void	__stdcall DRNLIN(void(__stdcall *)(long*, double*, long*, long*,
		double*, double*, double*, double*, long*), long*, long*,
		double*, double*, long*, long*, double*, double*);
void	__stdcall DR2LIN(void(__stdcall *)(long*, double*, long*, long*,
		double*, double*, double*, double*, long*), long*, long*,
		double*, double*, long*, long*, double*, double*, long*,
		double*, double*, long*, double*);
void	__stdcall DR8LIN(long*, double*);
void	__stdcall DRLAV(long*, long*, double*, long*, long*, long*, long*,
		long*, double*, long*, double*, long*, long*);
void	__stdcall DR2AV(long*, long*, double*, long*, long*, long*, long*,
		long*, double*, long*, double*, long*, long*, long*, double*);
void	__stdcall DRLLP(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, double*, double*, long*, double*, double*,
		double*, long*, long*, double*, double*, double*, double*,
		long*, long*);
void	__stdcall DR2LP(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, double*, double*, long*, double*, double*,
		double*, long*, long*, double*, double*, double*, double*,
		long*, long*, long*, double*);
void	__stdcall DRLMV(long*, long*, double*, long*, long*, long*, long*,
		long*, double*, long*, double*, long*, long*);
void	__stdcall DR2MV(long*, long*, double*, long*, long*, long*, long*,
		long*, double*, long*, double*, long*, long*, double*);

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DRLINE(long*, double*, double*, double*, double*, double*);
void	__stdcall DRCURV(long*, double*, double*, long*, double*, double*,
		double*);
void	__stdcall DR2URV(long*, double*, double*, long*, double*, double*,
		double*, double*, long*);

#endif

/*
 *    Chapter 3:  Correlation
 */

void	__stdcall DCORVC(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, double*, double*, long*, long*, long*, long*,
		long*, double*);
void	__stdcall DC2RVC(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, double*, double*, long*, long*, long*, long*,
		long*, double*, double*);
void	__stdcall DCOVPL(long*, long*, long*, long*, double*, long*, long*,
		long*, long*, long*, long*, long*, double*, double*, long*,
		double*, long*, long*);
void	__stdcall DC2VPL(long*, long*, long*, long*, double*, long*, long*,
		long*, long*, long*, long*, long*, double*, double*, long*,
		double*, long*, long*, double*, double*, double*, double*);
void	__stdcall DPCORR(long*, double*, long*, long*, long*, long*, long*,
		long*, long*, double*, long*, long*, double*, long*);
void	__stdcall DP2ORR(long*, double*, long*, long*, long*, long*, long*,
		long*, long*, double*, long*, long*, double*, long*, double*,
		double*, long*, long*, long*);
void	__stdcall DRBCOV(void(__stdcall *)(double*, long*, double*, double*,
		double*, double*), long*, long*, long*, double*, long*, long*,
		long*, long*, long*, long*, long*, long*, double*, long*,
		double*, long*, double*, double*, long*, double*, long*,
		double*, long*);
void	__stdcall DR2COV(void(__stdcall *)(double*, long*, double*, double*,
		double*, double*), long*, long*, long*, double*, long*, long*,
		long*, long*, long*, long*, long*, long*, double*, long*,
		double*, long*, double*, double*, long*, double*, long*,
		double*, long*, double*, double*, double*, double*, double*,
		double*, double*, double*, long*, long*);
void	__stdcall DR5COV(double*, long*, double*, double*, double*, double*);
void	__stdcall DCTRHO(long*, long*, double*, long*, double*, double*,
		double*, double*, double*, long*, double*, long*);
void	__stdcall DTETCC(long*, long*, double*, double*, double*, double*,
		long*, long*, long*, double*, double*);
void	__stdcall DBSPBS(long*, double*, long*, double*);
void	__stdcall DBSCAT(long*, double*, long*, double*);
void	__stdcall DCNCRD(long*, long*, double*, long*, double*, double*,
		double*);
void	__stdcall DC2CRD(long*, long*, double*, long*, double*, double*,
		double*, long*, double*);
void	__stdcall DKENDL(long*, double*, double*, double*, double*, double*);
void	__stdcall DK2NDL(long*, double*, double*, double*, double*, double*,
		long*, double*, double*, double*);
void	__stdcall DKENDP(long*, long*, double*, double*);
void	__stdcall DK2NDP(long*, long*, double*, double*, double*);

/*
 *    Chapter 4:  Analysis of Variance
 */

void	__stdcall DAONEW(long*, long*, double*, long*, double*, double*, long*,
		long*);
void	__stdcall DAONEC(long*, long*, long*, double*, long*, long*, long*,
		double*, long*, double*, long*, double*, double*, double*,
		double*, long*, double*, long*, double*, long*, long*);
void	__stdcall DA2NEC(long*, long*, long*, double*, long*, long*, long*,
		double*, long*, double*, long*, double*, double*, double*,
		double*, long*, double*, long*, double*, long*, long*, double*);
void	__stdcall DATWOB(long*, long*, long*, double*, long*, double*, double*,
		double*, double*);
void	__stdcall DABIBD(long*, long*, long*, long*, long*, double*, long*,
		long*, long*, double*, double*, double*, double*, double*,
		double*, double*);
void	__stdcall DA2IBD(long*, long*, long*, long*, long*, double*, long*,
		long*, long*, double*, double*, double*, double*, double*,
		double*, double*, double*);
void	__stdcall DALATN(long*, long*, double*, long*, long*, double*, double*,
		double*, double*);
void	__stdcall DANWAY(long*, long*, double*, long*, long*, double*, double*,
		long*, double*);
void	__stdcall DA2WAY(long*, long*, double*, long*, long*, double*, double*,
		long*, double*, double*, long*);
void	__stdcall DABALD(long*, long*, double*, long*, long*, long*, long*,
		long*, double*, long*, long*, double*, double*, double*, long*,
		double*);
void	__stdcall DA2ALD(long*, long*, double*, long*, long*, long*, long*,
		long*, double*, long*, long*, double*, double*, double*, long*,
		double*, double*, long*, char*, unsigned int);
void	__stdcall DANEST(long*, long*, long*, double*, double*, long*, double*,
		double*, double*, long*, double*, long*);
void	__stdcall DA2EST(long*, long*, long*, double*, double*, long*, double*,
		double*, double*, long*, double*, long*, double*, long*, char*,
		unsigned int);
void	__stdcall DCTRST(long*, long*, double*, long*, double*, long*, double*,
		double*);
void	__stdcall DSCIPM(long*, long*, double*, double*, double*, long*,
		double*, long*, double*, long*);
void	__stdcall DS2IPM(long*, long*, double*, double*, double*, long*,
		double*, long*, double*, long*, double*, long*);
void	__stdcall DSNKMC(long*, double*, double*, double*, double*, long*,
		long*);
void	__stdcall DS2KMC(long*, double*, double*, double*, double*, long*,
		long*, double*, long*);
void	__stdcall DCIDMS(double*, double*, double*, double*, double*, double*,
		long*, double*);
void	__stdcall DROREX(long*, long*, long*, double*, long*, double*);
void	__stdcall DR2REX(long*, long*, long*, double*, long*, double*, long*);

/*
 *    Chapter 5:  Categorical and Discrete Data Analysis
 */

void	__stdcall DCTTWO(double*, long*, long*, long*, double*, long*, double*,
		long*, double*, double*, long*);
void	__stdcall DCTCHI(long*, long*, double*, long*, long*, long*, double*,
		long*, double*, long*, double*, double*, long*);
void	__stdcall DCTPRB(long*, long*, double*, long*, double*, double*,
		double*);
void	__stdcall DC2PRB(long*, long*, double*, long*, double*, double*,
		double*, long*);
void	__stdcall DCTEPR(long*, long*, double*, long*, double*, double*,
		double*, double*, double*);
void	__stdcall DC2EPR(long*, long*, double*, long*, double*, double*,
		double*, double*, double*, double*, long*, long*, long*, long*,
		long*, long*, long*, long*, double*, long*, long*, double*,
		double*, double*, long*, long*, double*);
void	__stdcall DPRPFT(long*, long*, double*, long*, long*, long*, double*,
		long*, double*);
void	__stdcall DP2PFT(long*, long*, double*, long*, long*, long*, double*,
		long*, double*, double*, long*, double*, long*);
void	__stdcall DCTLLN(long*, long*, double*, long*, long*, long*, double*,
		long*, double*, long*, double*, long*, double*, long*, double*,
		long*, double*, long*, double*);
void	__stdcall DC2LLN(long*, long*, double*, long*, long*, long*, double*,
		long*, double*, long*, double*, long*, double*, long*, double*,
		long*, double*, long*, double*, double*, long*, long*, long*,
		long*, long*, long*, double*, double*, double*, double*,
		double*, double*, double*, double*, long*);
void	__stdcall DCTPAR(long*, long*, long*, long*, long*, double*, double*,
		long*, long*, double*, long*, double*, long*);
void	__stdcall DC2PAR(long*, long*, long*, long*, long*, double*, double*,
		long*, long*, double*, long*, double*, long*, long*, long*,
		long*, long*, long*, long*, double*, double*, double*, double*,
		double*, double*, double*);
void	__stdcall DCTASC(long*, long*, double*, double*, double*, long*, long*,
		double*, long*, double*, long*, double*, long*);
void	__stdcall DC2ASC(long*, long*, double*, double*, double*, long*, long*,
		double*, long*, double*, long*, double*, long*, double*, long*,
		long*, double*, long*, double*, long*, double*);
void	__stdcall DCTSTP(long*, long*, long*, double*, double*, double*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*, double*,
		double*, long*);
void	__stdcall DC2STP(long*, long*, long*, double*, double*, double*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*, double*,
		double*, long*, long*, double*, long*, long*, long*, double*,
		double*, long*);
void	__stdcall DCTRAN(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, double*, double*, long*);
void	__stdcall DC2RAN(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, double*, double*, long*, long*, double*,
		double*, double*, double*, double*, double*, double*, double*,
		double*);
void	__stdcall DCTGLM(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, double*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*, double*,
		long*, double*, long*, double*, double*, long*, double*,
		double*, long*, double*, long*, long*);
void	__stdcall DC2GLM(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, double*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*, double*,
		long*, double*, long*, double*, double*, long*, double*,
		double*, long*, double*, long*, long*, long*, double*, long*,
		double*, double*, long*);
void	__stdcall DCTWLS(long*, long*, double*, long*, long*, long*, long*,
		double*, long*, double*, long*, long*, long*, double*, long*,
		long*, double*, long*, double*, long*, double*, long*, double*,
		double*, long*, double*, long*);
void	__stdcall DC2WLS(long*, long*, double*, long*, long*, long*, long*,
		double*, long*, double*, long*, long*, long*, double*, long*,
		long*, double*, long*, double*, long*, double*, long*, double*,
		double*, long*, double*, long*, double*, double*, double*,
		double*, double*, long*, double*);

/*
 *    Chapter 6:  Nonparametric Statistics
 */

void	__stdcall DSIGNT(long*, double*, double*, double*, long*, long*,
		double*, long*);
void	__stdcall DSNRNK(long*, double*, double*, double*, long*);
void	__stdcall DS2RNK(long*, double*, double*, double*, long*, long*,
		double*);
void	__stdcall DNCTRD(long*, double*, double*, long*, double*, long*);
void	__stdcall DSDPLC(long*, double*, long*, long*, long*, double*, long*,
		double*, long*);
void	__stdcall DS2PLC(long*, double*, long*, long*, long*, double*, long*,
		double*, long*, double*);
void	__stdcall DNTIES(long*, double*, double*, double*);
void	__stdcall DRNKSM(long*, double*, long*, double*, double*, double*,
		long*, long*);
void	__stdcall DR2KSM(long*, double*, long*, double*, double*, double*,
		long*, long*, long*, double*);
void	__stdcall DINCLD(long*, double*, long*, double*, long*, long*, double*,
		double*, long*, long*);
void	__stdcall DI2CLD(long*, double*, long*, double*, long*, long*, double*,
		double*, long*, long*, double*);
void	__stdcall DKRSKL(long*, long*, double*, double*, double*);
void	__stdcall DK2SKL(long*, long*, double*, double*, double*, long*,
		double*, double*);
void	__stdcall DBHAKV(long*, long*, double*, double*, double*);
void	__stdcall DB2AKV(long*, long*, double*, double*, double*, long*,
		double*, double*);
void	__stdcall DFRDMN(long*, long*, double*, double*, double*, double*,
		double*, double*);
void	__stdcall DF2DMN(long*, long*, double*, double*, double*, double*,
		double*, double*, long*, double*);
void	__stdcall DQTEST(long*, long*, double*, long*, double*, double*);
void	__stdcall DKTRND(long*, long*, double*, double*);

/*
 *    Chapter 7:  Tests of Goodness of Fit and Randomness
 */

void	__stdcall DKSONE(double(__stdcall *)(double*), long*, double*, double*,
		long*);
void	__stdcall DK2ONE(double(__stdcall *)(double*), long*, double*, double*,
		long*, double*);
void	__stdcall DCHIGF(long*, double(__stdcall *)(double*), long*, double*,
		double*, long*, double*, long*, double*, double*, double*,
		double*, double*, double*);
void	__stdcall DSPWLK(long*, double*, double*, double*, long*);
void	__stdcall DS2WLK(long*, double*, double*, double*, long*, double*);
void	__stdcall DLILLF(long*, double*, long*, double*, double*, double*,
		double*, long*);
void	__stdcall DL2LLF(long*, double*, long*, double*, double*, double*,
		double*, long*, double*);
void	__stdcall DMVMMT(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, double*, double*, double*, long*, double*,
		long*);
void	__stdcall DM2MMT(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, double*, double*, double*, long*, double*,
		long*, double*, double*, double*);
void	__stdcall DKSTWO(long*, double*, long*, double*, double*, long*, long*);
void	__stdcall DK2TWO(long*, double*, long*, double*, double*, long*, long*,
		double*, double*);
void	__stdcall DRUNS(long*, long*, double*, long*, double*, double*, double*,
		long*, double*, double*, double*);
void	__stdcall DR2NS(long*, long*, double*, long*, double*, double*, double*,
		long*, double*, double*, double*, double*, double*, long*,
		long*, double*);
void	__stdcall DPAIRS(long*, long*, double*, long*, long*, double*, long*,
		double*, double*, double*, double*);
void	__stdcall DDSQAR(long*, long*, double*, long*, double*, double*,
		double*, double*, double*);
void	__stdcall DDCUBE(long*, long*, double*, long*, double*, long*, double*,
		double*, double*, double*);

/*
 *    Chapter 8:  Time Series Analysis and Forecasting
 */

void	__stdcall DBCTR(long*, double*, long*, long*, double*, double*,
		double*);
void	__stdcall DDIFF(long*, double*, long*, long*, long*, long*, long*,
		long*, long*, double*);
void	__stdcall DD2FF(long*, double*, long*, long*, long*, long*, long*,
		long*, long*, double*, double*);
void	__stdcall DACF(long*, double*, long*, long*, long*, double*, long*,
		double*, double*, double*);
void	__stdcall DPACF(long*, double*, double*);
void	__stdcall DP2CF(long*, double*, double*, double*);
void	__stdcall DCCF(long*, double*, double*, long*, long*, long*, long*,
		double*, double*, double*, double*, double*, double*, double*);
void	__stdcall DC2F(long*, double*, double*, long*, long*, long*, long*,
		double*, double*, double*, double*, double*, double*, double*,
		double*, double*);
void	__stdcall DMCCF(long*, long*, double*, long*, long*, long*, double*,
		long*, long*, long*, long*, double*, double*, double*, double*,
		double*, long*, long*, double*, long*, long*);
void	__stdcall DARMME(long*, double*, long*, long*, long*, double*);
void	__stdcall DA2MME(long*, double*, long*, long*, long*, double*, double*,
		double*, long*, double*);
void	__stdcall DMAMME(long*, double*, long*, long*, double*, double*, long*,
		long*, double*);
void	__stdcall DM2MME(long*, double*, long*, long*, double*, double*, long*,
		long*, double*, double*, double*, double*, double*, double*,
		double*, double*, double*, double*);
void	__stdcall DNSPE(long*, double*, long*, long*, double*, long*, long*,
		double*, long*, double*, double*, double*, double*);
void	__stdcall DN2PE(long*, double*, long*, long*, double*, long*, long*,
		double*, long*, double*, double*, double*, double*, double*,
		double*, double*, double*, double*, double*, double*, double*,
		double*, double*, double*, double*, long*, double*);
void	__stdcall DNSLSE(long*, double*, long*, long*, double*, long*, double*,
		long*, long*, double*, long*, long*, double*, double*, double*,
		double*, long*, long*, double*, double*);
void	__stdcall DN2LSE(long*, double*, long*, long*, double*, long*, double*,
		long*, long*, double*, long*, long*, double*, double*, double*,
		double*, long*, long*, double*, double*, double*, double*,
		double*, double*, double*, double*, long*, double*, long*,
		double*, double*, double*);
void	__stdcall DSPWF(long*, double*, long*, double*, double*, double*, long*,
		long*, double*);
void	__stdcall DS2WF(long*, double*, long*, double*, double*, double*, long*,
		long*, double*, double*, double*);
void	__stdcall DNSBJF(long*, double*, long*, long*, double*, long*, long*,
		double*, long*, long*, double*, double*, double*, long*, long*,
		double*, long*);
void	__stdcall DN2BJF(long*, double*, long*, long*, double*, long*, long*,
		double*, long*, long*, double*, double*, double*, long*, long*,
		double*, long*, double*, double*, double*, double*, long*);
void	__stdcall DIRNSE(long*, double*, double*, long*, long*, double*, long*,
		double*, long*, long*, double*, double*, double*, double*);
void	__stdcall DI2NSE(long*, double*, double*, long*, long*, double*, long*,
		double*, long*, long*, double*, double*, double*, double*,
		double*, double*, double*);
void	__stdcall DTFPE(long*, long*, long*, long*, long*, long*, long*,
		double*, long*, double*, double*, long*, double*, double*,
		double*, double*, double*);
void	__stdcall DT2PE(long*, long*, long*, long*, long*, long*, long*,
		double*, long*, double*, double*, long*, double*, double*,
		double*, double*, double*, double*, double*, long*, double*,
		double*, double*, double*, double*, double*, double*, double*,
		double*, double*, double*, double*);
void	__stdcall DMLSE(long*, long*, double*, long*, long*, double*, long*,
		long*, long*, double*, long*, double*);
void	__stdcall DM2SE(long*, long*, double*, long*, long*, double*, long*,
		long*, long*, double*, long*, double*, double*, long*);
void	__stdcall DMWFE(long*, long*, double*, long*, long*, long*, double*,
		long*, long*, double*, double*, long*, double*, long*, long*,
		double*);
void	__stdcall DM2FE(long*, long*, double*, long*, long*, long*, double*,
		long*, long*, double*, double*, long*, double*, long*, long*,
		double*, long*, double*);
void	__stdcall DKALMN(long*, double*, long*, double*, long*, double*, long*,
		long*, double*, long*, long*, double*, long*, double*, double*,
		double*, long*, long*, double*, double*, double*, double*,
		long*);
void	__stdcall DK2LMN(long*, double*, long*, double*, long*, double*, long*,
		long*, double*, long*, long*, double*, long*, double*, double*,
		double*, long*, long*, double*, double*, double*, double*,
		long*, double*, double*, double*);
void	__stdcall DLOFCF(long*, long*, long*, double*, long*, double*, double*);
double	__stdcall DDIRIC(long*, double*, double*);
double	__stdcall DFEJER(long*, double*, double*);
void	__stdcall DPFFT(long*, double*, long*, double*, long*, long*, long*,
		double*, long*);
void	__stdcall DP2FT(long*, double*, long*, double*, long*, long*, long*,
		double*, long*, d_complex*, d_complex*, double*, double*);
void	__stdcall DSSWD(long*, double*, long*, double*, long*, long*, long*,
		double*, double*, long*, long*, long*, double*, long*, double*,
		long*);
void	__stdcall DS2WD(long*, double*, long*, double*, long*, long*, long*,
		double*, double*, long*, long*, long*, double*, long*, double*,
		long*, d_complex*, d_complex*, double*, double*);
void	__stdcall DSSWP(long*, double*, long*, double*, long*, long*, double*);
void	__stdcall DSWED(long*, double*, long*, double*, long*, long*, long*,
		double*, double*, long*, double*, double*, long*, double*,
		long*);
void	__stdcall DS2ED(long*, double*, long*, double*, long*, long*, long*,
		double*, double*, long*, double*, double*, long*, double*,
		long*, d_complex*, d_complex*, double*, double*);
void	__stdcall DSWEP(long*, double*, long*, double*, long*, double*,
		double*);
void	__stdcall DCPFFT(long*, double*, double*, long*, double*, double*,
		long*, long*, long*, double*, long*);
void	__stdcall DC2FFT(long*, double*, double*, long*, double*, double*,
		long*, long*, long*, double*, long*, d_complex*, d_complex*,
		double*, double*);
void	__stdcall DCSSWD(long*, double*, double*, long*, double*, double*,
		long*, long*, long*, double*, double*, long*, long*, long*,
		double*, long*, double*, long*);
void	__stdcall DC2SWD(long*, double*, double*, long*, double*, double*,
		long*, long*, long*, double*, double*, long*, long*, long*,
		double*, long*, double*, long*, d_complex*, d_complex*, double*,
		double*);
void	__stdcall DCSSWP(long*, double*, double*, double*, double*, long*,
		double*, long*, long*, double*, double*, double*, double*,
		double*);
void	__stdcall DCSWED(long*, double*, double*, long*, double*, double*,
		long*, long*, long*, double*, double*, long*, double*, double*,
		long*, double*, long*);
void	__stdcall DC2WED(long*, double*, double*, long*, double*, double*,
		long*, long*, long*, double*, double*, long*, double*, double*,
		long*, double*, long*, d_complex*, d_complex*, double*,
		double*);
void	__stdcall DCSWEP(long*, double*, double*, double*, double*, long*,
		double*, long*, double*, double*, double*, double*, double*,
		double*);

/*
 *    Chapter 9:  Covariance Structures and Factor Analysis
 */

void	__stdcall DPRINC(long*, long*, double*, long*, long*, double*, double*,
		double*, double*, long*, double*, long*);
void	__stdcall DKPRIN(long*, long*, double*, long*, double*, long*, double*,
		long*);
void	__stdcall DK2RIN(long*, long*, double*, long*, double*, long*, double*,
		long*, double*, double*, double*, double*, double*);
void	__stdcall DFACTR(long*, double*, long*, long*, long*, long*, long*,
		long*, long*, double*, double*, long*, double*, double*, long*,
		double*, double*, double*);
void	__stdcall DF2CTR(long*, double*, long*, long*, long*, long*, long*,
		long*, long*, double*, double*, long*, double*, double*, long*,
		double*, double*, double*, long*, double*, double*, double*,
		double*, double*);
void	__stdcall DFROTA(long*, long*, double*, long*, long*, long*, double*,
		double*, double*, long*, double*, long*);
void	__stdcall DF2OTA(long*, long*, double*, long*, long*, long*, double*,
		double*, double*, long*, double*, long*, double*);
void	__stdcall DFOPCS(long*, long*, double*, long*, double*, long*, double*,
		long*, double*, long*);
void	__stdcall DF2PCS(long*, long*, double*, long*, double*, long*, double*,
		long*, double*, long*, double*, double*);
void	__stdcall DFDOBL(long*, long*, double*, long*, long*, double*, long*,
		double*, double*, long*, double*, long*, double*, long*);
void	__stdcall DF2OBL(long*, long*, double*, long*, long*, double*, long*,
		double*, double*, long*, double*, long*, double*, long*,
		double*, double*, double*);
void	__stdcall DFPRMX(long*, long*, double*, long*, long*, long*, double*,
		long*, double*, double*, double*, long*, double*, long*,
		double*, long*, double*, long*);
void	__stdcall DF2RMX(long*, long*, double*, long*, long*, long*, double*,
		long*, double*, double*, double*, long*, double*, long*,
		double*, long*, double*, long*, double*, double*, long*,
		double*);
void	__stdcall DFHARR(long*, long*, double*, long*, long*, long*, double*,
		double*, double*, double*, double*, long*, double*, long*,
		double*, long*);
void	__stdcall DF2ARR(long*, long*, double*, long*, long*, long*, double*,
		double*, double*, double*, double*, long*, double*, long*,
		double*, long*, double*, double*);
void	__stdcall DFGCRF(long*, long*, double*, long*, long*, double*, long*,
		double*, double*, long*, double*, long*, double*, long*);
void	__stdcall DF2CRF(long*, long*, double*, long*, long*, double*, long*,
		double*, double*, long*, double*, long*, double*, long*,
		double*, double*, double*);
void	__stdcall DFIMAG(long*, double*, long*, double*, long*);
void	__stdcall DF2MAG(long*, double*, long*, double*, long*, double*, long*);
void	__stdcall DFRVAR(long*, long*, double*, long*, double*, long*, double*,
		double*, long*, double*);
void	__stdcall DF2VAR(long*, long*, double*, long*, double*, long*, double*,
		double*, long*, double*, double*, double*, long*);
void	__stdcall DFCOEF(long*, long*, double*, long*, long*, double*, long*,
		double*, long*, double*, long*);
void	__stdcall DF2OEF(long*, long*, double*, long*, long*, double*, long*,
		double*, long*, double*, long*, double*, double*, double*,
		double*, double*);
void	__stdcall DFSCOR(long*, long*, double*, long*, long*, double*, long*,
		double*, double*, double*, long*);
void	__stdcall DF2COR(long*, long*, double*, long*, long*, double*, long*,
		double*, double*, double*, long*, double*);
void	__stdcall DFRESI(long*, double*, long*, long*, double*, long*, double*,
		double*, long*);
void	__stdcall DMVIND(long*, long*, double*, long*, long*, long*, double*);
void	__stdcall DM2IND(long*, long*, double*, long*, long*, long*, double*,
		double*, double*, long*);
void	__stdcall DCANCR(long*, long*, long*, long*, double*, long*, long*,
		long*, long*, long*, double*, long*, double*, long*, double*,
		long*, double*, long*, double*, long*, double*, long*, double*,
		long*, double*, long*);
void	__stdcall DC2NCR(long*, long*, long*, long*, double*, long*, long*,
		long*, long*, long*, double*, long*, double*, long*, double*,
		long*, double*, long*, double*, long*, double*, long*, double*,
		long*, double*, long*, double*, double*, long*, double*,
		double*, double*);
void	__stdcall DCANVC(long*, long*, long*, double*, long*, long*, long*,
		long*, double*, long*, double*, long*, double*, long*, double*,
		long*, double*, long*);
void	__stdcall DC2NVC(long*, long*, long*, double*, long*, long*, long*,
		long*, double*, long*, double*, long*, double*, long*, double*,
		long*, double*, long*, double*, double*, double*, double*,
		double*, double*);

/*
 *    Chapter 10:  Discriminant Analysis
 */

void	__stdcall DDSCRM(long*, long*, long*, long*, double*, long*, long*,
		long*, long*, long*, long*, long*, long*, double*, long*,
		double*, long*, double*, long*, double*, long*, long*, double*,
		long*, double*, long*, double*, long*, double*, long*);
void	__stdcall DD2CRM(long*, long*, long*, long*, double*, long*, long*,
		long*, long*, long*, long*, long*, long*, double*, long*,
		double*, long*, double*, long*, double*, long*, long*, double*,
		long*, double*, long*, double*, long*, double*, long*, double*,
		double*, double*);
void	__stdcall DDMSCR(long*, long*, double*, long*, double*, double*, long*,
		long*, double*, double*, long*, double*, long*);
void	__stdcall DD2SCR(long*, long*, double*, long*, double*, double*, long*,
		long*, double*, double*, long*, double*, long*, double*,
		double*, double*, double*, double*);
void	__stdcall DNNBRD(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, long*, long*, double*, double*, double*,
		long*, long*, long*, double*, long*, double*, long*);
void	__stdcall DN2BRD(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, long*, long*, double*, double*, double*,
		long*, long*, long*, double*, long*, double*, long*, double*,
		long*, long*, long*, long*, double*, double*, double*, long*,
		double*);

/*
 *    Chapter 11:  Cluster Analysis
 */

void	__stdcall DCDIST(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, long*);
void	__stdcall DC2IST(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, long*, double*, double*, double*,
		double*, long*);
void	__stdcall DCLINK(long*, long*, long*, double*, long*, double*, long*,
		long*);
void	__stdcall DC2INK(long*, long*, long*, double*, long*, double*, long*,
		long*, long*, long*, double*, double*);
void	__stdcall DKMEAN(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, double*, long*, double*, long*, long*,
		long*, double*);
void	__stdcall DK2EAN(long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, double*, long*, double*, long*, long*,
		long*, double*, long*, long*, double*, long*, long*);

#ifndef IMSL_STAT_COMMON

void	__stdcall CNUMB(long*, long*, long*, long*, long*, long*);
void	__stdcall C2UMB(long*, long*, long*, long*, long*, long*, long*);

#endif

/*
 *    Chapter 12:  Sampling
 */

void	__stdcall DSMPPR(long*, long*, long*, double*, double*);
void	__stdcall DSMPPS(long*, long*, long*, long*, double*, double*, double*);
void	__stdcall DSMPRR(long*, long*, double*, double*, long*, long*, double*,
		double*, double*, double*);
void	__stdcall DSMPRS(long*, long*, long*, double*, double*, long*, long*,
		long*, double*, double*, double*, double*, double*, double*,
		double*, double*, double*, double*, long*, double*);
void	__stdcall DSMPSC(long*, long*, long*, double*, long*, long*, long*,
		double*, double*, double*, double*, double*, long*, double*);
void	__stdcall DSMPSR(long*, long*, double*, long*, long*, long*, double*,
		double*);
void	__stdcall DSMPSS(long*, long*, long*, double*, long*, long*, double*,
		double*, double*, long*, double*);
void	__stdcall DSMPST(long*, long*, long*, long*, double*, long*, long*,
		double*, double*, double*, double*);

/*
 *    Chapter 13:  Survival Analysis, Life Testing and Reliability
 */

void	__stdcall DKAPMR(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, long*, long*);
void	__stdcall DK2PMR(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, long*, long*, long*, long*, long*, long*,
		double*, long*);
void	__stdcall DKTBLE(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, long*);
void	__stdcall DK2BLE(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, long*, double*, long*, long*, double*,
		double*, long*);
void	__stdcall DTRNBL(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, long*, long*, double*, long*, double*,
		long*);
void	__stdcall DT2NBL(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, long*, long*, double*, long*, double*,
		long*, double*, long*, long*, double*, long*);
void	__stdcall DPHGLM(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, double*, double*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, double*, long*,
		double*, long*, double*, double*, long*, double*, double*,
		long*, double*, long*, long*);
void	__stdcall DP2GLM(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, double*, double*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, double*, long*,
		double*, long*, double*, double*, long*, double*, double*,
		long*, double*, long*, long*, double*, double*, double*, long*,
		long*, long*);
void	__stdcall DSVGLM(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, double*, long*,
		double*, long*, double*, double*, long*, double*, double*,
		long*, double*, long*, long*);
void	__stdcall DS2GLM(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, double*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, double*, long*,
		double*, long*, double*, double*, long*, double*, double*,
		long*, double*, long*, long*, long*, double*, long*, double*,
		double*, long*, double*, long*);
void	__stdcall DSTBLE(long*, long*, double*, long*, long*, double*, long*,
		double*, long*, long*, long*, long*, long*, double*, long*,
		long*, long*, long*, double*, long*, double*, long*, double*);
void	__stdcall DS2BLE(long*, long*, double*, long*, long*, double*, long*,
		double*, long*, long*, long*, long*, long*, double*, long*,
		long*, long*, long*, double*, long*, double*, long*, double*,
		char*, unsigned int, double*, double*);
void	__stdcall DACTBL(long*, long*, long*, double*, double*, long*, long*,
		long*, double*, long*);

/*
 *    Chapter 14:  Multidimensional Scaling
 */

void	__stdcall DMSIDV(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, double*, long*, double*, long*, double*,
		double*, double*, double*, double*, double*);
void	__stdcall DM2IDV(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, double*, double*, long*, double*, long*, double*,
		double*, double*, double*, double*, double*, double*, double*,
		double*, double*, double*, double*, double*, long*, double*,
		double*, double*, double*, long*, double*, double*, double*,
		double*, long*, double*);
void	__stdcall DMSDST(long*, long*, double*, long*, long*, long*, long*,
		long*, double*, long*, double*, long*, double*);
void	__stdcall DMSSTN(long*, long*, long*, long*, double*, long*, long*,
		long*, long*, long*, double*);
void	__stdcall DM2STN(long*, long*, long*, long*, double*, long*, long*,
		long*, long*, long*, double*, long*, double*, double*);
void	__stdcall DMSDBL(long*, long*, long*, double*, long*, long*, double*,
		long*, double*, long*, double*, long*);
void	__stdcall DMSINI(long*, long*, long*, double*, long*, long*, long*,
		double*, long*, double*, long*, double*, long*, double*,
		double*);
void	__stdcall DM2INI(long*, long*, long*, double*, long*, long*, long*,
		double*, long*, double*, long*, double*, long*, double*,
		double*, double*, double*, double*, double*, double*, double*,
		long*, double*);
void	__stdcall DMSTRS(long*, double*, double*, long*, double*, long*,
		double*, double*, long*, double*, double*);

/*
 *    Chapter 15:  Density and Hazard Estimation
 */

void	__stdcall DDESPL(long*, double*, long*, double*, long*, double*, long*,
		double*, double*, double*, long*);
void	__stdcall DD2SPL(long*, double*, long*, double*, long*, double*, long*,
		double*, double*, double*, long*, double*, long*, long*,
		double*, double*, long*, double*, double*);
void	__stdcall DDESKN(double(__stdcall *)(double*), long*, double*, double*,
		double*, long*, double*, double*, long*);
void	__stdcall DDNFFT(long*, double*, double*, double*, double*, long*,
		long*, double*, double*, long*);
void	__stdcall DD2FFT(long*, double*, double*, double*, double*, long*,
		long*, double*, double*, long*, double*);
void	__stdcall DDESPT(long*, double*, long*, long*, double*, double*,
		double*);
void	__stdcall DD2SPT(long*, double*, long*, long*, double*, double*,
		double*, double*, double*, double*);
void	__stdcall DHAZRD(long*, double*, long*, long*, long*, long*, long*,
		double*, double*, long*, long*, long*, long*, long*, double*,
		long*, double*, double*, long*, double*, double*, long*);
void	__stdcall DHAZEZ(long*, double*, long*, long*, long*, long*, double*,
		long*, double*, double*, long*, double*, double*, long*);
void	__stdcall DHAZST(long*, double*, long*, long*, long*, double*, double*,
		double*, double*, long*, long*, double*, double*);

/*
 *    Chapter 16:  Line Printer Graphics
 */

void	__stdcall DVHSTP(long*, double*, long*, char*, unsigned int);
void	__stdcall DVHS2P(long*, double*, double*, long*, char*, unsigned int);
void	__stdcall DV2S2P(long*, double*, double*, long*, char*, unsigned int,
		double*);
void	__stdcall DHHSTP(long*, double*, long*, long*, long*, long*, long*,
		char*, unsigned int);
void	__stdcall DSCTP(long*, long*, double*, long*, long*, double*, char*,
		unsigned int, char*, unsigned int, char*, unsigned int, char*,
		unsigned int);
void	__stdcall DBOXP(long*, long*, double*, char*, unsigned int);
void	__stdcall DB2XP(long*, long*, double*, char*, unsigned int, double*);
void	__stdcall DSTMLP(long*, double*, double*, char*, unsigned int);
void	__stdcall DS2MLP(long*, double*, double*, char*, unsigned int, long*,
		long*, double*);
void	__stdcall DCDFP(double(__stdcall *)(double*), long*, double*, long*,
		long*, long*);
void	__stdcall DC2FP(double(__stdcall *)(double*), long*, double*, long*,
		long*, long*, double*, double*);
void	__stdcall DCDF2P(long*, long*, double*);
void	__stdcall DC2F2P(long*, long*, double*, double*, long*);
void	__stdcall DPROBP(long*, long*, long*, double*, long*);
void	__stdcall DP2OBP(long*, long*, long*, double*, long*, long*, long*,
		double*);
void	__stdcall DTREEP(long*, long*, long*, long*, double*, long*, long*,
		long*, double*, char*, unsigned int);
void	__stdcall DT2EEP(long*, long*, long*, long*, double*, long*, long*,
		long*, double*, char*, unsigned int, long*, long*, long*, long*,
		double*);

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DPLOTP(long*, long*, double*, double*, long*, long*, double*,
		char*, unsigned int, char*, unsigned int, char*, unsigned int,
		char*, unsigned int);

#endif

/*
 *    Chapter 17:  Probability Distribution Functions and Inverses
 */

double	__stdcall DCSNIN(double*, double*, double*);
double	__stdcall DGAMIN(double*, double*);
double	__stdcall DTNIN(double*, long*, double*);
double	__stdcall DGFNIN(double(__stdcall *)(double*), double*, double*,
		double*);

#ifndef IMSL_COMMON_DOUBLE

double	__stdcall DBINDF(long*, long*, double*);
double	__stdcall DBINPR(long*, long*, double*);
double	__stdcall DHYPDF(long*, long*, long*, long*);
double	__stdcall DHYPPR(long*, long*, long*, long*);
double	__stdcall DPOIDF(long*, double*);
double	__stdcall DPOIPR(long*, double*);
double	__stdcall DKS1DF(long*, double*);
double	__stdcall DK21DF(long*, double*, double*);
double	__stdcall DKS2DF(long*, long*, double*);
double	__stdcall DK22DF(long*, long*, double*, double*);
double	__stdcall DNORDF(double*);
double	__stdcall DNORIN(double*);
double	__stdcall DBETDF(double*, double*, double*);
double	__stdcall DBETIN(double*, double*, double*);
double	__stdcall DBNRDF(double*, double*, double*);
double	__stdcall DCHIDF(double*, double*);
double	__stdcall DCHIIN(double*, double*);
double	__stdcall DCSNDF(double*, double*, double*);
double	__stdcall DFDF(double*, double*, double*);
double	__stdcall DFIN(double*, double*, double*);
double	__stdcall DGAMDF(double*, double*);
double	__stdcall DTDF(double*, double*);
double	__stdcall DTIN(double*, double*);
double	__stdcall DTNDF(double*, long*, double*);
double	__stdcall DGCDF(double*, long*, long*, double*, double*);
double	__stdcall DG4DF(double*, long*, long*, double*, double*, double*,
		long*);
double	__stdcall DGCIN(double*, long*, long*, double*, double*);
double	__stdcall DG3IN(double*, long*, long*, double*, double*, double*,
		long*);

#endif

/*
 *    Chapter 18:  Random Number Generation
 */

void	__stdcall DRNSES(double*);
void	__stdcall DRNGES(double*);
void	__stdcall DRNGDA(long*, long*, long*, long*, double*, long*, double*,
		long*);
void	__stdcall DRNGDS(double(__stdcall *)(long*), long*, double*, long*,
		long*, long*, double*, long*);
void	__stdcall DRNGDT(long*, long*, long*, double*, long*);
void	__stdcall DRNBET(long*, double*, double*, double*);
void	__stdcall DRNCHI(long*, double*, double*);
void	__stdcall DRNCHY(long*, double*);
void	__stdcall DRNEXP(long*, double*);
void	__stdcall DRNEXT(long*, double*, double*, double*, double*);
void	__stdcall DRNGAM(long*, double*, double*);
void	__stdcall DRNGCS(double(__stdcall *)(double*), long*, long*, double*,
		long*);
void	__stdcall DRNGCT(long*, long*, double*, long*, double*);
void	__stdcall DRNLNL(long*, double*, double*, double*);
void	__stdcall DRNNOA(long*, double*);
double	__stdcall DRNNOF(void);
void	__stdcall DRNNOR(long*, double*);
void	__stdcall DRNSTA(long*, double*, double*, double*);
void	__stdcall DRNSTT(long*, double*, double*);
void	__stdcall DRNTRI(long*, double*);
void	__stdcall DRNVMS(long*, double*, double*);
void	__stdcall DRNWIB(long*, double*, double*);
void	__stdcall DRNCOR(long*, long*, double*, double*, long*, double*, long*);
void	__stdcall DR2COR(long*, long*, double*, double*, long*, double*, long*,
		long*, double*);
void	__stdcall DRNDAT(long*, long*, long*, long*, double*, long*, long*,
		double*, long*);
void	__stdcall DR2DAT(long*, long*, long*, long*, double*, long*, long*,
		double*, long*, long*, double*);
void	__stdcall DRNMVN(long*, long*, double*, long*, double*, long*);
void	__stdcall DRNSPH(long*, long*, double*, long*);
void	__stdcall DRNNOS(long*, long*, long*, double*);
void	__stdcall DRNUNO(long*, long*, long*, double*);
void	__stdcall DRNARM(long*, double*, long*, double*, long*, long*, double*,
		long*, long*, double*, double*, double*, double*);
void	__stdcall DRNNPP(double*, double*, double(__stdcall *)(double*),
		double*, double*, long*, long*, double*);
void	__stdcall DRNSRS(long*, long*, long*, double*, long*, long*, long*,
		double*, long*, long*);

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

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DRNUN(long*, double*);
double	__stdcall DRNUNF(void);

#endif

/*
 *    Chapter 19:  Utilities
 */

void	__stdcall DRORDM(long*, double*, long*, long*, long*, double*, long*);
void	__stdcall DR2RDM(long*, double*, long*, long*, long*, double*, long*,
		long*);
void	__stdcall DMVNAN(long*, long*, long*, long*, double*, long*, long*,
		long*);
void	__stdcall DSCOLR(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*);
void	__stdcall DS2OLR(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, double*, long*);
void	__stdcall DSROWR(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*);
void	__stdcall DS2OWR(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, double*, long*);
void	__stdcall DGDATA(long*, long*, long*, long*, double*, long*, long*);

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

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DWRRRN(char*, unsigned int, long*, long*, double*, long*,
		long*);
void	__stdcall DWRRRL(char*, unsigned int, long*, long*, double*, long*,
		long*, char*, unsigned int, char*, unsigned int, char*,
		unsigned int);
void	__stdcall DW2RRL(char*, unsigned int, long*, long*, double*, long*,
		long*, char*, unsigned int, char*, unsigned int, char*,
		unsigned int, char*, unsigned int);
void	__stdcall DPERMU(long*, double*, long*, long*, double*);
void	__stdcall DPERMA(long*, long*, double*, long*, long*, long*, double*,
		long*);
void	__stdcall DP2RMA(long*, long*, double*, long*, long*, long*, double*,
		long*, double*);
void	__stdcall DSVRGN(long*, double*, double*);
void	__stdcall DSVRGP(long*, double*, double*, long*);
void	__stdcall DSRCH(long*, double*, double*, long*, long*);

#endif

/*
 *    Chapter 20:  Mathematical Support
 */

void	__stdcall DCHFAC(long*, double*, long*, double*, long*, double*, long*);
void	__stdcall DMCHOL(long*, double*, long*, double*, long*, double*, long*,
		double*, long*);
void	__stdcall DGIRTS(long*, double*, long*, long*, double*, long*, long*,
		long*, double*, long*, double*, long*);
double	__stdcall DENOS(long*, long*);
double	__stdcall DMILLR(double*);
void	__stdcall DQUADT(long*, long*, long*, double*, long*, long*, long*,
		long*, double*);
void	__stdcall DQ2ADT(long*, long*, long*, double*, long*, long*, long*,
		long*, double*, long*, long*, double*, long*);
void	__stdcall DNGHBR(long*, double*, long*, long*, long*, double*, long*,
		long*, long*, long*, double*, long*, long*, double*);
void	__stdcall DN2HBR(long*, double*, long*, long*, long*, double*, long*,
		long*, long*, long*, double*, long*, long*, double*, long*,
		long*, long*, double*, double*);

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DLINRG(long*, double*, long*, double*, long*);
void	__stdcall DL2NRG(long*, double*, long*, double*, long*, double*, long*);
void	__stdcall DLSLRG(long*, double*, long*, double*, long*, double*);
void	__stdcall DL2LRG(long*, double*, long*, double*, long*, double*,
		double*, long*, double*);
void	__stdcall DLFTRG(long*, double*, long*, double*, long*, long*);
void	__stdcall DL2TRG(long*, double*, long*, double*, long*, long*, double*);
void	__stdcall DLFSRG(long*, double*, long*, long*, double*, long*, double*);
void	__stdcall DLFDRG(long*, double*, long*, long*, double*, double*);
void	__stdcall DLSGRR(long*, long*, double*, long*, double*, long*, double*,
		long*);
void	__stdcall DL2GRR(long*, long*, double*, long*, double*, long*, double*,
		long*, double*, double*);
void	__stdcall DLSBRR(long*, long*, double*, long*, double*, double*,
		double*, double*, long*);
void	__stdcall DL2BRR(long*, long*, double*, long*, double*, double*,
		double*, double*, long*, double*, double*, long*, double*);
void	__stdcall DLSQRR(long*, long*, double*, long*, double*, double*,
		double*, double*, long*);
void	__stdcall DL2QRR(long*, long*, double*, long*, double*, double*,
		double*, double*, long*, double*, double*, long*, double*);
void	__stdcall DLSVRR(long*, long*, double*, long*, long*, double*, long*,
		double*, double*, long*, double*, long*);
void	__stdcall DL2VRR(long*, long*, double*, long*, long*, double*, long*,
		double*, double*, long*, double*, long*, double*, double*);
void	__stdcall DEVCSF(long*, double*, long*, double*, double*, long*);
void	__stdcall DE5CSF(long*, double*, long*, double*, double*, long*,
		double*, long*);
double	__stdcall DEPISF(long*, long*, double*, long*, double*, double*, long*);
double	__stdcall DE2ISF(long*, long*, double*, long*, double*, double*, long*,
		double*);
void	__stdcall DGVLSP(long*, double*, long*, double*, long*, double*);
void	__stdcall DG3LSP(long*, double*, long*, double*, long*, double*, long*,
		double*, double*);
void	__stdcall DQDAGS(double(__stdcall *)(double*), double*, double*,
		double*, double*, double*, double*);
void	__stdcall DQ2AGS(double(__stdcall *)(double*), double*, double*,
		double*, double*, double*, double*, long*, long*, long*,
		double*, double*, double*, double*, long*);
void	__stdcall DFFTRI(long*, double*);
void	__stdcall DFFTRF(long*, double*, double*);
void	__stdcall DF2TRF(long*, double*, double*, double*);
void	__stdcall DFFTRB(long*, double*, double*);
void	__stdcall DF2TRB(long*, double*, double*, double*);
void	__stdcall DUMINF(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, long*, double*, double*, double*);
void	__stdcall DU2INF(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, long*, double*, double*, double*,
		double*);
void	__stdcall DU4INF(long*, double*);
void	__stdcall DMXTXF(long*, long*, double*, long*, long*, double*, long*);
void	__stdcall DMXTYF(long*, long*, double*, long*, long*, long*, double*,
		long*, long*, long*, double*, long*);
void	__stdcall DTRNRR(long*, long*, double*, long*, long*, long*, double*,
		long*);
void	__stdcall DMRRRR(long*, long*, double*, long*, long*, long*, double*,
		long*, long*, long*, double*, long*);
double	__stdcall DBLINF(long*, long*, double*, long*, double*, double*);
double	__stdcall DBETA(double*, double*);
double	__stdcall DBINOM(long*, long*);
double	__stdcall DGAMMA(double*);
void	__stdcall D9GAML(double*, double*);

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

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DSET(long*, double*, double*, long*);
void	__stdcall ZSET(long*, d_complex*, d_complex*, long*);
void	__stdcall DCOPY(long*, double*, long*, double*, long*);
void	__stdcall ZCOPY(long*, d_complex*, long*, d_complex*, long*);
void	__stdcall DSCAL(long*, double*, double*, long*);
void	__stdcall ZSCAL(long*, d_complex*, d_complex*, long*);
void	__stdcall ZDSCAL(long*, double*, d_complex*, long*);
void	__stdcall DVCAL(long*, double*, double*, long*, double*, long*);
void	__stdcall ZVCAL(long*, d_complex*, d_complex*, long*, d_complex*,
		long*);
void	__stdcall ZDVCAL(long*, double*, d_complex*, long*, d_complex*, long*);
void	__stdcall DADD(long*, double*, double*, long*);
void	__stdcall ZADD(long*, d_complex*, d_complex*, long*);
void	__stdcall DSUB(long*, double*, double*, long*);
void	__stdcall ZSUB(long*, d_complex*, d_complex*, long*);
void	__stdcall DAXPY(long*, double*, double*, long*, double*, long*);
void	__stdcall ZAXPY(long*, d_complex*, d_complex*, long*, d_complex*,
		long*);
void	__stdcall DSWAP(long*, double*, long*, double*, long*);
void	__stdcall ZSWAP(long*, d_complex*, long*, d_complex*, long*);
double	__stdcall DDOT(long*, double*, long*, double*, long*);
void	__stdcall ZDOTU(d_complex*, long*, d_complex*, long*, d_complex*,
		long*);
void	__stdcall ZDOTC(d_complex*, long*, d_complex*, long*, d_complex*,
		long*);
void	__stdcall ZQDOTC(d_complex*, long*, d_complex*, long*, d_complex*,
		long*);
void	__stdcall ZQDOTU(d_complex*, long*, d_complex*, long*, d_complex*,
		long*);
double	__stdcall DQDDOT(long*, double*, double*, long*, double*, long*);
void	__stdcall ZQCDOT(d_complex*, long*, d_complex*, d_complex*, long*,
		d_complex*, long*);
void	__stdcall ZQUDOT(f_complex*, long*, d_complex*, d_complex*, long*,
		d_complex*, long*);
double	__stdcall DQDOTI(long*, double*, double*, double*, long*, double*,
		long*);
double	__stdcall DQDOTA(long*, double*, double*, double*, long*, double*,
		long*);
void	__stdcall ZQDOTI(d_complex*, long*, d_complex*, double*, d_complex*,
		long*, d_complex*, long*);
void	__stdcall ZQDOTA(d_complex*, long*, d_complex*, double*, d_complex*,
		long*, d_complex*, long*);
void	__stdcall DHPROD(long*, double*, long*, double*, long*, double*, long*);
double	__stdcall DXYZ(long*, double*, long*, double*, long*, double*, long*);
double	__stdcall DSUM(long*, double*, long*);
double	__stdcall DASUM(long*, double*, long*);
double	__stdcall DZASUM(long*, d_complex*, long*);
double	__stdcall DNRM2(long*, double*, long*);
double	__stdcall DZNRM2(long*, d_complex*, long*);
double	__stdcall DPRDCT(long*, double*, long*);
long	__stdcall IDMIN(long*, double*, long*);
long	__stdcall IDMAX(long*, double*, long*);
long	__stdcall IDAMIN(long*, double*, long*);
long	__stdcall IZAMIN(long*, d_complex*, long*);
long	__stdcall IDAMAX(long*, double*, long*);
long	__stdcall IZAMAX(long*, d_complex*, long*);
void	__stdcall DROTG(double*, double*, double*, double*);
void	__stdcall DROT(long*, double*, long*, double*, long*, double*, double*);
void	__stdcall ZDROT(long*, d_complex*, long*, d_complex*, long*, double*,
		double*);
void	__stdcall DROTMG(double*, double*, double*, double*, double*);
void	__stdcall DROTM(long*, double*, long*, double*, long*, double*);
void	__stdcall ZDROTM(long*, d_complex*, long*, d_complex*, long*, double*);

#endif

/*
 *    Level 2 BLAS
 */

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DGEMV(char*, unsigned int, long*, long*, double*, double*,
		long*, double*, long*, double*, double*, long*);
void	__stdcall ZGEMV(char*, unsigned int, long*, long*, d_complex*,
		d_complex*, long*, d_complex*, long*, d_complex*, d_complex*,
		long*);
void	__stdcall DGBMV(char*, unsigned int, long*, long*, long*, long*,
		double*, double*, long*, double*, long*, double*, double*,
		long*);
void	__stdcall ZGBMV(char*, unsigned int, long*, long*, long*, long*,
		d_complex*, d_complex*, long*, d_complex*, long*, d_complex*,
		d_complex*, long*);
void	__stdcall ZHEMV(char*, unsigned int, long*, d_complex*, d_complex*,
		long*, d_complex*, long*, d_complex*, d_complex*, long*);
void	__stdcall ZHBMV(char*, unsigned int, long*, long*, d_complex*,
		d_complex*, long*, d_complex*, long*, d_complex*, d_complex*,
		long*);
void	__stdcall DSYMV(char*, unsigned int, long*, double*, double*, long*,
		double*, long*, double*, double*, long*);
void	__stdcall DSBMV(char*, unsigned int, long*, long*, double*, double*,
		long*, double*, long*, double*, double*, long*);
void	__stdcall DTRMV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, double*, long*, double*, long*);
void	__stdcall ZTRMV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, d_complex*, long*, d_complex*, long*);
void	__stdcall DTBMV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, long*, double*, long*, double*, long*);
void	__stdcall ZTBMV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, long*, d_complex*, long*, d_complex*,
		long*);
void	__stdcall DTRSV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, double*, long*, double*, long*);
void	__stdcall ZTRSV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, d_complex*, long*, d_complex*, long*);
void	__stdcall DTBSV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, long*, double*, long*, double*, long*);
void	__stdcall ZTBSV(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, long*, long*, d_complex*, long*, d_complex*,
		long*);
void	__stdcall DGER(long*, long*, double*, double*, long*, double*, long*,
		double*, long*);
void	__stdcall ZGERU(long*, long*, d_complex*, d_complex*, long*, d_complex*,
		long*, d_complex*, long*);
void	__stdcall ZGERC(long*, long*, d_complex*, d_complex*, long*, d_complex*,
		long*, d_complex*, long*);
void	__stdcall ZHER(char*, unsigned int, long*, double*, d_complex*, long*,
		d_complex*, long*);
void	__stdcall ZHER2(char*, unsigned int, long*, d_complex*, d_complex*,
		long*, d_complex*, long*, d_complex*, long*);
void	__stdcall DSYR(char*, unsigned int, long*, double*, double*, long*,
		double*, long*);
void	__stdcall DSYR2(char*, unsigned int, long*, double*, double*, long*,
		double*, long*, double*, long*);

#endif

/*
 *    Level 3 BLAS
 */

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DGEMM(char*, unsigned int, char*, unsigned int, long*, long*,
		long*, double*, double*, long*, double*, long*, double*,
		double*, long*);
void	__stdcall ZGEMM(char*, unsigned int, char*, unsigned int, long*, long*,
		long*, d_complex*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*, long*);
void	__stdcall DSYMM(char*, unsigned int, char*, unsigned int, long*, long*,
		double*, double*, long*, double*, long*, double*, double*,
		long*);
void	__stdcall ZSYMM(char*, unsigned int, char*, unsigned int, long*, long*,
		d_complex*, d_complex*, long*, d_complex*, long*, d_complex*,
		d_complex*, long*);
void	__stdcall ZHEMM(char*, unsigned int, char*, unsigned int, long*, long*,
		d_complex*, d_complex*, long*, d_complex*, long*, d_complex*,
		d_complex*, long*);
void	__stdcall DSYRK(char*, unsigned int, char*, unsigned int, long*, long*,
		double*, double*, long*, double*, double*, long*);
void	__stdcall ZSYRK(char*, unsigned int, char*, unsigned int, long*, long*,
		d_complex*, d_complex*, long*, d_complex*, d_complex*, long*);
void	__stdcall ZHERK(char*, unsigned int, char*, unsigned int, long*, long*,
		double*, d_complex*, long*, double*, d_complex*, long*);
void	__stdcall DSYR2K(char*, unsigned int, char*, unsigned int, long*, long*,
		double*, double*, long*, double*, long*, double*, double*,
		long*);
void	__stdcall ZSYR2K(char*, unsigned int, char*, unsigned int, long*, long*,
		d_complex*, d_complex*, long*, d_complex*, long*, d_complex*,
		d_complex*, long*);
void	__stdcall ZHER2K(char*, unsigned int, char*, unsigned int, long*, long*,
		d_complex*, d_complex*, long*, d_complex*, long*, double*,
		d_complex*, long*);
void	__stdcall DTRMM(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, char*, unsigned int, long*, long*, double*,
		double*, long*, double*, long*);
void	__stdcall ZTRMM(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, char*, unsigned int, long*, long*, d_complex*,
		d_complex*, long*, d_complex*, long*);
void	__stdcall DTRSM(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, char*, unsigned int, long*, long*, double*,
		double*, long*, double*, long*);
void	__stdcall ZTRSM(char*, unsigned int, char*, unsigned int, char*,
		unsigned int, char*, unsigned int, long*, long*, d_complex*,
		d_complex*, long*, d_complex*, long*);

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

#ifndef IMSL_COMMON_DOUBLE

double	__stdcall DMACH(long*);
long	__stdcall DIFNAN(double*);

#endif

/*
 *    Deprecated Routines
 */

#ifndef IMSL_COMMON_DOUBLE

double	__stdcall DG2DF(double*, long*, long*, double*, double*, double*);
double	__stdcall DG3DF(double*, long*, long*, double*, double*, double*);
double	__stdcall DG2IN(double*, long*, long*, double*, double*, double*);
void	__stdcall DHOUAP(long*, double*, long*, long*, double*, long*, long*,
		double*, long*);
void	__stdcall DHOUTR(long*, double*, long*, long*, double*, double*);

#endif

#if defined(__cplusplus)
}
#endif

#define IMSL_STAT_DOUBLE	/* Double-precision STAT/LIBRARY routines */

#ifndef IMSL_STAT_COMMON
#define IMSL_STAT_COMMON	/* STAT/LIBRARY routines common to both */
#endif				/* single- and double-precision */

#ifndef IMSL_COMMON_DOUBLE
#define IMSL_COMMON_DOUBLE	/* Double-precision routines common to */
#endif				/* both MATH/LIBRARY and STAT/LIBRARY */

#ifndef IMSL_COMMON
#define IMSL_COMMON		/* Routines common to both MATH/LIBRARY */
#endif				/* and STAT/LIBRARY */

#endif
