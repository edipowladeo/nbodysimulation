// scribdoc.cpp : implementation of the CScribDoc class
//
// This is a part of the Microsoft Foundation Classes C++ library.
// Copyright (C) 1992 Microsoft Corporation
// All rights reserved.
//
// This source code is only intended as a supplement to the
// Microsoft Foundation Classes Reference and Microsoft
// QuickHelp and/or WinHelp documentation provided with the library.
// See these sources for detailed information regarding the
// Microsoft Foundation Classes product.


#include "stdafx.h"
#include "scribble.h"
#include "scribdoc.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CScribDoc

IMPLEMENT_DYNCREATE(CScribDoc, CDocument)

BEGIN_MESSAGE_MAP(CScribDoc, CDocument)
	//{{AFX_MSG_MAP(CScribDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CScribDoc construction/destruction

CScribDoc::CScribDoc()
{
	// TODO: add one-time construction code here
}

CScribDoc::~CScribDoc()
{
}

BOOL CScribDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;
	InitDocument();
	return TRUE;
}


/////////////////////////////////////////////////////////////////////////////
// CScribDoc serialization

void CScribDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
	}
	else
	{
	}
	m_pointArray.Serialize(ar);
}

/////////////////////////////////////////////////////////////////////////////
// CScribDoc diagnostics

#ifdef _DEBUG
void CScribDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CScribDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}

#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CScribDoc commands

BOOL CScribDoc::OnOpenDocument(LPCTSTR lpszPathName)
{
	if (!CDocument::OnOpenDocument(lpszPathName))
		return FALSE;
	InitDocument();
	return TRUE;
}

void CScribDoc::DeleteContents()
{
	CDocument::DeleteContents();
}

void CScribDoc::InitDocument()
{
	m_nPenWidth = 2; // default 2 pixel pen width
	// solid, black pen
	m_penCur.CreatePen(PS_SOLID, m_nPenWidth, RGB(0,0,0));
} 

extern "C" {
	void __stdcall SPLINECALCULATE(float *, float*, int *);
	void __stdcall SPLINEEVALUATE(float *, float *);
}

BOOL CScribDoc::DrawDoc(CDC* pDC)
{
	CPen penStroke;

	if( m_pointArray.GetSize() < 1 ) 
		return FALSE;

	if (!penStroke.CreatePen(PS_SOLID, m_nPenWidth, RGB(0,0,0)))
		return FALSE;

	CPen* pOldPen = pDC->SelectObject(&penStroke);
	pDC->MoveTo(m_pointArray[0]);
	for (int i=1; i < m_pointArray.GetSize(); i++)
		pDC->LineTo(m_pointArray[i]);

	pDC->SelectObject(pOldPen);

	if( m_pointArray.GetSize() > 2 )
		return DrawSpline(pDC);
	else
		return TRUE;
}

BOOL CScribDoc::DrawSpline(CDC* pDC)
{
	float *x, *a;
	int last, i;
	CPoint pt;
	CPen penStroke;
	float evalx, evaly;

	if (!penStroke.CreatePen(PS_SOLID, m_nPenWidth, RGB(255,0,0)))
		return FALSE;
	CPen* pOldPen = pDC->SelectObject(&penStroke);

	last = m_pointArray.GetSize();
	x = (float *) malloc( last * sizeof(float) );
	a = (float *) malloc( last * sizeof(float) );
 	for( i = 0; i < last; i++ )
	{
		x[i] = (float) m_pointArray[i].x;
		a[i] = (float) m_pointArray[i].y;
	}

	SPLINECALCULATE( x, a, &last );

	pt.x = m_pointArray[0].x;
	SPLINEEVALUATE( &x[0], &evaly );
	pt.y = (int) (evaly + 0.5);
	pDC->MoveTo(pt);
	for( i = (int)x[0] + 1; i < x[last-1]; i++ )
	{
		pt.x = i;
		evalx = (float) i;
		SPLINEEVALUATE( &evalx, &evaly );
		pt.y = (int) (evaly + 0.5);
		pDC->LineTo(pt);
	}

	free( x );
	free( a );
	pDC->SelectObject(pOldPen);

	return( TRUE );
}	


