
/////////////////////////////////////////////////////////////
// dlglow.cpp
// low level dialog routines
/////////////////////////////////////////////////////////////

#include <windows.h>

#ifdef USEC
#define FORTRAN_CALL(ret,name) extern "C" ret __cdecl name##_
#else
#define FORTRAN_CALL(ret,name) extern "C" ret __stdcall name
#endif

/////////////////////////////////////////////////////////////
// dlggetres
//
// Given a resource id, returns a pointer to the raw resource bytes
/////////////////////////////////////////////////////////////
#ifdef USEC
FORTRAN_CALL(int,dlggetres) ( unsigned int* pid, void** p )
#else
FORTRAN_CALL(int,DLGGETRES) ( unsigned int* pid, void** p )
#endif
{
	HRSRC hrsrc = FindResource( NULL, (LPCTSTR)(*pid), (LPCTSTR)RT_DIALOG );

	if (hrsrc == NULL)
	{
		*p = NULL;
		return 0;
	}

	HGLOBAL hglob = LoadResource( NULL, hrsrc );

	if (hglob == NULL)
	{
		*p = NULL;
		return 0;
	}

	*p = LockResource( hglob );

	return *p != NULL;
}

/////////////////////////////////////////////////////////////
// dlgparseres
//
// parses the dialog header into an F90 readable structure
/////////////////////////////////////////////////////////////

typedef struct DialogBoxHeader
{
    unsigned int Style;
	unsigned int ExtendedStyle;
	unsigned int NumberOfItems;
	unsigned int x;
	unsigned int y;
	unsigned int cx;
	unsigned int cy;
	unsigned int MenuId;
	char MenuName[256];
	unsigned int ClassId;
	char ClassName[256];
	char Caption[256];
	unsigned int PointSize;
	char FontName[256];
} DLGHEADER;

#ifdef USEC
FORTRAN_CALL(void,dlgparseres) (void** p, DLGHEADER* pdlg)
#else
FORTRAN_CALL(void,DLGPARSERES) (void** p, DLGHEADER* pdlg)
#endif
{
	char* pc = (char*)(*p);

	pdlg->Style = *((DWORD*)pc);
	pc += 4;

	pdlg->ExtendedStyle = *((DWORD*)pc);
	pc += 4;

	pdlg->NumberOfItems = *((WORD*)pc);
	pc += 2;

	pdlg->x = *((WORD*)pc);
	pc += 2;

	pdlg->y = *((WORD*)pc);
	pc += 2;

	pdlg->cx = *((WORD*)pc);
	pc += 2;

	pdlg->cy = *((WORD*)pc);
	pc += 2;

	{
		WORD w;
		w = *((WORD*)pc);
		pc += 2;
		if ( w == 0xffff )
		{
			pdlg->MenuId = *((WORD*)pc);
			pc += 2;
			for (int i=0 ; i<256 ; ++i )
				pdlg->MenuName[i] = ' ';
		}
		else
		{
			for ( int i=0 ;  w!=NULL && i<256 ; ++i )
			{
				pdlg->MenuName[i] = w;
				w = *((WORD*)pc);
				pc += 2;
			}
			for ( ; i<256 ; ++i )
				pdlg->MenuName[i] = ' ';				
			pdlg->MenuId = -1;
		}
	}	

	{
		WORD w;
		w = *((WORD*)pc);
		pc += 2;
		if ( w == 0xffff )
		{
			pdlg->ClassId = *((WORD*)pc);
			pc += 2;
			for (int i=0 ; i<256 ; ++i )
				pdlg->ClassName[i] = ' ';
		}
		else
		{
			for ( int i=0 ;  w!=NULL && i<256 ; ++i )
			{
				pdlg->ClassName[i] = w;
				w = *((WORD*)pc);
				pc += 2;
			}
			for ( ; i<256 ; ++i )
				pdlg->ClassName[i] = ' ';				
			pdlg->ClassId = -1;
		}
	}	

	{
		WORD w;
		w = *((WORD*)pc);
		pc += 2;
		for ( int i=0 ; w!=NULL && i<256 ; ++i )
		{
			pdlg->Caption[i] = w;
			w = *((WORD*)pc);
			pc += 2;
		}
		for ( ; i<256 ; ++i )
			pdlg->Caption[i] = ' ';
	}	

	if ( pdlg->Style & DS_SETFONT )
	{
		pdlg->PointSize = *((WORD*)pc);
		pc += 2;

		{
			WORD w;
			w = *((WORD*)pc);
			pc += 2;
			for ( int i=0 ; w!=NULL && i<256 ; ++i )
			{
				pdlg->FontName[i] = w;
				w = *((WORD*)pc);
				pc += 2;
			}
			for ( ; i<256 ; ++i )
				pdlg->FontName[i] = ' ';
		}	
	}
	else
	{
		pdlg->PointSize = *((WORD*)pc);
		for ( int i=0 ; i<256 ; ++i )
			pdlg->FontName[i] = ' ';
	}

	// pad to DWORD boundary
	pc = (char*)(((unsigned int)pc+3) & ~3);

	*p = (void*)pc;
}

/////////////////////////////////////////////////////////////
// dlgparserescontrol
//
// parses the control data into an F90 readable structure
/////////////////////////////////////////////////////////////

typedef struct ControlData
{
    unsigned int Style;
	unsigned int ExtendedStyle;
	unsigned int x;
	unsigned int y;
	unsigned int cx;
	unsigned int cy;
	unsigned int id;
	unsigned int ClassId;
	char ClassName[256];
	unsigned int TextId;
	char TextName[256];
	unsigned int ExtraStuff;
} CONTROLDATA;

#ifdef USEC
FORTRAN_CALL(void,dlgparserescontrol) (void** p, CONTROLDATA* pctrl)
#else
FORTRAN_CALL(void,DLGPARSERESCONTROL) (void** p, CONTROLDATA* pctrl)
#endif
{
	char* pc = (char*)(*p);

	pctrl->Style = *((DWORD*)pc);
	pc += 4;

	pctrl->ExtendedStyle = *((DWORD*)pc);
	pc += 4;

	pctrl->x = *((WORD*)pc);
	pc += 2;

	pctrl->y = *((WORD*)pc);
	pc += 2;

	pctrl->cx = *((WORD*)pc);
	pc += 2;

	pctrl->cy = *((WORD*)pc);
	pc += 2;

	pctrl->id = *((WORD*)pc);
	pc += 2;

	{
		WORD w;
		w = *((WORD*)pc);
		pc += 2;
		if ( w == 0xffff )
		{
			pctrl->ClassId = *((WORD*)pc);
			pc += 2;
			for (int i=0 ; i<256 ; ++i )
				pctrl->ClassName[i] = ' ';
		}
		else
		{
			for ( int i=0 ;  w!=NULL && i<256 ; ++i )
			{
				pctrl->ClassName[i] = w;
				w = *((WORD*)pc);
				pc += 2;
			}
			for ( ; i<256 ; ++i )
				pctrl->ClassName[i] = ' ';				
			pctrl->ClassId = -1;
		}
	}	

	{
		WORD w;
		w = *((WORD*)pc);
		pc += 2;
		if ( w == 0xffff )
		{
			pctrl->TextId = *((WORD*)pc);
			pc += 2;
			for (int i=0 ; i<256 ; ++i )
				pctrl->TextName[i] = ' ';
		}
		else
		{
			for ( int i=0 ;  w!=NULL && i<256 ; ++i )
			{
				pctrl->TextName[i] = w;
				w = *((WORD*)pc);
				pc += 2;
			}
			for ( ; i<256 ; ++i )
				pctrl->TextName[i] = ' ';				
			pctrl->TextId = -1;
		}
	}

	pctrl->ExtraStuff = *((WORD*)pc);
	pc += 2;

	// pad to DWORD boundary
	pc = (char*)(((unsigned int)pc+3) & ~3);

	*p = (void*)pc;
}

/////////////////////////////////////////////////////////////
// dlgdocallback
//
// allow F90 to call a function indirectly
/////////////////////////////////////////////////////////////

#ifdef USEC
FORTRAN_CALL(void,dlgdocallback) (int (__stdcall **func)(int*,int*,int*), int* pdlg, int* pid, int*pcode)
#else
FORTRAN_CALL(void,DLGDOCALLBACK) (int (__stdcall **func)(int*,int*,int*), int* pdlg, int* pid, int*pcode)
#endif
{
	(**func)(pdlg, pid, pcode);
}

/////////////////////////////////////////////////////////////
// dlgdocallback
//
// wrapper for Win32 EndDialog
/////////////////////////////////////////////////////////////

#ifdef USEC
FORTRAN_CALL(void,dlgenddialog) (HWND* phwnd, int* pret)
#else
FORTRAN_CALL(void,DLGENDDIALOG) (HWND* phwnd, int* pret)
#endif
{
	EndDialog( *phwnd, *pret );
}

/////////////////////////////////////////////////////////////
// DialogBox
//
// wrapper for Win32 DialogBox
/////////////////////////////////////////////////////////////

#ifdef USEC
typedef int (__cdecl *FORTRAN_DLGPROC)(int* hwnd, int* msg, int* wparam, int* lparam);
#else
typedef int (__stdcall *FORTRAN_DLGPROC)(int* hwnd, int* msg, int* wparam, int* lparam);
#endif

FORTRAN_DLGPROC g_ForDlgProc;

// this wrapper is needed until VALUE is implemented
//
int __stdcall DlgProc(int hwnd, int msg, int wparam, int lparam)
{
	return (*g_ForDlgProc)( &hwnd, &msg, &wparam, &lparam );
}

#ifdef USEC
FORTRAN_CALL(int,dlgdomodal) (int* pid, HWND* phwndParent, FORTRAN_DLGPROC ForDlgProc)
#else
FORTRAN_CALL(int,DLGDOMODAL) (int* pid, HWND* phwndParent, FORTRAN_DLGPROC ForDlgProc)
#endif
{
	g_ForDlgProc = ForDlgProc;

	// pass DlgProc to DialogBox

	HINSTANCE hinst = (HINSTANCE)GetWindowLong( *phwndParent, GWL_HINSTANCE );

	return DialogBox(hinst, MAKEINTRESOURCE(*pid), *phwndParent, (DLGPROC)DlgProc);
}

/////////////////////////////////////////////////////////////
// dlghwnd2id
//
// wrapper for Win32 GetDlgCtrlID
/////////////////////////////////////////////////////////////

#ifdef USEC
FORTRAN_CALL(int,dlghwnd2id) ( HWND* phwnd )
#else
FORTRAN_CALL(int,DLGHWND2ID) ( HWND* phwnd )
#endif
{
	return GetDlgCtrlID( *phwnd );
}

/////////////////////////////////////////////////////////////
// dlgid2hwnd
//
// wrapper for Win32 GetDlgItem
/////////////////////////////////////////////////////////////

#ifdef USEC
FORTRAN_CALL(HWND,dlgid2hwnd) ( HWND* phwnd, int *id )
#else
FORTRAN_CALL(HWND,DLGID2HWND) ( HWND* phwnd, int *id )
#endif
{
	return GetDlgItem( *phwnd, *id );
}

/////////////////////////////////////////////////////////////
// dlgenablewindow
//
// wrapper for Win32 EnableWindow
/////////////////////////////////////////////////////////////

#ifdef USEC
FORTRAN_CALL(int,dlgenablewindow) ( HWND* hwnd, int* enable )
#else
FORTRAN_CALL(int,DLGENABLEWINDOW) ( HWND* hwnd, int* enable )
#endif
{
	return EnableWindow( *hwnd, *enable );
}

/////////////////////////////////////////////////////////////
// dlgiswindowenabled
//
// wrapper for Win32 IsWindowEnabled
/////////////////////////////////////////////////////////////

#ifdef USEC
FORTRAN_CALL(int,dlgiswindowenabled) ( HWND* hwnd )
#else
FORTRAN_CALL(int,DLGISWINDOWENABLED) ( HWND* hwnd )
#endif
{
	return IsWindowEnabled( *hwnd );
}

/////////////////////////////////////////////////////////////
// dlgsendmessage
//
// wrapper for Win32 SendMessage
/////////////////////////////////////////////////////////////

#ifdef USEC
FORTRAN_CALL(LRESULT,dlgsendmessage) ( HWND* hwnd, UINT* message, WPARAM* wparam, LPARAM* lparam )
#else
FORTRAN_CALL(LRESULT,DLGSENDMESSAGE) ( HWND* hwnd, UINT* message, WPARAM* wparam, LPARAM* lparam )
#endif
{
	return SendMessage( *hwnd, *message, *wparam, *lparam );
}

/////////////////////////////////////////////////////////////
// gethwndqq
//
// wrapper for runtime gethwndqq
/////////////////////////////////////////////////////////////

#ifdef USEC
extern "C" int __stdcall GETHWNDQQ( int* );

FORTRAN_CALL(int,gethwndqq) ( int* pi )
{
	return GETHWNDQQ( pi );
}
#endif

/////////////////////////////////////////////////////////////
// dlgcastfunc2int
//
// allow F90 to get a pointer to a function
/////////////////////////////////////////////////////////////

#ifdef USEC
FORTRAN_CALL(int,dlgcastfunc2int) ( void* pv )
#else
FORTRAN_CALL(int,DLGCASTFUNC2INT) ( void* pv )
#endif
{
	return (int)pv;
}
