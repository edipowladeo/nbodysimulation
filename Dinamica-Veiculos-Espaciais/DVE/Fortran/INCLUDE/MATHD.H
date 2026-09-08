/*
 *    MATHD.H	- Declare double-precision IMSL MATH/LIBRARY routines
 *
 *    Copyright (c) 1994 by Visual Numerics, Inc.  All Rights Reserved.
 */

#ifndef IMSL_MATH_DOUBLE

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
 *    Chapter 1:  Linear Systems
 */

void	__stdcall DLSARG(long*, double*, long*, double*, long*, double*);
void	__stdcall DL2ARG(long*, double*, long*, double*, long*, double*,
		double*, long*, double*);
void	__stdcall DLFCRG(long*, double*, long*, double*, long*, long*, double*);
void	__stdcall DL2CRG(long*, double*, long*, double*, long*, long*, double*,
		double*);
void	__stdcall DLFIRG(long*, double*, long*, double*, long*, long*, double*,
		long*, double*, double*);
void	__stdcall DLSACG(long*, d_complex*, long*, d_complex*, long*,
		d_complex*);
void	__stdcall DL2ACG(long*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*, long*, d_complex*);
void	__stdcall DLSLCG(long*, d_complex*, long*, d_complex*, long*,
		d_complex*);
void	__stdcall DL2LCG(long*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*, long*, d_complex*);
void	__stdcall DLFCCG(long*, d_complex*, long*, d_complex*, long*, long*,
		double*);
void	__stdcall DL2CCG(long*, d_complex*, long*, d_complex*, long*, long*,
		double*, d_complex*);
void	__stdcall DLFTCG(long*, d_complex*, long*, d_complex*, long*, long*);
void	__stdcall DL2TCG(long*, d_complex*, long*, d_complex*, long*, long*,
		d_complex*);
void	__stdcall DLFSCG(long*, d_complex*, long*, long*, d_complex*, long*,
		d_complex*);
void	__stdcall DLFICG(long*, d_complex*, long*, d_complex*, long*, long*,
		d_complex*, long*, d_complex*, d_complex*);
void	__stdcall DLFDCG(long*, d_complex*, long*, long*, d_complex*, double*);
void	__stdcall DLINCG(long*, d_complex*, long*, d_complex*, long*);
void	__stdcall DL2NCG(long*, d_complex*, long*, d_complex*, long*,
		d_complex*, long*);
void	__stdcall DLSLRT(long*, double*, long*, double*, long*, double*);
void	__stdcall DLFCRT(long*, double*, long*, long*, double*);
void	__stdcall DL2CRT(long*, double*, long*, long*, double*, double*);
void	__stdcall DLFDRT(long*, double*, long*, double*, double*);
void	__stdcall DLINRT(long*, double*, long*, long*, double*, long*);
void	__stdcall DLSLCT(long*, d_complex*, long*, d_complex*, long*,
		d_complex*);
void	__stdcall DLFCCT(long*, d_complex*, long*, long*, double*);
void	__stdcall DL2CCT(long*, d_complex*, long*, long*, double*, d_complex*);
void	__stdcall DLFDCT(long*, d_complex*, long*, d_complex*, double*);
void	__stdcall DLINCT(long*, d_complex*, long*, long*, d_complex*, long*);
void	__stdcall DLSADS(long*, double*, long*, double*, double*);
void	__stdcall DL2ADS(long*, double*, long*, double*, double*, double*,
		double*);
void	__stdcall DLSLDS(long*, double*, long*, double*, double*);
void	__stdcall DL2LDS(long*, double*, long*, double*, double*, double*,
		double*);
void	__stdcall DLFCDS(long*, double*, long*, double*, long*, double*);
void	__stdcall DL2CDS(long*, double*, long*, double*, long*, double*,
		double*);
void	__stdcall DLFTDS(long*, double*, long*, double*, long*);
void	__stdcall DLFSDS(long*, double*, long*, double*, double*);
void	__stdcall DLFIDS(long*, double*, long*, double*, long*, double*,
		double*, double*);
void	__stdcall DLFDDS(long*, double*, long*, double*, double*);
void	__stdcall DLINDS(long*, double*, long*, double*, long*);
void	__stdcall DL2NDS(long*, double*, long*, double*, long*, double*);
void	__stdcall DLSASF(long*, double*, long*, double*, double*);
void	__stdcall DL2ASF(long*, double*, long*, double*, double*, double*,
		long*, double*);
void	__stdcall DLSLSF(long*, double*, long*, double*, double*);
void	__stdcall DL2LSF(long*, double*, long*, double*, double*, double*,
		long*, double*);
void	__stdcall DLFCSF(long*, double*, long*, double*, long*, long*, double*);
void	__stdcall DL2CSF(long*, double*, long*, double*, long*, long*, double*,
		double*);
void	__stdcall DLFTSF(long*, double*, long*, double*, long*, long*);
void	__stdcall DLFSSF(long*, double*, long*, long*, double*, double*);
void	__stdcall DLFISF(long*, double*, long*, double*, long*, long*, double*,
		double*, double*);
void	__stdcall DLFDSF(long*, double*, long*, long*, double*, double*);
void	__stdcall DLSADH(long*, d_complex*, long*, d_complex*, d_complex*);
void	__stdcall DL2ADH(long*, d_complex*, long*, d_complex*, d_complex*,
		d_complex*, d_complex*);
void	__stdcall DLSLDH(long*, d_complex*, long*, d_complex*, d_complex*);
void	__stdcall DL2LDH(long*, d_complex*, long*, d_complex*, d_complex*,
		d_complex*, d_complex*);
void	__stdcall DLFCDH(long*, d_complex*, long*, d_complex*, long*, double*);
void	__stdcall DL2CDH(long*, d_complex*, long*, d_complex*, long*, double*,
		d_complex*);
void	__stdcall DLFTDH(long*, d_complex*, long*, d_complex*, long*);
void	__stdcall DLFSDH(long*, d_complex*, long*, d_complex*, d_complex*);
void	__stdcall DLFIDH(long*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*, d_complex*);
void	__stdcall DLFDDH(long*, d_complex*, long*, double*, double*);
void	__stdcall DLSAHF(long*, d_complex*, long*, d_complex*, d_complex*);
void	__stdcall DL2AHF(long*, d_complex*, long*, d_complex*, d_complex*,
		d_complex*, long*, d_complex*);
void	__stdcall DLSLHF(long*, d_complex*, long*, d_complex*, d_complex*);
void	__stdcall DL2LHF(long*, d_complex*, long*, d_complex*, d_complex*,
		d_complex*, long*, d_complex*);
void	__stdcall DLFCHF(long*, d_complex*, long*, d_complex*, long*, long*,
		double*);
void	__stdcall DL2CHF(long*, d_complex*, long*, d_complex*, long*, long*,
		double*, d_complex*);
void	__stdcall DLFTHF(long*, d_complex*, long*, d_complex*, long*, long*);
void	__stdcall DLFSHF(long*, d_complex*, long*, long*, d_complex*,
		d_complex*);
void	__stdcall DLFIHF(long*, d_complex*, long*, d_complex*, long*, long*,
		d_complex*, d_complex*, d_complex*);
void	__stdcall DLFDHF(long*, d_complex*, long*, long*, double*, double*);
void	__stdcall DLSLTR(long*, double*, double*, double*, double*);
void	__stdcall DLSLCR(long*, double*, double*, double*, long*, double*,
		double*, long*, long*);
void	__stdcall DLSARB(long*, double*, long*, long*, long*, double*, long*,
		double*);
void	__stdcall DL2ARB(long*, double*, long*, long*, long*, double*, long*,
		double*, double*, long*, double*);
void	__stdcall DLSLRB(long*, double*, long*, long*, long*, double*, long*,
		double*);
void	__stdcall DL2LRB(long*, double*, long*, long*, long*, double*, long*,
		double*, double*, long*, double*);
void	__stdcall DLFCRB(long*, double*, long*, long*, long*, double*, long*,
		long*, double*);
void	__stdcall DL2CRB(long*, double*, long*, long*, long*, double*, long*,
		long*, double*, double*);
void	__stdcall DLFTRB(long*, double*, long*, long*, long*, double*, long*,
		long*);
void	__stdcall DL2TRB(long*, double*, long*, long*, long*, double*, long*,
		long*, double*);
void	__stdcall DLFSRB(long*, double*, long*, long*, long*, long*, double*,
		long*, double*);
void	__stdcall DLFIRB(long*, double*, long*, long*, long*, double*, long*,
		long*, double*, long*, double*, double*);
void	__stdcall DLFDRB(long*, double*, long*, long*, long*, long*, double*,
		double*);
void	__stdcall DLSAQS(long*, double*, long*, long*, double*, double*);
void	__stdcall DL2AQS(long*, double*, long*, long*, double*, double*,
		double*, double*);
void	__stdcall DLSLQS(long*, double*, long*, long*, double*, double*);
void	__stdcall DL2LQS(long*, double*, long*, long*, double*, double*,
		double*, double*);
void	__stdcall DLSLPB(long*, double*, long*, long*, long*, double*);
void	__stdcall DL2LPB(long*, double*, long*, long*, long*, double*, double*);
void	__stdcall DLFCQS(long*, double*, long*, long*, double*, long*, double*);
void	__stdcall DL2CQS(long*, double*, long*, long*, double*, long*, double*,
		double*);
void	__stdcall DLFTQS(long*, double*, long*, long*, double*, long*);
void	__stdcall DLFSQS(long*, double*, long*, long*, double*, double*);
void	__stdcall DLFIQS(long*, double*, long*, long*, double*, long*, double*,
		double*, double*);
void	__stdcall DLFDQS(long*, double*, long*, long*, double*, double*);
void	__stdcall DLSLTQ(long*, d_complex*, d_complex*, d_complex*, d_complex*);
void	__stdcall DLSLCQ(long*, d_complex*, d_complex*, d_complex*, long*,
		d_complex*, double*, long*, long*);
void	__stdcall DLSACB(long*, d_complex*, long*, long*, long*, d_complex*,
		long*, d_complex*);
void	__stdcall DL2ACB(long*, d_complex*, long*, long*, long*, d_complex*,
		long*, d_complex*, d_complex*, long*, d_complex*);
void	__stdcall DLSLCB(long*, d_complex*, long*, long*, long*, d_complex*,
		long*, d_complex*);
void	__stdcall DL2LCB(long*, d_complex*, long*, long*, long*, d_complex*,
		long*, d_complex*, d_complex*, long*, d_complex*);
void	__stdcall DLFCCB(long*, d_complex*, long*, long*, long*, d_complex*,
		long*, long*, double*);
void	__stdcall DL2CCB(long*, d_complex*, long*, long*, long*, d_complex*,
		long*, long*, double*, d_complex*);
void	__stdcall DLFTCB(long*, d_complex*, long*, long*, long*, d_complex*,
		long*, long*);
void	__stdcall DL2TCB(long*, d_complex*, long*, long*, long*, d_complex*,
		long*, long*, d_complex*);
void	__stdcall DLFSCB(long*, d_complex*, long*, long*, long*, long*,
		d_complex*, long*, d_complex*);
void	__stdcall DLFICB(long*, d_complex*, long*, long*, long*, d_complex*,
		long*, long*, d_complex*, long*, d_complex*, d_complex*);
void	__stdcall DLFDCB(long*, d_complex*, long*, long*, long*, long*,
		d_complex*, double*);
void	__stdcall DLSAQH(long*, d_complex*, long*, long*, d_complex*,
		d_complex*);
void	__stdcall DL2AQH(long*, d_complex*, long*, long*, d_complex*,
		d_complex*, d_complex*, d_complex*);
void	__stdcall DLSLQH(long*, d_complex*, long*, long*, d_complex*,
		d_complex*);
void	__stdcall DL2LQH(long*, d_complex*, long*, long*, d_complex*,
		d_complex*, d_complex*, d_complex*);
void	__stdcall DLSLQB(long*, double*, long*, long*, long*, double*);
void	__stdcall DL2LQB(long*, double*, long*, long*, long*, double*, double*,
		double*);
void	__stdcall DLFCQH(long*, d_complex*, long*, long*, d_complex*, long*,
		double*);
void	__stdcall DL2CQH(long*, d_complex*, long*, long*, d_complex*, long*,
		double*, d_complex*);
void	__stdcall DLFTQH(long*, d_complex*, long*, long*, d_complex*, long*);
void	__stdcall DLFSQH(long*, d_complex*, long*, long*, d_complex*,
		d_complex*);
void	__stdcall DLFIQH(long*, d_complex*, long*, long*, d_complex*, long*,
		d_complex*, d_complex*, d_complex*);
void	__stdcall DLFDQH(long*, d_complex*, long*, long*, double*, double*);
void	__stdcall DLSLXG(long*, long*, double*, long*, long*, double*, long*,
		long*, double*, double*);
void	__stdcall DL2LXG(long*, long*, double*, long*, long*, double*, long*,
		long*, double*, double*, double*, long*, long*, long*);
void	__stdcall DL4LXG(long*, double*);
void	__stdcall DLFTXG(long*, long*, double*, long*, long*, long*, double*,
		long*, long*, double*, long*, long*, long*, long*);
void	__stdcall DL2TXG(long*, long*, double*, long*, long*, long*, double*,
		long*, long*, double*, long*, long*, long*, long*, double*,
		long*, long*, long*);
void	__stdcall DLFSXG(long*, long*, long*, double*, long*, long*, long*,
		long*, double*, long*, double*);
void	__stdcall DLSLZG(long*, long*, d_complex*, long*, long*, d_complex*,
		long*, long*, double*, d_complex*);
void	__stdcall DL2LZG(long*, long*, d_complex*, long*, long*, d_complex*,
		long*, long*, double*, d_complex*, d_complex*, long*, long*,
		long*);
void	__stdcall DL4LZG(long*, double*);
void	__stdcall DLFTZG(long*, long*, d_complex*, long*, long*, long*, double*,
		long*, long*, d_complex*, long*, long*, long*, long*);
void	__stdcall DL2TZG(long*, long*, d_complex*, long*, long*, long*, double*,
		long*, long*, d_complex*, long*, long*, long*, long*,
		d_complex*, long*, long*, long*);
void	__stdcall DLFSZG(long*, long*, long*, d_complex*, long*, long*, long*,
		long*, d_complex*, long*, d_complex*);
void	__stdcall DLSLXD(long*, long*, double*, long*, long*, double*, long*,
		double*);
void	__stdcall DL2LXD(long*, long*, double*, long*, long*, double*, double*,
		long*, long*, double*, double*, long*, long*, long*);
void	__stdcall DL4LXD(long*, double*);
void	__stdcall DLSCXD(long*, long*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*);
void	__stdcall DL2CXD(long*, long*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*);
void	__stdcall DLNFXD(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*, double*,
		double*, double*);
void	__stdcall DL2FXD(long*, long*, double*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, double*,
		double*, double*, double*, long*, long*, long*);
void	__stdcall DLFSXD(long*, long*, long*, long*, long*, double*, long*,
		double*, long*, double*, double*);
void	__stdcall DLSLZD(long*, long*, d_complex*, long*, long*, d_complex*,
		long*, d_complex*);
void	__stdcall DL2LZD(long*, long*, d_complex*, long*, long*, d_complex*,
		d_complex*, long*, long*, double*, d_complex*, long*, long*,
		long*);
void	__stdcall DL4LZD(long*, double*);
void	__stdcall DLNFZD(long*, long*, d_complex*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*,
		d_complex*, d_complex*, double*);
void	__stdcall DL2FZD(long*, long*, d_complex*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, d_complex*,
		d_complex*, double*, d_complex*, long*, long*, long*);
void	__stdcall DLFSZD(long*, long*, long*, long*, long*, d_complex*, long*,
		d_complex*, long*, d_complex*, d_complex*);
void	__stdcall DLSLTO(long*, double*, double*, long*, double*);
void	__stdcall DL2LTO(long*, double*, double*, long*, double*, double*);
void	__stdcall DLSLTC(long*, d_complex*, d_complex*, long*, d_complex*);
void	__stdcall DL2LTC(long*, d_complex*, d_complex*, long*, d_complex*,
		d_complex*);
void	__stdcall DLSLCC(long*, d_complex*, d_complex*, long*, d_complex*);
void	__stdcall DL2LCC(long*, d_complex*, d_complex*, long*, d_complex*,
		d_complex*, double*);
void	__stdcall DPCGRC(long*, long*, double*, double*, double*, double*,
		double*, long*);
void	__stdcall DP2GRC(long*, long*, double*, double*, double*, double*,
		double*, long*, double*, double*, long*);
void	__stdcall DJCGRC(long*, long*, double*, double*, double*, double*,
		double*, double*, long*);
void	__stdcall DJ2GRC(long*, long*, double*, double*, double*, double*,
		double*, double*, long*, double*, double*, long*);
void	__stdcall DLQRRV(long*, long*, long*, double*, long*, double*, long*);
void	__stdcall DL2RRV(long*, long*, long*, double*, long*, double*, long*,
		double*, long*, double*);
void	__stdcall DLCLSQ(long*, long*, long*, double*, long*, double*, double*,
		long*, double*, double*, long*, double*, double*, double*,
		double*);
void	__stdcall DL2LSQ(long*, long*, long*, double*, long*, double*, double*,
		long*, double*, double*, long*, double*, double*, double*,
		double*, double*, long*);
void	__stdcall DLQRRR(long*, long*, double*, long*, long*, long*, double*,
		long*, double*, double*);
void	__stdcall DL2RRR(long*, long*, double*, long*, long*, long*, double*,
		long*, double*, double*, double*);
void	__stdcall DLQERR(long*, long*, double*, long*, double*, double*, long*);
void	__stdcall DL2ERR(long*, long*, double*, long*, double*, double*, long*,
		double*);
void	__stdcall DLQRSL(long*, long*, double*, long*, double*, double*, long*,
		double*, double*, double*, double*, double*);
void	__stdcall DLUPQR(long*, long*, double*, double*, double*, double*,
		long*, double*, long*, long*, double*, long*, double*, long*);
void	__stdcall DL2PQR(long*, long*, double*, double*, double*, double*,
		long*, double*, long*, long*, double*, long*, double*, long*,
		double*, double*);
void	__stdcall DLCHRG(long*, double*, long*, long*, long*, double*, long*);
void	__stdcall DLUPCH(long*, double*, long*, double*, double*, long*,
		double*, double*);
void	__stdcall DLDNCH(long*, double*, long*, double*, double*, long*,
		double*, double*);
void	__stdcall DLSVCR(long*, long*, d_complex*, long*, long*, double*, long*,
		d_complex*, d_complex*, long*, d_complex*, long*);
void	__stdcall DL2VCR(long*, long*, d_complex*, long*, long*, double*, long*,
		d_complex*, d_complex*, long*, d_complex*, long*, d_complex*,
		d_complex*);

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DLSLRG(long*, double*, long*, double*, long*, double*);
void	__stdcall DL2LRG(long*, double*, long*, double*, long*, double*,
		double*, long*, double*);
void	__stdcall DLFTRG(long*, double*, long*, double*, long*, long*);
void	__stdcall DL2TRG(long*, double*, long*, double*, long*, long*, double*);
void	__stdcall DLFSRG(long*, double*, long*, long*, double*, long*, double*);
void	__stdcall DLFDRG(long*, double*, long*, long*, double*, double*);
void	__stdcall DLINRG(long*, double*, long*, double*, long*);
void	__stdcall DL2NRG(long*, double*, long*, double*, long*, double*, long*);
void	__stdcall DLSQRR(long*, long*, double*, long*, double*, double*,
		double*, double*, long*);
void	__stdcall DL2QRR(long*, long*, double*, long*, double*, double*,
		double*, double*, long*, double*, double*, long*, double*);
void	__stdcall DLSBRR(long*, long*, double*, long*, double*, double*,
		double*, double*, long*);
void	__stdcall DL2BRR(long*, long*, double*, long*, double*, double*,
		double*, double*, long*, double*, double*, long*, double*);
void	__stdcall DLSVRR(long*, long*, double*, long*, long*, double*, long*,
		double*, double*, long*, double*, long*);
void	__stdcall DL2VRR(long*, long*, double*, long*, long*, double*, long*,
		double*, double*, long*, double*, long*, double*, double*);
void	__stdcall DLSGRR(long*, long*, double*, long*, double*, long*, double*,
		long*);
void	__stdcall DL2GRR(long*, long*, double*, long*, double*, long*, double*,
		long*, double*, double*);

#endif

/*
 *    Chapter 2:  Eigensystem Analysis
 */

void	__stdcall DEVLRG(long*, double*, long*, d_complex*);
void	__stdcall DE3LRG(long*, double*, long*, d_complex*, double*, double*,
		long*);
void	__stdcall DEVCRG(long*, double*, long*, d_complex*, d_complex*, long*);
void	__stdcall DE8CRG(long*, double*, long*, d_complex*, d_complex*, long*,
		double*, double*, double*, long*);
double	__stdcall DEPIRG(long*, long*, double*, long*, d_complex*, d_complex*,
		long*);
double	__stdcall DE2IRG(long*, long*, double*, long*, d_complex*, d_complex*,
		long*, d_complex*);
void	__stdcall DEVLCG(long*, d_complex*, long*, d_complex*);
void	__stdcall DE3LCG(long*, d_complex*, long*, d_complex*, d_complex*,
		double*, d_complex*, long*);
void	__stdcall DEVCCG(long*, d_complex*, long*, d_complex*, d_complex*,
		long*);
void	__stdcall DE6CCG(long*, d_complex*, long*, d_complex*, d_complex*,
		long*, d_complex*, double*, d_complex*, long*);
double	__stdcall DEPICG(long*, long*, d_complex*, long*, d_complex*,
		d_complex*, long*);
double	__stdcall DE2ICG(long*, long*, d_complex*, long*, d_complex*,
		d_complex*, long*, d_complex*);
void	__stdcall DEVLSF(long*, double*, long*, double*);
void	__stdcall DE4LSF(long*, double*, long*, double*, double*, long*);
void	__stdcall DEVASF(long*, long*, double*, long*, long*, double*);
void	__stdcall DE4ASF(long*, long*, double*, long*, long*, double*, double*,
		long*);
void	__stdcall DEVESF(long*, long*, double*, long*, long*, double*, double*,
		long*);
void	__stdcall DE5ESF(long*, long*, double*, long*, long*, double*, double*,
		long*, double*, long*);
void	__stdcall DEVBSF(long*, long*, double*, long*, double*, double*, long*,
		double*);
void	__stdcall DE5BSF(long*, long*, double*, long*, double*, double*, long*,
		double*, double*, long*);
void	__stdcall DEVFSF(long*, long*, double*, long*, double*, double*, long*,
		double*, double*, long*);
void	__stdcall DE3FSF(long*, long*, double*, long*, double*, double*, long*,
		double*, double*, long*, double*, long*);
void	__stdcall DEVLSB(long*, double*, long*, long*, double*);
void	__stdcall DE3LSB(long*, double*, long*, long*, double*, double*,
		double*);
void	__stdcall DEVCSB(long*, double*, long*, long*, double*, double*, long*);
void	__stdcall DE4CSB(long*, double*, long*, long*, double*, double*, long*,
		double*, double*, long*);
void	__stdcall DEVASB(long*, long*, double*, long*, long*, long*, double*);
void	__stdcall DE3ASB(long*, long*, double*, long*, long*, long*, double*,
		double*, double*);
void	__stdcall DEVESB(long*, long*, double*, long*, long*, long*, double*,
		double*, long*);
void	__stdcall DE4ESB(long*, long*, double*, long*, long*, long*, double*,
		double*, long*, double*, double*, long*);
void	__stdcall DEVBSB(long*, long*, double*, long*, long*, double*, double*,
		long*, double*);
void	__stdcall DE3BSB(long*, long*, double*, long*, long*, double*, double*,
		long*, double*, double*, double*);
void	__stdcall DEVFSB(long*, long*, double*, long*, long*, double*, double*,
		long*, double*, double*, long*);
void	__stdcall DE3FSB(long*, long*, double*, long*, long*, double*, double*,
		long*, double*, double*, long*, double*, double*, double*,
		long*);
double	__stdcall DEPISB(long*, long*, double*, long*, long*, double*, double*,
		long*);
double	__stdcall DE2ISB(long*, long*, double*, long*, long*, double*, double*,
		long*, double*);
void	__stdcall DEVLHF(long*, d_complex*, long*, double*);
void	__stdcall DE3LHF(long*, d_complex*, long*, double*, d_complex*, double*,
		d_complex*, long*);
void	__stdcall DEVCHF(long*, d_complex*, long*, double*, d_complex*, long*);
void	__stdcall DE5CHF(long*, d_complex*, long*, double*, d_complex*, long*,
		d_complex*, double*, d_complex*, long*);
void	__stdcall DEVAHF(long*, long*, d_complex*, long*, long*, double*);
void	__stdcall DE3AHF(long*, long*, d_complex*, long*, long*, double*,
		d_complex*, double*, d_complex*, long*);
void	__stdcall DEVEHF(long*, long*, d_complex*, long*, long*, double*,
		d_complex*, long*);
void	__stdcall DE3EHF(long*, long*, d_complex*, long*, long*, double*,
		d_complex*, long*, d_complex*, double*, double*, d_complex*,
		long*);
void	__stdcall DEVBHF(long*, long*, d_complex*, long*, double*, double*,
		long*, double*);
void	__stdcall DE3BHF(long*, long*, d_complex*, long*, double*, double*,
		long*, double*, d_complex*, double*, d_complex*, long*);
void	__stdcall DEVFHF(long*, long*, d_complex*, long*, double*, double*,
		long*, double*, d_complex*, long*);
void	__stdcall DE3FHF(long*, long*, d_complex*, long*, double*, double*,
		long*, double*, d_complex*, long*, d_complex*, double*, double*,
		d_complex*, long*);
double	__stdcall DEPIHF(long*, long*, d_complex*, long*, double*, d_complex*,
		long*);
double	__stdcall DE2IHF(long*, long*, d_complex*, long*, double*, d_complex*,
		long*, d_complex*);
void	__stdcall DEVLRH(long*, double*, long*, d_complex*);
void	__stdcall DE3LRH(long*, double*, long*, d_complex*, double*, double*,
		long*);
void	__stdcall DEVCRH(long*, double*, long*, d_complex*, d_complex*, long*);
void	__stdcall DE6CRH(long*, double*, long*, d_complex*, d_complex*, long*,
		double*, double*, double*, long*);
void	__stdcall DEVLCH(long*, d_complex*, long*, d_complex*);
void	__stdcall DE3LCH(long*, d_complex*, long*, d_complex*, d_complex*,
		double*, long*);
void	__stdcall DEVCCH(long*, d_complex*, long*, d_complex*, d_complex*,
		long*);
void	__stdcall DE4CCH(long*, d_complex*, long*, d_complex*, d_complex*,
		long*, d_complex*, d_complex*, double*, long*);
void	__stdcall DGVLRG(long*, double*, long*, double*, long*, d_complex*,
		double*);
void	__stdcall DG3LRG(long*, double*, long*, double*, long*, d_complex*,
		double*, double*, double*, double*, d_complex*, long*);
void	__stdcall DGVCRG(long*, double*, long*, double*, long*, d_complex*,
		double*, d_complex*, long*);
void	__stdcall DG8CRG(long*, double*, long*, double*, long*, d_complex*,
		double*, d_complex*, long*, double*, double*, double*, double*,
		d_complex*, long*);
double	__stdcall DGPIRG(long*, long*, double*, long*, double*, long*,
		d_complex*, double*, d_complex*, long*);
double	__stdcall DG2IRG(long*, long*, double*, long*, double*, long*,
		d_complex*, double*, d_complex*, long*, d_complex*);
void	__stdcall DGVLCG(long*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*);
void	__stdcall DG3LCG(long*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*, d_complex*, d_complex*, d_complex*,
		double*, long*);
void	__stdcall DGVCCG(long*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*, d_complex*, long*);
void	__stdcall DG6CCG(long*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*, d_complex*, long*, d_complex*,
		d_complex*, d_complex*, double*, long*);
double	__stdcall DGPICG(long*, long*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*, d_complex*, long*);
double	__stdcall DG2ICG(long*, long*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*, d_complex*, long*, d_complex*);
void	__stdcall DGVCSP(long*, double*, long*, double*, long*, double*,
		double*, long*);
void	__stdcall DG3CSP(long*, double*, long*, double*, long*, double*,
		double*, long*, long*, double*, double*);
double	__stdcall DGPISP(long*, long*, double*, long*, double*, long*, double*,
		double*, long*);
double	__stdcall DG2ISP(long*, long*, double*, long*, double*, long*, double*,
		double*, long*, double*);

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DEVCSF(long*, double*, long*, double*, double*, long*);
void	__stdcall DE5CSF(long*, double*, long*, double*, double*, long*,
		double*, long*);
double	__stdcall DEPISF(long*, long*, double*, long*, double*, double*, long*);
double	__stdcall DE2ISF(long*, long*, double*, long*, double*, double*, long*,
		double*);
void	__stdcall DGVLSP(long*, double*, long*, double*, long*, double*);
void	__stdcall DG3LSP(long*, double*, long*, double*, long*, double*, long*,
		double*, double*);

#endif

/*
 *    Chapter 3:  Interpolation and Approximation
 */

void	__stdcall DCSIEZ(long*, double*, double*, long*, double*, double*);
void	__stdcall DC2IEZ(long*, double*, double*, long*, double*, double*,
		long*, double*, double*);
void	__stdcall DCSINT(long*, double*, double*, double*, double*);
void	__stdcall DC2INT(long*, double*, double*, double*, double*, long*);
void	__stdcall DCSDEC(long*, double*, double*, long*, double*, long*,
		double*, double*, double*);
void	__stdcall DC2DEC(long*, double*, double*, long*, double*, long*,
		double*, double*, double*, long*);
void	__stdcall DCSHER(long*, double*, double*, double*, double*, double*);
void	__stdcall DC2HER(long*, double*, double*, double*, double*, double*,
		long*);
void	__stdcall DCSAKM(long*, double*, double*, double*, double*);
void	__stdcall DC2AKM(long*, double*, double*, double*, double*, long*);
void	__stdcall DCSCON(long*, double*, double*, long*, double*, double*);
void	__stdcall DC2CON(long*, double*, double*, long*, double*, double*,
		long*, double*, double*, double*, double*, double*, long*,
		double*);
void	__stdcall DCSPER(long*, double*, double*, double*, double*);
void	__stdcall DC2PER(long*, double*, double*, double*, double*, double*,
		long*);
double	__stdcall DCSVAL(double*, long*, double*, double*);
double	__stdcall DCSDER(long*, double*, long*, double*, double*);
void	__stdcall DCS1GD(long*, long*, double*, long*, double*, double*,
		double*);
void	__stdcall DC21GD(long*, long*, double*, long*, double*, double*,
		double*, long*, double*, double*);
double	__stdcall DCSITG(double*, double*, long*, double*, double*);
void	__stdcall DSPLEZ(long*, double*, double*, long*, long*, long*, double*,
		double*);
void	__stdcall DS2LEZ(long*, double*, double*, long*, long*, long*, double*,
		double*, double*, long*);
void	__stdcall DBSINT(long*, double*, double*, long*, double*, double*);
void	__stdcall DB2INT(long*, double*, double*, long*, double*, double*,
		double*, double*, double*, long*);
void	__stdcall DBSNAK(long*, double*, long*, double*);
void	__stdcall DB2NAK(long*, double*, long*, double*, double*, long*);
void	__stdcall DBSOPK(long*, double*, long*, double*);
void	__stdcall DB2OPK(long*, double*, long*, double*, long*, double*, long*);
void	__stdcall DBS2IN(long*, double*, long*, double*, double*, long*, long*,
		long*, double*, double*, double*);
void	__stdcall DB22IN(long*, double*, long*, double*, double*, long*, long*,
		long*, double*, double*, double*, double*, long*);
void	__stdcall DBS3IN(long*, double*, long*, double*, long*, double*,
		double*, long*, long*, long*, long*, long*, double*, double*,
		double*, double*);
void	__stdcall DB23IN(long*, double*, long*, double*, long*, double*,
		double*, long*, long*, long*, long*, long*, double*, double*,
		double*, double*, double*, long*);
double	__stdcall DBSVAL(double*, long*, double*, long*, double*);
double	__stdcall DB2VAL(double*, long*, double*, long*, double*, double*,
		double*, double*);
double	__stdcall DBSDER(long*, double*, long*, double*, long*, double*);
double	__stdcall DB2DER(long*, double*, long*, double*, long*, double*,
		double*, double*, double*);
void	__stdcall DBS1GD(long*, long*, double*, long*, double*, long*, double*,
		double*);
void	__stdcall DB21GD(long*, long*, double*, long*, double*, long*, double*,
		double*, double*, double*, long*, double*, double*, double*);
double	__stdcall DBSITG(double*, double*, long*, double*, long*, double*);
double	__stdcall DB2ITG(double*, double*, long*, double*, long*, double*,
		double*, double*, double*, double*);
double	__stdcall DBS2VL(double*, double*, long*, long*, double*, double*,
		long*, long*, double*);
double	__stdcall DB22VL(double*, double*, long*, long*, double*, double*,
		long*, long*, double*, double*);
double	__stdcall DBS2DR(long*, long*, double*, double*, long*, long*, double*,
		double*, long*, long*, double*);
double	__stdcall DB22DR(long*, long*, double*, double*, long*, long*, double*,
		double*, long*, long*, double*, double*);
void	__stdcall DBS2GD(long*, long*, long*, double*, long*, double*, long*,
		long*, double*, double*, long*, long*, double*, double*, long*);
void	__stdcall DB22GD(long*, long*, long*, double*, long*, double*, long*,
		long*, double*, double*, long*, long*, double*, double*, long*,
		long*, long*, double*, double*, double*, double*, double*,
		double*);
double	__stdcall DBS2IG(double*, double*, double*, double*, long*, long*,
		double*, double*, long*, long*, double*);
double	__stdcall DB22IG(double*, double*, double*, double*, long*, long*,
		double*, double*, long*, long*, double*, double*);
double	__stdcall DBS3VL(double*, double*, double*, long*, long*, long*,
		double*, double*, double*, long*, long*, long*, double*);
double	__stdcall DB23VL(double*, double*, double*, long*, long*, long*,
		double*, double*, double*, long*, long*, long*, double*,
		double*);
double	__stdcall DBS3DR(long*, long*, long*, double*, double*, double*, long*,
		long*, long*, double*, double*, double*, long*, long*, long*,
		double*);
double	__stdcall DB23DR(long*, long*, long*, double*, double*, double*, long*,
		long*, long*, double*, double*, double*, long*, long*, long*,
		double*, double*);
void	__stdcall DBS3GD(long*, long*, long*, long*, double*, long*, double*,
		long*, double*, long*, long*, long*, double*, double*, double*,
		long*, long*, long*, double*, double*, long*, long*);
void	__stdcall DB23GD(long*, long*, long*, long*, double*, long*, double*,
		long*, double*, long*, long*, long*, double*, double*, double*,
		long*, long*, long*, double*, double*, long*, long*, long*,
		long*, long*, double*, double*, double*, double*, double*,
		double*, double*, double*, double*);
double	__stdcall DBS3IG(double*, double*, double*, double*, double*, double*,
		long*, long*, long*, double*, double*, double*, long*, long*,
		long*, double*);
double	__stdcall DB23IG(double*, double*, double*, double*, double*, double*,
		long*, long*, long*, double*, double*, double*, long*, long*,
		long*, double*, double*);
void	__stdcall DBSCPP(long*, double*, long*, double*, long*, double*,
		double*);
void	__stdcall DB2CPP(long*, double*, long*, double*, long*, double*,
		double*, double*);
double	__stdcall DPPVAL(double*, long*, long*, double*, double*);
double	__stdcall DPPDER(long*, double*, long*, long*, double*, double*);
void	__stdcall DPP1GD(long*, long*, double*, long*, long*, double*, double*,
		double*);
void	__stdcall DP21GD(long*, long*, double*, long*, long*, double*, double*,
		double*, long*, double*, double*);
double	__stdcall DPPITG(double*, double*, long*, long*, double*, double*);
double	__stdcall DQDVAL(double*, long*, double*, double*, long*);
double	__stdcall DQDDER(long*, double*, long*, double*, double*, long*);
double	__stdcall DQD2VL(double*, double*, long*, double*, long*, double*,
		double*, long*, long*);
double	__stdcall DQD2DR(long*, long*, double*, double*, long*, double*, long*,
		double*, double*, long*, long*);
double	__stdcall DQD3VL(double*, double*, double*, long*, double*, long*,
		double*, long*, double*, double*, long*, long*, long*);
double	__stdcall DQD3DR(long*, long*, long*, double*, double*, double*, long*,
		double*, long*, double*, long*, double*, double*, long*, long*,
		long*);
void	__stdcall DSURF(long*, double*, double*, long*, long*, double*, double*,
		double*, long*);
void	__stdcall DS2RF(long*, double*, double*, long*, long*, double*, double*,
		double*, long*, long*, double*);
void	__stdcall DFNLSQ(double(__stdcall *)(long*, double*), long*, long*,
		long*, double*, double*, long*, double*, double*, double*);
void	__stdcall DF2LSQ(double(__stdcall *)(long*, double*), long*, long*,
		long*, double*, double*, long*, double*, double*, double*,
		double*);
void	__stdcall DBSLSQ(long*, double*, double*, double*, long*, double*,
		long*, double*);
void	__stdcall DB2LSQ(long*, double*, double*, double*, long*, double*,
		long*, double*, double*, double*, double*, double*, long*);
void	__stdcall DBSVLS(long*, double*, double*, double*, long*, long*,
		double*, double*, double*, double*);
void	__stdcall DB2VLS(long*, double*, double*, double*, long*, long*,
		double*, double*, double*, double*, long*, double*);
void	__stdcall DCONFT(long*, double*, double*, double*, long*, double*,
		long*, long*, long*, double*, double*, long*, double*, long*,
		double*);
void	__stdcall DC2NFT(long*, double*, double*, double*, long*, double*,
		long*, long*, long*, double*, double*, long*, double*, long*,
		double*, double*, double*, double*, double*, double*, long*,
		long*);
void	__stdcall DBSLS2(long*, double*, long*, double*, double*, long*, long*,
		long*, double*, double*, long*, long*, double*, double*,
		double*);
void	__stdcall DB2LS2(long*, double*, long*, double*, double*, long*, long*,
		long*, double*, double*, long*, long*, double*, double*,
		double*, double*);
void	__stdcall DBSLS3(long*, double*, long*, double*, long*, double*,
		double*, long*, long*, long*, long*, long*, double*, double*,
		double*, long*, long*, long*, double*, double*, double*,
		double*);
void	__stdcall DB2LS3(long*, double*, long*, double*, long*, double*,
		double*, long*, long*, long*, long*, long*, double*, double*,
		double*, long*, long*, long*, double*, double*, double*,
		double*, double*);
void	__stdcall DCSSED(long*, double*, double*, double*, double*, long*,
		double*);
void	__stdcall DC2SED(long*, double*, double*, double*, double*, long*,
		double*, double*, long*);
void	__stdcall DCSSMH(long*, double*, double*, double*, double*, double*,
		double*);
void	__stdcall DC2SMH(long*, double*, double*, double*, double*, double*,
		double*, double*, long*);
void	__stdcall DCSSCV(long*, double*, double*, long*, double*, double*);
void	__stdcall DC2SCV(long*, double*, double*, long*, double*, double*,
		double*, double*, long*);
void	__stdcall DRATCH(double(__stdcall *)(double*),
		double(__stdcall *)(double*), double(__stdcall *)(double*),
		double*, double*, long*, long*, double*, double*, double*);
void	__stdcall DR2TCH(double(__stdcall *)(double*),
		double(__stdcall *)(double*), double(__stdcall *)(double*),
		double*, double*, long*, long*, double*, double*, double*,
		long*, long*, double*);

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DRLINE(long*, double*, double*, double*, double*, double*);
void	__stdcall DRCURV(long*, double*, double*, long*, double*, double*,
		double*);
void	__stdcall DR2URV(long*, double*, double*, long*, double*, double*,
		double*, double*, long*);

#endif

/*
 *    Chapter 4:  Integration and Differentiation
 */

void	__stdcall DQDAG(double(__stdcall *)(double*), double*, double*, double*,
		double*, long*, double*, double*);
void	__stdcall DQ2AG(double(__stdcall *)(double*), double*, double*, double*,
		double*, long*, double*, double*, long*, long*, long*, double*,
		double*, double*, double*, long*);
void	__stdcall DQDAGP(double(__stdcall *)(double*), double*, double*, long*,
		double*, double*, double*, double*, double*);
void	__stdcall DQ2AGP(double(__stdcall *)(double*), double*, double*, long*,
		double*, double*, double*, double*, double*, long*, long*,
		long*, double*, double*, double*, double*, long*, long*,
		double*, long*);
void	__stdcall DQDAGI(double(__stdcall *)(double*), double*, long*, double*,
		double*, double*, double*);
void	__stdcall DQ2AGI(double*, double*, long*, double*, double*, double*,
		double*, long*, long*, long*, double*, double*, double*,
		double*, long*);
void	__stdcall DQDAWO(double(__stdcall *)(double*), double*, double*, long*,
		double*, double*, double*, double*, double*);
void	__stdcall DQ2AWO(double(__stdcall *)(double*), double*, double*, long*,
		double*, double*, double*, double*, double*, long*, long*,
		long*, long*, double*, double*, double*, double*, long*, long*,
		double*);
void	__stdcall DQDAWF(double(__stdcall *)(double*), double*, long*, double*,
		double*, double*, double*);
void	__stdcall DQ2AWF(double(__stdcall *)(double*), double*, long*, double*,
		double*, double*, double*, long*, long*, long*, long*, long*,
		double*, double*, long*, long*, double*, long*);
void	__stdcall DQDAWS(double(__stdcall *)(double*), double*, double*, long*,
		double*, double*, double*, double*, double*, double*);
void	__stdcall DQ2AWS(double(__stdcall *)(double*), double*, double*, long*,
		double*, double*, double*, double*, double*, double*, long*,
		long*, long*, double*, double*, double*, double*, long*);
void	__stdcall DQDAWC(double(__stdcall *)(double*), double*, double*,
		double*, double*, double*, double*, double*);
void	__stdcall DQ2AWC(double(__stdcall *)(double*), double*, double*,
		double*, double*, double*, double*, double*, long*, long*,
		long*, double*, double*, double*, double*, long*);
void	__stdcall DQDNG(double(__stdcall *)(double*), double*, double*, double*,
		double*, double*, double*);
void	__stdcall DTWODQ(double(__stdcall *)(double*, double*), double*,
		double*, double(__stdcall *)(double*),
		double(__stdcall *)(double*), double*, double*, long*, double*,
		double*);
void	__stdcall DT2ODQ(double(__stdcall *)(double*, double*), double*,
		double*, double(__stdcall *)(double*),
		double(__stdcall *)(double*), double*, double*, long*, double*,
		double*, long*, long*, long*, double*, double*, double*,
		double*, long*, double*, long*);
void	__stdcall DQAND(double(__stdcall *)(long*, double*), long*, double*,
		double*, double*, double*, long*, double*, double*);
void	__stdcall DGQRUL(long*, long*, double*, double*, long*, double*,
		double*, double*);
void	__stdcall DG2RUL(long*, long*, double*, double*, long*, double*,
		double*, double*, double*);
void	__stdcall DGQRCF(long*, double*, double*, long*, double*, double*,
		double*);
void	__stdcall DG2RCF(long*, double*, double*, long*, double*, double*,
		double*, double*);
void	__stdcall DRECCF(long*, long*, double*, double*, double*, double*);
void	__stdcall DRECQR(long*, double*, double*, long*, double*, double*);
void	__stdcall DR2CQR(long*, double*, double*, long*, double*, double*,
		double*);
void	__stdcall DFQRUL(long*, double*, double*, long*, double*, double*,
		double*, double*);
void	__stdcall DF2RUL(long*, double*, double*, long*, double*, double*,
		double*, double*, double*);
double	__stdcall DDERIV(double(__stdcall *)(double*), long*, double*, double*,
		double*);

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DQDAGS(double(__stdcall *)(double*), double*, double*,
		double*, double*, double*, double*);
void	__stdcall DQ2AGS(double(__stdcall *)(double*), double*, double*,
		double*, double*, double*, double*, long*, long*, long*,
		double*, double*, double*, double*, long*);

#endif

/*
 *    Chapter 5:  Differential Equations
 */

void	__stdcall DIVPRK(long*, long*, void(__stdcall *)(long*, double*,
		double*, double*), double*, double*, double*, double*, double*);
void	__stdcall DI2PRK(long*, long*, void(__stdcall *)(long*, double*,
		double*, double*), double*, double*, double*, double*, double*,
		void(__stdcall *)(long*, double*, double*, double*, double*),
		double*);
void	__stdcall DI3PRK(long*, double*, double*, double*, double*);
void	__stdcall DIVPAG(long*, long*, void(__stdcall *)(long*, double*,
		double*, double*), void(__stdcall *)(long*, double*, double*,
		double*), double*, double*, double*, double*, double*, double*);
void	__stdcall DI2PAG(long*, long*, void(__stdcall *)(long*, double*,
		double*, double*), void(__stdcall *)(long*, double*, double*,
		double*), double*, double*, double*, double*, double*, double*,
		double*, double*, double*, double*, double*, double*, long*,
		void(__stdcall *)(long*, double*, double*, double*, double*));
void	__stdcall DBVPFD(void(__stdcall *)(long*, double*, double*, double*,
		double*), void(__stdcall *)(long*, double*, double*, double*,
		double*), void(__stdcall *)(long*, double*, double*, double*,
		double*), void(__stdcall *)(long*, double*, double*, double*,
		double*), void(__stdcall *)(long*, double*, double*, double*,
		double*), long*, long*, long*, double*, double*, double*,
		double*, long*, double*, double*, long*, long*, long*, long*,
		long*, double*, double*, long*, double*);
void	__stdcall DB2PFD(void(__stdcall *)(long*, double*, double*, double*,
		double*), void(__stdcall *)(long*, double*, double*, double*,
		double*), void(__stdcall *)(long*, double*, double*, double*,
		double*), void(__stdcall *)(long*, double*, double*, double*,
		double*), void(__stdcall *)(long*, double*, double*, double*,
		double*), long*, long*, long*, double*, double*, double*,
		double*, long*, double*, double*, long*, long*, long*, long*,
		long*, double*, double*, long*, double*, double*, long*);
void	__stdcall DBVPMS(void(__stdcall *)(long*, double*, double*, double*,
		double*), void(__stdcall *)(long*, double*, double*, double*,
		double*), void(__stdcall *)(long*, double*, double*, double*,
		double*), long*, double*, double*, double*, double*, long*,
		long*, double*, double*, long*, long*, long*, double*, double*,
		long*);
void	__stdcall DB2PMS(void(__stdcall *)(long*, double*, double*, double*,
		double*), void(__stdcall *)(long*, double*, double*, double*,
		double*), void(__stdcall *)(long*, double*, double*, double*,
		double*), long*, double*, double*, double*, double*, long*,
		long*, double*, double*, long*, long*, long*, double*, double*,
		long*, double*, long*);
void	__stdcall DDASPG(long*, double*, double*, long*, double*, double*,
		void(__stdcall *)(long*, double*, double*, double*, double*));
void	__stdcall DD2SPG(long*, double*, double*, long*, double*, double*,
		void(__stdcall *)(long*, double*, double*, double*, double*),
		void(__stdcall *)(long*, double*, double*, double*, double*,
		double*, long*), long*, double*);
void	__stdcall DDGSPG(long*, double*, double*, double*, double*);
void	__stdcall DDJSPG(long*, double*, double*, double*, double*, double*,
		long*);
void	__stdcall DMOLCH(long*, void(__stdcall *)(long*, double*, double*,
		double*, double*, double*, double*), void(__stdcall *)(long*,
		double*, double*, double*, double*, double*), long*, double*,
		double*, long*, double*, double*, double*, double*, long*);
void	__stdcall DM2LCH(long*, void(__stdcall *)(long*, double*, double*,
		double*, double*, double*, double*), void(__stdcall *)(long*,
		double*, double*, double*, double*, double*), long*, double*,
		double*, long*, double*, double*, double*, double*, long*,
		double*, long*);
void	__stdcall DFPS2H(double(__stdcall *)(double*, double*),
		double(__stdcall *)(long*, double*, double*), double*, long*,
		long*, double*, double*, double*, double*, long*, long*,
		double*, long*);
void	__stdcall DF2S2H(double(__stdcall *)(double*, double*),
		double(__stdcall *)(long*, double*, double*), double*, long*,
		long*, double*, double*, double*, double*, long*, long*,
		double*, long*, double*, double*);
void	__stdcall DFPS3H(double(__stdcall *)(double*, double*, double*),
		double(__stdcall *)(long*, double*, double*, double*), double*,
		long*, long*, long*, double*, double*, double*, double*,
		double*, double*, long*, long*, double*, long*, long*);
void	__stdcall DF2S3H(double(__stdcall *)(double*, double*, double*),
		double(__stdcall *)(long*, double*, double*, double*), double*,
		long*, long*, long*, double*, double*, double*, double*,
		double*, double*, long*, long*, double*, long*, long*, double*,
		double*);

/*
 *    Chapter 6:  Transforms
 */

void	__stdcall DFFTCF(long*, d_complex*, d_complex*);
void	__stdcall DF2TCF(long*, d_complex*, d_complex*, double*, double*);
void	__stdcall DFFTCB(long*, d_complex*, d_complex*);
void	__stdcall DF2TCB(long*, d_complex*, d_complex*, double*, double*);
void	__stdcall DFFTCI(long*, double*);
void	__stdcall DFSINT(long*, double*, double*);
void	__stdcall DF2INT(long*, double*, double*, double*);
void	__stdcall DFSINI(long*, double*);
void	__stdcall DFCOST(long*, double*, double*);
void	__stdcall DF2OST(long*, double*, double*, double*);
void	__stdcall DFCOSI(long*, double*);
void	__stdcall DQSINF(long*, double*, double*);
void	__stdcall DQ2INF(long*, double*, double*, double*);
void	__stdcall DQSINB(long*, double*, double*);
void	__stdcall DQ2INB(long*, double*, double*, double*);
void	__stdcall DQSINI(long*, double*);
void	__stdcall DQCOSF(long*, double*, double*);
void	__stdcall DQ2OSF(long*, double*, double*, double*);
void	__stdcall DQCOSB(long*, double*, double*);
void	__stdcall DQ2OSB(long*, double*, double*, double*);
void	__stdcall DQCOSI(long*, double*);
void	__stdcall DFFT2D(long*, long*, d_complex*, long*, d_complex*, long*);
void	__stdcall DF2T2D(long*, long*, d_complex*, long*, d_complex*, long*,
		double*, double*, d_complex*, double*);
void	__stdcall DFFT2B(long*, long*, d_complex*, long*, d_complex*, long*);
void	__stdcall DF2T2B(long*, long*, d_complex*, long*, d_complex*, long*,
		double*, double*, d_complex*, double*);
void	__stdcall DFFT3F(long*, long*, long*, d_complex*, long*, long*,
		d_complex*, long*, long*);
void	__stdcall DF2T3F(long*, long*, long*, d_complex*, long*, long*,
		d_complex*, long*, long*, double*, double*, double*, double*);
void	__stdcall DFFT3B(long*, long*, long*, d_complex*, long*, long*,
		d_complex*, long*, long*);
void	__stdcall DF2T3B(long*, long*, long*, d_complex*, long*, long*,
		d_complex*, long*, long*, double*, double*, double*, double*);
void	__stdcall DRCONV(long*, long*, double*, long*, double*, long*, long*,
		double*, double*);
void	__stdcall DR2ONV(long*, long*, double*, long*, double*, long*, long*,
		double*, double*, double*, double*, double*);
void	__stdcall DCCONV(long*, long*, d_complex*, long*, d_complex*, long*,
		long*, d_complex*, d_complex*);
void	__stdcall DC2ONV(long*, long*, d_complex*, long*, d_complex*, long*,
		long*, d_complex*, d_complex*, d_complex*, d_complex*, double*);
void	__stdcall DRCORL(long*, long*, double*, double*, long*, long*, double*,
		double*);
void	__stdcall DR2ORL(long*, long*, double*, double*, long*, long*, double*,
		double*, double*, double*, double*);
void	__stdcall DCCORL(long*, long*, d_complex*, d_complex*, long*, long*,
		d_complex*, d_complex*);
void	__stdcall DC2ORL(long*, long*, d_complex*, d_complex*, long*, long*,
		d_complex*, d_complex*, d_complex*, d_complex*, double*);
void	__stdcall DINLAP(d_complex(__stdcall *)(d_complex*), long*, double*,
		double*, double*, long*, double*);
void	__stdcall DSINLP(d_complex(__stdcall *)(d_complex*), long*, double*,
		double*, double*, double*, double*);
void	__stdcall DS2NLP(d_complex(__stdcall *)(d_complex*), long*, double*,
		double*, double*, double*, double*, double*, double*, long*,
		double*, long*);

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DFFTRF(long*, double*, double*);
void	__stdcall DF2TRF(long*, double*, double*, double*);
void	__stdcall DFFTRB(long*, double*, double*);
void	__stdcall DF2TRB(long*, double*, double*, double*);
void	__stdcall DFFTRI(long*, double*);

#endif

/*
 *    Chapter 7:  Nonlinear Equations
 */

void	__stdcall DZPLRC(long*, double*, d_complex*);
void	__stdcall DZPORC(long*, double*, d_complex*);
void	__stdcall DZPOCC(long*, d_complex*, d_complex*);
void	__stdcall DZANLY(d_complex(__stdcall *)(d_complex*), double*, double*,
		long*, long*, long*, d_complex*, long*, d_complex*, long*);
void	__stdcall DZBREN(double(__stdcall *)(double*), double*, double*,
		double*, double*, long*);
void	__stdcall DZREAL(double(__stdcall *)(double*), double*, double*,
		double*, double*, long*, long*, double*, double*, long*);
void	__stdcall DNEQNF(void(__stdcall *)(double*, double*, long*), double*,
		long*, long*, double*, double*, double*);
void	__stdcall DN2QNF(void(__stdcall *)(double*, double*, long*), double*,
		long*, long*, double*, double*, double*, double*, double*,
		double*, double*, double*);
void	__stdcall DNEQNJ(void(__stdcall *)(double*, double*, long*),
		void(__stdcall *)(long*, double*, double*), double*, long*,
		long*, double*, double*, double*);
void	__stdcall DN2QNJ(void(__stdcall *)(double*, double*, long*),
		void(__stdcall *)(long*, double*, double*), double*, long*,
		long*, double*, double*, double*, double*, double*, double*,
		double*, double*);
void	__stdcall DNEQBF(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, long*, double*, double*, double*);
void	__stdcall DN2QBF(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, long*, double*, double*, double*,
		double*, long*);
void	__stdcall DNEQBJ(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*, long*), long*,
		double*, double*, double*, long*, double*, double*, double*);
void	__stdcall DN2QBJ(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*, long*), long*,
		double*, double*, double*, long*, double*, double*, double*,
		double*, long*);
void	__stdcall DN4QBJ(long*, double*);

/*
 *    Chapter 8:  Optimization
 */

void	__stdcall DUVMIF(double*, double*, double*, double*, double*, long*,
		double*);
void	__stdcall DUVMID(double(__stdcall *)(double*),
		double(__stdcall *)(double*), double*, double*, double*, long*,
		double*, double*, double*, double*, double*);
void	__stdcall DUVMGS(double(__stdcall *)(double*), double*, double*,
		double*, double*);
void	__stdcall DUMING(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*), long*, double*,
		double*, double*, long*, double*, double*, double*);
void	__stdcall DU2ING(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*), long*, double*,
		double*, double*, long*, double*, double*, double*, double*);
void	__stdcall DUMIDH(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*), long*, double*,
		double*, double*, long*, double*, double*, double*);
void	__stdcall DU2IDH(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*), long*, double*,
		double*, double*, long*, double*, double*, double*, double*);
void	__stdcall DUMIAH(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*, long*), long*,
		double*, double*, double*, long*, double*, double*, double*);
void	__stdcall DU2IAH(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*, long*), long*,
		double*, double*, double*, long*, double*, double*, double*,
		double*);
void	__stdcall DUMCGF(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, long*, double*, double*, double*,
		double*);
void	__stdcall DU2CGF(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, long*, double*, double*, double*,
		double*, double*, double*, double*, double*, double*, double*);
void	__stdcall DUMCGG(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*), long*, double*,
		double*, long*, double*, double*, double*, double*);
void	__stdcall DU2CGG(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*), long*, double*,
		double*, long*, double*, double*, double*, double*, double*,
		double*, double*, double*, double*, double*);
void	__stdcall DUMPOL(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, long*, double*, double*);
void	__stdcall DU2POL(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, long*, double*, double*, double*);
void	__stdcall DUNLSF(void(__stdcall *)(long*, long*, double*, double*),
		long*, long*, double*, double*, double*, long*, double*,
		double*, double*, double*, long*);
void	__stdcall DU2LSF(void(__stdcall *)(long*, long*, double*, double*),
		long*, long*, double*, double*, double*, long*, double*,
		double*, double*, double*, long*, double*, long*);
void	__stdcall DU4LSF(long*, double*);
void	__stdcall DUNLSJ(void(__stdcall *)(long*, long*, double*, double*),
		void(__stdcall *)(long*, long*, double*, double*, long*), long*,
		long*, double*, double*, double*, long*, double*, double*,
		double*, double*, long*);
void	__stdcall DU2LSJ(void(__stdcall *)(long*, long*, double*, double*),
		void(__stdcall *)(long*, long*, double*, double*, long*), long*,
		long*, double*, double*, double*, long*, double*, double*,
		double*, double*, long*, double*, long*);
void	__stdcall DBCONF(void(__stdcall *)(long*, double*, double*), long*,
		double*, long*, double*, double*, double*, double*, long*,
		double*, double*, double*);
void	__stdcall DB2ONF(void(__stdcall *)(long*, double*, double*), long*,
		double*, long*, double*, double*, double*, double*, long*,
		double*, double*, double*, double*, long*);
void	__stdcall DBCONG(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*), long*, double*,
		long*, double*, double*, double*, double*, long*, double*,
		double*, double*);
void	__stdcall DB2ONG(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*), long*, double*,
		long*, double*, double*, double*, double*, long*, double*,
		double*, double*, double*, long*);
void	__stdcall DBCODH(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*), long*, double*,
		long*, double*, double*, double*, double*, long*, double*,
		double*, double*);
void	__stdcall DB2ODH(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*), long*, double*,
		long*, double*, double*, double*, double*, long*, double*,
		double*, double*, double*, long*);
void	__stdcall DBCOAH(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*, long*), long*,
		double*, long*, double*, double*, double*, double*, long*,
		double*, double*, double*);
void	__stdcall DB2OAH(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*, long*), long*,
		double*, long*, double*, double*, double*, double*, long*,
		double*, double*, double*, double*, long*);
void	__stdcall DBCPOL(void(__stdcall *)(long*, double*, double*), long*,
		double*, long*, double*, double*, double*, long*, double*,
		double*);
void	__stdcall DB2POL(void(__stdcall *)(long*, double*, double*), long*,
		double*, long*, double*, double*, double*, long*, double*,
		double*, double*);
void	__stdcall DBCLSF(void(__stdcall *)(long*, long*, double*, double*),
		long*, long*, double*, long*, double*, double*, double*,
		double*, long*, double*, double*, double*, double*, long*);
void	__stdcall DB2LSF(void(__stdcall *)(long*, long*, double*, double*),
		long*, long*, double*, long*, double*, double*, double*,
		double*, long*, double*, double*, double*, double*, long*,
		double*, long*);
void	__stdcall DBCLSJ(void(__stdcall *)(long*, long*, double*, double*),
		void(__stdcall *)(long*, long*, double*, double*, long*), long*,
		long*, double*, long*, double*, double*, double*, double*,
		long*, double*, double*, double*, double*, long*);
void	__stdcall DB2LSJ(void(__stdcall *)(long*, long*, double*, double*),
		void(__stdcall *)(long*, long*, double*, double*, long*), long*,
		long*, double*, long*, double*, double*, double*, double*,
		long*, double*, double*, double*, double*, long*, double*,
		long*);
void	__stdcall DDLPRS(long*, long*, double*, long*, double*, double*,
		double*, long*, double*, double*, double*, double*, double*);
void	__stdcall DD2PRS(long*, long*, double*, long*, double*, double*,
		double*, long*, double*, double*, double*, double*, double*,
		double*, long*, double*, long*);
void	__stdcall DQPROG(long*, long*, long*, double*, long*, double*, double*,
		double*, long*, double*, double*, long*, long*, double*);
void	__stdcall DQ2ROG(long*, long*, long*, double*, long*, double*, double*,
		double*, long*, double*, double*, long*, long*, double*,
		double*);
void	__stdcall DLCONF(void(__stdcall *)(long*, double*, double*), long*,
		long*, long*, double*, long*, double*, double*, double*,
		double*, double*, long*, double*, double*, long*, long*,
		double*);
void	__stdcall DL2ONF(void(__stdcall *)(long*, double*, double*), long*,
		long*, long*, double*, long*, double*, double*, double*,
		double*, double*, long*, double*, double*, long*, long*,
		double*, long*, long*, double*);
void	__stdcall DLCONG(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*), long*, long*, long*,
		double*, long*, double*, double*, double*, double*, double*,
		long*, double*, double*, long*, long*, double*);
void	__stdcall DL2ONG(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*), long*, long*, long*,
		double*, long*, double*, double*, double*, double*, double*,
		long*, double*, double*, long*, long*, double*, long*, long*,
		double*);
void	__stdcall DNCONF(void(__stdcall *)(long*, long*, long*, double*,
		double*, double*, double*), long*, long*, long*, double*, long*,
		double*, double*, double*, long*, long*, double*, double*);
void	__stdcall DN2ONF(void(__stdcall *)(long*, long*, long*, double*,
		double*, double*, double*), long*, long*, long*, double*, long*,
		double*, double*, double*, long*, long*, double*, double*,
		double*, long*, long*, long*, double*);
void	__stdcall DN0ONF(long*, long*, long*, long*, long*, double*, double*,
		long*, long*, double*, double*, double*, double*, double*,
		long*, double*, double*, long*, double*, double*, double*,
		long*, long*, long*, double*, long*, double*);
void	__stdcall DNCONG(void(__stdcall *)(long*, long*, long*, double*,
		double*, double*, double*), void(__stdcall *)(long*, long*,
		long*, long*, double*, double*, double*, double*, double*,
		double*), long*, long*, long*, double*, long*, double*, double*,
		long*, long*, double*, double*);
void	__stdcall DN2ONG(void(__stdcall *)(long*, long*, long*, double*,
		double*, double*, double*), void(__stdcall *)(long*, long*,
		long*, long*, double*, double*, double*, double*, double*,
		double*), long*, long*, long*, double*, long*, double*, double*,
		long*, long*, double*, double*, double*, long*, long*, long*);
void	__stdcall DCDGRD(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, double*);
void	__stdcall DFDGRD(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, double*, double*);
void	__stdcall DFDHES(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, double*, double*, long*);
void	__stdcall DF2HES(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, double*, double*, long*, double*,
		double*);
void	__stdcall DGDHES(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, double*, double*, long*);
void	__stdcall DG2HES(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, double*, double*, long*, double*);
void	__stdcall DFDJAC(void(__stdcall *)(long*, long*, double*, double*),
		long*, long*, double*, double*, double*, double*, double*,
		long*);
void	__stdcall DF2JAC(void(__stdcall *)(long*, long*, double*, double*),
		long*, long*, double*, double*, double*, double*, double*,
		long*, double*);
void	__stdcall DCHGRD(void(__stdcall *)(long*, double*, double*), double*,
		long*, double*, long*);
void	__stdcall DC2GRD(void(__stdcall *)(long*, double*, double*), double*,
		long*, double*, long*, double*, double*, double*, double*);
void	__stdcall DCHHES(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*, long*), long*,
		double*, long*, long*);
void	__stdcall DC2HES(void(__stdcall *)(long*, double*, double*),
		void(__stdcall *)(long*, double*, double*, long*), long*,
		double*, long*, long*, double*, double*, double*, double*,
		double*, long*, double*);
void	__stdcall DCHJAC(void(__stdcall *)(long*, long*, double*, double*),
		void(__stdcall *)(long*, long*, double*, double*, long*), long*,
		long*, double*, long*, long*);
void	__stdcall DC2JAC(void(__stdcall *)(long*, long*, double*, double*),
		void(__stdcall *)(long*, long*, double*, double*, long*), long*,
		long*, double*, long*, long*, double*, double*, double*,
		double*, double*, long*, double*);
void	__stdcall DGGUES(long*, double*, double*, long*, long*, double*);
void	__stdcall DG2UES(long*, double*, double*, long*, long*, double*,
		double*, long*);

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DUMINF(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, long*, double*, double*, double*);
void	__stdcall DU2INF(void(__stdcall *)(long*, double*, double*), long*,
		double*, double*, double*, long*, double*, double*, double*,
		double*);
void	__stdcall DU4INF(long*, double*);

#endif

/*
 *    Chapter 9:  Basic Matrix/Vector Operations
 */

void	__stdcall DCRGRG(long*, double*, long*, double*, long*);
void	__stdcall DCCGCG(long*, d_complex*, long*, d_complex*, long*);
void	__stdcall DCRBRB(long*, double*, long*, long*, long*, double*, long*,
		long*, long*);
void	__stdcall DCCBCB(long*, d_complex*, long*, long*, long*, d_complex*,
		long*, long*, long*);
void	__stdcall DCRGRB(long*, double*, long*, long*, long*, double*, long*);
void	__stdcall DCRBRG(long*, double*, long*, long*, long*, double*, long*);
void	__stdcall DCCGCB(long*, d_complex*, long*, long*, long*, d_complex*,
		long*);
void	__stdcall DCCBCG(long*, d_complex*, long*, long*, long*, d_complex*,
		long*);
void	__stdcall DCRGCG(long*, double*, long*, d_complex*, long*);
void	__stdcall DCRRCR(long*, long*, double*, long*, long*, long*, d_complex*,
		long*);
void	__stdcall DCRBCB(long*, double*, long*, long*, long*, d_complex*, long*,
		long*, long*);
void	__stdcall DCSFRG(long*, double*, long*);
void	__stdcall DCHFCG(long*, d_complex*, long*);
void	__stdcall DCSBRB(long*, double*, long*, long*, double*, long*, long*,
		long*);
void	__stdcall DCHBCB(long*, d_complex*, long*, long*, d_complex*, long*,
		long*, long*);
void	__stdcall DMXYTF(long*, long*, double*, long*, long*, long*, double*,
		long*, long*, long*, double*, long*);
void	__stdcall DMCRCR(long*, long*, d_complex*, long*, long*, long*,
		d_complex*, long*, long*, long*, d_complex*, long*);
void	__stdcall DHRRRR(long*, long*, double*, long*, long*, long*, double*,
		long*, long*, long*, double*, long*);
void	__stdcall DPOLRG(long*, double*, long*, long*, double*, double*, long*);
void	__stdcall DP2LRG(long*, double*, long*, long*, double*, double*, long*,
		double*);
void	__stdcall DMURRV(long*, long*, double*, long*, long*, double*, long*,
		long*, double*);
void	__stdcall DMURBV(long*, double*, long*, long*, long*, long*, double*,
		long*, long*, double*);
void	__stdcall DMUCRV(long*, long*, d_complex*, long*, long*, d_complex*,
		long*, long*, d_complex*);
void	__stdcall DMUCBV(long*, d_complex*, long*, long*, long*, long*,
		d_complex*, long*, long*, d_complex*);
void	__stdcall DARBRB(long*, double*, long*, long*, long*, double*, long*,
		long*, long*, double*, long*, long*, long*);
void	__stdcall DACBCB(long*, d_complex*, long*, long*, long*, d_complex*,
		long*, long*, long*, d_complex*, long*, long*, long*);
void	__stdcall DNRIRR(long*, long*, double*, long*, double*);
void	__stdcall DNR1RR(long*, long*, double*, long*, double*);
void	__stdcall DNR2RR(long*, long*, double*, long*, double*);
void	__stdcall DNR1RB(long*, double*, long*, long*, long*, double*);
void	__stdcall DNR1CB(long*, d_complex*, long*, long*, long*, double*);
double	__stdcall DDISL2(long*, double*, long*, double*, long*);
double	__stdcall DDISL1(long*, double*, long*, double*, long*);
double	__stdcall DDISLI(long*, double*, long*, double*, long*);
void	__stdcall DVCONR(long*, double*, long*, double*, long*, double*);
void	__stdcall DV2ONR(long*, double*, long*, double*, long*, double*,
		d_complex*, d_complex*, d_complex*, double*);
void	__stdcall DVCONC(long*, d_complex*, long*, d_complex*, long*,
		d_complex*);
void	__stdcall DV2ONC(long*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*, d_complex*, double*);

#ifndef IMSL_MATH_COMMON

void	__stdcall DQADD(double*, double*);
void	__stdcall DQINI(double*, double*);
void	__stdcall DQMUL(double*, double*, double*);
void	__stdcall DQSTO(double*, double*);
void	__stdcall ZQADD(d_complex*, double*);
void	__stdcall ZQINI(d_complex*, double*);
void	__stdcall ZQMUL(d_complex*, d_complex*, double*);
void	__stdcall ZQSTO(double*, d_complex*);

#endif

#ifndef IMSL_COMMON_DOUBLE

void	__stdcall DTRNRR(long*, long*, double*, long*, long*, long*, double*,
		long*);
void	__stdcall DMXTXF(long*, long*, double*, long*, long*, double*, long*);
void	__stdcall DMXTYF(long*, long*, double*, long*, long*, long*, double*,
		long*, long*, long*, double*, long*);
void	__stdcall DMRRRR(long*, long*, double*, long*, long*, long*, double*,
		long*, long*, long*, double*, long*);
double	__stdcall DBLINF(long*, long*, double*, long*, double*, double*);

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
void	__stdcall ZQUDOT(d_complex*, long*, d_complex*, d_complex*, long*,
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
 *    Chapter 10:  Utilities
 */

void	__stdcall DWRCRN(char*, unsigned int, long*, long*, d_complex*, long*,
		long*);
void	__stdcall DWRCRL(char*, unsigned int, long*, long*, d_complex*, long*,
		long*, char*, unsigned int, char*, unsigned int, char*,
		unsigned int);
void	__stdcall DW2CRL(char*, unsigned int, long*, long*, d_complex*, long*,
		long*, char*, unsigned int, char*, unsigned int, char*,
		unsigned int, char*, unsigned int);
void	__stdcall DSVRBN(long*, double*, double*);
void	__stdcall DSVRBP(long*, double*, double*, long*);
double	__stdcall DCONST(char*, unsigned int);
void	__stdcall DCUNIT(double*, char*, unsigned int, double*, char*,
		unsigned int);
double	__stdcall DHYPOT(double*, double*);

#ifndef IMSL_MATH_COMMON

void	__stdcall SVIBN(long*, long*, long*);
void	__stdcall SVIBP(long*, long*, long*, long*);
void	__stdcall VERML(char*, unsigned int, long*);
void	__stdcall IUMAG(char*, unsigned int, long*, long*, long*, long*, long*);
void	__stdcall SUMAG(char*, unsigned int, long*, long*, long*, long*,
		float*);
void	__stdcall DUMAG(char*, unsigned int, long*, long*, long*, long*,
		double*);
void	__stdcall PRIME(long*, long*, long*, long*, long*);

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
void	__stdcall RNGET(long*);
void	__stdcall RNSET(long*);
void	__stdcall RNOPT(long*);

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
double	__stdcall DRNUNF(void);
void	__stdcall DRNUN(long*, double*);
void	__stdcall DPLOTP(long*, long*, double*, double*, long*, long*, double*,
		char*, unsigned int, char*, unsigned int, char*, unsigned int,
		char*, unsigned int);

#endif

/*
 *    Special Functions Chapter 1:  Elementary Functions
 */

double	__stdcall ZARG(d_complex*);
double	__stdcall DCBRT(double*);
void	__stdcall ZCBRT(d_complex*, d_complex*);
double	__stdcall DEXPRL(double*);
void	__stdcall ZLOG10(d_complex*, d_complex*);
double	__stdcall DLNREL(double*);

#ifndef IMSL_MATH_COMMON

void	__stdcall CEXPRL(f_complex*, f_complex*);
void	__stdcall CLNREL(f_complex*, f_complex*);

#endif

/*
 *    Special Functions Chapter 2:  Trigonometric and Hyperbolic
 *                                  Functions
 */

void	__stdcall ZTAN(d_complex*, d_complex*);
double	__stdcall DCOT(double*);
void	__stdcall ZCOT(d_complex*, d_complex*);
double	__stdcall DSINDG(double*);
double	__stdcall DCOSDG(double*);
void	__stdcall ZASIN(d_complex*, d_complex*);
void	__stdcall ZACOS(d_complex*, d_complex*);
void	__stdcall ZATAN(d_complex*, d_complex*);
void	__stdcall ZATAN2(d_complex*, d_complex*, d_complex*);
void	__stdcall ZSINH(d_complex*, d_complex*);
void	__stdcall ZCOSH(d_complex*, d_complex*);
void	__stdcall ZTANH(d_complex*, d_complex*);
double	__stdcall DASINH(double*);
void	__stdcall ZASINH(d_complex*, d_complex*);
double	__stdcall DACOSH(double*);
void	__stdcall ZACOSH(d_complex*, d_complex*);
double	__stdcall DATANH(double*);
void	__stdcall ZATANH(d_complex*, d_complex*);

/*
 *    Special Functions Chapter 3:  Exponential Integrals and Related
 *                                  Functions
 */

double	__stdcall DEI(double*);
double	__stdcall DE1(double*);
void	__stdcall DENE(double*, long*, double*);
double	__stdcall DLI(double*);
double	__stdcall DSI(double*);
double	__stdcall DCI(double*);
double	__stdcall DCIN(double*);
double	__stdcall DSHI(double*);
double	__stdcall DCHI(double*);
double	__stdcall DCINH(double*);

/*
 *    Special Functions Chapter 4:  Gamma Function and Related Functions
 */

double	__stdcall DFAC(long*);
double	__stdcall DGAMR(double*);
double	__stdcall DLNGAM(double*);
void	__stdcall DLGAMS(double*, double*, double*);
double	__stdcall DGAMI(double*, double*);
double	__stdcall DGAMIC(double*, double*);
double	__stdcall DGAMIT(double*, double*);
double	__stdcall DPSI(double*);
double	__stdcall DPOCH(double*, double*);
double	__stdcall DPOCH1(double*, double*);
double	__stdcall DLBETA(double*, double*);
double	__stdcall DBETAI(double*, double*, double*);

#ifndef IMSL_MATH_COMMON

void	__stdcall CGAMMA(f_complex*, f_complex*);
void	__stdcall CGAMR(f_complex*, f_complex*);
void	__stdcall CLNGAM(f_complex*, f_complex*);
void	__stdcall CPSI(f_complex*, f_complex*);
void	__stdcall CBETA(f_complex*, f_complex*, f_complex*);
void	__stdcall CLBETA(f_complex*, f_complex*, f_complex*);

#endif

#ifndef IMSL_COMMON_DOUBLE

double	__stdcall DBINOM(long*, long*);
double	__stdcall DGAMMA(double*);
void	__stdcall D9GAML(double*, double*);
double	__stdcall DBETA(double*, double*);

#endif

/*
 *    Special Functions Chapter 5:  Error Function and Related Functions
 */

double	__stdcall DERF(double*);
double	__stdcall DERFC(double*);
double	__stdcall DERFCE(double*);
void	__stdcall ZERFE(d_complex*, d_complex*);
double	__stdcall DERFI(double*);
double	__stdcall DERFCI(double*);
double	__stdcall DDAWS(double*);
double	__stdcall DFRESC(double*);
double	__stdcall DFRESS(double*);

/*
 *    Special Functions Chapter 6:  Bessel Functions
 */

double	__stdcall DBSJ0(double*);
double	__stdcall DBSJ1(double*);
double	__stdcall DBSY0(double*);
double	__stdcall DBSY1(double*);
double	__stdcall DBSI0(double*);
double	__stdcall DBSI1(double*);
double	__stdcall DBSK0(double*);
double	__stdcall DBSK1(double*);
double	__stdcall DBSI0E(double*);
double	__stdcall DBSI1E(double*);
double	__stdcall DBSK0E(double*);
double	__stdcall DBSK1E(double*);
void	__stdcall DBSJNS(double*, long*, double*);
void	__stdcall DCBJNS(d_complex*, long*, d_complex*);
void	__stdcall DBSINS(double*, long*, double*);
void	__stdcall DCBINS(d_complex*, long*, d_complex*);
void	__stdcall DBSJS(double*, double*, long*, double*);
void	__stdcall DB2JS(double*, double*, long*, double*, double*);
void	__stdcall DBSYS(double*, double*, long*, double*);
void	__stdcall DBSIS(double*, double*, long*, double*);
void	__stdcall DBSIES(double*, double*, long*, double*);
void	__stdcall DBSKS(double*, double*, long*, double*);
void	__stdcall DBSKES(double*, double*, long*, double*);
void	__stdcall DCBJS(double*, d_complex*, long*, d_complex*);
void	__stdcall DCBYS(double*, d_complex*, long*, d_complex*);
void	__stdcall DC2YS(double*, d_complex*, long*, d_complex*, d_complex*);
void	__stdcall DCBIS(double*, d_complex*, long*, d_complex*);
void	__stdcall DCBKS(double*, d_complex*, long*, d_complex*);
void	__stdcall DC2KS(double*, d_complex*, long*, d_complex*, d_complex*);

/*
 *    Special Functions Chapter 7:  Kelvin Functions
 */

double	__stdcall DBER0(double*);
double	__stdcall DBEI0(double*);
double	__stdcall DKER0(double*);
double	__stdcall DKEI0(double*);
double	__stdcall DBERP0(double*);
double	__stdcall DBEIP0(double*);
double	__stdcall DKERP0(double*);
double	__stdcall DKEIP0(double*);
double	__stdcall DBER1(double*);
double	__stdcall DBEI1(double*);
double	__stdcall DKER1(double*);
double	__stdcall DKEI1(double*);

/*
 *    Special Functions Chapter 8:  Airy Functions
 */

double	__stdcall DAI(double*);
double	__stdcall DBI(double*);
double	__stdcall DAID(double*);
double	__stdcall DBID(double*);
double	__stdcall DAIE(double*);
double	__stdcall DBIE(double*);
double	__stdcall DAIDE(double*);
double	__stdcall DBIDE(double*);

/*
 *    Special Functions Chapter 9:  Elliptic Integrals
 */

double	__stdcall DELK(double*);
double	__stdcall DELE(double*);
double	__stdcall DELRF(double*, double*, double*);
double	__stdcall DELRD(double*, double*, double*);
double	__stdcall DELRJ(double*, double*, double*, double*);
double	__stdcall DELRC(double*, double*);

/*
 *    Special Functions Chapter 10:  Elliptic and Related Functions
 */

void	__stdcall ZWPL(d_complex*, d_complex*);
void	__stdcall ZWPLD(d_complex*, d_complex*);
void	__stdcall ZWPQ(d_complex*, d_complex*);
void	__stdcall ZWPQD(d_complex*, d_complex*);
double	__stdcall DEJSN(double*, double*);
void	__stdcall ZEJSN(d_complex*, d_complex*, double*);
double	__stdcall DEJCN(double*, double*);
void	__stdcall ZEJCN(d_complex*, d_complex*, double*);
double	__stdcall DEJDN(double*, double*);
void	__stdcall ZEJDN(d_complex*, d_complex*, double*);

/*
 *    Special Functions Chapter 11:  Probability Distribution Functions
 *                                   and Inverses
 */

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
 *    Special Functions Chapter 12:  Mathieu Functions
 */

void	__stdcall DMATEE(double*, long*, long*, long*, double*);
void	__stdcall DM2TEE(double*, long*, long*, long*, double*, long*, double*,
		double*);
void	__stdcall DM3TEE(double*, long*, long*);
void	__stdcall DMATCE(double*, double*, long*, double*);
void	__stdcall DM2TCE(double*, double*, long*, double*, long*, long*,
		double*, double*, double*, double*, double*);
void	__stdcall DMATSE(double*, double*, long*, double*);
void	__stdcall DM2TSE(double*, double*, long*, double*, long*, long*,
		double*, double*, double*, double*, double*);

/*
 *    Special Functions Chapter 13:  Miscellaneous Functions
 */

double	__stdcall DSPENC(double*);
long	__stdcall INITDS(double*, long*, float);
double	__stdcall DCSEVL(double*, double*, long*);

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

void	__stdcall DE2AHF(long*, long*, d_complex*, long*, long*, double*,
		d_complex*, double*, d_complex*, long*);
void	__stdcall DE2ASF(long*, long*, double*, long*, long*, double*, double*,
		double*, long*);
void	__stdcall DE2BHF(long*, long*, d_complex*, long*, double*, double*,
		long*, double*, d_complex*, double*, d_complex*, long*);
void	__stdcall DE2BSB(long*, long*, double*, long*, long*, double*, double*,
		long*, double*, double*, double*, long*);
void	__stdcall DE2BSF(long*, long*, double*, long*, double*, double*, long*,
		double*, double*, double*, long*);
void	__stdcall DE2CCG(long*, d_complex*, long*, d_complex*, d_complex*,
		long*, d_complex*, double*, d_complex*);
void	__stdcall DE2CCH(long*, d_complex*, long*, d_complex*, d_complex*,
		long*, d_complex*, d_complex*);
void	__stdcall DE2CHF(long*, d_complex*, long*, double*, d_complex*, long*,
		d_complex*, double*, d_complex*);
void	__stdcall DE2CRG(long*, double*, long*, d_complex*, d_complex*, long*,
		double*, double*, double*);
void	__stdcall DE2CRH(long*, double*, long*, d_complex*, d_complex*, long*,
		double*, double*);
void	__stdcall DE2CSB(long*, double*, long*, long*, double*, double*, long*,
		double*, double*);
void	__stdcall DE2EHF(long*, long*, d_complex*, long*, long*, double*,
		d_complex*, long*, d_complex*, double*, double*, d_complex*,
		long*);
void	__stdcall DE2ESB(long*, long*, double*, long*, long*, long*, double*,
		double*, long*, double*, double*, long*);
void	__stdcall DE2FHF(long*, long*, d_complex*, long*, double*, double*,
		long*, double*, d_complex*, long*, d_complex*, double*, double*,
		d_complex*, long*);
void	__stdcall DE2FSB(long*, long*, double*, long*, long*, double*, double*,
		long*, double*, double*, long*, double*, double*, double*,
		long*);
void	__stdcall DE2FSF(long*, long*, double*, long*, double*, double*, long*,
		double*, double*, long*, double*, double*, long*);
void	__stdcall DE2LCG(long*, d_complex*, long*, d_complex*, d_complex*,
		double*, d_complex*);
void	__stdcall DE2LCH(long*, d_complex*, long*, d_complex*, d_complex*);
void	__stdcall DE2LHF(long*, d_complex*, long*, double*, d_complex*, double*,
		d_complex*);
void	__stdcall DE2LRG(long*, double*, long*, d_complex*, double*, double*);
void	__stdcall DE2LRH(long*, double*, long*, d_complex*, double*);
void	__stdcall DE2LSB(long*, double*, long*, long*, double*, double*,
		double*);
void	__stdcall DE3CRG(long*, long*, long*, double*, long*, double*);
void	__stdcall DE3CRH(long*, long*, long*, double*, long*, d_complex*,
		double*, long*, d_complex*, long*, long*);
void	__stdcall DE3LSF(long*, double*, long*, double*, double*, double*);
void	__stdcall DE4CRG(long*, long*, long*, double*, long*, double*, double*);
void	__stdcall DE4ESF(long*, long*, double*, double*, long*, double*);
void	__stdcall DE5CRG(long*, long*, long*, double*, long*, double*, double*,
		long*, double*);
void	__stdcall DE7CRG(long*, long*, d_complex*, d_complex*, long*, long*);
void	__stdcall DG2CCG(long*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*, d_complex*, long*, d_complex*,
		d_complex*);
void	__stdcall DG2CRG(long*, double*, long*, double*, long*, d_complex*,
		double*, d_complex*, long*, double*, double*, double*, double*,
		d_complex*);
void	__stdcall DG2LCG(long*, d_complex*, long*, d_complex*, long*,
		d_complex*, d_complex*, d_complex*, d_complex*);
void	__stdcall DG2LRG(long*, double*, long*, double*, long*, d_complex*,
		double*, double*, double*, double*, d_complex*);
void	__stdcall DG3CCG(long*, d_complex*, d_complex*, long*, d_complex*,
		long*);
void	__stdcall DG4CCG(long*, d_complex*, d_complex*, d_complex*, long*,
		long*, d_complex*, d_complex*);
void	__stdcall DG5CCG(long*, long*, d_complex*, d_complex*, d_complex*,
		long*, long*, d_complex*);
void	__stdcall DG7CRG(long*, long*, d_complex*, double*, d_complex*, long*,
		long*, d_complex*);
void	__stdcall DIVPBS(long*, long*, void(__stdcall *)(long*, double*,
		double*), double*, double*, double*, double*, double*);
void	__stdcall DI2PBS(long*, long*, void(__stdcall *)(long*, double*,
		double*), double*, double*, double*, double*, double*, double*,
		double*, void(__stdcall *)(long*, double*, double*, double*,
		double*), double*);

#ifndef IMSL_MATH_COMMON

void	__stdcall CZADD(f_complex*, double*);
void	__stdcall CZINI(f_complex*, double*);
void	__stdcall CZMUL(f_complex*, f_complex*, double*);
void	__stdcall CZSTO(double*, f_complex*);
void	__stdcall SDADD(float, double*);
void	__stdcall SDINI(float, double*);
void	__stdcall SDMUL(float, float, double*);
void	__stdcall SDSTO(double*, float);

#endif

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

#define IMSL_MATH_DOUBLE	/* Double-precision MATH/LIBRARY routines */

#ifndef IMSL_MATH_COMMON
#define IMSL_MATH_COMMON	/* MATH/LIBRARY routines common to both */
#endif				/* single- and double-precision */

#ifndef IMSL_COMMON_DOUBLE
#define IMSL_COMMON_DOUBLE	/* Double-precision routines common to */
#endif				/* both MATH/LIBRARY and STAT/LIBRARY */

#ifndef IMSL_COMMON
#define IMSL_COMMON		/* Routines common to both MATH/LIBRARY */
#endif				/* and STAT/LIBRARY */

#endif
