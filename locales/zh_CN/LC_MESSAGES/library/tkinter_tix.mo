��    I      d              �  -   �  /   �  )       5  �   C  L  @     �     �  8   �     �      	     !  E   -  �  s  �  3     �     �  8   �  7   3  E  k    �  x   �  �  8         "  e  4  #   �  �   �  2  g    �  M  �    �           S  1!  -  �"  T  �#  �   %  0  �%  �   �&  �   �'  E  v(  �  �)  �   �+  ~  C,     �-  E  B.  
  �/  �   �0  �   o1  �  2  �   �3  b  �4  ]   6  v   w6  f   �6     U7     b7  �   n7  �  B8  �   �9  3   �:  w   �:  	   2;    <;  �  T<  �   �=  R   x>  -   �>  ?   �>  ^   9?  �   �?  �  P@  -   B  /   5B  )  eB     �C  �   �C  L  �D     �E     �E  8   F     EF     ZF     {H  E   �H  �  �H  �  �J     .M     >M  8   TM  7   �M  E  �M    P  x   Q  �  �Q     lS    |S  e  �T  #   �V  �   W  2  �W    �X  M  �Y    D[    [\    t]  S  �^  -  �_  T  a  �   bb  0  �b  �   $d  �   �d  E  �e  �  g  �   �h  ~  �i     k  E  �k  
  �l  �   �m  �   �n  �  no  �   ,q  b  r  ]   ss  v   �s  f   Ht     �t     �t  �   �t  �  �u  �   6w  3   �w  w   x  	   �x    �x  �  �y  �   @{  R   �{  -   %|  ?   S|  ^   �|  �   �|   **Source code:** :source:`Lib/tkinter/tix.py` :mod:`tkinter.tix` --- Extension widgets for Tk A `Balloon <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixBalloon.htm>`_ that pops up over a widget to provide help.  When the user moves the cursor inside a widget to which a Balloon widget has been bound, a small pop-up window with a descriptive message will be shown on the screen. Basic Widgets Because of the way Tk handles the X option database, after Tix has been has imported and inited, it is not possible to reset the color schemes and font sets using the :meth:`tix_config` method. Instead, the :meth:`tix_resetoptions` method must be used. Classes in the :mod:`tkinter.tix` module subclasses the classes in the :mod:`tkinter`. The former imports the latter, so to use :mod:`tkinter.tix` with Tkinter, all you need to do is to import one module. In general, you can just import :mod:`tkinter.tix`, and replace the toplevel call to :class:`tkinter.Tk` with :class:`tix.Tk`:: File Selectors Form Geometry Manager Gets the options maintained by the Tix scheme mechanism. Hierarchical ListBox If this fails, you have a Tk installation problem which must be resolved before proceeding. Use the environment variable :envvar:`TIX_LIBRARY` to point to the installed Tix library directory, and make sure you have the dynamic object library (:file:`tix8183.dll` or :file:`libtix8183.so`) in  the same directory that contains your Tk dynamic object library (:file:`tk8183.dll` or :file:`libtk8183.so`). The directory with the dynamic object library should also have a file called :file:`pkgIndex.tcl` (case sensitive), which contains the line:: Image Types In addition, :mod:`tkinter.tix` augments :mod:`tkinter` by providing: Locates a bitmap file of the name ``name.xpm`` or ``name`` in one of the bitmap directories (see the :meth:`tix_addbitmapdir` method).  By using :meth:`tix_getbitmap`, you can avoid hard coding the pathnames of the bitmap files in your application. When successful, it returns the complete pathname of the bitmap file, prefixed with the character ``@``.  The returned value can be used to configure the ``bitmap`` option of the Tk and Tix widgets. Locates an image file of the name :file:`name.xpm`, :file:`name.xbm` or :file:`name.ppm` in one of the bitmap directories (see the :meth:`tix_addbitmapdir` method above). If more than one file with the same name (but different extensions) exist, then the image type is chosen according to the depth of the X display: xbm images are chosen on monochrome displays and color images are chosen on color displays. By using :meth:`tix_getimage`, you can avoid hard coding the pathnames of the image files in your application. When successful, this method returns the name of the newly created image, which can be used to configure the ``image`` option of the Tk and Tix widgets. Manager Widgets Miscellaneous Widgets On-line version of the man pages and reference material. On-line version of the programmer's reference material. Query or modify the configuration options of the Tix application context. If no option is specified, returns a dictionary all of the available options.  If option is specified with no value, then the method returns a list describing the one named option (this list will be identical to the corresponding sublist of the value returned if no option is specified).  If one or more option-value pairs are specified, then the method modifies the given option(s) to have the given value(s); in this case the method returns an empty string. Option may be any of the configuration options. Resets the scheme and fontset of the Tix application to *newScheme* and *newFontSet*, respectively.  This affects only those widgets created after this call.  Therefore, it is best to call the resetoptions method before the creation of any widgets in a Tix application. Returns the current value of the configuration option given by *option*. Option may be any of the configuration options. Returns the file selection dialog that may be shared among different calls from this application.  This method will create a file selection dialog widget when it is called the first time. This dialog will be returned by all subsequent calls to :meth:`tix_filedialog`.  An optional dlgclass parameter can be passed as a string to specified what type of file selection dialog widget is desired. Possible options are ``tix``, ``FileSelectDialog`` or ``tixExFileSelectDialog``. Tabular ListBox The :class:`DirSelectBox` is similar to the standard Motif(TM) directory-selection box. It is generally used for the user to choose a directory.  DirSelectBox stores the directories mostly recently selected into a ComboBox widget so that they can be quickly selected again. The :mod:`tkinter.tix` (Tk Interface Extension) module provides an additional rich set of widgets. Although the standard Tk library has many useful widgets, they are far from complete. The :mod:`tkinter.tix` library provides most of the commonly needed widgets that are missing from standard Tk: :class:`HList`, :class:`ComboBox`, :class:`Control` (a.k.a. SpinBox) and an assortment of scrollable widgets. :mod:`tkinter.tix` also includes many more widgets that are generally useful in a wide range of applications: :class:`NoteBook`, :class:`FileEntry`, :class:`PanedWindow`, etc; there are more than 40 of them. The :mod:`tkinter.tix` module adds: The `ButtonBox <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixButtonBox.htm>`_ widget creates a box of buttons, such as is commonly used for ``Ok Cancel``. The `CheckList <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixCheckList.htm>`_ widget displays a list of items to be selected by the user. CheckList acts similarly to the Tk checkbutton or radiobutton widgets, except it is capable of handling many more items than checkbuttons or radiobuttons. The `ComboBox <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixComboBox.htm>`_ widget is similar to the combo box control in MS Windows. The user can select a choice by either typing in the entry subwidget or selecting from the listbox subwidget. The `Control <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixControl.htm>`_ widget is also known as the :class:`SpinBox` widget. The user can adjust the value by pressing the two arrow buttons or by entering the value directly into the entry. The new value will be checked against the user-defined upper and lower limits. The `DirList <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixDirList.htm>`_ widget displays a list view of a directory, its previous directories and its sub-directories. The user can choose one of the directories displayed in the list or change to another directory. The `DirSelectDialog <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixDirSelectDialog.htm>`_ widget presents the directories in the file system in a dialog window.  The user can use this dialog window to navigate through the file system to select the desired directory. The `DirTree <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixDirTree.htm>`_ widget displays a tree view of a directory, its previous directories and its sub-directories. The user can choose one of the directories displayed in the list or change to another directory. The `ExFileSelectBox <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixExFileSelectBox.htm>`_ widget is usually embedded in a tixExFileSelectDialog widget. It provides a convenient method for the user to select files. The style of the :class:`ExFileSelectBox` widget is very similar to the standard file dialog on MS Windows 3.1. The `FileEntry <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixFileEntry.htm>`_ widget can be used to input a filename. The user can type in the filename manually. Alternatively, the user can press the button widget that sits next to the entry, which will bring up a file selection dialog. The `FileSelectBox <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixFileSelectBox.htm>`_ is similar to the standard Motif(TM) file-selection box. It is generally used for the user to choose a file. FileSelectBox stores the files mostly recently selected into a :class:`ComboBox` widget so that they can be quickly selected again. The `Form <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixForm.htm>`_ geometry manager based on attachment rules for all Tk widgets. The `HList <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixHList.htm>`_ widget can be used to display any data that have a hierarchical structure, for example, file system directory trees. The list entries are indented and connected by branch lines according to their places in the hierarchy. The `InputOnly <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixInputOnly.htm>`_ widgets are to accept inputs from the user, which can be done with the ``bind`` command (Unix only). The `LabelEntry <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixLabelEntry.htm>`_ widget packages an entry widget and a label into one mega widget. It can be used to simplify the creation of "entry-form" type of interface. The `LabelFrame <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixLabelFrame.htm>`_ widget packages a frame widget and a label into one mega widget.  To create widgets inside a LabelFrame widget, one creates the new widgets relative to the :attr:`frame` subwidget and manage them inside the :attr:`frame` subwidget. The `ListNoteBook <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixListNoteBook.htm>`_ widget is very similar to the :class:`TixNoteBook` widget: it can be used to display many windows in a limited space using a notebook metaphor. The notebook is divided into a stack of pages (windows). At one time only one of these pages can be shown. The user can navigate through these pages by choosing the name of the desired page in the :attr:`hlist` subwidget. The `Meter <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixMeter.htm>`_ widget can be used to show the progress of a background job which may take a long time to execute. The `NoteBook <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixNoteBook.htm>`_ widget can be used to display many windows in a limited space using a notebook metaphor. The notebook is divided into a stack of pages. At one time only one of these pages can be shown. The user can navigate through these pages by choosing the visual "tabs" at the top of the NoteBook widget. The `OptionMenu <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixOptionMenu.htm>`_ creates a menu button of options. The `PanedWindow <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixPanedWindow.htm>`_ widget allows the user to interactively manipulate the sizes of several panes. The panes can be arranged either vertically or horizontally.  The user changes the sizes of the panes by dragging the resize handle between two panes. The `PopupMenu <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixPopupMenu.htm>`_ widget can be used as a replacement of the ``tk_popup`` command. The advantage of the :mod:`Tix` :class:`PopupMenu` widget is it requires less application code to manipulate. The `Select <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixSelect.htm>`_ widget is a container of button subwidgets. It can be used to provide radio-box or check-box style of selection options for the user. The `StdButtonBox <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixStdButtonBox.htm>`_ widget is a group of standard buttons for Motif-like dialog boxes. The `TList <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixTList.htm>`_ widget can be used to display data in a tabular format. The list entries of a :class:`TList` widget are similar to the entries in the Tk listbox widget.  The main differences are (1) the :class:`TList` widget can display the list entries in a two dimensional format and (2) you can use graphical images as well as multiple colors and fonts for the list entries. The `Tree <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixTree.htm>`_ widget can be used to display hierarchical data in a tree form. The user can adjust the view of the tree by opening or closing parts of the tree. The `tix commands <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tix.htm>`_ provide access to miscellaneous elements of :mod:`Tix`'s internal state and the :mod:`Tix` application context.  Most of the information manipulated by these methods pertains to the application as a whole, or to a screen or display, rather than to a particular window. The home page for :mod:`Tix`.  This includes links to additional documentation and downloads. The optional parameter *newScmPrio* can be given to reset the priority level of the Tk options set by the Tix schemes. This Tk extension is unmaintained and should not be used in new code.  Use :mod:`tkinter.ttk` instead. Tix Commands Tix Widgets Tix applications for development of Tix and Tkinter programs. Tide applications work under Tk or Tkinter, and include :program:`TixInspect`, an inspector to remotely modify and debug Tix/Tk/Tkinter applications. Tix maintains a list of directories under which the :meth:`tix_getimage` and :meth:`tix_getbitmap` methods will search for image files.  The standard bitmap directory is :file:`$TIX_LIBRARY/bitmaps`. The :meth:`tix_addbitmapdir` method adds *directory* into this list. By using this method, the image files of an applications can also be located using the :meth:`tix_getimage` or :meth:`tix_getbitmap` method. To use :mod:`tkinter.tix`, you must have the Tix widgets installed, usually alongside your installation of the Tk widgets. To test your installation, try the following:: To view the current settings, the common usage is:: Toplevel widget of Tix which represents mostly the main window of an application. It has an associated Tcl interpreter. Using Tix With all these new widgets, you can introduce new interaction techniques into applications, creating more useful and more intuitive user interfaces. You can design your application by choosing the most appropriate widgets to match the special needs of your application and users. `Compound <http://tix.sourceforge.net/dist/current/man/html/TixCmd/compound.htm>`_ image types can be used to create images that consists of multiple horizontal lines; each line is composed of a series of items (texts, bitmaps, images or spaces) arranged from left to right. For example, a compound image can be used to display a bitmap and a text string simultaneously in a Tk :class:`Button` widget. `Tix <http://tix.sourceforge.net/dist/current/man/html/TixCmd/TixIntro.htm>`_ introduces over 40 widget classes to the :mod:`tkinter` repertoire. `Tix Development Applications <http://tix.sourceforge.net/Tixapps/src/Tide.html>`_ `Tix Homepage <http://tix.sourceforge.net/>`_ `Tix Man Pages <http://tix.sourceforge.net/dist/current/man/>`_ `Tix Programming Guide <http://tix.sourceforge.net/dist/current/docs/tix-book/tix.book.html>`_ `pixmap <http://tix.sourceforge.net/dist/current/man/html/TixCmd/pixmap.htm>`_ capabilities to all :mod:`tkinter.tix` and :mod:`tkinter` widgets to create color images from XPM files. Project-Id-Version: Python 3.6
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-01-05 15:01+0000
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_Hans_CN
Language-Team: Chinese (China) (https://www.transifex.com/python-doc/teams/5390/zh_CN/)
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.1
 **Source code:** :source:`Lib/tkinter/tix.py` :mod:`tkinter.tix` --- Extension widgets for Tk A `Balloon <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixBalloon.htm>`_ that pops up over a widget to provide help.  When the user moves the cursor inside a widget to which a Balloon widget has been bound, a small pop-up window with a descriptive message will be shown on the screen. Basic Widgets Because of the way Tk handles the X option database, after Tix has been has imported and inited, it is not possible to reset the color schemes and font sets using the :meth:`tix_config` method. Instead, the :meth:`tix_resetoptions` method must be used. Classes in the :mod:`tkinter.tix` module subclasses the classes in the :mod:`tkinter`. The former imports the latter, so to use :mod:`tkinter.tix` with Tkinter, all you need to do is to import one module. In general, you can just import :mod:`tkinter.tix`, and replace the toplevel call to :class:`tkinter.Tk` with :class:`tix.Tk`:: File Selectors Form Geometry Manager Gets the options maintained by the Tix scheme mechanism. Hierarchical ListBox If this fails, you have a Tk installation problem which must be resolved before proceeding. Use the environment variable :envvar:`TIX_LIBRARY` to point to the installed Tix library directory, and make sure you have the dynamic object library (:file:`tix8183.dll` or :file:`libtix8183.so`) in  the same directory that contains your Tk dynamic object library (:file:`tk8183.dll` or :file:`libtk8183.so`). The directory with the dynamic object library should also have a file called :file:`pkgIndex.tcl` (case sensitive), which contains the line:: Image Types In addition, :mod:`tkinter.tix` augments :mod:`tkinter` by providing: Locates a bitmap file of the name ``name.xpm`` or ``name`` in one of the bitmap directories (see the :meth:`tix_addbitmapdir` method).  By using :meth:`tix_getbitmap`, you can avoid hard coding the pathnames of the bitmap files in your application. When successful, it returns the complete pathname of the bitmap file, prefixed with the character ``@``.  The returned value can be used to configure the ``bitmap`` option of the Tk and Tix widgets. Locates an image file of the name :file:`name.xpm`, :file:`name.xbm` or :file:`name.ppm` in one of the bitmap directories (see the :meth:`tix_addbitmapdir` method above). If more than one file with the same name (but different extensions) exist, then the image type is chosen according to the depth of the X display: xbm images are chosen on monochrome displays and color images are chosen on color displays. By using :meth:`tix_getimage`, you can avoid hard coding the pathnames of the image files in your application. When successful, this method returns the name of the newly created image, which can be used to configure the ``image`` option of the Tk and Tix widgets. Manager Widgets Miscellaneous Widgets On-line version of the man pages and reference material. On-line version of the programmer's reference material. Query or modify the configuration options of the Tix application context. If no option is specified, returns a dictionary all of the available options.  If option is specified with no value, then the method returns a list describing the one named option (this list will be identical to the corresponding sublist of the value returned if no option is specified).  If one or more option-value pairs are specified, then the method modifies the given option(s) to have the given value(s); in this case the method returns an empty string. Option may be any of the configuration options. Resets the scheme and fontset of the Tix application to *newScheme* and *newFontSet*, respectively.  This affects only those widgets created after this call.  Therefore, it is best to call the resetoptions method before the creation of any widgets in a Tix application. Returns the current value of the configuration option given by *option*. Option may be any of the configuration options. Returns the file selection dialog that may be shared among different calls from this application.  This method will create a file selection dialog widget when it is called the first time. This dialog will be returned by all subsequent calls to :meth:`tix_filedialog`.  An optional dlgclass parameter can be passed as a string to specified what type of file selection dialog widget is desired. Possible options are ``tix``, ``FileSelectDialog`` or ``tixExFileSelectDialog``. Tabular ListBox The :class:`DirSelectBox` is similar to the standard Motif(TM) directory-selection box. It is generally used for the user to choose a directory.  DirSelectBox stores the directories mostly recently selected into a ComboBox widget so that they can be quickly selected again. The :mod:`tkinter.tix` (Tk Interface Extension) module provides an additional rich set of widgets. Although the standard Tk library has many useful widgets, they are far from complete. The :mod:`tkinter.tix` library provides most of the commonly needed widgets that are missing from standard Tk: :class:`HList`, :class:`ComboBox`, :class:`Control` (a.k.a. SpinBox) and an assortment of scrollable widgets. :mod:`tkinter.tix` also includes many more widgets that are generally useful in a wide range of applications: :class:`NoteBook`, :class:`FileEntry`, :class:`PanedWindow`, etc; there are more than 40 of them. The :mod:`tkinter.tix` module adds: The `ButtonBox <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixButtonBox.htm>`_ widget creates a box of buttons, such as is commonly used for ``Ok Cancel``. The `CheckList <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixCheckList.htm>`_ widget displays a list of items to be selected by the user. CheckList acts similarly to the Tk checkbutton or radiobutton widgets, except it is capable of handling many more items than checkbuttons or radiobuttons. The `ComboBox <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixComboBox.htm>`_ widget is similar to the combo box control in MS Windows. The user can select a choice by either typing in the entry subwidget or selecting from the listbox subwidget. The `Control <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixControl.htm>`_ widget is also known as the :class:`SpinBox` widget. The user can adjust the value by pressing the two arrow buttons or by entering the value directly into the entry. The new value will be checked against the user-defined upper and lower limits. The `DirList <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixDirList.htm>`_ widget displays a list view of a directory, its previous directories and its sub-directories. The user can choose one of the directories displayed in the list or change to another directory. The `DirSelectDialog <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixDirSelectDialog.htm>`_ widget presents the directories in the file system in a dialog window.  The user can use this dialog window to navigate through the file system to select the desired directory. The `DirTree <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixDirTree.htm>`_ widget displays a tree view of a directory, its previous directories and its sub-directories. The user can choose one of the directories displayed in the list or change to another directory. The `ExFileSelectBox <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixExFileSelectBox.htm>`_ widget is usually embedded in a tixExFileSelectDialog widget. It provides a convenient method for the user to select files. The style of the :class:`ExFileSelectBox` widget is very similar to the standard file dialog on MS Windows 3.1. The `FileEntry <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixFileEntry.htm>`_ widget can be used to input a filename. The user can type in the filename manually. Alternatively, the user can press the button widget that sits next to the entry, which will bring up a file selection dialog. The `FileSelectBox <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixFileSelectBox.htm>`_ is similar to the standard Motif(TM) file-selection box. It is generally used for the user to choose a file. FileSelectBox stores the files mostly recently selected into a :class:`ComboBox` widget so that they can be quickly selected again. The `Form <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixForm.htm>`_ geometry manager based on attachment rules for all Tk widgets. The `HList <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixHList.htm>`_ widget can be used to display any data that have a hierarchical structure, for example, file system directory trees. The list entries are indented and connected by branch lines according to their places in the hierarchy. The `InputOnly <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixInputOnly.htm>`_ widgets are to accept inputs from the user, which can be done with the ``bind`` command (Unix only). The `LabelEntry <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixLabelEntry.htm>`_ widget packages an entry widget and a label into one mega widget. It can be used to simplify the creation of "entry-form" type of interface. The `LabelFrame <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixLabelFrame.htm>`_ widget packages a frame widget and a label into one mega widget.  To create widgets inside a LabelFrame widget, one creates the new widgets relative to the :attr:`frame` subwidget and manage them inside the :attr:`frame` subwidget. The `ListNoteBook <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixListNoteBook.htm>`_ widget is very similar to the :class:`TixNoteBook` widget: it can be used to display many windows in a limited space using a notebook metaphor. The notebook is divided into a stack of pages (windows). At one time only one of these pages can be shown. The user can navigate through these pages by choosing the name of the desired page in the :attr:`hlist` subwidget. The `Meter <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixMeter.htm>`_ widget can be used to show the progress of a background job which may take a long time to execute. The `NoteBook <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixNoteBook.htm>`_ widget can be used to display many windows in a limited space using a notebook metaphor. The notebook is divided into a stack of pages. At one time only one of these pages can be shown. The user can navigate through these pages by choosing the visual "tabs" at the top of the NoteBook widget. The `OptionMenu <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixOptionMenu.htm>`_ creates a menu button of options. The `PanedWindow <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixPanedWindow.htm>`_ widget allows the user to interactively manipulate the sizes of several panes. The panes can be arranged either vertically or horizontally.  The user changes the sizes of the panes by dragging the resize handle between two panes. The `PopupMenu <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixPopupMenu.htm>`_ widget can be used as a replacement of the ``tk_popup`` command. The advantage of the :mod:`Tix` :class:`PopupMenu` widget is it requires less application code to manipulate. The `Select <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixSelect.htm>`_ widget is a container of button subwidgets. It can be used to provide radio-box or check-box style of selection options for the user. The `StdButtonBox <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixStdButtonBox.htm>`_ widget is a group of standard buttons for Motif-like dialog boxes. The `TList <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixTList.htm>`_ widget can be used to display data in a tabular format. The list entries of a :class:`TList` widget are similar to the entries in the Tk listbox widget.  The main differences are (1) the :class:`TList` widget can display the list entries in a two dimensional format and (2) you can use graphical images as well as multiple colors and fonts for the list entries. The `Tree <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tixTree.htm>`_ widget can be used to display hierarchical data in a tree form. The user can adjust the view of the tree by opening or closing parts of the tree. The `tix commands <http://tix.sourceforge.net/dist/current/man/html/TixCmd/tix.htm>`_ provide access to miscellaneous elements of :mod:`Tix`'s internal state and the :mod:`Tix` application context.  Most of the information manipulated by these methods pertains to the application as a whole, or to a screen or display, rather than to a particular window. The home page for :mod:`Tix`.  This includes links to additional documentation and downloads. The optional parameter *newScmPrio* can be given to reset the priority level of the Tk options set by the Tix schemes. This Tk extension is unmaintained and should not be used in new code.  Use :mod:`tkinter.ttk` instead. Tix Commands Tix Widgets Tix applications for development of Tix and Tkinter programs. Tide applications work under Tk or Tkinter, and include :program:`TixInspect`, an inspector to remotely modify and debug Tix/Tk/Tkinter applications. Tix maintains a list of directories under which the :meth:`tix_getimage` and :meth:`tix_getbitmap` methods will search for image files.  The standard bitmap directory is :file:`$TIX_LIBRARY/bitmaps`. The :meth:`tix_addbitmapdir` method adds *directory* into this list. By using this method, the image files of an applications can also be located using the :meth:`tix_getimage` or :meth:`tix_getbitmap` method. To use :mod:`tkinter.tix`, you must have the Tix widgets installed, usually alongside your installation of the Tk widgets. To test your installation, try the following:: To view the current settings, the common usage is:: Toplevel widget of Tix which represents mostly the main window of an application. It has an associated Tcl interpreter. Using Tix With all these new widgets, you can introduce new interaction techniques into applications, creating more useful and more intuitive user interfaces. You can design your application by choosing the most appropriate widgets to match the special needs of your application and users. `Compound <http://tix.sourceforge.net/dist/current/man/html/TixCmd/compound.htm>`_ image types can be used to create images that consists of multiple horizontal lines; each line is composed of a series of items (texts, bitmaps, images or spaces) arranged from left to right. For example, a compound image can be used to display a bitmap and a text string simultaneously in a Tk :class:`Button` widget. `Tix <http://tix.sourceforge.net/dist/current/man/html/TixCmd/TixIntro.htm>`_ introduces over 40 widget classes to the :mod:`tkinter` repertoire. `Tix Development Applications <http://tix.sourceforge.net/Tixapps/src/Tide.html>`_ `Tix Homepage <http://tix.sourceforge.net/>`_ `Tix Man Pages <http://tix.sourceforge.net/dist/current/man/>`_ `Tix Programming Guide <http://tix.sourceforge.net/dist/current/docs/tix-book/tix.book.html>`_ `pixmap <http://tix.sourceforge.net/dist/current/man/html/TixCmd/pixmap.htm>`_ capabilities to all :mod:`tkinter.tix` and :mod:`tkinter` widgets to create color images from XPM files. 