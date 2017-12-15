��    �      $              ,     -  .   M  $   |     �  (   �     �     �  /   	     3	     ?	     O	     d	     z	  &   �	     �	  %   �	  -   �	     !
     =
     Y
     l
     �
     �
     �
     �
     �
  �   �
     �     �     �     �     �     �          '     ;     J     c  	   p     z     �     �  +   �     �     �               ,     G     T     c     x     �     �     �     �     �     �  #   
     .     L     ]     p  +   �     �     �     �     �                :     M     _     z     �     �     �     �     �                ,     ?     O     `  �   q     K     i  -   �     �     �     �     �               .     K     Z     x     �     �     �     �     �     �          %     C     b      |     �     �     �     �     �  >   �  �   ;     )  O   7     �     �  "   �  #   �     �  '      #   (  	   L  %   V  �  |     3  .   S  $   �     �  (   �     �     �  /   	     9     E     U     j     �  &   �     �  %   �  -   �     '     C     _     r     �     �     �     �     �  �   �     �     �     �     �     �     �          -     A     P     i  	   v     �     �     �  +   �     �     �               2     M     Z     i     ~     �     �     �     �     �     �  #        4     R     c     v  +   �     �     �     �     �          &     @     S     e     �     �     �     �     �     �                 2      E      U      f   �   w      Q!     o!  -   �!     �!     �!     �!     �!     "     ""     4"     Q"     `"     ~"     �"     �"     �"     �"     �"     #     #     +#     I#     h#      �#     �#     �#     �#     �#     �#  >   $  �   A$     /%  O   =%     �%     �%  "   �%  #   �%     �%  '   &  #   .&  	   R&  %   \&   .lib section in a.out corrupted :mod:`errno` --- Standard errno system symbols Accessing a corrupted shared library Address already in use Address family not supported by protocol Advertise error Arg list too long Attempting to link in too many shared libraries Bad address Bad file number Bad font file format Block device required Broken pipe Can not access a needed shared library Cannot assign requested address Cannot exec a shared library directly Cannot send after transport endpoint shutdown Channel number out of range Communication error on send Connection refused Connection reset by peer Connection timed out Cross-device link Destination address required Device not a stream Device or resource busy Dictionary providing a mapping from the errno value to the string name in the underlying system.  For instance, ``errno.errorcode[errno.EPERM]`` maps to ``'EPERM'``. Directory not empty Exchange full Exec format error File descriptor in bad state File exists File locking deadlock error File name too long File table overflow File too large Function not implemented Host is down I/O error Identifier removed Illegal byte sequence Illegal seek Interrupted system call should be restarted Interrupted system call. Invalid argument Invalid exchange Invalid request code Invalid request descriptor Invalid slot Is a directory Is a named type file Level 2 halted Level 2 not synchronized Level 3 halted Level 3 reset Link has been severed Link number out of range Machine is not on the network Math argument out of domain of func Math result not representable Message too long Multihop attempted Name not unique on network Network dropped connection because of reset Network is down Network is unreachable No CSI structure available No XENIX semaphores available No anode No buffer space available No child processes No data available No message of desired type No record locks available No route to host No space left on device No such device No such device or address No such file or directory No such process Not a XENIX named type file Not a data message Not a directory Not a typewriter Object is remote Of the following list, symbols that are not used on the current platform are not defined by the module.  The specific list of defined symbols is available as ``errno.errorcode.keys()``.  Symbols available can include: Operation already in progress Operation not permitted Operation not supported on transport endpoint Operation now in progress Operation would block Out of memory Out of streams resources Package not installed Permission denied Protocol driver not attached Protocol error Protocol family not supported Protocol not available Protocol not supported Protocol wrong type for socket Quota exceeded RFS specific error Read-only file system Remote I/O error Remote address changed Resource deadlock would occur Socket operation on non-socket Socket type not supported Software caused connection abort Srmount error Stale NFS file handle Streams pipe error Structure needs cleaning Text file busy This error is mapped to the exception :exc:`InterruptedError`. This module makes available standard ``errno`` system symbols. The value of each symbol is the corresponding integer value. The names and descriptions are borrowed from :file:`linux/include/errno.h`, which should be pretty all-inclusive. Timer expired To translate a numeric error code to an error message, use :func:`os.strerror`. Too many links Too many open files Too many references: cannot splice Too many symbolic links encountered Too many users Transport endpoint is already connected Transport endpoint is not connected Try again Value too large for defined data type Project-Id-Version: Python 3.6
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
 .lib section in a.out corrupted :mod:`errno` --- Standard errno system symbols Accessing a corrupted shared library Address already in use Address family not supported by protocol Advertise error Arg list too long Attempting to link in too many shared libraries Bad address Bad file number Bad font file format Block device required Broken pipe Can not access a needed shared library Cannot assign requested address Cannot exec a shared library directly Cannot send after transport endpoint shutdown Channel number out of range Communication error on send Connection refused Connection reset by peer Connection timed out Cross-device link Destination address required Device not a stream Device or resource busy Dictionary providing a mapping from the errno value to the string name in the underlying system.  For instance, ``errno.errorcode[errno.EPERM]`` maps to ``'EPERM'``. Directory not empty Exchange full Exec format error File descriptor in bad state File exists File locking deadlock error File name too long File table overflow File too large Function not implemented Host is down I/O error Identifier removed Illegal byte sequence Illegal seek Interrupted system call should be restarted Interrupted system call. Invalid argument Invalid exchange Invalid request code Invalid request descriptor Invalid slot Is a directory Is a named type file Level 2 halted Level 2 not synchronized Level 3 halted Level 3 reset Link has been severed Link number out of range Machine is not on the network Math argument out of domain of func Math result not representable Message too long Multihop attempted Name not unique on network Network dropped connection because of reset Network is down Network is unreachable No CSI structure available No XENIX semaphores available No anode No buffer space available No child processes No data available No message of desired type No record locks available No route to host No space left on device No such device No such device or address No such file or directory No such process Not a XENIX named type file Not a data message Not a directory Not a typewriter Object is remote Of the following list, symbols that are not used on the current platform are not defined by the module.  The specific list of defined symbols is available as ``errno.errorcode.keys()``.  Symbols available can include: Operation already in progress Operation not permitted Operation not supported on transport endpoint Operation now in progress Operation would block Out of memory Out of streams resources Package not installed Permission denied Protocol driver not attached Protocol error Protocol family not supported Protocol not available Protocol not supported Protocol wrong type for socket Quota exceeded RFS specific error Read-only file system Remote I/O error Remote address changed Resource deadlock would occur Socket operation on non-socket Socket type not supported Software caused connection abort Srmount error Stale NFS file handle Streams pipe error Structure needs cleaning Text file busy This error is mapped to the exception :exc:`InterruptedError`. This module makes available standard ``errno`` system symbols. The value of each symbol is the corresponding integer value. The names and descriptions are borrowed from :file:`linux/include/errno.h`, which should be pretty all-inclusive. Timer expired To translate a numeric error code to an error message, use :func:`os.strerror`. Too many links Too many open files Too many references: cannot splice Too many symbolic links encountered Too many users Transport endpoint is already connected Transport endpoint is not connected Try again Value too large for defined data type 