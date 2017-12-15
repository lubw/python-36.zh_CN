��    !      $              ,  �   -  E   �  K   "  C   n  -   �  )   �     
  9   %  8  _     �  +   �  �  �  l   �    %  :   :	  D   u	  D   �	  �   �	  P   �
     -    >  a   U  
  �  Z  �  �     �     +   �  �   �  |   �  �   ?    �    �  �     �   �  E   f  K   �  C   �  -   <  )   j     �  9   �  8  �     "  +   /  �  [  l   B     �   :   �!  D   �!  D   D"  �   �"  P   f#     �#    �#  a   �$  
  A%  Z  L&  �   �*  �   �+  +   U,  �   �,  |   L-  �   �-    {.    ~/   *len* is the number of bytes to lock, *start* is the byte offset at which the lock starts, relative to *whence*, and *whence* is as with :func:`io.IOBase.seek`, specifically: :const:`0` -- relative to the start of the file (:data:`os.SEEK_SET`) :const:`1` -- relative to the current buffer position (:data:`os.SEEK_CUR`) :const:`2` -- relative to the end of the file (:data:`os.SEEK_END`) :const:`LOCK_EX` -- acquire an exclusive lock :const:`LOCK_SH` -- acquire a shared lock :const:`LOCK_UN` -- unlock :mod:`fcntl` --- The ``fcntl`` and ``ioctl`` system calls All functions in this module take a file descriptor *fd* as their first argument.  This can be an integer file descriptor, such as returned by ``sys.stdin.fileno()``, or an :class:`io.IOBase` object, such as ``sys.stdin`` itself, which provides a :meth:`~io.IOBase.fileno` that returns a genuine file descriptor. An example:: Examples (all on a SVR4 compliant system):: If *mutate_flag* is true (the default), then the buffer is (in effect) passed to the underlying :func:`ioctl` system call, the latter's return code is passed back to the calling Python, and the buffer's new contents reflect the action of the :func:`ioctl`.  This is a slight simplification, because if the supplied buffer is less than 1024 bytes long it is first copied into a static buffer 1024 bytes long which is then passed to :func:`ioctl` and copied back into the supplied buffer. If a mutable buffer is passed, then the behaviour is determined by the value of the *mutate_flag* parameter. If it is false, the buffer's mutability is ignored and behaviour is as for a read-only buffer, except that the 1024 byte limit mentioned above is avoided -- so long as the buffer you pass is at least as long as what the operating system wants to put there, things should work. If the :c:func:`fcntl` fails, an :exc:`OSError` is raised. If the :c:func:`flock` fails, an :exc:`OSError` exception is raised. If the :c:func:`ioctl` fails, an :exc:`OSError` exception is raised. If the locking flags :data:`~os.O_SHLOCK` and :data:`~os.O_EXLOCK` are present in the :mod:`os` module (on BSD only), the :func:`os.open` function provides an alternative to the :func:`lockf` and :func:`flock` functions. In all but the last case, behaviour is as for the :func:`~fcntl.fcntl` function. Module :mod:`os` Note that in the first example the return value variable *rv* will hold an integer value; in the second example it will hold a :class:`bytes` object.  The structure lay-out for the *lockdata* variable is system dependent --- therefore using the :func:`flock` call may be better. Operations in this module used to raise an :exc:`IOError` where they now raise an :exc:`OSError`. Perform the lock operation *operation* on file descriptor *fd* (file objects providing a :meth:`~io.IOBase.fileno` method are accepted as well). See the Unix manual :manpage:`flock(2)` for details.  (On some systems, this function is emulated using :c:func:`fcntl`.) Perform the operation *cmd* on file descriptor *fd* (file objects providing a :meth:`~io.IOBase.fileno` method are accepted as well).  The values used for *cmd* are operating system dependent, and are available as constants in the :mod:`fcntl` module, using the same names as used in the relevant C header files. The argument *arg* can either be an integer value, or a :class:`bytes` object. With an integer value, the return value of this function is the integer return value of the C :c:func:`fcntl` call.  When the argument is bytes it represents a binary structure, e.g. created by :func:`struct.pack`. The binary data is copied to a buffer whose address is passed to the C :c:func:`fcntl` call.  The return value after a successful call is the contents of the buffer, converted to a :class:`bytes` object. The length of the returned object will be the same as the length of the *arg* argument. This is limited to 1024 bytes. If the information returned in the buffer by the operating system is larger than 1024 bytes, this is most likely to result in a segmentation violation or a more subtle data corruption. The *request* parameter is limited to values that can fit in 32-bits. Additional constants of interest for use as the *request* argument can be found in the :mod:`termios` module, under the same names as used in the relevant C header files. The default for *start* is 0, which means to start at the beginning of the file. The default for *len* is 0 which means to lock to the end of the file.  The default for *whence* is also 0. The module defines the following functions: The parameter *arg* can be one of an integer, an object supporting the read-only buffer interface (like :class:`bytes`) or an object supporting the read-write buffer interface (like :class:`bytearray`). This function is identical to the :func:`~fcntl.fcntl` function, except that the argument handling is even more complicated. This is essentially a wrapper around the :func:`~fcntl.fcntl` locking calls. *fd* is the file descriptor of the file to lock or unlock, and *cmd* is one of the following values: This module performs file control and I/O control on file descriptors. It is an interface to the :c:func:`fcntl` and :c:func:`ioctl` Unix routines.  For a complete description of these calls, see :manpage:`fcntl(2)` and :manpage:`ioctl(2)` Unix manual pages. When *cmd* is :const:`LOCK_SH` or :const:`LOCK_EX`, it can also be bitwise ORed with :const:`LOCK_NB` to avoid blocking on lock acquisition. If :const:`LOCK_NB` is used and the lock cannot be acquired, an :exc:`OSError` will be raised and the exception will have an *errno* attribute set to :const:`EACCES` or :const:`EAGAIN` (depending on the operating system; for portability, check for both values).  On at least some systems, :const:`LOCK_EX` can only be used if the file descriptor refers to a file opened for writing. Project-Id-Version: Python 3.6
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
 *len* is the number of bytes to lock, *start* is the byte offset at which the lock starts, relative to *whence*, and *whence* is as with :func:`io.IOBase.seek`, specifically: :const:`0` -- relative to the start of the file (:data:`os.SEEK_SET`) :const:`1` -- relative to the current buffer position (:data:`os.SEEK_CUR`) :const:`2` -- relative to the end of the file (:data:`os.SEEK_END`) :const:`LOCK_EX` -- acquire an exclusive lock :const:`LOCK_SH` -- acquire a shared lock :const:`LOCK_UN` -- unlock :mod:`fcntl` --- The ``fcntl`` and ``ioctl`` system calls All functions in this module take a file descriptor *fd* as their first argument.  This can be an integer file descriptor, such as returned by ``sys.stdin.fileno()``, or an :class:`io.IOBase` object, such as ``sys.stdin`` itself, which provides a :meth:`~io.IOBase.fileno` that returns a genuine file descriptor. An example:: Examples (all on a SVR4 compliant system):: If *mutate_flag* is true (the default), then the buffer is (in effect) passed to the underlying :func:`ioctl` system call, the latter's return code is passed back to the calling Python, and the buffer's new contents reflect the action of the :func:`ioctl`.  This is a slight simplification, because if the supplied buffer is less than 1024 bytes long it is first copied into a static buffer 1024 bytes long which is then passed to :func:`ioctl` and copied back into the supplied buffer. If a mutable buffer is passed, then the behaviour is determined by the value of the *mutate_flag* parameter. If it is false, the buffer's mutability is ignored and behaviour is as for a read-only buffer, except that the 1024 byte limit mentioned above is avoided -- so long as the buffer you pass is at least as long as what the operating system wants to put there, things should work. If the :c:func:`fcntl` fails, an :exc:`OSError` is raised. If the :c:func:`flock` fails, an :exc:`OSError` exception is raised. If the :c:func:`ioctl` fails, an :exc:`OSError` exception is raised. If the locking flags :data:`~os.O_SHLOCK` and :data:`~os.O_EXLOCK` are present in the :mod:`os` module (on BSD only), the :func:`os.open` function provides an alternative to the :func:`lockf` and :func:`flock` functions. In all but the last case, behaviour is as for the :func:`~fcntl.fcntl` function. Module :mod:`os` Note that in the first example the return value variable *rv* will hold an integer value; in the second example it will hold a :class:`bytes` object.  The structure lay-out for the *lockdata* variable is system dependent --- therefore using the :func:`flock` call may be better. Operations in this module used to raise an :exc:`IOError` where they now raise an :exc:`OSError`. Perform the lock operation *operation* on file descriptor *fd* (file objects providing a :meth:`~io.IOBase.fileno` method are accepted as well). See the Unix manual :manpage:`flock(2)` for details.  (On some systems, this function is emulated using :c:func:`fcntl`.) Perform the operation *cmd* on file descriptor *fd* (file objects providing a :meth:`~io.IOBase.fileno` method are accepted as well).  The values used for *cmd* are operating system dependent, and are available as constants in the :mod:`fcntl` module, using the same names as used in the relevant C header files. The argument *arg* can either be an integer value, or a :class:`bytes` object. With an integer value, the return value of this function is the integer return value of the C :c:func:`fcntl` call.  When the argument is bytes it represents a binary structure, e.g. created by :func:`struct.pack`. The binary data is copied to a buffer whose address is passed to the C :c:func:`fcntl` call.  The return value after a successful call is the contents of the buffer, converted to a :class:`bytes` object. The length of the returned object will be the same as the length of the *arg* argument. This is limited to 1024 bytes. If the information returned in the buffer by the operating system is larger than 1024 bytes, this is most likely to result in a segmentation violation or a more subtle data corruption. The *request* parameter is limited to values that can fit in 32-bits. Additional constants of interest for use as the *request* argument can be found in the :mod:`termios` module, under the same names as used in the relevant C header files. The default for *start* is 0, which means to start at the beginning of the file. The default for *len* is 0 which means to lock to the end of the file.  The default for *whence* is also 0. The module defines the following functions: The parameter *arg* can be one of an integer, an object supporting the read-only buffer interface (like :class:`bytes`) or an object supporting the read-write buffer interface (like :class:`bytearray`). This function is identical to the :func:`~fcntl.fcntl` function, except that the argument handling is even more complicated. This is essentially a wrapper around the :func:`~fcntl.fcntl` locking calls. *fd* is the file descriptor of the file to lock or unlock, and *cmd* is one of the following values: This module performs file control and I/O control on file descriptors. It is an interface to the :c:func:`fcntl` and :c:func:`ioctl` Unix routines.  For a complete description of these calls, see :manpage:`fcntl(2)` and :manpage:`ioctl(2)` Unix manual pages. When *cmd* is :const:`LOCK_SH` or :const:`LOCK_EX`, it can also be bitwise ORed with :const:`LOCK_NB` to avoid blocking on lock acquisition. If :const:`LOCK_NB` is used and the lock cannot be acquired, an :exc:`OSError` will be raised and the exception will have an *errno* attribute set to :const:`EACCES` or :const:`EAGAIN` (depending on the operating system; for portability, check for both values).  On at least some systems, :const:`LOCK_EX` can only be used if the file descriptor refers to a file opened for writing. 