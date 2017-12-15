��          �               �  :   �  �   �     �    �     �  �   �  X   Q  �  �  S   r  �   �  S   �     �  >   �  �  %  f   �	  0   %
  �   V
  b     �   f     [  D   |  >   �  ?      >   @  @     �  �  :   w  �   �     C    O     m  �   }  X     �  d  S   ,  �   �  S   <     �  >   �  �  �  f   x  0   �  �     b   �  �           D   6  >   {  ?   �  >   �  @   9   :mod:`msvcrt` --- Useful routines from the MS VC++ runtime Cause the byte string *char* to be "pushed back" into the console buffer; it will be the next character read by :func:`getch` or :func:`getche`. Console I/O Create a C runtime file descriptor from the file handle *handle*.  The *flags* parameter should be a bitwise OR of :const:`os.O_APPEND`, :const:`os.O_RDONLY`, and :const:`os.O_TEXT`.  The returned file descriptor may be used as a parameter to :func:`os.fdopen` to create a file object. File Operations Force the :c:func:`malloc` heap to clean itself up and return unused blocks to the operating system.  On failure, this raises :exc:`OSError`. Further documentation on these functions can be found in the Platform API documentation. Lock part of a file based on file descriptor *fd* from the C runtime.  Raises :exc:`OSError` on failure.  The locked region of the file extends from the current file position for *nbytes* bytes, and may continue beyond the end of the file.  *mode* must be one of the :const:`LK_\*` constants listed below. Multiple regions in a file may be locked at the same time, but may not overlap.  Adjacent regions are not merged; they must be unlocked individually. Locks the specified bytes. If the bytes cannot be locked, :exc:`OSError` is raised. Locks the specified bytes. If the bytes cannot be locked, the program immediately tries again after 1 second.  If, after 10 attempts, the bytes cannot be locked, :exc:`OSError` is raised. Operations in this module now raise :exc:`OSError` where :exc:`IOError` was raised. Other Functions Print the byte string *char* to the console without buffering. Read a keypress and return the resulting character as a byte string. Nothing is echoed to the console.  This call will block if a keypress is not already available, but will not wait for :kbd:`Enter` to be pressed. If the pressed key was a special function key, this will return ``'\000'`` or ``'\xe0'``; the next call will return the keycode. The :kbd:`Control-C` keypress cannot be read with this function. Return the file handle for the file descriptor *fd*.  Raises :exc:`OSError` if *fd* is not recognized. Return true if a keypress is waiting to be read. Set the line-end translation mode for the file descriptor *fd*. To set it to text mode, *flags* should be :const:`os.O_TEXT`; for binary, it should be :const:`os.O_BINARY`. Similar to :func:`getch`, but the keypress will be echoed if it  represents a printable character. The module implements both the normal and wide char variants of the console I/O api. The normal API deals only with ASCII characters and is of limited use for internationalized applications. The wide char API should be used where ever possible. These functions provide access to some useful capabilities on Windows platforms. Some higher-level modules use these functions to build the  Windows implementations of their services.  For example, the :mod:`getpass` module uses this in the implementation of the :func:`getpass` function. Unlocks the specified bytes, which must have been previously locked. Wide char variant of :func:`getch`, returning a Unicode value. Wide char variant of :func:`getche`, returning a Unicode value. Wide char variant of :func:`putch`, accepting a Unicode value. Wide char variant of :func:`ungetch`, accepting a Unicode value. Project-Id-Version: Python 3.6
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2017-12-12 17:30+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_Hans_CN
Language-Team: Chinese (China) (https://www.transifex.com/python-doc/teams/5390/zh_CN/)
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.0
 :mod:`msvcrt` --- Useful routines from the MS VC++ runtime Cause the byte string *char* to be "pushed back" into the console buffer; it will be the next character read by :func:`getch` or :func:`getche`. Console I/O Create a C runtime file descriptor from the file handle *handle*.  The *flags* parameter should be a bitwise OR of :const:`os.O_APPEND`, :const:`os.O_RDONLY`, and :const:`os.O_TEXT`.  The returned file descriptor may be used as a parameter to :func:`os.fdopen` to create a file object. File Operations Force the :c:func:`malloc` heap to clean itself up and return unused blocks to the operating system.  On failure, this raises :exc:`OSError`. Further documentation on these functions can be found in the Platform API documentation. Lock part of a file based on file descriptor *fd* from the C runtime.  Raises :exc:`OSError` on failure.  The locked region of the file extends from the current file position for *nbytes* bytes, and may continue beyond the end of the file.  *mode* must be one of the :const:`LK_\*` constants listed below. Multiple regions in a file may be locked at the same time, but may not overlap.  Adjacent regions are not merged; they must be unlocked individually. Locks the specified bytes. If the bytes cannot be locked, :exc:`OSError` is raised. Locks the specified bytes. If the bytes cannot be locked, the program immediately tries again after 1 second.  If, after 10 attempts, the bytes cannot be locked, :exc:`OSError` is raised. Operations in this module now raise :exc:`OSError` where :exc:`IOError` was raised. Other Functions Print the byte string *char* to the console without buffering. Read a keypress and return the resulting character as a byte string. Nothing is echoed to the console.  This call will block if a keypress is not already available, but will not wait for :kbd:`Enter` to be pressed. If the pressed key was a special function key, this will return ``'\000'`` or ``'\xe0'``; the next call will return the keycode. The :kbd:`Control-C` keypress cannot be read with this function. Return the file handle for the file descriptor *fd*.  Raises :exc:`OSError` if *fd* is not recognized. Return true if a keypress is waiting to be read. Set the line-end translation mode for the file descriptor *fd*. To set it to text mode, *flags* should be :const:`os.O_TEXT`; for binary, it should be :const:`os.O_BINARY`. Similar to :func:`getch`, but the keypress will be echoed if it  represents a printable character. The module implements both the normal and wide char variants of the console I/O api. The normal API deals only with ASCII characters and is of limited use for internationalized applications. The wide char API should be used where ever possible. These functions provide access to some useful capabilities on Windows platforms. Some higher-level modules use these functions to build the  Windows implementations of their services.  For example, the :mod:`getpass` module uses this in the implementation of the :func:`getpass` function. Unlocks the specified bytes, which must have been previously locked. Wide char variant of :func:`getch`, returning a Unicode value. Wide char variant of :func:`getche`, returning a Unicode value. Wide char variant of :func:`putch`, accepting a Unicode value. Wide char variant of :func:`ungetch`, accepting a Unicode value. 