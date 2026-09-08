// scribvw.cpp : implementation of the CScribView class
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
#include "scribvw.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CScribView

IMPLEMENT_DYNCREATE(CScribView, CScrollView)


BEGIN_MESSAGE_MAP(CScribView, CScrollView)
	//{{AFX_MSG_MAP(CScribView)
	ON_WM_KEYDOWN()
	ON_WM_LBUTTONDOWN()
	ON_WM_RBUTTONDOWN()
	//}}AFX_MSG_MAP

	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CScribView construction/destruction

CScribView::CScribView()
{
	// TODO: add construction code here
}

CScribView::~CScribView()
{
}



/////////////////////////////////////////////////////////////////////////////
// CScribView drawing

void CScribView::OnDraw(CDC* pDC)
{
	CScribDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	pDoc->DrawDoc(pDC);
}

/////////////////////////////////////////////////////////////////////////////
// CScribView printing

BOOL CScribView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CScribView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CScribView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}


/////////////////////////////////////////////////////////////////////////////
// CScribView diagnostics

#ifdef _DEBUG
void CScribView::AssertValid() const
{
	CView::AssertValid();
}

void CScribView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CScribDoc* CScribView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CScribDoc)));
	return (CScribDoc*) m_pDocument;
}

#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CScribView message handlers

void CScribView::OnLButtonDown(UINT, CPoint point)
{
	CScribDoc* pDoc = GetDocument();
	CClientDC dc(this);
	OnPrepareDC(&dc);
	dc.DPtoLP(&point);

	if( pDoc->m_pointArray.GetSize() == 0 )	   // first point on new grid
	{
		pDoc->m_pointArray.Add(point); 
	}
	else
	{
		if( point.x <= pDoc->m_pointArray[pDoc->m_pointArray.GetSize()-1].x )    // don't let it go backward
		{
			MessageBeep(0);
			return;
		}
		pDoc->m_pointArray.Add(point);
	}
	RedrawWindow();
}


void CScribView::OnRButtonDown(UINT, CPoint point)
{
	OnKeyDown( VK_DELETE, 1, 0 );
}


void CScribView::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
	CScribDoc* pDoc = GetDocument();
		
	if( nChar == VK_DELETE )
	{
		if( pDoc->m_pointArray.GetSize() > 0 ) 
		{
			pDoc->m_pointArray.RemoveAt( pDoc->m_pointArray.GetSize()-1 );
			RedrawWindow();
		}
		else
			MessageBeep(0);
	}
	else
	{
		CView::OnKeyDown(nChar, nRepCnt, nFlags);
	}
}


void CScribView::OnInitialUpdate() 
{
	
	SetScrollSizes( MM_TEXT, CSize(2048,2048) );	
	CScrollView::OnInitialUpdate();
}

