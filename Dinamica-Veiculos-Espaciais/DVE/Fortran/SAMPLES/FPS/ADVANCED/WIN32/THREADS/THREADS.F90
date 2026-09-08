!*************************************************************************\
!*  PROGRAM: Threads.f90
!*
!*  PURPOSE:
!*
!*     To demonstrate suspending, resuming, and setting the priorities
!*     of threads.
!*
!*  FUNCTIONS:
!*
!*    WinMain()      - Initializes the window, and process the message loop.
!*    MainWndProc()  - Process messages, launches server & client threads.
!*    ThreadProc()   - Draws rectangles to the window, demonstrating the
!*                     threads performance.
!*
!*  COMMENTS:
!*
!*    To Use:
!*      When starting this application, two threads are created.  The
!*      first draws a green box, the second a red.  Both boxes are moved
!*      about the screen as their individual threads calculate a new
!*      position and redraws the box.  The user can Suspend either thread,
!*      Resume them, or change their priority through the menu selections.
!*      The colored boxes will respond accordingly.
!*
!*      Note through out the sample "red thread" or "green thread" are
!*      referred to.  This simply indicates the thread which draws either the
!*      red or green rectangle.
!*
!*************************************************************************/
interface
integer*4 function WinMain (hInstance,hPrevInstance,lpCmdLine,nCmdShow)
!MS$ ATTRIBUTES STDCALL,ALIAS : '_WinMain@16' :: WinMain
integer(4)  hInstance
integer(4)  hPrevInstance
integer(4)  lpcmdline
integer(4)  ncmdshow
end function WinMain
end interface
end

!*************************************************************************\
!*
!*  FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
!*
!*  PURPOSE: calls initialization function, processes message loop
!*
!*  COMMENTS:
!*
!*************************************************************************/
integer*4 function WinMain (hInstance,hPrevInstance,lpCmdLine,nCmdShow)
!MS$ ATTRIBUTES STDCALL,ALIAS : '_WinMain@16' :: WinMain
use msfwina
use threadin

interface 
integer  function MainWndProc (x, y, z, w)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4 x 
integer*4 y 
integer*4 z 
integer*4 w 
end function
end interface

interface 
recursive integer function ThreadProc(color)
!MS$ ATTRIBUTES STDCALL, ALIAS :'_ThreadProc@4' :: ThreadProc
integer color
end function
end interface

integer*4           hInstance
integer*4           hPrevInstance
integer*4           lpCmdLine
integer*4           nCmdShow


type (T_MSG)        mesg
type (T_WNDCLASS)   wc
character*100       lpszClassName, lpszMenuName, lpszAppName

   
   
   hPrevInstance = hPrevInstance
   lpCmdLine = lpCmdLine

   RedSuspendCnt = 0
   GreenSuspendCnt = 0
   hInst = hInstance
   
   lpszClassName = "ThreadsWClass"C
   lpszMenuName  = "Thread_Menu"C
   wc%style = 0                          ! Replaces CS_SIZEREDRAW.
   wc%lpfnWndProc = LOC(MainWndProc) ! The client window procedure.
   wc%cbClsExtra = 0                     ! No room reserved for extra data.
   wc%cbWndExtra = 0
   wc%hInstance = hInstance
   wc%hIcon = LoadIcon (NULL, IDI_APPLICATION)
   wc%hCursor = LoadCursor (NULL, IDC_ARROW)
   wc%hbrBackground = GetStockObject (WHITE_BRUSH)
   wc%lpszMenuName = LOC(lpszMenuNAme)
   wc%lpszClassName = LOC(lpszClassName)
   
   i = RegisterClass(wc)

   lpszAppName = "Threads Sample"C
   hWnd2 = CreateWindowEx (0,lpszClassName,               &
                  lpszAppName,                         &
                  INT(WS_OVERLAPPEDWINDOW),                       &
                  CW_USEDEFAULT,                                  &
                  CW_USEDEFAULT,                                  &
                  CW_USEDEFAULT,                                  &
                  CW_USEDEFAULT,                                  &
                  NULL,                                           &
                  NULL,                                           &
                  hInstance,                                      &
                  NULL)
   i = ShowWindow(hWnd2, nCmdShow)
   do while (GetMessage (mesg, NULL, 0, 0) .neqv. .FALSE.)
      i = TranslateMessage(mesg)    
      i = DispatchMessage (mesg)   ! Dispatch message to window.
   end do
   WinMain = mesg%wParam           ! Returns value from PostQuitMessage.
   return 
end 

!*************************************************************************\
!*
!*  FUNCTION:  MainWndProc (HWND, UINT, UINT, LONG)
!*
!*  PURPOSE:   To process the windows messages.  This procedure totally
!*             controls the priority and suspension/resumption of the
!*             thread.
!*
!*  VARIABLES USED:
!*
!*    - hThread1, hThread2:
!*             Static handles to the two created threads.
!*
!*    - ThreadID1 ThreadID2:
!*             DWORDs used in the CreateThread call.
!*
!*    - pColor1, pColor2:
!*             DWORDs used to allocate some memory to use as a parameter
!*             to pass color values to the threads.  This memory was
!*             allocated so that the threads wouldn't have to rely on this
!*             procedures stack for the values.
!*
!*    - Buf[80]:
!*             Character buffer used to write messages to the user.
!*
!*    - RedSuspendCnt, GreenSuspendCnt:
!*             Static DWORDs used to track the count of suspension put
!*             on the specific thread.
!*
!*  MESSAGES:
!*
!*    WM_DESTROY:     - Terminates the threads and post the quit message.
!*    WM_CREATE:      - Allocates memory to hold some color values, and
!*                      creates the two threads.
!*    WM_COMMAND
!*
!*      IDM_SUSPEND***:
!*               Suspends the specified thread, updates the globally kept
!*               count (number of times the thread has been suspended),
!*               and then produces a message box telling the user the
!*               number of suspensions.
!*
!*      IDM_RESUME***:
!*               Resumes the specified thread, updates the gobally kept
!*               count (number of times the thread has been suspended),
!*               and then produces a message box telling the user the
!*               number of suspensions.
!*
!*      IDM_G***:
!*               These 7 messages use SetThreadPriority to set the
!*               priority of the Green Thread.
!*
!*      IDM_R***:
!*               These 7 messages use SetThreadPriority to set the
!*               priority of the Red Thread.
!*
!*  CALLED BY:
!*
!*    WinMain()
!*
!*  CALLS TO:
!*
!*    ThreadProc()
!*
!*  COMMENTS:
!*
!*
!*************************************************************************/


integer*4 function MainWndProc (hwnd,message,wParam,lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use msfwina
use threadin

integer*4 hwnd
integer*4 message
integer*4 wParam
integer*4 lParam

interface 
recursive integer function ThreadProc(color)
!MS$ ATTRIBUTES STDCALL, ALIAS :'_ThreadProc@4' :: ThreadProc
integer color 
end function
end interface

integer*4 hThread1, hThread2
integer*4 ThreadID1, ThreadID2
character*255 Buf
integer*4 pColor1, pColor2

save hThread1, hThread2, pColor1, pColor2

   select case (message)
      case (WM_CREATE)
         pColor1 = #00007F00
         hThread1 = CreateThread (NULL_SECURITY_ATTRIBUTES, 0,                             &
                              LOC(ThreadProc),                    &
                              LOC(pColor1), 0,                    &
                              LOC(ThreadID1))

         if (hThread1 == 0) then
            write(Buf, 100) GetLastError()
100         FORMAT ('Error in creating Green thread: ', I5)
            i = MessageBox (hwnd, Buf, "WM_CREATE"C, MB_OK)
         end if


         call Sleep (4500)             ! Allow some time/distance between the
                                      ! thread boxes.

         pColor2 = #0000007F
         hThread2 = CreateThread (NULL_SECURITY_ATTRIBUTES, 0,                             &
                              LOC(ThreadProc),                    &
                              LOC(pColor2), 0,                    &
                              LOC(ThreadID2))
         if (hThread2 == 0) then
            write(Buf, 200) GetLastError()
200         FORMAT ('Error in creating Red thread: ', I5)
            i = MessageBox (hwnd, Buf, "WM_CREATE"C, MB_OK)
         end if

         call Sleep (4500)             ! Allow some time/distance between the

         MainWndProc = 0
         return

      case (WM_COMMAND)
         select case (INT4(LOWORD(wParam)))
            case (IDM_SUSPENDGREEN)           ! Suspends green thread.
               i = SuspendThread (hThread1)
               GreenSuspendCnt = GreenSuspendCnt + 1
               write (Buf, 300) GreenSuspendCnt
300            FORMAT('The suspension count for the green thread is now ', I5)
               i   = MessageBox(hWnd, Buf, "Suspension Count"C,MB_OK)
               MainWndProc = 0
               return
            case (IDM_SUSPENDRED)             ! Suspends red thread.
               i = SuspendThread (hThread2)
               RedSuspendCnt = RedSuspendCnt + 1
               write(Buf, 400) RedSuspendCnt
400            FORMAT('The suspension count for the red thread is now ', I5)
               i = MessageBox(hWnd, Buf, "Suspension Count"C,MB_OK)
               MainWndProc = 0
               return

            case (IDM_RESUMEGREEN)            ! Resumes green thread.
               i = ResumeThread (hThread1)
               if (GreenSuspendCnt > 0)   then
                  GreenSuspendCnt = GreenSuspendCnt - 1
               end if
               write(Buf, 500) GreenSuspendCnt
500            FORMAT('The suspension count for the green thread is now ', I5)
               i = MessageBox(hWnd, Buf, "Suspension Count"C,MB_OK)
               MainWndProc = 0
               return

            case (IDM_RESUMERED)              ! Resumes red thread.
               i = ResumeThread (hThread2)
               if (RedSuspendCnt > 0) then
                  RedSuspendCnt = RedSuspendCnt - 1
               end if
               write(Buf, 600) RedSuspendCnt
600            FORMAT('The suspension count for the red thread is now ', I5)
               i = MessageBox(hWnd, Buf, "Suspension Count"C,MB_OK)
               MainWndProc = 0
               return
            case (IDM_GIDLE)                   ! Sets green idle.
               i = SetThreadPriority (hThread1, THREAD_PRIORITY_IDLE)
               MainWndProc = 0
               return
            case (IDM_GLOW)                   ! Sets green lowest.
               i = SetThreadPriority (hThread1, THREAD_PRIORITY_LOWEST)
               MainWndProc = 0
               return     
            case (IDM_GBNORM)                 ! Sets green below normal.
               i = SetThreadPriority (hThread1, THREAD_PRIORITY_BELOW_NORMAL)
               MainWndProc = 0
               return

            case (IDM_GNORM)                  ! Sets green to normal.
               i = SetThreadPriority (hThread1, THREAD_PRIORITY_NORMAL)
               MainWndProc = 0
               return

            case (IDM_GANORM)                 ! Sets green above normal.
               i = SetThreadPriority (hThread1, THREAD_PRIORITY_ABOVE_NORMAL)
               MainWndProc = 0
               return

            case (IDM_GHIGH)                  ! Sets green to highest.
               i = SetThreadPriority (hThread1, THREAD_PRIORITY_HIGHEST)
               MainWndProc = 0
               return

            case (IDM_GTC)                   ! Sets green time critical.
               i = SetThreadPriority (hThread1,THREAD_PRIORITY_TIME_CRITICAL)
               MainWndProc = 0
               return
            case (IDM_RIDLE)                   ! Sets red idle.
               i = SetThreadPriority (hThread1, THREAD_PRIORITY_IDLE)
               MainWndProc = 0
               return
            case (IDM_RLOW)                   ! Sets red to lowest possible
               i   = SetThreadPriority (hThread2, THREAD_PRIORITY_LOWEST)
               MainWndProc = 0
               return
            case  (IDM_RBNORM)                 ! Sets red below normal.
               i = SetThreadPriority (hThread2,THREAD_PRIORITY_BELOW_NORMAL)
               MainWndProc = 0
               return

            case (IDM_RNORM)                  ! Sets red to normal.
               i = SetThreadPriority (hThread2, THREAD_PRIORITY_NORMAL)
               MainWndProc = 0
               return

            case (IDM_RANORM)                 ! Sets red above normal.
               i = SetThreadPriority (hThread2, THREAD_PRIORITY_ABOVE_NORMAL)
               MainWndProc = 0
               return

            case (IDM_RHIGH)                  ! Sets red to highest.
               i = SetThreadPriority (hThread2, THREAD_PRIORITY_HIGHEST)
               MainWndProc = 0
               return

            case (IDM_RTC)                   ! Sets green time critical.
               i = SetThreadPriority (hThread1, THREAD_PRIORITY_TIME_CRITICAL)
               MainWndProc = 0
               return
            case default
               MainWndProc = 0
               return
         end select 
      case (WM_DESTROY )
         i = TerminateThread(hThread1, 0)
         i = TerminateThread(hThread2, 0)
         call PostQuitMessage (0)
         MainWndProc = 0
         return
   end select 
   MainWndProc = DefWindowProc (hwnd, message, wParam, lParam)
   return
end 

