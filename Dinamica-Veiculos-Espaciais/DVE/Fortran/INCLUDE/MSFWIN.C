#include <stdio.h>
#include <windows.h>
#include <winioctl.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <largeint.h>


#define SIZEOFCAPTIONTEXT   20

typedef struct PERWNDINFO {
    HWND       hParent;
    HWND       hTextWnd;
    RECT       rcClient;
    char       CaptionBarText[SIZEOFCAPTIONTEXT];
} INFO, *LPINFO;

typedef struct _PERWNDINFO1 {
    HWND       hParent;
    HWND       hThisWnd;
    RECT       rcClient;
    char       CaptionBarText[SIZEOFCAPTIONTEXT];
} PERWNDINFO1, *LPERWNDINFO1;


typedef struct tagNODE {
    PERWNDINFO1    ChildWnd;
    int            hNext;
} NODE, *LPNODE;


typedef DISK_GEOMETRY   *LPDISKGEOMETRY;

/* 
 * Filename: Macros.c
 * 
 *  File containing the macro enevelopes.
 *
 * Revision History:
 * 12/24/94 SPN.PSPL                Created
 *
 */


char * _stdcall CallCStrStr(char *MainBuffer,char *FindString)
{
    return strstr(MainBuffer,FindString);
}

void _stdcall ConvertFilterString(char *FilterString)
{
    int Len,i;
    Len = lstrlen(FilterString);
    for(i=0;i<Len;i++)
    {
        if(FilterString[i] == '|')
            FilterString[i] = '\0';
    }
}

// HIWORD
WORD _stdcall HiWord(DWORD param)
{
    return HIWORD(param);
}

// LOWORD
WORD _stdcall LoWord(DWORD param)
{
    return LOWORD(param);
}

// RGB
COLORREF _stdcall Rgb(BYTE bRed, BYTE bGreen, BYTE bBlue)
{

    return RGB(bRed,bGreen,bBlue);

}

// GETRVALUE
BYTE _stdcall GetRedValue(DWORD rgb)
{

    return GetRValue(rgb);
}


//GETBVALUE
BYTE _stdcall GetBlueValue(DWORD rgb)
{

    return GetBValue(rgb);
}

//GETGVALUE
BYTE _stdcall GetGreenValue(DWORD rgb)
{

    return GetGValue(rgb);
}


// HIBYTE
BYTE _stdcall HiByte(WORD param)
{

    return HIBYTE(param);
}

// LOBYTE
BYTE _stdcall LoByte(WORD param)
{

    return LOBYTE(param);
}

//LANGIDFROMLCID
WORD _stdcall LangIDFromLCID(DWORD lcid)
{

    return (LANGIDFROMLCID(lcid));
}

//MAKEINTATOM
LPTSTR _stdcall MakeIntAtom(WORD wInteger)
{

    return(MAKEINTATOM(wInteger));
}

//MAKEINTRESOURCE
LPTSTR _stdcall MakeIntResource(WORD wInteger)
{

    return(MAKEINTRESOURCE(wInteger));
}

//MAKELANGID
WORD _stdcall MakeLangID(USHORT usPrimaryLanguage, USHORT usSubLanguage)
{

    return(MAKELANGID(usPrimaryLanguage, usSubLanguage));
}

//MAKELCID
DWORD _stdcall MakeLCID(WORD wLanguageID, WORD wSortID)
{

    return(MAKELCID(wLanguageID, wSortID));
}

//MAKELONG
DWORD _stdcall MakeLong(WORD wLow, WORD wHigh)
{

    return(MAKELONG(wLow, wHigh));
}

//MAKELPARAM
LPARAM _stdcall MakeLparam(WORD wLow, WORD wHigh)
{

    return(MAKELPARAM(wLow, wHigh));
}

//MAKELRESULT
LRESULT _stdcall MakeLResult(WORD wLow, WORD wHigh)
{

    return(MAKELRESULT(wLow, wHigh));
}

//MAKEPOINTS
POINTS _stdcall MakePoints(DWORD dwValue)
{
    
    return(MAKEPOINTS(dwValue));
}

//MAKEWORD
WORD _stdcall MakeWord(BYTE bLow, BYTE bHigh)
{

    return(MAKEWORD(bLow,bHigh));
}

//MAKEWPARAM
LPARAM _stdcall MakeWparam(WORD wLow, WORD wHigh)
{

    return(MAKEWPARAM(wLow, wHigh));
}

//PALETTEINDEX
COLORREF _stdcall PaletteIndex(WORD wPaletteIndex)
{

    return(PALETTEINDEX(wPaletteIndex));
}

//PALETTERGB
COLORREF _stdcall PaletteRGB(BYTE bRed, BYTE bGreen, BYTE bBlue)
{

    return(PALETTERGB(bRed,bGreen,bBlue));
}

//POINTSTOPOINT
void _stdcall PointsTOPoint(POINT pt, POINTS pts)
{

    pt.x = (SHORT)pts.x;
    pt.y = (SHORT)pts.y;
}

//POINTTOPOINTS
int _stdcall PointTOPoints(POINT pt)
{
    return (MAKELONG((short) ((pt).x), (short) ((pt).y)));
}

//PRIMARYLANGID
BYTE _stdcall PrimaryLangID(USHORT usLanguageID)
{

    return(PRIMARYLANGID(usLanguageID));
}

// SUBLANGID
BYTE _stdcall SubLangID(USHORT usLanguageID)
{

    return(SUBLANGID(usLanguageID));
}

//SORIDFROMLCID
WORD _stdcall SortIDFromLCID(LCID lcid)
{

    return(SORTIDFROMLCID(lcid));
}

// BType
int _stdcall BType (int x)
{
    return (BTYPE(x));
}


// IsPtr

int _stdcall IsPtr (int x)
{
    return (ISPTR(x));
}

// IsFcn

int _stdcall IsFcn (int x)
{
    return (ISFCN(x));
}

// IsAry

int _stdcall IsAry (int x)
{
    return (ISARY(x));
}

// IsTag

int _stdcall IsTag (int x)
{
    return (ISTAG(x));
}


// IncRef

int _stdcall IncRef (int x)
{
    return (INCREF(x));
}


// DecRef

int _stdcall DecRef (int x)
{
    return (DECREF(x));
}

// Image_Snap_By_Ordinal

int _stdcall Image_Snap_By_Ordinal (int Ordinal)
{
    return (IMAGE_SNAP_BY_ORDINAL(Ordinal));
}


// Image_Ordinal

int _stdcall Image_Ordinal (int Ordinal)
{
    return (IMAGE_ORDINAL(Ordinal));
}


//SNDALIAS

DWORD  _stdcall SndAlias (char ch0, char ch1)
{
    return (sndAlias(ch0, ch1));
}

//MMIOFOURCC

DWORD _stdcall MMIOFOURCC( char ch0, char ch1, char ch2, char ch3 )
{
    return (mmioFOURCC (ch0, ch1, ch2, ch3));
}


//FD_ISSET
void _stdcall FDISSET(int fd, struct fd_set * set)
{
    FD_ISSET(fd, set);
}




//FD_ZERO

void _stdcall FDZERO(struct fd_set *set)
{
    FD_ZERO (set);
}

//FD_SET

void _stdcall FDSET(int fd, struct fd_set *set)
{
    FD_SET ( fd, set);
}


//FD_CLR

void _stdcall FDCLR(int fd, struct fd_set *set) 
{
    FD_CLR( (unsigned) fd, set);
}



int _stdcall IO_( char x, char y)        
{
    return (_IO(x,y));

}

DWORD _stdcall IOR_( char x, char y, int t)        
{
    return (_IOR(x,y,t));

}

DWORD _stdcall IOW_( char x, char y, int t)        
{
    return (_IOW(x,y,t));

}


DWORD _stdcall MakeRop4 (int fore, int back)
{
    return (MAKEROP4 (fore, back));
}


double _stdcall chartoreal (char *buffer)
{
    return (atof(buffer));
}

int _stdcall chartoint (char *buffer)
{
    return (atoi(buffer));
}

char * _stdcall inttochar (int value, char * string, int radix)
{
    return (_itoa(value, string, radix));
}



void _stdcall strncopy (char *dest, char *source, int nchar)
{
    strncpy(dest, source, nchar);
    return;
}




HWND _stdcall CreateWindows (LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, int x, int y, int nWidth, int nHeight, HWND hwndParent, HMENU hMenu, HANDLE hInst, LPVOID lpvParam )
{
    return (CreateWindowEx (0,lpszClassName, lpszWindowName, dwStyle, x, y, nWidth, nHeight, hwndParent, hMenu, hInst, lpvParam));
}


HWND _stdcall CreateDialogs (HANDLE hInst, LPCTSTR lpszTemplate, HWND hwndOwner, DLGPROC dlgprc)
{
    return (CreateDialogParam (hInst, lpszTemplate, hwndOwner, dlgprc, 0));
}

int _stdcall DialogBoxs (HANDLE hInst,LPCTSTR lpszTemplate, HWND hwndOwner, DLGPROC dlgprc)
{
    return (DialogBoxParam (hInst, lpszTemplate, hwndOwner, dlgprc, 0));
}

void _stdcall Long2Point(int l, POINT *pt)  
{
    pt->x = (SHORT)LOWORD(l);
    pt->y = (SHORT)HIWORD(l);
}

void _stdcall setptr (char **ptr1, int ptr2)
{
    *ptr1 = (char *)(ptr2);
}


void _stdcall SetPInfoToInfo (int pInfo, INFO *Info)
{
    ((LPINFO)(pInfo))->hParent = Info->hParent;
    ((LPINFO)(pInfo))->hTextWnd = Info->hTextWnd;
    ((LPINFO)(pInfo))->rcClient = Info->rcClient;
    lstrcpy(((LPINFO)(pInfo))->CaptionBarText,Info->CaptionBarText);
}


void _stdcall SetInfoToPInfo (int pInfo, INFO *Info)
{
    Info->hParent = ((LPINFO)(pInfo))->hParent;
    Info->hTextWnd = ((LPINFO)(pInfo))->hTextWnd;
    Info->rcClient = ((LPINFO)(pInfo))->rcClient;
    lstrcpy(Info->CaptionBarText, ((LPINFO)(pInfo))->CaptionBarText);
}


HANDLE _stdcall SetHandle (int lParam)
{
    return ((HANDLE) ((LPMDICREATESTRUCT) ((LPCREATESTRUCT) lParam)->lpCreateParams)->lParam );
}


void _stdcall SetCharToVal (int lpStr, int posn, int val)
{
    *((char *) (lpStr+posn)) = val;
}


void _stdcall SetPNodeToNode (int pNode, NODE* Node)
{
    ((LPNODE)(pNode))->ChildWnd = Node->ChildWnd;
    ((LPNODE)(pNode))->hNext = Node->hNext;
}

void _stdcall SetNodeToPNode (int pNode, NODE* Node)
{
    Node->ChildWnd = ((LPNODE)(pNode))->ChildWnd;
    Node->hNext = ((LPNODE)(pNode))->hNext;
}



BOOL _stdcall VersionQueryValueS (const LPVOID pBlock, LPTSTR lpSubBlock, LPVOID lpBuffer, PUINT puLen)
{
    BOOL  bRet;
    LPSTR pTemp = NULL;
    UINT  uVerLen = 0;

    bRet = VerQueryValueA (pBlock, lpSubBlock,(LPVOID)&pTemp,(LPDWORD) &uVerLen);
   
    if (bRet) {
        strcpy (lpBuffer, pTemp);
        *puLen = uVerLen;
    
    }
    return (bRet);


}



BOOL _stdcall fAllocateAndInitializeSid (PSID_IDENTIFIER_AUTHORITY psia, \
BYTE cSubAuthorities,DWORD dwSubAuthority0, DWORD dwSubAuthority1,        \
DWORD dwSubAuthority2, DWORD dwSubAuthority3, DWORD dwSubAuthority4,      \
DWORD dwSubAuthority5, DWORD dwSubAuthority6, DWORD dwSubAuthority7,      \
PSID *lppsid)
{
    BOOL  bRet;
    PSID  lpsid1 = NULL;

    bRet = AllocateAndInitializeSid(psia,cSubAuthorities,dwSubAuthority0, 
                        dwSubAuthority1,dwSubAuthority2,dwSubAuthority3,  
                        dwSubAuthority4,dwSubAuthority5,dwSubAuthority6,  
                        dwSubAuthority7, &lpsid1);                                                                                            
   
    if (bRet) {
        *lppsid = lpsid1;
    
    }
    return (bRet);


}


VOID _stdcall setptrvalue(DWORD *dest, int *src, int flag1)
{
    switch (flag1)
    {
     case 0:
        *dest = (int) src;
        break;
     case 1:
        *dest = *src;
        break;
    }
}

int _stdcall CtlCode( DeviceType, Function, Method, Access )
{                  
    return (CTL_CODE (DeviceType, Function, Method,  Access));
}



int _stdcall StartServiceCtrlDisp(LPTSTR name, LPSERVICE_MAIN_FUNCTION srv_main)
{
    SERVICE_TABLE_ENTRY dispathtab[2];

    dispathtab[0].lpServiceName = name;
    dispathtab[0].lpServiceProc = srv_main;
    dispathtab[1].lpServiceName = NULL;
    dispathtab[1].lpServiceProc = NULL;

    
    return (StartServiceCtrlDispatcher(dispathtab));
}

int _stdcall FSetTimer(HWND hwnd, UINT idTimer, UINT uTimeout, TIMERPROC tmproc, int flag)
{
    if (flag == 0)
        return (SetTimer(hwnd, idTimer, uTimeout, NULL));
    else
        return (SetTimer(hwnd, idTimer, uTimeout, tmproc));
}

int _stdcall fOpenFile (LPCSTR lpszFile, LPOFSTRUCT lpOpenBuff, UINT fuMode)
{   
    HFILE   hFile;
    OFSTRUCT    ofstruct;
    
    hFile = OpenFile(lpszFile, &ofstruct, fuMode);
    if (hFile) {
        strcpy ((char *)lpOpenBuff, (const char *)&ofstruct);
    }
    return (hFile);
}

BOOL _stdcall fGetAce (PACL pAcl, DWORD dwAceIndex, LPVOID lpAce)
{
    BOOL    bRet;
    LPSTR   pTemp;
    bRet = GetAce (pAcl, dwAceIndex, (LPVOID*)&pTemp);
    if ( bRet )
        strcpy( lpAce, pTemp );
    return (bRet);
}


int _stdcall fmemcmpr (const void *buf1, const void *buf2, size_t count)
{
    return (memcmp (buf1, buf2, count));
}


HGLOBAL _stdcall Global_Discard (HGLOBAL h)
{
   return (GlobalReAlloc((h), 0, GMEM_MOVEABLE));
}

HLOCAL _stdcall Local_Discard (HLOCAL h)
{
   return (LocalReAlloc((h), 0, LMEM_MOVEABLE));
}


PIMAGE_SECTION_HEADER _stdcall Image_First_Section (int ntheader)
{
   return (IMAGE_FIRST_SECTION (ntheader));
}

int _stdcall convertFtoCstring(char *CString,int FString)
{
    return (int)(char *)strcpy(CString,(const char *)FString);
}


int _stdcall CheckIfNULL(void *Ptr)
{
    if(Ptr == NULL)
        return 0;
    else
        return 1;
}

WORD _stdcall FPO_DATA$cbProlog(WORD Bits)
{
   return (WORD) (Bits & 0x00FF);
}

WORD _stdcall FPO_DATA$cbRegs (WORD Bits)
{
   return (WORD) ((WORD)(Bits >> 8) & 0x0007);
}

WORD _stdcall FPO_DATA$fHasSEH (WORD Bits)
{
    return (WORD) ((WORD)(Bits >> 11) & 0x0001);
}

WORD _stdcall FPO_DATA$fUseBP (WORD Bits)
{
   return (WORD) ((WORD)(Bits >> 12) & 0x0001);
}

WORD _stdcall FPO_DATA$reserved (WORD Bits)
{
   return (WORD) ((WORD)(Bits >> 13) & 0x0001);
}

WORD _stdcall FPO_DATA$cbFrame (WORD Bits)
{
   return (WORD) ((WORD)(Bits >> 14) & 0x0002);
}

DWORD _stdcall LDT_ENTRY$BaseMid (DWORD Bits)
{
   return (DWORD)(Bits & 0x000000ff);
}

DWORD _stdcall LDT_ENTRY$Type (DWORD Bits)
{
   return (DWORD) ((Bits >> 8) & 0x0000001f);
}

DWORD _stdcall LDT_ENTRY$Dpl (DWORD Bits)
{
   return (DWORD)((Bits >> 13) & 0x00000002);
}

DWORD _stdcall LDT_ENTRY$Pres (DWORD Bits)
{
   return (DWORD)((Bits >> 15) &  0x00000001);
}

DWORD _stdcall LDT_ENTRY$LimitHi (DWORD Bits)
{
   return (DWORD)((Bits >> 16) &  0x0000000f);
}


DWORD _stdcall LDT_ENTRY$Sys (DWORD Bits)
{
   return (DWORD)((Bits >> 20) &  0x00000001);
}

DWORD _stdcall LDT_ENTRY$Reserved (DWORD Bits)
{
   return (DWORD)((Bits >> 21) & 0x00000001);
}

DWORD _stdcall LDT_ENTRY$Default_Big (DWORD Bits)
{
   return (DWORD)((Bits >> 22) & 0x00000001);
}

DWORD _stdcall LDT_ENTRY$Granularity (DWORD Bits)
{
   return (DWORD)((Bits>> 23) & 0x00000001);
}

DWORD _stdcall LDT_ENTRY$BaseHi (DWORD Bits)
{
   return (DWORD)((Bits >> 24) &  0x000000ff);
}

DWORD _stdcall COMSTAT$fCtsHold (DWORD Bits)
{
   return (DWORD)(Bits & 0x00000001);
}

DWORD _stdcall COMSTAT$fDsrHold (DWORD Bits)
{
   return (DWORD)((Bits >> 1) &  0x00000001);
}

DWORD _stdcall COMSTAT$fRlsHold (DWORD Bits)
{
   return (DWORD)((Bits >> 2) &  0x00000001);
}

DWORD _stdcall COMSTAT$fXoffHold (DWORD Bits)
{
   return (DWORD)((Bits >> 3) & 0x00000001);
}

DWORD _stdcall COMSTAT$fXoffSent (DWORD Bits)
{
   return (DWORD)((Bits >> 4) &  0x00000001);
}

DWORD _stdcall COMSTAT$fEof (DWORD Bits)
{
   return (DWORD)((Bits >> 5) &  0x00000001);
}

DWORD _stdcall COMSTAT$fTxim (DWORD Bits)
{
   return (DWORD)((Bits >> 6) & 0x00000001);
}

DWORD _stdcall COMSTAT$fReserved (DWORD Bits)
{
   return (DWORD)((Bits >> 7) &  0x00000019);
}

DWORD _stdcall DCB$fBinary (DWORD Bits)
{
   return (DWORD)(Bits &  0x00000001);
}

DWORD _stdcall DCB$fParity (DWORD Bits)
{
   return (DWORD)((Bits >> 1) & 0x00000001);
}

DWORD _stdcall DCB$fOutxCtsFlow (DWORD Bits)
{
   return (DWORD)((Bits >> 2), 0x00000001);
}

DWORD _stdcall DCB$fOutxDsrFlow (DWORD Bits)
{
   return (DWORD)((Bits >> 3) & 0x00000001);
}

DWORD _stdcall DCB$fDtrControl (DWORD Bits)
{
   return (DWORD)((Bits >> 4) &  0x00000001);
}

DWORD _stdcall DCB$fDsrSensitivity (DWORD Bits)
{
   return (DWORD)((Bits >> 6) & 0x00000001);
}

DWORD _stdcall DCB$fTXContinueOnXOff (DWORD Bits)
{
   return (DWORD)((Bits >> 7) & 0x00000001);
}

DWORD _stdcall DCB$fOutX (DWORD Bits)
{
   return (DWORD)((Bits >> 8) & 0x00000001);
}

DWORD _stdcall DCB$fInX (DWORD Bits)
{
   return (DWORD)((Bits >> 9) & 0x00000001);
}

DWORD _stdcall DCB$fErrorChar (DWORD Bits)
{
   return (DWORD)((Bits >> 10) & 0x00000001);
}

DWORD _stdcall DCB$fNull (DWORD Bits)
{
   return (DWORD)((Bits >> 11) & 0x00000001);
}

DWORD _stdcall DCB$fRtsControl (DWORD Bits)
{
   return (DWORD)((Bits >> 12) & 0x00000002);
}

DWORD _stdcall DCB$fAbortOnError (DWORD Bits)
{
   return (DWORD)((Bits >> 14) & 0x00000001);
}

DWORD _stdcall DCB$fDummy2 (DWORD Bits)
{
   return (DWORD)((Bits >> 15) & 0x00000011);
}

/*
!
! DDE.F90
!
*/

DWORD _stdcall DDEPACK$bAppReturnedCode (DWORD Bits)
{
   return (DWORD)(Bits & 0x000000ff);
}

DWORD _stdcall DDEPACK$reserved (DWORD Bits)
{
   return (DWORD)((Bits >> 8) & 0x0000002f);
}

DWORD _stdcall DDEPACK$fBusy (DWORD Bits)
{
   return (DWORD)((Bits >> 14) & 0x00000001);
}

DWORD _stdcall DDEPACK$fAck (DWORD Bits)
{
   return (DWORD)((Bits >> 15) & 0x00000001);
}

DWORD _stdcall DDEADVISE$reserved (DWORD Bits)
{
   return (DWORD)(Bits & 0x00002fff);
}

DWORD _stdcall DDEADVISE$fDeferUpd (DWORD Bits)
{
   return (DWORD)((Bits >> 14) & 0x00000001);
}

DWORD _stdcall DDEADVISE$fAckReq (DWORD Bits)
{
   return (DWORD)((Bits >> 15) & 0x00000001);
}

DWORD _stdcall DDEDATA$unused (DWORD Bits)
{
   return (DWORD)(Bits & 0x00000fff);
}

DWORD _stdcall DDEDATA$fResponse (DWORD Bits)
{
   return (DWORD)((Bits >> 12) &  0x00000001);
}

DWORD _stdcall DDEDATA$fRelease (DWORD Bits)
{
   return (DWORD)((Bits >> 13) & 0x00000001);
}

DWORD _stdcall DDEDATA$reserved (DWORD Bits)
{
   return (DWORD)((Bits >> 14) & 0x00000001);
}

DWORD _stdcall DDEDATA$fAckReq (DWORD Bits)
{
   return (DWORD)((Bits >> 15) & 0x00000001);
}

DWORD _stdcall DDEPOKE$unused (DWORD Bits)
{
   return (DWORD)(Bits & 0x00001fff);
}

DWORD _stdcall DDEPOKE$fRelease (DWORD Bits)
{
   return (DWORD)((Bits >> 13) & 0x00000001);
}

DWORD _stdcall DDEPOKE$fReserved (DWORD Bits)
{
   return (DWORD)((Bits >> 14) & 0x00000001);
}

DWORD _stdcall DDELN$unused (DWORD Bits)
{
   return (DWORD)(Bits & 0x00001fff);
}

DWORD _stdcall DDELN$fRelease (DWORD Bits)
{
   return (DWORD)((Bits >> 13) & 0x00000001);
}

DWORD _stdcall DDELN$fDeferUpd (DWORD Bits)
{
   return (DWORD)((Bits >> 14) & 0x00000001);
}

DWORD _stdcall DDELN$fAckReq (DWORD Bits)
{
   return (DWORD)((Bits >> 13) & 0x00000001);
}

DWORD _stdcall DDEUP$unused (DWORD Bits)
{
   return (DWORD)(Bits & 0x00000fff);
}

DWORD _stdcall DDEUP$fAck (DWORD Bits)
{
   return (DWORD)((Bits >> 12) & 0x00000001);
}

DWORD _stdcall DDEUP$fRelease (DWORD Bits)
{
   return (DWORD)((Bits >> 13) & 0x00000001);
}

DWORD _stdcall DDEUP$fReserved(DWORD Bits)
{
   return (DWORD)((Bits >> 14) & 0x00000001);
}

DWORD _stdcall DDEUP$fAckReq (DWORD Bits)
{
   return (DWORD)((Bits >> 15) & 0x00000001);
}

/* VDMDBG */


DWORD _stdcall VDMLDT_ENTRY$BaseMid (DWORD Bits)
{
   return (DWORD)(Bits & 0x000000ff);
}

DWORD _stdcall VDMLDT_ENTRY$Type (DWORD Bits)
{
   return (DWORD)((Bits >> 8) & 0x0000001f);
}

DWORD _stdcall VDMLDT_ENTRY$Dpl (DWORD Bits)
{
   return (DWORD)((Bits >> 13) & 0x00000002);
}

DWORD _stdcall VDMLDT_ENTRY$Pres (DWORD Bits)
{
   return (DWORD)((Bits >> 15) & 0x00000001);
}

DWORD _stdcall VDMLDT_ENTRY$LimitHi (DWORD Bits)
{
   return (DWORD)((Bits >> 16) & 0x0000000f);
}

DWORD _stdcall VDMLDT_ENTRY$Sys (DWORD Bits)
{
   return (DWORD)((Bits >> 20) & 0x00000001);
}

DWORD _stdcall VDMLDT_ENTRY$Reserved (DWORD Bits)
{
   return (DWORD)((Bits >> 21) & 0x00000001);
}

DWORD _stdcall VDMLDT_ENTRY$Default_Big (DWORD Bits)
{
   return (DWORD)((Bits >> 22) & 0x00000001);
}

DWORD _stdcall VDMLDT_ENTRY$Granularity (DWORD Bits)
{
   return (DWORD)((Bits >> 23) & 0x00000001);
}

DWORD _stdcall VDMLDT_ENTRY$BaseHi (DWORD Bits)
{
   return (DWORD)((Bits >> 24) & 0x000000ff);
}

