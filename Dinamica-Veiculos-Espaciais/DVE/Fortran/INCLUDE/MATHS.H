/*
 *    MATHS.H	- Declare single-precision IMSL MATH/LIBRARY routines
 *
 *    Copyright (c) 1994 by Visual Numerics, Inc.  All Rights Reserved.
 */

#ifndef IMSL_MATH_SINGLE

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

void	__stdcall LSARG(long*, float*, long*, float*, long*, float*);
void	__stdcall L2ARG(long*, float*, long*, float*, long*, float*, float*,
		long*, float*);
void	__stdcall LFCRG(long*, float*, long*, float*, long*, long*, float*);
void	__stdcall L2CRG(long*, float*, long*, float*, long*, long*, float*,
		float*);
void	__stdcall LFIRG(long*, float*, long*, float*, long*, long*, float*,
		long*, float*, float*);
void	__stdcall LSACG(long*, f_complex*, long*, f_complex*, long*,
		f_complex*);
void	__stdcall L2ACG(long*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, long*, f_complex*);
void	__stdcall LSLCG(long*, f_complex*, long*, f_complex*, long*,
		f_complex*);
void	__stdcall L2LCG(long*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, long*, f_complex*);
void	__stdcall LFCCG(long*, f_complex*, long*, f_complex*, long*, long*,
		float*);
void	__stdcall L2CCG(long*, f_complex*, long*, f_complex*, long*, long*,
		float*, f_complex*);
void	__stdcall LFTCG(long*, f_complex*, long*, f_complex*, long*, long*);
void	__stdcall L2TCG(long*, f_complex*, long*, f_complex*, long*, long*,
		f_complex*);
void	__stdcall LFSCG(long*, f_complex*, long*, long*, f_complex*, long*,
		f_complex*);
void	__stdcall LFICG(long*, f_complex*, long*, f_complex*, long*, long*,
		f_complex*, long*, f_complex*, f_complex*);
void	__stdcall LFDCG(long*, f_complex*, long*, long*, f_complex*, float*);
void	__stdcall LINCG(long*, f_complex*, long*, f_complex*, long*);
void	__stdcall L2NCG(long*, f_complex*, long*, f_complex*, long*, f_complex*,
		long*);
void	__stdcall LSLRT(long*, float*, long*, float*, long*, float*);
void	__stdcall LFCRT(long*, float*, long*, long*, float*);
void	__stdcall L2CRT(long*, float*, long*, long*, float*, float*);
void	__stdcall LFDRT(long*, float*, long*, float*, float*);
void	__stdcall LINRT(long*, float*, long*, long*, float*, long*);
void	__stdcall LSLCT(long*, f_complex*, long*, f_complex*, long*,
		f_complex*);
void	__stdcall LFCCT(long*, f_complex*, long*, long*, float*);
void	__stdcall L2CCT(long*, f_complex*, long*, long*, float*, f_complex*);
void	__stdcall LFDCT(long*, f_complex*, long*, f_complex*, float*);
void	__stdcall LINCT(long*, f_complex*, long*, long*, f_complex*, long*);
void	__stdcall LSADS(long*, float*, long*, float*, float*);
void	__stdcall L2ADS(long*, float*, long*, float*, float*, float*, float*);
void	__stdcall LSLDS(long*, float*, long*, float*, float*);
void	__stdcall L2LDS(long*, float*, long*, float*, float*, float*, float*);
void	__stdcall LFCDS(long*, float*, long*, float*, long*, float*);
void	__stdcall L2CDS(long*, float*, long*, float*, long*, float*, float*);
void	__stdcall LFTDS(long*, float*, long*, float*, long*);
void	__stdcall LFSDS(long*, float*, long*, float*, float*);
void	__stdcall LFIDS(long*, float*, long*, float*, long*, float*, float*,
		float*);
void	__stdcall LFDDS(long*, float*, long*, float*, float*);
void	__stdcall LINDS(long*, float*, long*, float*, long*);
void	__stdcall L2NDS(long*, float*, long*, float*, long*, float*);
void	__stdcall LSASF(long*, float*, long*, float*, float*);
void	__stdcall L2ASF(long*, float*, long*, float*, float*, float*, long*,
		float*);
void	__stdcall LSLSF(long*, float*, long*, float*, float*);
void	__stdcall L2LSF(long*, float*, long*, float*, float*, float*, long*,
		float*);
void	__stdcall LFCSF(long*, float*, long*, float*, long*, long*, float*);
void	__stdcall L2CSF(long*, float*, long*, float*, long*, long*, float*,
		float*);
void	__stdcall LFTSF(long*, float*, long*, float*, long*, long*);
void	__stdcall LFSSF(long*, float*, long*, long*, float*, float*);
void	__stdcall LFISF(long*, float*, long*, float*, long*, long*, float*,
		float*, float*);
void	__stdcall LFDSF(long*, float*, long*, long*, float*, float*);
void	__stdcall LSADH(long*, f_complex*, long*, f_complex*, f_complex*);
void	__stdcall L2ADH(long*, f_complex*, long*, f_complex*, f_complex*,
		f_complex*, f_complex*);
void	__stdcall LSLDH(long*, f_complex*, long*, f_complex*, f_complex*);
void	__stdcall L2LDH(long*, f_complex*, long*, f_complex*, f_complex*,
		f_complex*, f_complex*);
void	__stdcall LFCDH(long*, f_complex*, long*, f_complex*, long*, float*);
void	__stdcall L2CDH(long*, f_complex*, long*, f_complex*, long*, float*,
		f_complex*);
void	__stdcall LFTDH(long*, f_complex*, long*, f_complex*, long*);
void	__stdcall LFSDH(long*, f_complex*, long*, f_complex*, f_complex*);
void	__stdcall LFIDH(long*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, f_complex*);
void	__stdcall LFDDH(long*, f_complex*, long*, float*, float*);
void	__stdcall LSAHF(long*, f_complex*, long*, f_complex*, f_complex*);
void	__stdcall L2AHF(long*, f_complex*, long*, f_complex*, f_complex*,
		f_complex*, long*, f_complex*);
void	__stdcall LSLHF(long*, f_complex*, long*, f_complex*, f_complex*);
void	__stdcall L2LHF(long*, f_complex*, long*, f_complex*, f_complex*,
		f_complex*, long*, f_complex*);
void	__stdcall LFCHF(long*, f_complex*, long*, f_complex*, long*, long*,
		float*);
void	__stdcall L2CHF(long*, f_complex*, long*, f_complex*, long*, long*,
		float*, f_complex*);
void	__stdcall LFTHF(long*, f_complex*, long*, f_complex*, long*, long*);
void	__stdcall LFSHF(long*, f_complex*, long*, long*, f_complex*,
		f_complex*);
void	__stdcall LFIHF(long*, f_complex*, long*, f_complex*, long*, long*,
		f_complex*, f_complex*, f_complex*);
void	__stdcall LFDHF(long*, f_complex*, long*, long*, float*, float*);
void	__stdcall LSLTR(long*, float*, float*, float*, float*);
void	__stdcall LSLCR(long*, float*, float*, float*, long*, float*, float*,
		long*, long*);
void	__stdcall LSARB(long*, float*, long*, long*, long*, float*, long*,
		float*);
void	__stdcall L2ARB(long*, float*, long*, long*, long*, float*, long*,
		float*, float*, long*, float*);
void	__stdcall LSLRB(long*, float*, long*, long*, long*, float*, long*,
		float*);
void	__stdcall L2LRB(long*, float*, long*, long*, long*, float*, long*,
		float*, float*, long*, float*);
void	__stdcall LFCRB(long*, float*, long*, long*, long*, float*, long*,
		long*, float*);
void	__stdcall L2CRB(long*, float*, long*, long*, long*, float*, long*,
		long*, float*, float*);
void	__stdcall LFTRB(long*, float*, long*, long*, long*, float*, long*,
		long*);
void	__stdcall L2TRB(long*, float*, long*, long*, long*, float*, long*,
		long*, float*);
void	__stdcall LFSRB(long*, float*, long*, long*, long*, long*, float*,
		long*, float*);
void	__stdcall LFIRB(long*, float*, long*, long*, long*, float*, long*,
		long*, float*, long*, float*, float*);
void	__stdcall LFDRB(long*, float*, long*, long*, long*, long*, float*,
		float*);
void	__stdcall LSAQS(long*, float*, long*, long*, float*, float*);
void	__stdcall L2AQS(long*, float*, long*, long*, float*, float*, float*,
		float*);
void	__stdcall LSLQS(long*, float*, long*, long*, float*, float*);
void	__stdcall L2LQS(long*, float*, long*, long*, float*, float*, float*,
		float*);
void	__stdcall LSLPB(long*, float*, long*, long*, long*, float*);
void	__stdcall L2LPB(long*, float*, long*, long*, long*, float*, float*);
void	__stdcall LFCQS(long*, float*, long*, long*, float*, long*, float*);
void	__stdcall L2CQS(long*, float*, long*, long*, float*, long*, float*,
		float*);
void	__stdcall LFTQS(long*, float*, long*, long*, float*, long*);
void	__stdcall LFSQS(long*, float*, long*, long*, float*, float*);
void	__stdcall LFIQS(long*, float*, long*, long*, float*, long*, float*,
		float*, float*);
void	__stdcall LFDQS(long*, float*, long*, long*, float*, float*);
void	__stdcall LSLTQ(long*, f_complex*, f_complex*, f_complex*, f_complex*);
void	__stdcall LSLCQ(long*, f_complex*, f_complex*, f_complex*, long*,
		f_complex*, float*, long*, long*);
void	__stdcall LSACB(long*, f_complex*, long*, long*, long*, f_complex*,
		long*, f_complex*);
void	__stdcall L2ACB(long*, f_complex*, long*, long*, long*, f_complex*,
		long*, f_complex*, f_complex*, long*, f_complex*);
void	__stdcall LSLCB(long*, f_complex*, long*, long*, long*, f_complex*,
		long*, f_complex*);
void	__stdcall L2LCB(long*, f_complex*, long*, long*, long*, f_complex*,
		long*, f_complex*, f_complex*, long*, f_complex*);
void	__stdcall LFCCB(long*, f_complex*, long*, long*, long*, f_complex*,
		long*, long*, float*);
void	__stdcall L2CCB(long*, f_complex*, long*, long*, long*, f_complex*,
		long*, long*, float*, f_complex*);
void	__stdcall LFTCB(long*, f_complex*, long*, long*, long*, f_complex*,
		long*, long*);
void	__stdcall L2TCB(long*, f_complex*, long*, long*, long*, f_complex*,
		long*, long*, f_complex*);
void	__stdcall LFSCB(long*, f_complex*, long*, long*, long*, long*,
		f_complex*, long*, f_complex*);
void	__stdcall LFICB(long*, f_complex*, long*, long*, long*, f_complex*,
		long*, long*, f_complex*, long*, f_complex*, f_complex*);
void	__stdcall LFDCB(long*, f_complex*, long*, long*, long*, long*,
		f_complex*, float*);
void	__stdcall LSAQH(long*, f_complex*, long*, long*, f_complex*,
		f_complex*);
void	__stdcall L2AQH(long*, f_complex*, long*, long*, f_complex*, f_complex*,
		f_complex*, f_complex*);
void	__stdcall LSLQH(long*, f_complex*, long*, long*, f_complex*,
		f_complex*);
void	__stdcall L2LQH(long*, f_complex*, long*, long*, f_complex*, f_complex*,
		f_complex*, f_complex*);
void	__stdcall LSLQB(long*, float*, long*, long*, long*, float*);
void	__stdcall L2LQB(long*, float*, long*, long*, long*, float*, float*,
		float*);
void	__stdcall LFCQH(long*, f_complex*, long*, long*, f_complex*, long*,
		float*);
void	__stdcall L2CQH(long*, f_complex*, long*, long*, f_complex*, long*,
		float*, f_complex*);
void	__stdcall LFTQH(long*, f_complex*, long*, long*, f_complex*, long*);
void	__stdcall LFSQH(long*, f_complex*, long*, long*, f_complex*,
		f_complex*);
void	__stdcall LFIQH(long*, f_complex*, long*, long*, f_complex*, long*,
		f_complex*, f_complex*, f_complex*);
void	__stdcall LFDQH(long*, f_complex*, long*, long*, float*, float*);
void	__stdcall LSLXG(long*, long*, float*, long*, long*, float*, long*,
		long*, float*, float*);
void	__stdcall L2LXG(long*, long*, float*, long*, long*, float*, long*,
		long*, float*, float*, float*, long*, long*, long*);
void	__stdcall L4LXG(long*, float*);
void	__stdcall LFTXG(long*, long*, float*, long*, long*, long*, float*,
		long*, long*, float*, long*, long*, long*, long*);
void	__stdcall L2TXG(long*, long*, float*, long*, long*, long*, float*,
		long*, long*, float*, long*, long*, long*, long*, float*, long*,
		long*, long*);
void	__stdcall LFSXG(long*, long*, long*, float*, long*, long*, long*, long*,
		float*, long*, float*);
void	__stdcall LSLZG(long*, long*, f_complex*, long*, long*, f_complex*,
		long*, long*, float*, f_complex*);
void	__stdcall L2LZG(long*, long*, f_complex*, long*, long*, f_complex*,
		long*, long*, float*, f_complex*, f_complex*, long*, long*,
		long*);
void	__stdcall L4LZG(long*, float*);
void	__stdcall LFTZG(long*, long*, f_complex*, long*, long*, long*, float*,
		long*, long*, f_complex*, long*, long*, long*, long*);
void	__stdcall L2TZG(long*, long*, f_complex*, long*, long*, long*, float*,
		long*, long*, f_complex*, long*, long*, long*, long*,
		f_complex*, long*, long*, long*);
void	__stdcall LFSZG(long*, long*, long*, f_complex*, long*, long*, long*,
		long*, f_complex*, long*, f_complex*);
void	__stdcall LSLXD(long*, long*, float*, long*, long*, float*, long*,
		float*);
void	__stdcall L2LXD(long*, long*, float*, long*, long*, float*, float*,
		long*, long*, float*, float*, long*, long*, long*);
void	__stdcall L4LXD(long*, float*);
void	__stdcall LSCXD(long*, long*, long*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*);
void	__stdcall L2CXD(long*, long*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*);
void	__stdcall LNFXD(long*, long*, float*, long*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, float*, float*,
		float*);
void	__stdcall L2FXD(long*, long*, float*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, float*, float*,
		float*, float*, long*, long*, long*);
void	__stdcall LFSXD(long*, long*, long*, long*, long*, float*, long*,
		float*, long*, float*, float*);
void	__stdcall LSLZD(long*, long*, f_complex*, long*, long*, f_complex*,
		long*, f_complex*);
void	__stdcall L2LZD(long*, long*, f_complex*, long*, long*, f_complex*,
		f_complex*, long*, long*, float*, f_complex*, long*, long*,
		long*);
void	__stdcall L4LZD(long*, float*);
void	__stdcall LNFZD(long*, long*, f_complex*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, long*,
		f_complex*, f_complex*, float*);
void	__stdcall L2FZD(long*, long*, f_complex*, long*, long*, long*, long*,
		long*, long*, long*, long*, long*, long*, long*, f_complex*,
		f_complex*, float*, f_complex*, long*, long*, long*);
void	__stdcall LFSZD(long*, long*, long*, long*, long*, f_complex*, long*,
		f_complex*, long*, f_complex*, f_complex*);
void	__stdcall LSLTO(long*, float*, float*, long*, float*);
void	__stdcall L2LTO(long*, float*, float*, long*, float*, float*);
void	__stdcall LSLTC(long*, f_complex*, f_complex*, long*, f_complex*);
void	__stdcall L2LTC(long*, f_complex*, f_complex*, long*, f_complex*,
		f_complex*);
void	__stdcall LSLCC(long*, f_complex*, f_complex*, long*, f_complex*);
void	__stdcall L2LCC(long*, f_complex*, f_complex*, long*, f_complex*,
		f_complex*, float*);
void	__stdcall PCGRC(long*, long*, float*, float*, float*, float*, float*,
		long*);
void	__stdcall P2GRC(long*, long*, float*, float*, float*, float*, float*,
		long*, float*, float*, long*);
void	__stdcall JCGRC(long*, long*, float*, float*, float*, float*, float*,
		float*, long*);
void	__stdcall J2GRC(long*, long*, float*, float*, float*, float*, float*,
		float*, long*, float*, float*, long*);
void	__stdcall LQRRV(long*, long*, long*, float*, long*, float*, long*);
void	__stdcall L2RRV(long*, long*, long*, float*, long*, float*, long*,
		float*, long*, float*);
void	__stdcall LCLSQ(long*, long*, long*, float*, long*, float*, float*,
		long*, float*, float*, long*, float*, float*, float*, float*);
void	__stdcall L2LSQ(long*, long*, long*, float*, long*, float*, float*,
		long*, float*, float*, long*, float*, float*, float*, float*,
		float*, long*);
void	__stdcall LQRRR(long*, long*, float*, long*, long*, long*, float*,
		long*, float*, float*);
void	__stdcall L2RRR(long*, long*, float*, long*, long*, long*, float*,
		long*, float*, float*, float*);
void	__stdcall LQERR(long*, long*, float*, long*, float*, float*, long*);
void	__stdcall L2ERR(long*, long*, float*, long*, float*, float*, long*,
		float*);
void	__stdcall LQRSL(long*, long*, float*, long*, float*, float*, long*,
		float*, float*, float*, float*, float*);
void	__stdcall LUPQR(long*, long*, float*, float*, float*, float*, long*,
		float*, long*, long*, float*, long*, float*, long*);
void	__stdcall L2PQR(long*, long*, float*, float*, float*, float*, long*,
		float*, long*, long*, float*, long*, float*, long*, float*,
		float*);
void	__stdcall LCHRG(long*, float*, long*, long*, long*, float*, long*);
void	__stdcall LUPCH(long*, float*, long*, float*, float*, long*, float*,
		float*);
void	__stdcall LDNCH(long*, float*, long*, float*, float*, long*, float*,
		float*);
void	__stdcall LSVCR(long*, long*, f_complex*, long*, long*, float*, long*,
		f_complex*, f_complex*, long*, f_complex*, long*);
void	__stdcall L2VCR(long*, long*, f_complex*, long*, long*, float*, long*,
		f_complex*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*);

#ifndef IMSL_COMMON_SINGLE

void	__stdcall LSLRG(long*, float*, long*, float*, long*, float*);
void	__stdcall L2LRG(long*, float*, long*, float*, long*, float*, float*,
		long*, float*);
void	__stdcall LFTRG(long*, float*, long*, float*, long*, long*);
void	__stdcall L2TRG(long*, float*, long*, float*, long*, long*, float*);
void	__stdcall LFSRG(long*, float*, long*, long*, float*, long*, float*);
void	__stdcall LFDRG(long*, float*, long*, long*, float*, float*);
void	__stdcall LINRG(long*, float*, long*, float*, long*);
void	__stdcall L2NRG(long*, float*, long*, float*, long*, float*, long*);
void	__stdcall LSQRR(long*, long*, float*, long*, float*, float*, float*,
		float*, long*);
void	__stdcall L2QRR(long*, long*, float*, long*, float*, float*, float*,
		float*, long*, float*, float*, long*, float*);
void	__stdcall LSBRR(long*, long*, float*, long*, float*, float*, float*,
		float*, long*);
void	__stdcall L2BRR(long*, long*, float*, long*, float*, float*, float*,
		float*, long*, float*, float*, long*, float*);
void	__stdcall LSVRR(long*, long*, float*, long*, long*, float*, long*,
		float*, float*, long*, float*, long*);
void	__stdcall L2VRR(long*, long*, float*, long*, long*, float*, long*,
		float*, float*, long*, float*, long*, float*, float*);
void	__stdcall LSGRR(long*, long*, float*, long*, float*, long*, float*,
		long*);
void	__stdcall L2GRR(long*, long*, float*, long*, float*, long*, float*,
		long*, float*, float*);

#endif

/*
 *    Chapter 2:  Eigensystem Analysis
 */

void	__stdcall EVLRG(long*, float*, long*, f_complex*);
void	__stdcall E3LRG(long*, float*, long*, f_complex*, float*, float*,
		long*);
void	__stdcall EVCRG(long*, float*, long*, f_complex*, f_complex*, long*);
void	__stdcall E8CRG(long*, float*, long*, f_complex*, f_complex*, long*,
		float*, float*, float*, long*);
float	__stdcall EPIRG(long*, long*, float*, long*, f_complex*, f_complex*,
		long*);
float	__stdcall E2IRG(long*, long*, float*, long*, f_complex*, f_complex*,
		long*, f_complex*);
void	__stdcall EVLCG(long*, f_complex*, long*, f_complex*);
void	__stdcall E3LCG(long*, f_complex*, long*, f_complex*, f_complex*,
		float*, f_complex*, long*);
void	__stdcall EVCCG(long*, f_complex*, long*, f_complex*, f_complex*,
		long*);
void	__stdcall E6CCG(long*, f_complex*, long*, f_complex*, f_complex*, long*,
		f_complex*, float*, f_complex*, long*);
float	__stdcall EPICG(long*, long*, f_complex*, long*, f_complex*, f_complex*,
		long*);
float	__stdcall E2ICG(long*, long*, f_complex*, long*, f_complex*, f_complex*,
		long*, f_complex*);
void	__stdcall EVLSF(long*, float*, long*, float*);
void	__stdcall E4LSF(long*, float*, long*, float*, float*, long*);
void	__stdcall EVASF(long*, long*, float*, long*, long*, float*);
void	__stdcall E4ASF(long*, long*, float*, long*, long*, float*, float*,
		long*);
void	__stdcall EVESF(long*, long*, float*, long*, long*, float*, float*,
		long*);
void	__stdcall E5ESF(long*, long*, float*, long*, long*, float*, float*,
		long*, float*, long*);
void	__stdcall EVBSF(long*, long*, float*, long*, float*, float*, long*,
		float*);
void	__stdcall E5BSF(long*, long*, float*, long*, float*, float*, long*,
		float*, float*, long*);
void	__stdcall EVFSF(long*, long*, float*, long*, float*, float*, long*,
		float*, float*, long*);
void	__stdcall E3FSF(long*, long*, float*, long*, float*, float*, long*,
		float*, float*, long*, float*, long*);
void	__stdcall EVLSB(long*, float*, long*, long*, float*);
void	__stdcall E3LSB(long*, float*, long*, long*, float*, float*, float*);
void	__stdcall EVCSB(long*, float*, long*, long*, float*, float*, long*);
void	__stdcall E4CSB(long*, float*, long*, long*, float*, float*, long*,
		float*, float*, long*);
void	__stdcall EVASB(long*, long*, float*, long*, long*, long*, float*);
void	__stdcall E3ASB(long*, long*, float*, long*, long*, long*, float*,
		float*, float*);
void	__stdcall EVESB(long*, long*, float*, long*, long*, long*, float*,
		float*, long*);
void	__stdcall E4ESB(long*, long*, float*, long*, long*, long*, float*,
		float*, long*, float*, float*, long*);
void	__stdcall EVBSB(long*, long*, float*, long*, long*, float*, float*,
		long*, float*);
void	__stdcall E3BSB(long*, long*, float*, long*, long*, float*, float*,
		long*, float*, float*, float*);
void	__stdcall EVFSB(long*, long*, float*, long*, long*, float*, float*,
		long*, float*, float*, long*);
void	__stdcall E3FSB(long*, long*, float*, long*, long*, float*, float*,
		long*, float*, float*, long*, float*, float*, float*, long*);
float	__stdcall EPISB(long*, long*, float*, long*, long*, float*, float*,
		long*);
float	__stdcall E2ISB(long*, long*, float*, long*, long*, float*, float*,
		long*, float*);
void	__stdcall EVLHF(long*, f_complex*, long*, float*);
void	__stdcall E3LHF(long*, f_complex*, long*, float*, f_complex*, float*,
		f_complex*, long*);
void	__stdcall EVCHF(long*, f_complex*, long*, float*, f_complex*, long*);
void	__stdcall E5CHF(long*, f_complex*, long*, float*, f_complex*, long*,
		f_complex*, float*, f_complex*, long*);
void	__stdcall EVAHF(long*, long*, f_complex*, long*, long*, float*);
void	__stdcall E3AHF(long*, long*, f_complex*, long*, long*, float*,
		f_complex*, float*, f_complex*, long*);
void	__stdcall EVEHF(long*, long*, f_complex*, long*, long*, float*,
		f_complex*, long*);
void	__stdcall E3EHF(long*, long*, f_complex*, long*, long*, float*,
		f_complex*, long*, f_complex*, float*, float*, f_complex*,
		long*);
void	__stdcall EVBHF(long*, long*, f_complex*, long*, float*, float*, long*,
		float*);
void	__stdcall E3BHF(long*, long*, f_complex*, long*, float*, float*, long*,
		float*, f_complex*, float*, f_complex*, long*);
void	__stdcall EVFHF(long*, long*, f_complex*, long*, float*, float*, long*,
		float*, f_complex*, long*);
void	__stdcall E3FHF(long*, long*, f_complex*, long*, float*, float*, long*,
		float*, f_complex*, long*, f_complex*, float*, float*,
		f_complex*, long*);
float	__stdcall EPIHF(long*, long*, f_complex*, long*, float*, f_complex*,
		long*);
float	__stdcall E2IHF(long*, long*, f_complex*, long*, float*, f_complex*,
		long*, f_complex*);
void	__stdcall EVLRH(long*, float*, long*, f_complex*);
void	__stdcall E3LRH(long*, float*, long*, f_complex*, float*, float*,
		long*);
void	__stdcall EVCRH(long*, float*, long*, f_complex*, f_complex*, long*);
void	__stdcall E6CRH(long*, float*, long*, f_complex*, f_complex*, long*,
		float*, float*, float*, long*);
void	__stdcall EVLCH(long*, f_complex*, long*, f_complex*);
void	__stdcall E3LCH(long*, f_complex*, long*, f_complex*, f_complex*,
		float*, long*);
void	__stdcall EVCCH(long*, f_complex*, long*, f_complex*, f_complex*,
		long*);
void	__stdcall E4CCH(long*, f_complex*, long*, f_complex*, f_complex*, long*,
		f_complex*, f_complex*, float*, long*);
void	__stdcall GVLRG(long*, float*, long*, float*, long*, f_complex*,
		float*);
void	__stdcall G3LRG(long*, float*, long*, float*, long*, f_complex*, float*,
		float*, float*, float*, f_complex*, long*);
void	__stdcall GVCRG(long*, float*, long*, float*, long*, f_complex*, float*,
		f_complex*, long*);
void	__stdcall G8CRG(long*, float*, long*, float*, long*, f_complex*, float*,
		f_complex*, long*, float*, float*, float*, float*, f_complex*,
		long*);
float	__stdcall GPIRG(long*, long*, float*, long*, float*, long*, f_complex*,
		float*, f_complex*, long*);
float	__stdcall G2IRG(long*, long*, float*, long*, float*, long*, f_complex*,
		float*, f_complex*, long*, f_complex*);
void	__stdcall GVLCG(long*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*);
void	__stdcall G3LCG(long*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, f_complex*, f_complex*, f_complex*, float*, long*);
void	__stdcall GVCCG(long*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, f_complex*, long*);
void	__stdcall G6CCG(long*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, f_complex*, long*, f_complex*, f_complex*,
		f_complex*, float*, long*);
float	__stdcall GPICG(long*, long*, f_complex*, long*, f_complex*, long*,
		f_complex*, f_complex*, f_complex*, long*);
float	__stdcall G2ICG(long*, long*, f_complex*, long*, f_complex*, long*,
		f_complex*, f_complex*, f_complex*, long*, f_complex*);
void	__stdcall GVCSP(long*, float*, long*, float*, long*, float*, float*,
		long*);
void	__stdcall G3CSP(long*, float*, long*, float*, long*, float*, float*,
		long*, long*, float*, float*);
float	__stdcall GPISP(long*, long*, float*, long*, float*, long*, float*,
		float*, long*);
float	__stdcall G2ISP(long*, long*, float*, long*, float*, long*, float*,
		float*, long*, float*);

#ifndef IMSL_COMMON_SINGLE

void	__stdcall EVCSF(long*, float*, long*, float*, float*, long*);
void	__stdcall E5CSF(long*, float*, long*, float*, float*, long*, float*,
		long*);
float	__stdcall EPISF(long*, long*, float*, long*, float*, float*, long*);
float	__stdcall E2ISF(long*, long*, float*, long*, float*, float*, long*,
		float*);
void	__stdcall GVLSP(long*, float*, long*, float*, long*, float*);
void	__stdcall G3LSP(long*, float*, long*, float*, long*, float*, long*,
		float*, float*);

#endif

/*
 *    Chapter 3:  Interpolation and Approximation
 */

void	__stdcall CSIEZ(long*, float*, float*, long*, float*, float*);
void	__stdcall C2IEZ(long*, float*, float*, long*, float*, float*, long*,
		float*, float*);
void	__stdcall CSINT(long*, float*, float*, float*, float*);
void	__stdcall C2INT(long*, float*, float*, float*, float*, long*);
void	__stdcall CSDEC(long*, float*, float*, long*, float*, long*, float*,
		float*, float*);
void	__stdcall C2DEC(long*, float*, float*, long*, float*, long*, float*,
		float*, float*, long*);
void	__stdcall CSHER(long*, float*, float*, float*, float*, float*);
void	__stdcall C2HER(long*, float*, float*, float*, float*, float*, long*);
void	__stdcall CSAKM(long*, float*, float*, float*, float*);
void	__stdcall C2AKM(long*, float*, float*, float*, float*, long*);
void	__stdcall CSCON(long*, float*, float*, long*, float*, float*);
void	__stdcall C2CON(long*, float*, float*, long*, float*, float*, long*,
		float*, float*, float*, float*, float*, long*, float*);
void	__stdcall CSPER(long*, float*, float*, float*, float*);
void	__stdcall C2PER(long*, float*, float*, float*, float*, float*, long*);
float	__stdcall CSVAL(float*, long*, float*, float*);
float	__stdcall CSDER(long*, float*, long*, float*, float*);
void	__stdcall CS1GD(long*, long*, float*, long*, float*, float*, float*);
void	__stdcall C21GD(long*, long*, float*, long*, float*, float*, float*,
		long*, float*, float*);
float	__stdcall CSITG(float*, float*, long*, float*, float*);
void	__stdcall SPLEZ(long*, float*, float*, long*, long*, long*, float*,
		float*);
void	__stdcall S2LEZ(long*, float*, float*, long*, long*, long*, float*,
		float*, float*, long*);
void	__stdcall BSINT(long*, float*, float*, long*, float*, float*);
void	__stdcall B2INT(long*, float*, float*, long*, float*, float*, float*,
		float*, float*, long*);
void	__stdcall BSNAK(long*, float*, long*, float*);
void	__stdcall B2NAK(long*, float*, long*, float*, float*, long*);
void	__stdcall BSOPK(long*, float*, long*, float*);
void	__stdcall B2OPK(long*, float*, long*, float*, long*, float*, long*);
void	__stdcall BS2IN(long*, float*, long*, float*, float*, long*, long*,
		long*, float*, float*, float*);
void	__stdcall B22IN(long*, float*, long*, float*, float*, long*, long*,
		long*, float*, float*, float*, float*, long*);
void	__stdcall BS3IN(long*, float*, long*, float*, long*, float*, float*,
		long*, long*, long*, long*, long*, float*, float*, float*,
		float*);
void	__stdcall B23IN(long*, float*, long*, float*, long*, float*, float*,
		long*, long*, long*, long*, long*, float*, float*, float*,
		float*, float*, long*);
float	__stdcall BSVAL(float*, long*, float*, long*, float*);
float	__stdcall B2VAL(float*, long*, float*, long*, float*, float*, float*,
		float*);
float	__stdcall BSDER(long*, float*, long*, float*, long*, float*);
float	__stdcall B2DER(long*, float*, long*, float*, long*, float*, float*,
		float*, float*);
void	__stdcall BS1GD(long*, long*, float*, long*, float*, long*, float*,
		float*);
void	__stdcall B21GD(long*, long*, float*, long*, float*, long*, float*,
		float*, float*, float*, long*, float*, float*, float*);
float	__stdcall BSITG(float*, float*, long*, float*, long*, float*);
float	__stdcall B2ITG(float*, float*, long*, float*, long*, float*, float*,
		float*, float*, float*);
float	__stdcall BS2VL(float*, float*, long*, long*, float*, float*, long*,
		long*, float*);
float	__stdcall B22VL(float*, float*, long*, long*, float*, float*, long*,
		long*, float*, float*);
float	__stdcall BS2DR(long*, long*, float*, float*, long*, long*, float*,
		float*, long*, long*, float*);
float	__stdcall B22DR(long*, long*, float*, float*, long*, long*, float*,
		float*, long*, long*, float*, float*);
void	__stdcall BS2GD(long*, long*, long*, float*, long*, float*, long*,
		long*, float*, float*, long*, long*, float*, float*, long*);
void	__stdcall B22GD(long*, long*, long*, float*, long*, float*, long*,
		long*, float*, float*, long*, long*, float*, float*, long*,
		long*, long*, float*, float*, float*, float*, float*, float*);
float	__stdcall BS2IG(float*, float*, float*, float*, long*, long*, float*,
		float*, long*, long*, float*);
float	__stdcall B22IG(float*, float*, float*, float*, long*, long*, float*,
		float*, long*, long*, float*, float*);
float	__stdcall BS3VL(float*, float*, float*, long*, long*, long*, float*,
		float*, float*, long*, long*, long*, float*);
float	__stdcall B23VL(float*, float*, float*, long*, long*, long*, float*,
		float*, float*, long*, long*, long*, float*, float*);
float	__stdcall BS3DR(long*, long*, long*, float*, float*, float*, long*,
		long*, long*, float*, float*, float*, long*, long*, long*,
		float*);
float	__stdcall B23DR(long*, long*, long*, float*, float*, float*, long*,
		long*, long*, float*, float*, float*, long*, long*, long*,
		float*, float*);
void	__stdcall BS3GD(long*, long*, long*, long*, float*, long*, float*,
		long*, float*, long*, long*, long*, float*, float*, float*,
		long*, long*, long*, float*, float*, long*, long*);
void	__stdcall B23GD(long*, long*, long*, long*, float*, long*, float*,
		long*, float*, long*, long*, long*, float*, float*, float*,
		long*, long*, long*, float*, float*, long*, long*, long*, long*,
		long*, float*, float*, float*, float*, float*, float*, float*,
		float*, float*);
float	__stdcall BS3IG(float*, float*, float*, float*, float*, float*, long*,
		long*, long*, float*, float*, float*, long*, long*, long*,
		float*);
float	__stdcall B23IG(float*, float*, float*, float*, float*, float*, long*,
		long*, long*, float*, float*, float*, long*, long*, long*,
		float*, float*);
void	__stdcall BSCPP(long*, float*, long*, float*, long*, float*, float*);
void	__stdcall B2CPP(long*, float*, long*, float*, long*, float*, float*,
		float*);
float	__stdcall PPVAL(float*, long*, long*, float*, float*);
float	__stdcall PPDER(long*, float*, long*, long*, float*, float*);
void	__stdcall PP1GD(long*, long*, float*, long*, long*, float*, float*,
		float*);
void	__stdcall P21GD(long*, long*, float*, long*, long*, float*, float*,
		float*, long*, float*, float*);
float	__stdcall PPITG(float*, float*, long*, long*, float*, float*);
float	__stdcall QDVAL(float*, long*, float*, float*, long*);
float	__stdcall QDDER(long*, float*, long*, float*, float*, long*);
float	__stdcall QD2VL(float*, float*, long*, float*, long*, float*, float*,
		long*, long*);
float	__stdcall QD2DR(long*, long*, float*, float*, long*, float*, long*,
		float*, float*, long*, long*);
float	__stdcall QD3VL(float*, float*, float*, long*, float*, long*, float*,
		long*, float*, float*, long*, long*, long*);
float	__stdcall QD3DR(long*, long*, long*, float*, float*, float*, long*,
		float*, long*, float*, long*, float*, float*, long*, long*,
		long*);
void	__stdcall SURF(long*, float*, float*, long*, long*, float*, float*,
		float*, long*);
void	__stdcall S2RF(long*, float*, float*, long*, long*, float*, float*,
		float*, long*, long*, float*);
void	__stdcall FNLSQ(float(__stdcall *)(long*, float*), long*, long*, long*,
		float*, float*, long*, float*, float*, float*);
void	__stdcall F2LSQ(float(__stdcall *)(long*, float*), long*, long*, long*,
		float*, float*, long*, float*, float*, float*, float*);
void	__stdcall BSLSQ(long*, float*, float*, float*, long*, float*, long*,
		float*);
void	__stdcall B2LSQ(long*, float*, float*, float*, long*, float*, long*,
		float*, float*, float*, float*, float*, long*);
void	__stdcall BSVLS(long*, float*, float*, float*, long*, long*, float*,
		float*, float*, float*);
void	__stdcall B2VLS(long*, float*, float*, float*, long*, long*, float*,
		float*, float*, float*, long*, float*);
void	__stdcall CONFT(long*, float*, float*, float*, long*, float*, long*,
		long*, long*, float*, float*, long*, float*, long*, float*);
void	__stdcall C2NFT(long*, float*, float*, float*, long*, float*, long*,
		long*, long*, float*, float*, long*, float*, long*, float*,
		float*, float*, float*, float*, float*, long*, long*);
void	__stdcall BSLS2(long*, float*, long*, float*, float*, long*, long*,
		long*, float*, float*, long*, long*, float*, float*, float*);
void	__stdcall B2LS2(long*, float*, long*, float*, float*, long*, long*,
		long*, float*, float*, long*, long*, float*, float*, float*,
		float*);
void	__stdcall BSLS3(long*, float*, long*, float*, long*, float*, float*,
		long*, long*, long*, long*, long*, float*, float*, float*,
		long*, long*, long*, float*, float*, float*, float*);
void	__stdcall B2LS3(long*, float*, long*, float*, long*, float*, float*,
		long*, long*, long*, long*, long*, float*, float*, float*,
		long*, long*, long*, float*, float*, float*, float*, float*);
void	__stdcall CSSED(long*, float*, float*, float*, float*, long*, float*);
void	__stdcall C2SED(long*, float*, float*, float*, float*, long*, float*,
		float*, long*);
void	__stdcall CSSMH(long*, float*, float*, float*, float*, float*, float*);
void	__stdcall C2SMH(long*, float*, float*, float*, float*, float*, float*,
		float*, long*);
void	__stdcall CSSCV(long*, float*, float*, long*, float*, float*);
void	__stdcall C2SCV(long*, float*, float*, long*, float*, float*, float*,
		float*, long*);
void	__stdcall RATCH(float(__stdcall *)(float*), float(__stdcall *)(float*),
		float(__stdcall *)(float*), float*, float*, long*, long*,
		float*, float*, float*);
void	__stdcall R2TCH(float(__stdcall *)(float*), float(__stdcall *)(float*),
		float(__stdcall *)(float*), float*, float*, long*, long*,
		float*, float*, float*, long*, long*, float*);

#ifndef IMSL_COMMON_SINGLE

void	__stdcall RLINE(long*, float*, float*, float*, float*, float*);
void	__stdcall RCURV(long*, float*, float*, long*, float*, float*, float*);
void	__stdcall R2URV(long*, float*, float*, long*, float*, float*, float*,
		float*, long*);

#endif

/*
 *    Chapter 4:  Integration and Differentiation
 */

void	__stdcall QDAG(float(__stdcall *)(float*), float*, float*, float*,
		float*, long*, float*, float*);
void	__stdcall Q2AG(float(__stdcall *)(float*), float*, float*, float*,
		float*, long*, float*, float*, long*, long*, long*, float*,
		float*, float*, float*, long*);
void	__stdcall QDAGP(float(__stdcall *)(float*), float*, float*, long*,
		float*, float*, float*, float*, float*);
void	__stdcall Q2AGP(float(__stdcall *)(float*), float*, float*, long*,
		float*, float*, float*, float*, float*, long*, long*, long*,
		float*, float*, float*, float*, long*, long*, float*, long*);
void	__stdcall QDAGI(float(__stdcall *)(float*), float*, long*, float*,
		float*, float*, float*);
void	__stdcall Q2AGI(float*, float*, long*, float*, float*, float*, float*,
		long*, long*, long*, float*, float*, float*, float*, long*);
void	__stdcall QDAWO(float(__stdcall *)(float*), float*, float*, long*,
		float*, float*, float*, float*, float*);
void	__stdcall Q2AWO(float(__stdcall *)(float*), float*, float*, long*,
		float*, float*, float*, float*, float*, long*, long*, long*,
		long*, float*, float*, float*, float*, long*, long*, float*);
void	__stdcall QDAWF(float(__stdcall *)(float*), float*, long*, float*,
		float*, float*, float*);
void	__stdcall Q2AWF(float(__stdcall *)(float*), float*, long*, float*,
		float*, float*, float*, long*, long*, long*, long*, long*,
		float*, float*, long*, long*, float*, long*);
void	__stdcall QDAWS(float(__stdcall *)(float*), float*, float*, long*,
		float*, float*, float*, float*, float*, float*);
void	__stdcall Q2AWS(float(__stdcall *)(float*), float*, float*, long*,
		float*, float*, float*, float*, float*, float*, long*, long*,
		long*, float*, float*, float*, float*, long*);
void	__stdcall QDAWC(float(__stdcall *)(float*), float*, float*, float*,
		float*, float*, float*, float*);
void	__stdcall Q2AWC(float(__stdcall *)(float*), float*, float*, float*,
		float*, float*, float*, float*, long*, long*, long*, float*,
		float*, float*, float*, long*);
void	__stdcall QDNG(float(__stdcall *)(float*), float*, float*, float*,
		float*, float*, float*);
void	__stdcall TWODQ(float(__stdcall *)(float*, float*), float*, float*,
		float(__stdcall *)(float*), float(__stdcall *)(float*), float*,
		float*, long*, float*, float*);
void	__stdcall T2ODQ(float(__stdcall *)(float*, float*), float*, float*,
		float(__stdcall *)(float*), float(__stdcall *)(float*), float*,
		float*, long*, float*, float*, long*, long*, long*, float*,
		float*, float*, float*, long*, float*, long*);
void	__stdcall QAND(float(__stdcall *)(long*, float*), long*, float*, float*,
		float*, float*, long*, float*, float*);
void	__stdcall GQRUL(long*, long*, float*, float*, long*, float*, float*,
		float*);
void	__stdcall G2RUL(long*, long*, float*, float*, long*, float*, float*,
		float*, float*);
void	__stdcall GQRCF(long*, float*, float*, long*, float*, float*, float*);
void	__stdcall G2RCF(long*, float*, float*, long*, float*, float*, float*,
		float*);
void	__stdcall RECCF(long*, long*, float*, float*, float*, float*);
void	__stdcall RECQR(long*, float*, float*, long*, float*, float*);
void	__stdcall R2CQR(long*, float*, float*, long*, float*, float*, float*);
void	__stdcall FQRUL(long*, float*, float*, long*, float*, float*, float*,
		float*);
void	__stdcall F2RUL(long*, float*, float*, long*, float*, float*, float*,
		float*, float*);
float	__stdcall DERIV(float(__stdcall *)(float*), long*, float*, float*,
		float*);

#ifndef IMSL_COMMON_SINGLE

void	__stdcall QDAGS(float(__stdcall *)(float*), float*, float*, float*,
		float*, float*, float*);
void	__stdcall Q2AGS(float(__stdcall *)(float*), float*, float*, float*,
		float*, float*, float*, long*, long*, long*, float*, float*,
		float*, float*, long*);

#endif

/*
 *    Chapter 5:  Differential Equations
 */

void	__stdcall IVPRK(long*, long*, void(__stdcall *)(long*, float*, float*,
		float*), float*, float*, float*, float*, float*);
void	__stdcall I2PRK(long*, long*, void(__stdcall *)(long*, float*, float*,
		float*), float*, float*, float*, float*, float*,
		void(__stdcall *)(long*, float*, float*, float*, float*),
		float*);
void	__stdcall I3PRK(long*, float*, float*, float*, float*);
void	__stdcall IVPAG(long*, long*, void(__stdcall *)(long*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*),
		float*, float*, float*, float*, float*, float*);
void	__stdcall I2PAG(long*, long*, void(__stdcall *)(long*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*),
		float*, float*, float*, float*, float*, float*, float*, float*,
		float*, float*, float*, float*, long*, void(__stdcall *)(long*,
		float*, float*, float*, float*));
void	__stdcall BVPFD(void(__stdcall *)(long*, float*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*,
		float*), long*, long*, long*, float*, float*, float*, float*,
		long*, float*, float*, long*, long*, long*, long*, long*,
		float*, float*, long*, float*);
void	__stdcall B2PFD(void(__stdcall *)(long*, float*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*,
		float*), long*, long*, long*, float*, float*, float*, float*,
		long*, float*, float*, long*, long*, long*, long*, long*,
		float*, float*, long*, float*, float*, long*);
void	__stdcall BVPMS(void(__stdcall *)(long*, float*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*,
		float*), long*, float*, float*, float*, float*, long*, long*,
		float*, float*, long*, long*, long*, float*, float*, long*);
void	__stdcall B2PMS(void(__stdcall *)(long*, float*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*,
		float*), void(__stdcall *)(long*, float*, float*, float*,
		float*), long*, float*, float*, float*, float*, long*, long*,
		float*, float*, long*, long*, long*, float*, float*, long*,
		float*, long*);
void	__stdcall DASPG(long*, float*, float*, long*, float*, float*,
		void(__stdcall *)(long*, float*, float*, float*, float*));
void	__stdcall D2SPG(long*, float*, float*, long*, float*, float*,
		void(__stdcall *)(long*, float*, float*, float*, float*),
		void(__stdcall *)(long*, float*, float*, float*, float*, float*,
		long*), long*, float*);
void	__stdcall DGSPG(long*, float*, float*, float*, float*);
void	__stdcall DJSPG(long*, float*, float*, float*, float*, float*, long*);
void	__stdcall MOLCH(long*, void(__stdcall *)(long*, float*, float*, float*,
		float*, float*, float*), void(__stdcall *)(long*, float*,
		float*, float*, float*, float*), long*, float*, float*, long*,
		float*, float*, float*, float*, long*);
void	__stdcall M2LCH(long*, void(__stdcall *)(long*, float*, float*, float*,
		float*, float*, float*), void(__stdcall *)(long*, float*,
		float*, float*, float*, float*), long*, float*, float*, long*,
		float*, float*, float*, float*, long*, float*, long*);
void	__stdcall FPS2H(float(__stdcall *)(float*, float*),
		float(__stdcall *)(long*, float*, float*), float*, long*, long*,
		float*, float*, float*, float*, long*, long*, float*, long*);
void	__stdcall F2S2H(float(__stdcall *)(float*, float*),
		float(__stdcall *)(long*, float*, float*), float*, long*, long*,
		float*, float*, float*, float*, long*, long*, float*, long*,
		float*, float*);
void	__stdcall FPS3H(float(__stdcall *)(float*, float*, float*),
		float(__stdcall *)(long*, float*, float*, float*), float*,
		long*, long*, long*, float*, float*, float*, float*, float*,
		float*, long*, long*, float*, long*, long*);
void	__stdcall F2S3H(float(__stdcall *)(float*, float*, float*),
		float(__stdcall *)(long*, float*, float*, float*), float*,
		long*, long*, long*, float*, float*, float*, float*, float*,
		float*, long*, long*, float*, long*, long*, float*, float*);

/*
 *    Chapter 6:  Transforms
 */

void	__stdcall FFTCF(long*, f_complex*, f_complex*);
void	__stdcall F2TCF(long*, f_complex*, f_complex*, float*, float*);
void	__stdcall FFTCB(long*, f_complex*, f_complex*);
void	__stdcall F2TCB(long*, f_complex*, f_complex*, float*, float*);
void	__stdcall FFTCI(long*, float*);
void	__stdcall FSINT(long*, float*, float*);
void	__stdcall F2INT(long*, float*, float*, float*);
void	__stdcall FSINI(long*, float*);
void	__stdcall FCOST(long*, float*, float*);
void	__stdcall F2OST(long*, float*, float*, float*);
void	__stdcall FCOSI(long*, float*);
void	__stdcall QSINF(long*, float*, float*);
void	__stdcall Q2INF(long*, float*, float*, float*);
void	__stdcall QSINB(long*, float*, float*);
void	__stdcall Q2INB(long*, float*, float*, float*);
void	__stdcall QSINI(long*, float*);
void	__stdcall QCOSF(long*, float*, float*);
void	__stdcall Q2OSF(long*, float*, float*, float*);
void	__stdcall QCOSB(long*, float*, float*);
void	__stdcall Q2OSB(long*, float*, float*, float*);
void	__stdcall QCOSI(long*, float*);
void	__stdcall FFT2D(long*, long*, f_complex*, long*, f_complex*, long*);
void	__stdcall F2T2D(long*, long*, f_complex*, long*, f_complex*, long*,
		float*, float*, f_complex*, float*);
void	__stdcall FFT2B(long*, long*, f_complex*, long*, f_complex*, long*);
void	__stdcall F2T2B(long*, long*, f_complex*, long*, f_complex*, long*,
		float*, float*, f_complex*, float*);
void	__stdcall FFT3F(long*, long*, long*, f_complex*, long*, long*,
		f_complex*, long*, long*);
void	__stdcall F2T3F(long*, long*, long*, f_complex*, long*, long*,
		f_complex*, long*, long*, float*, float*, float*, float*);
void	__stdcall FFT3B(long*, long*, long*, f_complex*, long*, long*,
		f_complex*, long*, long*);
void	__stdcall F2T3B(long*, long*, long*, f_complex*, long*, long*,
		f_complex*, long*, long*, float*, float*, float*, float*);
void	__stdcall RCONV(long*, long*, float*, long*, float*, long*, long*,
		float*, float*);
void	__stdcall R2ONV(long*, long*, float*, long*, float*, long*, long*,
		float*, float*, float*, float*, float*);
void	__stdcall CCONV(long*, long*, f_complex*, long*, f_complex*, long*,
		long*, f_complex*, f_complex*);
void	__stdcall C2ONV(long*, long*, f_complex*, long*, f_complex*, long*,
		long*, f_complex*, f_complex*, f_complex*, f_complex*, float*);
void	__stdcall RCORL(long*, long*, float*, float*, long*, long*, float*,
		float*);
void	__stdcall R2ORL(long*, long*, float*, float*, long*, long*, float*,
		float*, float*, float*, float*);
void	__stdcall CCORL(long*, long*, f_complex*, f_complex*, long*, long*,
		f_complex*, f_complex*);
void	__stdcall C2ORL(long*, long*, f_complex*, f_complex*, long*, long*,
		f_complex*, f_complex*, f_complex*, f_complex*, float*);
void	__stdcall INLAP(f_complex(__stdcall *)(f_complex*), long*, float*,
		float*, float*, long*, float*);
void	__stdcall SINLP(f_complex(__stdcall *)(f_complex*), long*, float*,
		float*, float*, float*, float*);
void	__stdcall S2NLP(f_complex(__stdcall *)(f_complex*), long*, float*,
		float*, float*, float*, float*, float*, float*, long*, float*,
		long*);

#ifndef IMSL_COMMON_SINGLE

void	__stdcall FFTRF(long*, float*, float*);
void	__stdcall F2TRF(long*, float*, float*, float*);
void	__stdcall FFTRB(long*, float*, float*);
void	__stdcall F2TRB(long*, float*, float*, float*);
void	__stdcall FFTRI(long*, float*);

#endif

/*
 *    Chapter 7:  Nonlinear Equations
 */

void	__stdcall ZPLRC(long*, float*, f_complex*);
void	__stdcall ZPORC(long*, float*, f_complex*);
void	__stdcall ZPOCC(long*, f_complex*, f_complex*);
void	__stdcall ZANLY(f_complex(__stdcall *)(f_complex*), float*, float*,
		long*, long*, long*, f_complex*, long*, f_complex*, long*);
void	__stdcall ZBREN(float(__stdcall *)(float*), float*, float*, float*,
		float*, long*);
void	__stdcall ZREAL(float(__stdcall *)(float*), float*, float*, float*,
		float*, long*, long*, float*, float*, long*);
void	__stdcall NEQNF(void(__stdcall *)(float*, float*, long*), float*, long*,
		long*, float*, float*, float*);
void	__stdcall N2QNF(void(__stdcall *)(float*, float*, long*), float*, long*,
		long*, float*, float*, float*, float*, float*, float*, float*,
		float*);
void	__stdcall NEQNJ(void(__stdcall *)(float*, float*, long*),
		void(__stdcall *)(long*, float*, float*), float*, long*, long*,
		float*, float*, float*);
void	__stdcall N2QNJ(void(__stdcall *)(float*, float*, long*),
		void(__stdcall *)(long*, float*, float*), float*, long*, long*,
		float*, float*, float*, float*, float*, float*, float*, float*);
void	__stdcall NEQBF(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, long*, float*, float*, float*);
void	__stdcall N2QBF(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, long*, float*, float*, float*, float*, long*);
void	__stdcall NEQBJ(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*, long*), long*, float*,
		float*, float*, long*, float*, float*, float*);
void	__stdcall N2QBJ(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*, long*), long*, float*,
		float*, float*, long*, float*, float*, float*, float*, long*);
void	__stdcall N4QBJ(long*, float*);

/*
 *    Chapter 8:  Optimization
 */

void	__stdcall UVMIF(float*, float*, float*, float*, float*, long*, float*);
void	__stdcall UVMID(float(__stdcall *)(float*), float(__stdcall *)(float*),
		float*, float*, float*, long*, float*, float*, float*, float*,
		float*);
void	__stdcall UVMGS(float(__stdcall *)(float*), float*, float*, float*,
		float*);
void	__stdcall UMING(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*), long*, float*, float*,
		float*, long*, float*, float*, float*);
void	__stdcall U2ING(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*), long*, float*, float*,
		float*, long*, float*, float*, float*, float*);
void	__stdcall UMIDH(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*), long*, float*, float*,
		float*, long*, float*, float*, float*);
void	__stdcall U2IDH(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*), long*, float*, float*,
		float*, long*, float*, float*, float*, float*);
void	__stdcall UMIAH(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*, long*), long*, float*,
		float*, float*, long*, float*, float*, float*);
void	__stdcall U2IAH(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*, long*), long*, float*,
		float*, float*, long*, float*, float*, float*, float*);
void	__stdcall UMCGF(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, long*, float*, float*, float*, float*);
void	__stdcall U2CGF(void(__stdcall *)(long*, float*, float*), long*,
		float*, float*, float*, long*, float*, float*, float*, float*,
		float*, float*, float*, float*, float*, float*);
void	__stdcall UMCGG(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*), long*, float*, float*,
		long*, float*, float*, float*, float*);
void	__stdcall U2CGG(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*), long*, float*, float*,
		long*, float*, float*, float*, float*, float*, float*, float*,
		float*, float*, float*);
void	__stdcall UMPOL(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, long*, float*, float*);
void	__stdcall U2POL(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, long*, float*, float*, float*);
void	__stdcall UNLSF(void(__stdcall *)(long*, long*, float*, float*), long*,
		long*, float*, float*, float*, long*, float*, float*, float*,
		float*, long*);
void	__stdcall U2LSF(void(__stdcall *)(long*, long*, float*, float*), long*,
		long*, float*, float*, float*, long*, float*, float*, float*,
		float*, long*, float*, long*);
void	__stdcall U4LSF(long*, float*);
void	__stdcall UNLSJ(void(__stdcall *)(long*, long*, float*, float*),
		void(__stdcall *)(long*, long*, float*, float*, long*), long*,
		long*, float*, float*, float*, long*, float*, float*, float*,
		float*, long*);
void	__stdcall U2LSJ(void(__stdcall *)(long*, long*, float*, float*),
		void(__stdcall *)(long*, long*, float*, float*, long*), long*,
		long*, float*, float*, float*, long*, float*, float*, float*,
		float*, long*, float*, long*);
void	__stdcall BCONF(void(__stdcall *)(long*, float*, float*), long*, float*,
		long*, float*, float*, float*, float*, long*, float*, float*,
		float*);
void	__stdcall B2ONF(void(__stdcall *)(long*, float*, float*), long*, float*,
		long*, float*, float*, float*, float*, long*, float*, float*,
		float*, float*, long*);
void	__stdcall BCONG(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*), long*, float*, long*,
		float*, float*, float*, float*, long*, float*, float*, float*);
void	__stdcall B2ONG(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*), long*, float*, long*,
		float*, float*, float*, float*, long*, float*, float*, float*,
		float*, long*);
void	__stdcall BCODH(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*), long*, float*, long*,
		float*, float*, float*, float*, long*, float*, float*, float*);
void	__stdcall B2ODH(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*), long*, float*, long*,
		float*, float*, float*, float*, long*, float*, float*, float*,
		float*, long*);
void	__stdcall BCOAH(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*, long*), long*, float*,
		long*, float*, float*, float*, float*, long*, float*, float*,
		float*);
void	__stdcall B2OAH(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*, long*), long*, float*,
		long*, float*, float*, float*, float*, long*, float*, float*,
		float*, float*, long*);
void	__stdcall BCPOL(void(__stdcall *)(long*, float*, float*), long*, float*,
		long*, float*, float*, float*, long*, float*, float*);
void	__stdcall B2POL(void(__stdcall *)(long*, float*, float*), long*, float*,
		long*, float*, float*, float*, long*, float*, float*, float*);
void	__stdcall BCLSF(void(__stdcall *)(long*, long*, float*, float*), long*,
		long*, float*, long*, float*, float*, float*, float*, long*,
		float*, float*, float*, float*, long*);
void	__stdcall B2LSF(void(__stdcall *)(long*, long*, float*, float*), long*,
		long*, float*, long*, float*, float*, float*, float*, long*,
		float*, float*, float*, float*, long*, float*, long*);
void	__stdcall BCLSJ(void(__stdcall *)(long*, long*, float*, float*),
		void(__stdcall *)(long*, long*, float*, float*, long*), long*,
		long*, float*, long*, float*, float*, float*, float*, long*,
		float*, float*, float*, float*, long*);
void	__stdcall B2LSJ(void(__stdcall *)(long*, long*, float*, float*),
		void(__stdcall *)(long*, long*, float*, float*, long*), long*,
		long*, float*, long*, float*, float*, float*, float*, long*,
		float*, float*, float*, float*, long*, float*, long*);
void	__stdcall DLPRS(long*, long*, float*, long*, float*, float*, float*,
		long*, float*, float*, float*, float*, float*);
void	__stdcall D2PRS(long*, long*, float*, long*, float*, float*, float*,
		long*, float*, float*, float*, float*, float*, float*, long*,
		float*, long*);
void	__stdcall QPROG(long*, long*, long*, float*, long*, float*, float*,
		float*, long*, float*, float*, long*, long*, float*);
void	__stdcall Q2ROG(long*, long*, long*, float*, long*, float*, float*,
		float*, long*, float*, float*, long*, long*, float*, float*);
void	__stdcall LCONF(void(__stdcall *)(long*, float*, float*), long*, long*,
		long*, float*, long*, float*, float*, float*, float*, float*,
		long*, float*, float*, long*, long*, float*);
void	__stdcall L2ONF(void(__stdcall *)(long*, float*, float*), long*, long*,
		long*, float*, long*, float*, float*, float*, float*, float*,
		long*, float*, float*, long*, long*, float*, long*, long*,
		float*);
void	__stdcall LCONG(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*), long*, long*, long*,
		float*, long*, float*, float*, float*, float*, float*, long*,
		float*, float*, long*, long*, float*);
void	__stdcall L2ONG(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*), long*, long*, long*,
		float*, long*, float*, float*, float*, float*, float*, long*,
		float*, float*, long*, long*, float*, long*, long*, float*);
void	__stdcall NCONF(void(__stdcall *)(long*, long*, long*, float*, float*,
		float*, float*), long*, long*, long*, float*, long*, float*,
		float*, float*, long*, long*, float*, float*);
void	__stdcall N2ONF(void(__stdcall *)(long*, long*, long*, float*, float*,
		float*, float*), long*, long*, long*, float*, long*, float*,
		float*, float*, long*, long*, float*, float*, float*, long*,
		long*, long*, float*);
void	__stdcall N0ONF(long*, long*, long*, long*, long*, float*, float*,
		long*, long*, float*, float*, float*, float*, float*, long*,
		float*, float*, long*, float*, float*, float*, long*, long*,
		long*, float*, long*, float*);
void	__stdcall NCONG(void(__stdcall *)(long*, long*, long*, float*, float*,
		float*, float*), void(__stdcall *)(long*, long*, long*, long*,
		float*, float*, float*, float*, float*, float*), long*, long*,
		long*, float*, long*, float*, float*, long*, long*, float*,
		float*);
void	__stdcall N2ONG(void(__stdcall *)(long*, long*, long*, float*, float*,
		float*, float*), void(__stdcall *)(long*, long*, long*, long*,
		float*, float*, float*, float*, float*, float*), long*, long*,
		long*, float*, long*, float*, float*, long*, long*, float*,
		float*, float*, long*, long*, long*);
void	__stdcall CDGRD(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, float*);
void	__stdcall FDGRD(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, float*, float*);
void	__stdcall FDHES(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, float*, float*, long*);
void	__stdcall F2HES(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, float*, float*, long*, float*, float*);
void	__stdcall GDHES(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, float*, float*, long*);
void	__stdcall G2HES(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, float*, float*, long*, float*);
void	__stdcall FDJAC(void(__stdcall *)(long*, long*, float*, float*), long*,
		long*, float*, float*, float*, float*, float*, long*);
void	__stdcall F2JAC(void(__stdcall *)(long*, long*, float*, float*), long*,
		long*, float*, float*, float*, float*, float*, long*, float*);
void	__stdcall CHGRD(void(__stdcall *)(long*, float*, float*), float*, long*,
		float*, long*);
void	__stdcall C2GRD(void(__stdcall *)(long*, float*, float*), float*, long*,
		float*, long*, float*, float*, float*, float*);
void	__stdcall CHHES(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*, long*), long*, float*,
		long*, long*);
void	__stdcall C2HES(void(__stdcall *)(long*, float*, float*),
		void(__stdcall *)(long*, float*, float*, long*), long*, float*,
		long*, long*, float*, float*, float*, float*, float*, long*,
		float*);
void	__stdcall CHJAC(void(__stdcall *)(long*, long*, float*, float*),
		void(__stdcall *)(long*, long*, float*, float*, long*), long*,
		long*, float*, long*, long*);
void	__stdcall C2JAC(void(__stdcall *)(long*, long*, float*, float*),
		void(__stdcall *)(long*, long*, float*, float*, long*), long*,
		long*, float*, long*, long*, float*, float*, float*, float*,
		float*, long*, float*);
void	__stdcall GGUES(long*, float*, float*, long*, long*, float*);
void	__stdcall G2UES(long*, float*, float*, long*, long*, float*, float*,
		long*);

#ifndef IMSL_COMMON_SINGLE

void	__stdcall UMINF(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, long*, float*, float*, float*);
void	__stdcall U2INF(void(__stdcall *)(long*, float*, float*), long*, float*,
		float*, float*, long*, float*, float*, float*, float*);
void	__stdcall U4INF(long*, float*);

#endif

/*
 *    Chapter 9:  Basic Matrix/Vector Operations
 */

void	__stdcall CRGRG(long*, float*, long*, float*, long*);
void	__stdcall CCGCG(long*, f_complex*, long*, f_complex*, long*);
void	__stdcall CRBRB(long*, float*, long*, long*, long*, float*, long*,
		long*, long*);
void	__stdcall CCBCB(long*, f_complex*, long*, long*, long*, f_complex*,
		long*, long*, long*);
void	__stdcall CRGRB(long*, float*, long*, long*, long*, float*, long*);
void	__stdcall CRBRG(long*, float*, long*, long*, long*, float*, long*);
void	__stdcall CCGCB(long*, f_complex*, long*, long*, long*, f_complex*,
		long*);
void	__stdcall CCBCG(long*, f_complex*, long*, long*, long*, f_complex*,
		long*);
void	__stdcall CRGCG(long*, float*, long*, f_complex*, long*);
void	__stdcall CRRCR(long*, long*, float*, long*, long*, long*, f_complex*,
		long*);
void	__stdcall CRBCB(long*, float*, long*, long*, long*, f_complex*, long*,
		long*, long*);
void	__stdcall CSFRG(long*, float*, long*);
void	__stdcall CHFCG(long*, f_complex*, long*);
void	__stdcall CSBRB(long*, float*, long*, long*, float*, long*, long*,
		long*);
void	__stdcall CHBCB(long*, f_complex*, long*, long*, f_complex*, long*,
		long*, long*);
void	__stdcall MXYTF(long*, long*, float*, long*, long*, long*, float*,
		long*, long*, long*, float*, long*);
void	__stdcall MCRCR(long*, long*, f_complex*, long*, long*, long*,
		f_complex*, long*, long*, long*, f_complex*, long*);
void	__stdcall HRRRR(long*, long*, float*, long*, long*, long*, float*,
		long*, long*, long*, float*, long*);
void	__stdcall POLRG(long*, float*, long*, long*, float*, float*, long*);
void	__stdcall P2LRG(long*, float*, long*, long*, float*, float*, long*,
		float*);
void	__stdcall MURRV(long*, long*, float*, long*, long*, float*, long*,
		long*, float*);
void	__stdcall MURBV(long*, float*, long*, long*, long*, long*, float*,
		long*, long*, float*);
void	__stdcall MUCRV(long*, long*, f_complex*, long*, long*, f_complex*,
		long*, long*, f_complex*);
void	__stdcall MUCBV(long*, f_complex*, long*, long*, long*, long*,
		f_complex*, long*, long*, f_complex*);
void	__stdcall ARBRB(long*, float*, long*, long*, long*, float*, long*,
		long*, long*, float*, long*, long*, long*);
void	__stdcall ACBCB(long*, f_complex*, long*, long*, long*, f_complex*,
		long*, long*, long*, f_complex*, long*, long*, long*);
void	__stdcall NRIRR(long*, long*, float*, long*, float*);
void	__stdcall NR1RR(long*, long*, float*, long*, float*);
void	__stdcall NR2RR(long*, long*, float*, long*, float*);
void	__stdcall NR1RB(long*, float*, long*, long*, long*, float*);
void	__stdcall NR1CB(long*, f_complex*, long*, long*, long*, float*);
float	__stdcall DISLI(long*, float*, long*, float*, long*);
float	__stdcall DISL2(long*, float*, long*, float*, long*);
float	__stdcall DISL1(long*, float*, long*, float*, long*);
void	__stdcall VCONR(long*, float*, long*, float*, long*, float*);
void	__stdcall V2ONR(long*, float*, long*, float*, long*, float*, f_complex*,
		f_complex*, f_complex*, float*);
void	__stdcall VCONC(long*, f_complex*, long*, f_complex*, long*,
		f_complex*);
void	__stdcall V2ONC(long*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, f_complex*, float*);

#ifndef IMSL_MATH_COMMON

void	__stdcall TRNRR(long*, long*, float*, long*, long*, long*, float*,
		long*);
void	__stdcall MXTXF(long*, long*, float*, long*, long*, float*, long*);
void	__stdcall MXTYF(long*, long*, float*, long*, long*, long*, float*,
		long*, long*, long*, float*, long*);
void	__stdcall MRRRR(long*, long*, float*, long*, long*, long*, float*,
		long*, long*, long*, float*, long*);
float	__stdcall BLINF(long*, long*, float*, long*, float*, float*);
void	__stdcall DQADD(double*, double*);
void	__stdcall DQINI(double*, double*);
void	__stdcall DQMUL(double*, double*, double*);
void	__stdcall DQSTO(double*, double*);
void	__stdcall ZQADD(d_complex*, double*);
void	__stdcall ZQINI(d_complex*, double*);
void	__stdcall ZQMUL(d_complex*, d_complex*, double*);
void	__stdcall ZQSTO(double*, d_complex*);

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
 *    Chapter 10:  Utilities
 */

void	__stdcall WRCRN(char*, unsigned int, long*, long*, f_complex*, long*,
		long*);
void	__stdcall WRCRL(char*, unsigned int, long*, long*, f_complex*, long*,
		long*, char*, unsigned int, char*, unsigned int, char*,
		unsigned int);
void	__stdcall W2CRL(char*, unsigned int, long*, long*, f_complex*, long*,
		long*, char*, unsigned int, char*, unsigned int, char*,
		unsigned int, char*, unsigned int);
void	__stdcall SVRBN(long*, float*, float*);
void	__stdcall SVRBP(long*, float*, float*, long*);
float	__stdcall CONST(char*, unsigned int);
void	__stdcall CUNIT(float*, char*, unsigned int, float*, char*,
		unsigned int);
float	__stdcall HYPOT(float*, float*);

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
float	__stdcall RNUNF(void);
void	__stdcall RNUN(long*, float*);
void	__stdcall PLOTP(long*, long*, float*, float*, long*, long*, float*,
		char*, unsigned int, char*, unsigned int, char*, unsigned int,
		char*, unsigned int);

#endif

/*
 *    Special Functions Chapter 1:  Elementary Functions
 */

float	__stdcall CARG(f_complex*);
float	__stdcall CBRT(float*);
void	__stdcall CCBRT(f_complex*, f_complex*);
float	__stdcall EXPRL(float*);
void	__stdcall CLOG10(f_complex*, f_complex*);
float	__stdcall ALNREL(float*);

#ifndef IMSL_MATH_COMMON

void	__stdcall CEXPRL(f_complex*, f_complex*);
void	__stdcall CLNREL(f_complex*, f_complex*);

#endif

/*
 *    Special Functions Chapter 2:  Trigonometric and Hyperbolic
 *                                  Functions
 */

void	__stdcall CTAN(f_complex*, f_complex*);
float	__stdcall COT(float*);
void	__stdcall CCOT(f_complex*, f_complex*);
float	__stdcall SINDG(float*);
float	__stdcall COSDG(float*);
void	__stdcall CASIN(f_complex*, f_complex*);
void	__stdcall CACOS(f_complex*, f_complex*);
void	__stdcall CATAN(f_complex*, f_complex*);
void	__stdcall CATAN2(f_complex*, f_complex*, f_complex*);
void	__stdcall CSINH(f_complex*, f_complex*);
void	__stdcall CCOSH(f_complex*, f_complex*);
void	__stdcall CTANH(f_complex*, f_complex*);
float	__stdcall ASINH(float*);
void	__stdcall CASINH(f_complex*, f_complex*);
float	__stdcall ACOSH(float*);
void	__stdcall CACOSH(f_complex*, f_complex*);
float	__stdcall ATANH(float*);
void	__stdcall CATANH(f_complex*, f_complex*);

/*
 *    Special Functions Chapter 3:  Exponential Integrals and Related
 *                                  Functions
 */

float	__stdcall EI(float*);
float	__stdcall E1(float*);
void	__stdcall ENE(float*, long*, float*);
float	__stdcall ALI(float*);
float	__stdcall SI(float*);
float	__stdcall CI(float*);
float	__stdcall CIN(float*);
float	__stdcall SHI(float*);
float	__stdcall CHI(float*);
float	__stdcall CINH(float*);

/*
 *    Special Functions Chapter 4:  Gamma Function and Related Functions
 */

float	__stdcall FAC(long*);
float	__stdcall GAMR(float*);
float	__stdcall ALNGAM(float*);
void	__stdcall ALGAMS(float*, float*, float*);
float	__stdcall GAMI(float*, float*);
float	__stdcall GAMIC(float*, float*);
float	__stdcall GAMIT(float*, float*);
float	__stdcall PSI(float*);
float	__stdcall POCH(float*, float*);
float	__stdcall POCH1(float*, float*);
float	__stdcall ALBETA(float*, float*);
float	__stdcall BETAI(float*, float*, float*);

#ifndef IMSL_MATH_COMMON

void	__stdcall CGAMMA(f_complex*, f_complex*);
void	__stdcall CGAMR(f_complex*, f_complex*);
void	__stdcall CLNGAM(f_complex*, f_complex*);
void	__stdcall CPSI(f_complex*, f_complex*);
void	__stdcall CBETA(f_complex*, f_complex*, f_complex*);
void	__stdcall CLBETA(f_complex*, f_complex*, f_complex*);

#endif

#ifndef IMSL_COMMON_SINGLE

float	__stdcall BINOM(long*, long*);
float	__stdcall GAMMA(float*);
void	__stdcall R9GAML(float*, float*);
float	__stdcall BETA(float*, float*);

#endif

/*
 *    Special Functions Chapter 5:  Error Function and Related Functions
 */

float	__stdcall ERF(float*);
float	__stdcall ERFC(float*);
float	__stdcall ERFCE(float*);
void	__stdcall CERFE(f_complex*, f_complex*);
float	__stdcall ERFI(float*);
float	__stdcall ERFCI(float*);
float	__stdcall DAWS(float*);
float	__stdcall FRESC(float*);
float	__stdcall FRESS(float*);

/*
 *    Special Functions Chapter 6:  Bessel Functions
 */

float	__stdcall BSJ0(float*);
float	__stdcall BSJ1(float*);
float	__stdcall BSY0(float*);
float	__stdcall BSY1(float*);
float	__stdcall BSI0(float*);
float	__stdcall BSI1(float*);
float	__stdcall BSK0(float*);
float	__stdcall BSK1(float*);
float	__stdcall BSI0E(float*);
float	__stdcall BSI1E(float*);
float	__stdcall BSK0E(float*);
float	__stdcall BSK1E(float*);
void	__stdcall BSJNS(float*, long*, float*);
void	__stdcall CBJNS(f_complex*, long*, f_complex*);
void	__stdcall BSINS(float*, long*, float*);
void	__stdcall CBINS(f_complex*, long*, f_complex*);
void	__stdcall BSJS(float*, float*, long*, float*);
void	__stdcall B2JS(float*, float*, long*, float*, float*);
void	__stdcall BSYS(float*, float*, long*, float*);
void	__stdcall BSIS(float*, float*, long*, float*);
void	__stdcall BSIES(float*, float*, long*, float*);
void	__stdcall BSKS(float*, float*, long*, float*);
void	__stdcall BSKES(float*, float*, long*, float*);
void	__stdcall CBJS(float*, f_complex*, long*, f_complex*);
void	__stdcall CBYS(float*, f_complex*, long*, f_complex*);
void	__stdcall C2YS(float*, f_complex*, long*, f_complex*, f_complex*);
void	__stdcall CBIS(float*, f_complex*, long*, f_complex*);
void	__stdcall CBKS(float*, f_complex*, long*, f_complex*);
void	__stdcall C2KS(float*, f_complex*, long*, f_complex*, f_complex*);

/*
 *    Special Functions Chapter 7:  Kelvin Functions
 */

float	__stdcall BER0(float*);
float	__stdcall BEI0(float*);
float	__stdcall AKER0(float*);
float	__stdcall AKEI0(float*);
float	__stdcall BERP0(float*);
float	__stdcall BEIP0(float*);
float	__stdcall AKERP0(float*);
float	__stdcall AKEIP0(float*);
float	__stdcall BER1(float*);
float	__stdcall BEI1(float*);
float	__stdcall AKER1(float*);
float	__stdcall AKEI1(float*);

/*
 *    Special Functions Chapter 8:  Airy Functions
 */

float	__stdcall AI(float*);
float	__stdcall BI(float*);
float	__stdcall AID(float*);
float	__stdcall BID(float*);
float	__stdcall AIE(float*);
float	__stdcall BIE(float*);
float	__stdcall AIDE(float*);
float	__stdcall BIDE(float*);

/*
 *    Special Functions Chapter 9:  Elliptic Integrals
 */

float	__stdcall ELK(float*);
float	__stdcall ELE(float*);
float	__stdcall ELRF(float*, float*, float*);
float	__stdcall ELRD(float*, float*, float*);
float	__stdcall ELRJ(float*, float*, float*, float*);
float	__stdcall ELRC(float*, float*);

/*
 *    Special Functions Chapter 10:  Elliptic and Related Functions
 */

void	__stdcall CWPL(f_complex*, f_complex*);
void	__stdcall CWPLD(f_complex*, f_complex*);
void	__stdcall CWPQ(f_complex*, f_complex*);
void	__stdcall CWPQD(f_complex*, f_complex*);
float	__stdcall EJSN(float*, float*);
void	__stdcall CEJSN(f_complex*, f_complex*, float*);
float	__stdcall EJCN(float*, float*);
void	__stdcall CEJCN(f_complex*, f_complex*, float*);
float	__stdcall EJDN(float*, float*);
void	__stdcall CEJDN(f_complex*, f_complex*, float*);

/*
 *    Special Functions Chapter 11:  Probability Distribution Functions
 *                                   and Inverses
 */

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
 *    Special Functions Chapter 12:  Mathieu Functions
 */

void	__stdcall MATEE(float*, long*, long*, long*, float*);
void	__stdcall M2TEE(float*, long*, long*, long*, float*, long*, float*,
		float*);
void	__stdcall M3TEE(float*, long*, long*);
void	__stdcall MATCE(float*, float*, long*, float*);
void	__stdcall M2TCE(float*, float*, long*, float*, long*, long*, float*,
		float*, float*, float*, float*);
void	__stdcall MATSE(float*, float*, long*, float*);
void	__stdcall M2TSE(float*, float*, long*, float*, long*, long*, float*,
		float*, float*, float*, float*);

/*
 *    Special Functions Chapter 13:  Miscellaneous Functions
 */

float	__stdcall SPENC(float*);
long	__stdcall INITS(float*, long*, float*);
float	__stdcall CSEVL(float*, float*, long*);

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

void	__stdcall E2AHF(long*, long*, f_complex*, long*, long*, float*,
		f_complex*, float*, f_complex*, long*);
void	__stdcall E2ASF(long*, long*, float*, long*, long*, float*, float*,
		float*, long*);
void	__stdcall E2BHF(long*, long*, f_complex*, long*, float*, float*, long*,
		float*, f_complex*, float*, f_complex*, long*);
void	__stdcall E2BSB(long*, long*, float*, long*, long*, float*, float*,
		long*, float*, float*, float*, long*);
void	__stdcall E2BSF(long*, long*, float*, long*, float*, float*, long*,
		float*, float*, float*, long*);
void	__stdcall E2CCG(long*, f_complex*, long*, f_complex*, f_complex*, long*,
		f_complex*, float*, f_complex*);
void	__stdcall E2CCH(long*, f_complex*, long*, f_complex*, f_complex*, long*,
		f_complex*, f_complex*);
void	__stdcall E2CHF(long*, f_complex*, long*, float*, f_complex*, long*,
		f_complex*, float*, f_complex*);
void	__stdcall E2CRG(long*, float*, long*, f_complex*, f_complex*, long*,
		float*, float*, float*);
void	__stdcall E2CRH(long*, float*, long*, f_complex*, f_complex*, long*,
		float*, float*);
void	__stdcall E2CSB(long*, float*, long*, long*, float*, float*, long*,
		float*, float*);
void	__stdcall E2EHF(long*, long*, f_complex*, long*, long*, float*,
		f_complex*, long*, f_complex*, float*, float*, f_complex*,
		long*);
void	__stdcall E2ESB(long*, long*, float*, long*, long*, long*, float*,
		float*, long*, float*, float*, long*);
void	__stdcall E2FHF(long*, long*, f_complex*, long*, float*, float*, long*,
		float*, f_complex*, long*, f_complex*, float*, float*,
		f_complex*, long*);
void	__stdcall E2FSB(long*, long*, float*, long*, long*, float*, float*,
		long*, float*, float*, long*, float*, float*, float*, long*);
void	__stdcall E2FSF(long*, long*, float*, long*, float*, float*, long*,
		float*, float*, long*, float*, float*, long*);
void	__stdcall E2LCG(long*, f_complex*, long*, f_complex*, f_complex*,
		float*, f_complex*);
void	__stdcall E2LCH(long*, f_complex*, long*, f_complex*, f_complex*);
void	__stdcall E2LHF(long*, f_complex*, long*, float*, f_complex*, float*,
		f_complex*);
void	__stdcall E2LRG(long*, float*, long*, f_complex*, float*, float*);
void	__stdcall E2LRH(long*, float*, long*, f_complex*, float*);
void	__stdcall E2LSB(long*, float*, long*, long*, float*, float*, float*);
void	__stdcall E3CRG(long*, long*, long*, float*, long*, float*);
void	__stdcall E3CRH(long*, long*, long*, float*, long*, f_complex*, float*,
		long*, f_complex*, long*, long*);
void	__stdcall E3LSF(long*, float*, long*, float*, float*, float*);
void	__stdcall E4CRG(long*, long*, long*, float*, long*, float*, float*);
void	__stdcall E4ESF(long*, long*, float*, float*, long*, float*);
void	__stdcall E5CRG(long*, long*, long*, float*, long*, float*, float*,
		long*, float*);
void	__stdcall E7CRG(long*, long*, f_complex*, f_complex*, long*, long*);
void	__stdcall G2CCG(long*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, f_complex*, long*, f_complex*, f_complex*);
void	__stdcall G2CRG(long*, float*, long*, float*, long*, f_complex*, float*,
		f_complex*, long*, float*, float*, float*, float*, f_complex*);
void	__stdcall G2LCG(long*, f_complex*, long*, f_complex*, long*, f_complex*,
		f_complex*, f_complex*, f_complex*);
void	__stdcall G2LRG(long*, float*, long*, float*, long*, f_complex*, float*,
		float*, float*, float*, f_complex*);
void	__stdcall G3CCG(long*, f_complex*, f_complex*, long*, f_complex*,
		long*);
void	__stdcall G4CCG(long*, f_complex*, f_complex*, f_complex*, long*, long*,
		f_complex*, f_complex*);
void	__stdcall G5CCG(long*, long*, f_complex*, f_complex*, f_complex*, long*,
		long*, f_complex*);
void	__stdcall G7CRG(long*, long*, f_complex*, float*, f_complex*, long*,
		long*, f_complex*);
void	__stdcall IVPBS(long*, long*, void(__stdcall *)(long*, float*, float*),
		float*, float*, float*, float*, float*);
void	__stdcall I2PBS(long*, long*, void(__stdcall *)(long*, float*, float*),
		float*, float*, float*, float*, float*, float*, float*,
		void(__stdcall *)(long*, float*, float*, float*, float*),
		float*);

#ifndef IMSL_MATH_COMMON

void	__stdcall CZADD(f_complex*, double*);
void	__stdcall CZINI(f_complex*, double*);
void	__stdcall CZMUL(f_complex*, f_complex*, double*);
void	__stdcall CZSTO(double*, f_complex*);
void	__stdcall SDADD(float*, double*);
void	__stdcall SDINI(float*, double*);
void	__stdcall SDMUL(float*, float*, double*);
void	__stdcall SDSTO(double*, float*);

#endif

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

#define IMSL_MATH_SINGLE	/* Single-precision MATH/LIBRARY routines */

#ifndef IMSL_MATH_COMMON
#define IMSL_MATH_COMMON	/* MATH/LIBRARY routines common to both */
#endif				/* single- and double-precision */

#ifndef IMSL_COMMON_SINGLE
#define IMSL_COMMON_SINGLE	/* Single-precision routines common to */
#endif				/* both MATH/LIBRARY and STAT/LIBRARY */

#ifndef IMSL_COMMON
#define IMSL_COMMON		/* Routines common to both MATH/LIBRARY */
#endif				/* and STAT/LIBRARY */

#endif
