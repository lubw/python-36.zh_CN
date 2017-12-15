��    #      4              L  n  M  1   �  ;   �  �   *  5   �  &   '  U   N  l   �  �       �  &     &   (  )   O  %  y     �	  V   �	     �	     
  ,   .
     [
  >   u
  T   �
  X   	  �   b  {   ?  �   �  �   J  �   �    �  d   �  ;   V  �   �  �    �   �  �  �  n  8  1   �  ;   �  �     5   �  &     U   9  l   �  �  �     �  &   �  &     )   :  %  d     �  V   �     �     �  ,        F  >   `  T   �  X   �  �   M  {   *  �   �  �   5   �   �     �!  d   �"  ;   A#  �   }#  �  �#  �   �%   :func:`enable`, :func:`dump_traceback_later` and :func:`register` keep the file descriptor of their *file* argument. If the file is closed and its file descriptor is reused by a new file, or if :func:`os.dup2` is used to replace the file descriptor, the traceback will be written into a different file. Call these functions again each time that the file is replaced. :mod:`faulthandler` --- Dump the Python traceback Added support for passing file descriptor to this function. By default, the Python traceback is written to :data:`sys.stderr`. To see tracebacks, applications must be run in the terminal. A log file can alternatively be passed to :func:`faulthandler.enable`. Cancel the last call to :func:`dump_traceback_later`. Check if the fault handler is enabled. Disable the fault handler: uninstall the signal handlers installed by :func:`enable`. Dump the tracebacks of all threads into *file*. If *all_threads* is ``False``, dump only the current thread. Dump the tracebacks of all threads, after a timeout of *timeout* seconds, or every *timeout* seconds if *repeat* is ``True``.  If *exit* is ``True``, call :c:func:`_exit` with status=1 after dumping the tracebacks.  (Note :c:func:`_exit` exits the process immediately, which means it doesn't do any cleanup like flushing file buffers.) If the function is called twice, the new call replaces previous parameters and resets the timeout. The timer has a sub-second resolution. Dumping the traceback Dumping the traceback on a user signal Dumping the tracebacks after a timeout Each string is limited to 500 characters. Enable the fault handler: install handlers for the :const:`SIGSEGV`, :const:`SIGFPE`, :const:`SIGABRT`, :const:`SIGBUS` and :const:`SIGILL` signals to dump the Python traceback. If *all_threads* is ``True``, produce tracebacks for every running thread. Otherwise, dump only the current thread. Example Example of a segmentation fault on Linux with and without enabling the fault handler:: Fault handler state Issue with file descriptors It is limited to 100 frames and 100 threads. Not available on Windows. On Windows, a handler for Windows exception is also installed. Only ASCII is supported. The ``backslashreplace`` error handler is used on encoding. Only the filename, the function name and the line number are displayed. (no source code) Register a user signal: install a handler for the *signum* signal to dump the traceback of all threads, or of the current thread if *all_threads* is ``False``, into *file*. Call the previous handler if chain is ``True``. The *file* must be kept open until the fault handler is disabled: see :ref:`issue with file descriptors <faulthandler-fd>`. The *file* must be kept open until the signal is unregistered by :func:`unregister`: see :ref:`issue with file descriptors <faulthandler-fd>`. The *file* must be kept open until the traceback is dumped or :func:`cancel_dump_traceback_later` is called: see :ref:`issue with file descriptors <faulthandler-fd>`. The fault handler is called on catastrophic cases and therefore can only use signal-safe functions (e.g. it cannot allocate memory on the heap). Because of this limitation traceback dumping is minimal compared to normal Python tracebacks: The fault handler is compatible with system fault handlers like Apport or the Windows fault handler. The module uses an alternative stack for signal handlers if the :c:func:`sigaltstack` function is available. This allows it to dump the traceback even on a stack overflow. The module is implemented in C, so tracebacks can be dumped on a crash or when Python is deadlocked. The order is reversed: the most recent call is shown first. This function is implemented using a watchdog thread and therefore is not available if Python is compiled with threads disabled. This module contains functions to dump Python tracebacks explicitly, on a fault, after a timeout, or on a user signal. Call :func:`faulthandler.enable` to install fault handlers for the :const:`SIGSEGV`, :const:`SIGFPE`, :const:`SIGABRT`, :const:`SIGBUS`, and :const:`SIGILL` signals. You can also enable them at startup by setting the :envvar:`PYTHONFAULTHANDLER` environment variable or by using the :option:`-X` ``faulthandler`` command line option. Unregister a user signal: uninstall the handler of the *signum* signal installed by :func:`register`. Return ``True`` if the signal was registered, ``False`` otherwise. Project-Id-Version: Python 3.6
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
 :func:`enable`, :func:`dump_traceback_later` and :func:`register` keep the file descriptor of their *file* argument. If the file is closed and its file descriptor is reused by a new file, or if :func:`os.dup2` is used to replace the file descriptor, the traceback will be written into a different file. Call these functions again each time that the file is replaced. :mod:`faulthandler` --- Dump the Python traceback Added support for passing file descriptor to this function. By default, the Python traceback is written to :data:`sys.stderr`. To see tracebacks, applications must be run in the terminal. A log file can alternatively be passed to :func:`faulthandler.enable`. Cancel the last call to :func:`dump_traceback_later`. Check if the fault handler is enabled. Disable the fault handler: uninstall the signal handlers installed by :func:`enable`. Dump the tracebacks of all threads into *file*. If *all_threads* is ``False``, dump only the current thread. Dump the tracebacks of all threads, after a timeout of *timeout* seconds, or every *timeout* seconds if *repeat* is ``True``.  If *exit* is ``True``, call :c:func:`_exit` with status=1 after dumping the tracebacks.  (Note :c:func:`_exit` exits the process immediately, which means it doesn't do any cleanup like flushing file buffers.) If the function is called twice, the new call replaces previous parameters and resets the timeout. The timer has a sub-second resolution. Dumping the traceback Dumping the traceback on a user signal Dumping the tracebacks after a timeout Each string is limited to 500 characters. Enable the fault handler: install handlers for the :const:`SIGSEGV`, :const:`SIGFPE`, :const:`SIGABRT`, :const:`SIGBUS` and :const:`SIGILL` signals to dump the Python traceback. If *all_threads* is ``True``, produce tracebacks for every running thread. Otherwise, dump only the current thread. Example Example of a segmentation fault on Linux with and without enabling the fault handler:: Fault handler state Issue with file descriptors It is limited to 100 frames and 100 threads. Not available on Windows. On Windows, a handler for Windows exception is also installed. Only ASCII is supported. The ``backslashreplace`` error handler is used on encoding. Only the filename, the function name and the line number are displayed. (no source code) Register a user signal: install a handler for the *signum* signal to dump the traceback of all threads, or of the current thread if *all_threads* is ``False``, into *file*. Call the previous handler if chain is ``True``. The *file* must be kept open until the fault handler is disabled: see :ref:`issue with file descriptors <faulthandler-fd>`. The *file* must be kept open until the signal is unregistered by :func:`unregister`: see :ref:`issue with file descriptors <faulthandler-fd>`. The *file* must be kept open until the traceback is dumped or :func:`cancel_dump_traceback_later` is called: see :ref:`issue with file descriptors <faulthandler-fd>`. The fault handler is called on catastrophic cases and therefore can only use signal-safe functions (e.g. it cannot allocate memory on the heap). Because of this limitation traceback dumping is minimal compared to normal Python tracebacks: The fault handler is compatible with system fault handlers like Apport or the Windows fault handler. The module uses an alternative stack for signal handlers if the :c:func:`sigaltstack` function is available. This allows it to dump the traceback even on a stack overflow. The module is implemented in C, so tracebacks can be dumped on a crash or when Python is deadlocked. The order is reversed: the most recent call is shown first. This function is implemented using a watchdog thread and therefore is not available if Python is compiled with threads disabled. This module contains functions to dump Python tracebacks explicitly, on a fault, after a timeout, or on a user signal. Call :func:`faulthandler.enable` to install fault handlers for the :const:`SIGSEGV`, :const:`SIGFPE`, :const:`SIGABRT`, :const:`SIGBUS`, and :const:`SIGILL` signals. You can also enable them at startup by setting the :envvar:`PYTHONFAULTHANDLER` environment variable or by using the :option:`-X` ``faulthandler`` command line option. Unregister a user signal: uninstall the handler of the *signum* signal installed by :func:`register`. Return ``True`` if the signal was registered, ``False`` otherwise. 