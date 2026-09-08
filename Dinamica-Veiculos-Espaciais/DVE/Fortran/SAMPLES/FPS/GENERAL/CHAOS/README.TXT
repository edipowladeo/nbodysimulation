                                                 CHAOS Demo Program

CHAOS is a QuickWin demo program developed using Microsoft Fortran PowerStation 4.0. It demonstrates
PowerStation's ability through the use of QuickWin and Fortran 90 to create a functional Windows
application without having to know Windows programming.  CHAOS demonstrates the use of menus, dialog boxes
for input and output, message boxes for the signaling of error states, various ways of
recovering from error conditions and still keep the program running, QuickWin graphics routines, 
multi-threading, and Fortran 90.

CHAOS allows the user to generate images based on one of three sets of symmetrical chaos equations in two
dimensions.  The equations simulate three fold, four fold, and five fold symmetric chaos.  The image is
created by taking the output of the set of equations, relating it to a pixel location on the screen, and
relating the color of the pixel to the number of times that the pixel has been hit.  The user can manipulate
various aspects of the image through various dialog boxes.  These aspects include the equation
coefficients, the number of points that is used to create the image, the color palette that is used, the
number of hits that a pixel gets before it changes colors, the size of the image, the screen resolution of
the image.  There is also an option that allows the user to plot multiple copies of the base image that is rotated
through a user defined angle.  The user has the option of saving the image as a bitmap (.bmp file) or they can 
save the chaos data and the palette data in separate data files.

There are various help screens associated with each of the dialogs that explain their usage and the limits
of the information that is input or output through them.  One of the biggest things to remember is
that small changes in the equation coefficients and/or the initial conditions can result in radically
different images.  Several sample input data files for each of the various equations (*.dat files), along with
some sample input files for palette generation (*.pal files), are supplied as a starting point.  Have fun and enjoy!!!!!


REQUIREMENTS FOR RUNNING CHAOS

  CHAOS requires either Windows NT 3.51 or Windows95.  Also, this file (README.TXT) needs to be in the same 
  subdirectory as the executable, CHAOS.EXE.  To run the demo mode all of the input data files provided with 
  this sample also need to be in this subdirectory.


Following is a description of the various menus and their operations.

File Menu
  The file menu has the following sub-menus:

  Input Chaos Data File...
       This menu brings up a dialog box that allows the user to input a data file that contains the parameters
       required to generate an image.  If the data files are not in the subdirectory that the executable is in,
       the path to the data file must be included.

  Input Palette Data File...
       This menu brings up a dialog box that allows the user to input a data file that contains the parameters
       required to generate a new palette.  If the data files are not in the subdirectory that the executable is
       in, the path to the data file must be included.

  Save Chaos Data File...
       This menu brings up a dialog box that allows the user to save a data file that contains the parameters
       that can be used to generate a new chaos image.  The information is extracted from information the user
       has input through the program.  If the data files are not to be saved in the subdirectory that the
       executable is in, the path to desired location for the data file must be included.

  Save Palette Data File...
       This menu brings up a dialog box that allows the user to save a data file that contains the parameters
       that can be used to generate a new palette.  The information is extracted from information the user has
       input through the program.  If the data files are not to be saved in the subdirectory that the
       executable is in, the path to desired location for the data file must be included.

  Print
       This allows the user to print the image to a line printer.

  Save
       This allows the user to save the image as a .bmp file.

  Exit
       Terminates the program.

Input Menu
  This menu has sub-menus that allows the user to input data into the program.  The sub-menus are:

  Set Video Mode...
      This menu brings up a dialog box that allows the user to specify the screen resolution and number of
      colors used to generate the image.  If a set of parameters is chosen that is not compatible with the 
      video driver being used, an error message is given and the parameters are set to the maximum parameters
      allowed for the video driver.

  Chaos Symmetry...
      This menu brings up a dialog box that allows the user to select the desired symmetry of the chaos
      equation.
 
  Chaos Coefficients...
      This menu brings up a dialog box that allows the user to input coefficient values for the selected chaos
      equation.  Small changes to the coefficients can results in wildly different images and, at times
      floating point errors. It is recommended that if the user would like to save the information entered that
      the file is saved before the start of the image generation.

  Number of Points To Waste...
      This menu brings up a dialog box that allows the user to input the number of points that will be
      calculated before the minimum/maximum calculations are started.  The chaos equations tend to produce wild
      results before settling down to produce some good images.  Setting this parameter allows these points to
      be ignored before the image is plotted.  If when the image is generated you notice that there are points
      that lie well outside of the main image, this number should be increased.

  Number of Points for Min/Max Calculations...
      This menu brings up a dialog box that allows the user to input the number of points that will be
      calculations to determine the minimum/maximum boundaries for the image.  This is done to set some internal
      parameters that relate the output of the chaos equations to the absolute pixel addressing used to
      plot the image.  This is to try to ensure that the image fits on the screen.  If after the image is
      generated it appears either too small or too large for the screen, this number can be adjusted
      accordingly.  The image size can also be adjusted with the image scale factor.

  Number of Points for Image Calculations...
      This menu brings up a dialog box that allows the user to input the total number of points that are calculated for
      the image.  It is limited to the largest INTEGER(KIND=4) number allowed by the compiler.

  Drawing Scale Factor...
      This menu brings up a dialog box that allows the user to input a scale factor to adjust the size of the generated
      image.  To make the image smaller, enter a number greater than 1; to make it smaller, enter a number less that 
      one.

  Initial X and Y Conditions...
      This menu brings up a dialog box that allows the user to input the initial X and Y values for the chaos equations.
      Small changes to the initial conditions can results in wildly different images, and at times floating point 
      errors.  It is recommended that if the user would like to save the information entered that the file is saved 
      before the start of the image generation.

  Drawing Rotation...
      This menu brings up a dialog box that allows the user to input an angle of rotation to plot multiple copies of 
      the image on the screen.  When this option is activated the minimum value for the image is translated to the 
      zero point of the x and y axes and the maximum value for the image is translated to the +/- limits for the x 
      and y axes.  The image is then repeated every n number of degrees about this new zero point.  The value of n is 
      adjusted so that there is an integral number of images generated.

  Color Stepping...
      This menu brings up a dialog box that allows the user to determine how many times a pixel is hit before
      it changes color.  When the chaos equation is producing output, a pixel may be hit a multiple number of
      times.  This parameter allows the user to manipulate the color of the image by determining when the
      pixels change colors.

  Palette Generation...
      This menu brings up a dialog box that allows the user to set some parameters used to generate a new palette.  The
      intensity of the red, green, and blue components can be controlled independently.  By default these are 
      controlled by three cosine functions.  To see how this is done, please refer to the subroutine source file 
      palette.F90.

View Menu
  This menu has sub-menus that allows the user view some things about the image. The sub-menus are:

  Video Mode...
    This menu brings up a dialog box that displays the current screen resolution and number of colors being used.

  Palette
    This menu produces an image that displays the palette that the user has generated by using the Input.palette 
    Generation menu.  A band at the top shows the palette colors and a plot in the lower part of the screen displays
    the intensity of each of the primary colors, red, green, and blue, that is used to generate a particular color in 
    the palette.

  Drawing Statistics...
    This menu brings up a dialog box that provides information on the image being generated.  This information is
    the time that has elapsed since the image was started, the number of points plotted so far, and the
    number of points per second that are being plotted.

Run Menu
  This menu has the sub-menus that deal with the actual image generation.

  Go
    This menu starts the image generation.  The program uses a buffered SETPIXEL routine to speed the
    drawing of the image, and to increase the speed of the program.  Because of this, there is a brief delay
    before the image appears.

  Stop Drawing
    This menu allows the user to stop the image generation before the specified number of points is reached.
    A message box appears to inform the user that the drawing has been terminated.

  Demo
    This menu puts the program into a demo mode.  In this mode, the program loops continuously through the
    provided set of input data files generating a set of images composed of 300,000 points.  The demo mode
    can be stopped using the Run.Stop Drawing command

  Pause/Resume
    This menu item is Pause when the drawing is in progress.  When Pause is selected, the drawing is paused and the
    menu item changes to Resume.  A message also appears in the status bar telling the user that the program
    has been paused.  The image generation begins from where it left off when Resume is chosen.  When the image is 
    paused, it may not stop drawing immediately.  This is do to the fact that a buffered SETPIXEL routine is used
    and whenever drawing is stopped for any reason, the pixel buffer need to be flushed.

Windows Menu
  This menu has standard Windows sub-menus for organizing and positioning the child windows. 

Help Menu
  This menu has an About menu item that displays an About box and More Information menu item that displays this file.
