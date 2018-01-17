��    �      |              �  )   �  -   	  G   5	  �  }	  Z   F  f   �  )        2  A   S  T   �  ?   �  I   *  k   t     �         w   !  z   �  }     v   �  {   	  �   �  �   %  <   �      z        �     �  *   �  o   �  !   `     �  a   �  �   �     �  _  �      &     F   /     v  �   �  R  V  �   �  �  F  �      �   �   �   �!  �   "  �   �"  _   #     �#  X   �#  K   >$  4   �$  �   �$     �%     �%     �%     �%     �%     �%      
&  &  +&    R'  (   k-  (   �-  '   �-  W   �-  <   =.     z.  �   �.  �   /  6   �/  �   �/  �   �0  )   X1  W  �1  �   �3  >   x4  M   �4     5  9   5     T5     q5  '   �5  !   �5  )   �5     6  8   "6  <   [6     �6     �6  8   �6  <   7  �   D7  �   �7  E   �8  a   �8  <   K9    �9  <  �:  i   �;  *  8<  #   c=  a   �=  1   �=  �   >  '   �>  8   �>  \   $?  \   �?  a   �?  a   @@  
  �@  S   �A  h  B  E   jC  +   �C     �C     �C     D  J  E  -  iF  �   �G  �  �H  h  J     zK     �K  (   �K     �K  �   �K     �L  0   �L     �L     �L     M     M     M     M     M  �  #M  )   �N  -   O  G   9O  �  �O  Z   JQ  f   �Q  )   R     6R  A   WS  T   �S  ?   �S  I   .T  k   xT     �T      U  w   %U  z   �U  }   V  v   �V  {   W  �   �W  �   )X  <   �X    	Y  z   "[     �[     �[  *   �[  o   �[  !   d\     �\  a   �\  �   ]     �]  _  �]    _  &   `  F   3`     z`  �   �`  R  Za  �   �c  �  Jd  �   f  �   �f  �   �g  �   h  �   �h  _   �i     �i  X   �i  K   Bj  4   �j  �   �j     �k     �k     �k     �k     �k     �k      l  &  /l    Vm  (   os  (   �s  '   �s  W   �s  <   At     ~t  �   �t  �   u  6   �u  �   �u  �   �v  )   \w  W  �w  �   �y  >   |z  M   �z     	{  9   {     X{     u{  '   �{  !   �{  )   �{     |  8   &|  <   _|     �|     �|  8   �|  <   }  �   H}  �   �}  E   �~  a   �~  <   O    �  <  ��  i   ҁ  *  <�  #   g�  a   ��  1   �  �   �  '   Ǆ  8   �  \   (�  \   ��  a   �  a   D�  
  ��  S   ��  h  �  E   n�  +   ��     ��     �    �  J  "�  -  m�  �   ��  �  ��  h  �     ~�     ��  (   ��     ő  �   Ց     ��  0   ��     �     �     	�     �     �     �     !�   **Source code:** :source:`Lib/zipfile.py` *basename* is intended for internal use only. *filename* should be the path to a file or directory on the filesystem. *filterfunc*, if given, must be a function taking a single string argument.  It will be passed each path (including each individual full file path) before it is added to the archive.  If *filterfunc* returns a false value, the path will not be added, and if it is a directory its contents will be ignored.  For example, if our test files are all either in ``test`` directories or start with the string ``test_``, we can use a *filterfunc* to exclude them:: :meth:`open` can now be used to write files into the archive with the ``mode='w'`` option. :meth:`~ZipFile.open` is also a context manager and therefore supports the :keyword:`with` statement:: :mod:`zipfile` --- Work with ZIP archives Access a member of the archive as a binary file-like object.  *name* can be either the name of a file within the archive or a :class:`ZipInfo` object.  The *mode* parameter, if included, must be ``'r'`` (the default) or ``'w'``.  *pwd* is the password used to decrypt encrypted ZIP files. Added support for :mod:`bzip2 <bz2>` and :mod:`lzma` compression. Added support for writing to unseekable streams. Added support for the ``'x'`` mode. Added the ability to use :class:`ZipFile` as a context manager. Alias of :exc:`BadZipFile`, for compatibility with older Python versions. Archive names should be relative to the archive root, that is, they should not start with a path separator. Byte offset to the file header. CRC-32 of the uncompressed file. Calling :meth:`.open` on a closed ZipFile will raise a :exc:`ValueError`. Previously, a :exc:`RuntimeError` was raised. Calling :meth:`extract` on a closed ZipFile will raise a :exc:`ValueError`.  Previously, a :exc:`RuntimeError` was raised. Calling :meth:`extractall` on a closed ZipFile will raise a :exc:`ValueError`.  Previously, a :exc:`RuntimeError` was raised. Calling :meth:`read` on a closed ZipFile will raise a :exc:`ValueError`. Previously, a :exc:`RuntimeError` was raised. Calling :meth:`testfile` on a closed ZipFile will raise a :exc:`ValueError`.  Previously, a :exc:`RuntimeError` was raised. Calling :meth:`write` on a ZipFile created with mode ``'r'`` or a closed ZipFile will raise a :exc:`ValueError`.  Previously, a :exc:`RuntimeError` was raised. Calling :meth:`writestr` on a ZipFile created with mode ``'r'`` or a closed ZipFile will raise a :exc:`ValueError`.  Previously, a :exc:`RuntimeError` was raised. Class for creating ZIP archives containing Python libraries. Class used to represent information about a member of an archive. Instances of this class are returned by the :meth:`.getinfo` and :meth:`.infolist` methods of :class:`ZipFile` objects.  Most users of the :mod:`zipfile` module will not need to create these, but only use those created by this module. *filename* should be the full name of the archive member, and *date_time* should be a tuple containing six fields which describe the time of the last modification to the file; the fields are described in section :ref:`zipinfo-objects`. Close the archive file.  You must call :meth:`close` before exiting your program or essential records will not be written. Command-Line Interface Command-line options Comment for the individual archive member. Construct a :class:`ZipInfo` instance for a file on the filesystem, in preparation for adding it to a zip file. Create zipfile from source files. Day of month (one-based) Documentation on the ZIP file format by Phil Katz, the creator of the format and algorithms used. Expansion field data.  The `PKZIP Application Note`_ contains some comments on the internal structure of the data contained in this string. External file attributes. Extract a member from the archive to the current working directory; *member* must be its full name or a :class:`ZipInfo` object.  Its file information is extracted as accurately as possible.  *path* specifies a different directory to extract to.  *member* can be a filename or a :class:`ZipInfo` object. *pwd* is the password used for encrypted files. Extract all members from the archive to the current working directory.  *path* specifies a different directory to extract to.  *members* is optional and must be a subset of the list returned by :meth:`namelist`.  *pwd* is the password used for encrypted files. Extract zipfile into target directory. For a list of the files in a ZIP archive, use the :option:`-l` option: Hours (zero-based) If *arcname* is specified, it is used as the name within the archive. If *arcname* is not specified, the name will be the same as *filename*, but with any drive letter and leading path separators removed. If *pathname* is a file, the filename must end with :file:`.py`, and just the (corresponding :file:`\*.pyc`) file is added at the top level (no path information).  If *pathname* is a file that does not end with :file:`.py`, a :exc:`RuntimeError` will be raised.  If it is a directory, and the directory is not a package directory, then all the files :file:`\*.pyc` are added at the top level.  If the directory is a package directory, then all :file:`\*.pyc` are added under the package name as a file path, and if any subdirectories are package directories, all of these are added recursively. If ``arcname`` (or ``filename``, if ``arcname`` is  not given) contains a null byte, the name of the file in the archive will be truncated at the null byte. If a member filename is an absolute path, a drive/UNC sharepoint and leading (back)slashes will be stripped, e.g.: ``///foo/bar`` becomes ``foo/bar`` on Unix, and ``C:\foo\bar`` becomes ``foo\bar`` on Windows. And all ``".."`` components in a member filename will be removed, e.g.: ``../../foo../../ba..r`` becomes ``foo../ba..r``.  On Windows illegal characters (``:``, ``<``, ``>``, ``|``, ``"``, ``?``, and ``*``) replaced by underscore (``_``). If given, *compress_type* overrides the value given for the *compression* parameter to the constructor for the new entry, or in the *zinfo_or_arcname* (if that is a :class:`ZipInfo` instance). If the *optimize* parameter to :class:`PyZipFile` was ``0``, ``1`` or ``2``, only files with that optimization level (see :func:`compile`) are added to the archive, compiling if necessary. If the *optimize* parameter to :class:`PyZipFile` was not given or ``-1``, the corresponding file is a :file:`\*.pyc` file, compiling if necessary. If the file is created with mode ``'w'``, ``'x'`` or ``'a'`` and then :meth:`closed <close>` without adding any files to the archive, the appropriate ZIP structures for an empty archive will be written to the file. If you want to create a new ZIP archive, specify its name after the :option:`-c` option and then list the filename(s) that should be included: If you want to extract a ZIP archive into the specified directory, use the :option:`-e` option: Index Information about the Info-ZIP project's ZIP archive programs and development libraries. Instances have one method in addition to those of :class:`ZipFile` objects: Instances have the following methods and attributes: Instances of the :class:`ZipInfo` class are returned by the :meth:`.getinfo` and :meth:`.infolist` methods of :class:`ZipFile` objects.  Each object stores information about a single member of the ZIP archive. Internal attributes. List files in a zipfile. Minutes (zero-based) Month (one-based) Must be zero. Name of the ZIP file. Name of the file in the archive. Never extract archives from untrusted sources without prior inspection. It is possible that files are created outside of *path*, e.g. members that have absolute filenames starting with ``"/"`` or filenames with two dots ``".."``.  This module attempts to prevent that. See :meth:`extract` note. Open a ZIP file, where *file* can be a path to a file (a string), a file-like object or a :term:`path-like object`. The *mode* parameter should be ``'r'`` to read an existing file, ``'w'`` to truncate and write a new file, ``'a'`` to append to an existing file, or ``'x'`` to exclusively create and write a new file. If *mode* is ``'x'`` and *file* refers to an existing file, a :exc:`FileExistsError` will be raised. If *mode* is ``'a'`` and *file* refers to an existing ZIP file, then additional files are added to it.  If *file* does not refer to a ZIP file, then a new ZIP archive is appended to the file.  This is meant for adding a ZIP archive to another file (such as :file:`python.exe`).  If *mode* is ``'a'`` and the file does not exist at all, it is created. If *mode* is ``'r'`` or ``'a'``, the file should be seekable. *compression* is the ZIP compression method to use when writing the archive, and should be :const:`ZIP_STORED`, :const:`ZIP_DEFLATED`, :const:`ZIP_BZIP2` or :const:`ZIP_LZMA`; unrecognized values will cause :exc:`NotImplementedError` to be raised.  If :const:`ZIP_DEFLATED`, :const:`ZIP_BZIP2` or :const:`ZIP_LZMA` is specified but the corresponding module (:mod:`zlib`, :mod:`bz2` or :mod:`lzma`) is not available, :exc:`RuntimeError` is raised. The default is :const:`ZIP_STORED`.  If *allowZip64* is ``True`` (the default) zipfile will create ZIP files that use the ZIP64 extensions when the zipfile is larger than 4 GiB. If it is  false :mod:`zipfile` will raise an exception when the ZIP file would require ZIP64 extensions. PKZIP version needed to extract archive. PKZIP version which created ZIP archive. Passing a directory is also acceptable: Previously, a plain :exc:`RuntimeError` was raised for unrecognized compression values. Print a table of contents for the archive to ``sys.stdout``. PyZipFile Objects Read all the files in the archive and check their CRC's and file headers. Return the name of the first bad file, or else return ``None``. Removed support of ``mode='U'``.  Use :class:`io.TextIOWrapper` for reading compressed text files in :term:`universal newlines` mode. Return ``True`` if this archive member is a directory. Return a :class:`ZipInfo` object with information about the archive member *name*.  Calling :meth:`getinfo` for a name not currently contained in the archive will raise a :exc:`KeyError`. Return a list containing a :class:`ZipInfo` object for each member of the archive.  The objects are in the same order as their entries in the actual ZIP file on disk if an existing archive was opened. Return a list of archive members by name. Return the bytes of the file *name* in the archive.  *name* is the name of the file in the archive, or a :class:`ZipInfo` object.  The archive must be open for read or append. *pwd* is the password used for encrypted  files and, if specified, it will override the default password set with :meth:`setpassword`.  Calling :meth:`read` on a ZipFile that uses a compression method other than :const:`ZIP_STORED`, :const:`ZIP_DEFLATED`, :const:`ZIP_BZIP2` or :const:`ZIP_LZMA` will raise a :exc:`NotImplementedError`. An error will also be raised if the corresponding compression module is not available. Returns ``True`` if *filename* is a valid ZIP file based on its magic number, otherwise returns ``False``.  *filename* may be a file or file-like object too. Returns the normalized path created (a directory or new file). Search for files :file:`\*.py` and add the corresponding file to the archive. Seconds (zero-based) Set *pwd* as default password to extract encrypted files. Size of the compressed data. Size of the uncompressed file. Support for file and file-like objects. System which created ZIP archive. Test whether the zipfile is valid or not. The *compress_type* argument. The *file* parameter accepts a :term:`path-like object`. The *filename* parameter accepts a :term:`path-like object`. The *filterfunc* parameter. The *optimize* parameter. The *path* parameter accepts a :term:`path-like object`. The *pathname* parameter accepts a :term:`path-like object`. The :class:`PyZipFile` constructor takes the same parameters as the :class:`ZipFile` constructor, and one additional parameter, *optimize*. The :meth:`.open`, :meth:`read` and :meth:`extract` methods can take a filename or a :class:`ZipInfo` object.  You will appreciate this when trying to read a ZIP file that contains members with duplicate names. The :meth:`writepy` method makes archives with file names like this:: The :mod:`zipfile` module provides a simple command-line interface to interact with ZIP archives. The ZIP file format does not support timestamps before 1980. The ZIP file format is a common archive and compression standard. This module provides tools to create, read, write, append, and list a ZIP file.  Any advanced use of this module will require an understanding of the format, as defined in `PKZIP Application Note`_. The ZIP file format specification has included support for bzip2 compression since 2001, and for LZMA compression since 2006. However, some tools (including older Python releases) do not support these compression methods, and may either refuse to process the ZIP file altogether, or fail to extract individual files. The class for reading and writing ZIP files.  See section :ref:`zipfile-objects` for constructor details. The comment text associated with the ZIP file.  If assigning a comment to a :class:`ZipFile` instance created with mode ``'w'``, ``'x'`` or ``'a'``, this should be a string no longer than 65535 bytes.  Comments longer than this will be truncated in the written archive when :meth:`close` is called. The error raised for bad ZIP files. The error raised when a ZIP file would require ZIP64 functionality but that has not been enabled. The following data attributes are also available: The level of debug output to use.  This may be set from ``0`` (the default, no output) to ``3`` (the most output).  Debugging information is written to ``sys.stdout``. The module defines the following items: The numeric constant for an uncompressed archive member. The numeric constant for the BZIP2 compression method.  This requires the :mod:`bz2` module. The numeric constant for the LZMA compression method.  This requires the :mod:`lzma` module. The numeric constant for the usual ZIP compression method.  This requires the :mod:`zlib` module. The time and date of the last modification to the archive member.  This is a tuple of six values: There is no official file name encoding for ZIP files. If you have unicode file names, you must convert them to byte strings in your desired encoding before passing them to :meth:`write`. WinZip interprets all file names as encoded in CP437, also known as DOS Latin. There is one classmethod to make a :class:`ZipInfo` instance for a filesystem file: This module does not currently handle multi-disk ZIP files. It can handle ZIP files that use the ZIP64 extensions (that is ZIP files that are more than 4 GiB in size).  It supports decryption of encrypted files in ZIP archives, but it currently cannot create an encrypted file.  Decryption is extremely slow as it is implemented in native Python rather than C. This uses the entry's name: directories should always end with ``/``. Type of compression for the archive member. Value Volume number of file header. When passing a :class:`ZipInfo` instance as the *zinfo_or_arcname* parameter, the compression method used will be that specified in the *compress_type* member of the given :class:`ZipInfo` instance.  By default, the :class:`ZipInfo` constructor sets this member to :const:`ZIP_STORED`. When writing a file, if the file size is not known in advance but may exceed 2 GiB, pass ``force_zip64=True`` to ensure that the header format is capable of supporting large files.  If the file size is known in advance, construct a :class:`ZipInfo` object with :attr:`~ZipInfo.file_size` set, and use that as the *name* parameter. With *mode* ``'r'`` the file-like object (``ZipExtFile``) is read-only and provides the following methods: :meth:`~io.BufferedIOBase.read`, :meth:`~io.IOBase.readline`, :meth:`~io.IOBase.readlines`, :meth:`__iter__`, :meth:`~iterator.__next__`.  These objects can operate independently of the ZipFile. With ``mode='w'``, a writable file handle is returned, which supports the :meth:`~io.BufferedIOBase.write` method.  While a writable file handle is open, attempting to read or write other files in the ZIP file will raise a :exc:`ValueError`. Write the file named *filename* to the archive, giving it the archive name *arcname* (by default, this will be the same as *filename*, but without a drive letter and with leading path separators removed).  If given, *compress_type* overrides the value given for the *compression* parameter to the constructor for the new entry. The archive must be open with mode ``'w'``, ``'x'`` or ``'a'``. Write the string *data* to the archive; *zinfo_or_arcname* is either the file name it will be given in the archive, or a :class:`ZipInfo` instance.  If it's an instance, at least the filename, date, and time must be given.  If it's a name, the date and time is set to the current date and time. The archive must be opened with mode ``'w'``, ``'x'`` or ``'a'``. Year (>= 1980) ZIP flag bits. ZIP64 extensions are enabled by default. ZipFile Objects ZipFile is also a context manager and therefore supports the :keyword:`with` statement.  In the example, *myzip* is closed after the :keyword:`with` statement's suite is finished---even if an exception occurs:: ZipInfo Objects `Info-ZIP Home Page <http://www.info-zip.org/>`_ `PKZIP Application Note`_ ``0`` ``1`` ``2`` ``3`` ``4`` ``5`` Project-Id-Version: Python 3.6
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-01-05 15:01+0000
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: 操旭 <caoxu3000@126.com>, 2017
Language: zh_Hans_CN
Language-Team: Chinese (China) (https://www.transifex.com/python-doc/teams/5390/zh_CN/)
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.1
 **Source code:** :source:`Lib/zipfile.py` *basename* is intended for internal use only. *filename* should be the path to a file or directory on the filesystem. *filterfunc*, if given, must be a function taking a single string argument.  It will be passed each path (including each individual full file path) before it is added to the archive.  If *filterfunc* returns a false value, the path will not be added, and if it is a directory its contents will be ignored.  For example, if our test files are all either in ``test`` directories or start with the string ``test_``, we can use a *filterfunc* to exclude them:: :meth:`open` can now be used to write files into the archive with the ``mode='w'`` option. :meth:`~ZipFile.open` is also a context manager and therefore supports the :keyword:`with` statement:: :mod:`zipfile` --- Work with ZIP archives Access a member of the archive as a binary file-like object.  *name* can be either the name of a file within the archive or a :class:`ZipInfo` object.  The *mode* parameter, if included, must be ``'r'`` (the default) or ``'w'``.  *pwd* is the password used to decrypt encrypted ZIP files. Added support for :mod:`bzip2 <bz2>` and :mod:`lzma` compression. Added support for writing to unseekable streams. Added support for the ``'x'`` mode. Added the ability to use :class:`ZipFile` as a context manager. Alias of :exc:`BadZipFile`, for compatibility with older Python versions. Archive names should be relative to the archive root, that is, they should not start with a path separator. Byte offset to the file header. CRC-32 of the uncompressed file. Calling :meth:`.open` on a closed ZipFile will raise a :exc:`ValueError`. Previously, a :exc:`RuntimeError` was raised. Calling :meth:`extract` on a closed ZipFile will raise a :exc:`ValueError`.  Previously, a :exc:`RuntimeError` was raised. Calling :meth:`extractall` on a closed ZipFile will raise a :exc:`ValueError`.  Previously, a :exc:`RuntimeError` was raised. Calling :meth:`read` on a closed ZipFile will raise a :exc:`ValueError`. Previously, a :exc:`RuntimeError` was raised. Calling :meth:`testfile` on a closed ZipFile will raise a :exc:`ValueError`.  Previously, a :exc:`RuntimeError` was raised. Calling :meth:`write` on a ZipFile created with mode ``'r'`` or a closed ZipFile will raise a :exc:`ValueError`.  Previously, a :exc:`RuntimeError` was raised. Calling :meth:`writestr` on a ZipFile created with mode ``'r'`` or a closed ZipFile will raise a :exc:`ValueError`.  Previously, a :exc:`RuntimeError` was raised. Class for creating ZIP archives containing Python libraries. Class used to represent information about a member of an archive. Instances of this class are returned by the :meth:`.getinfo` and :meth:`.infolist` methods of :class:`ZipFile` objects.  Most users of the :mod:`zipfile` module will not need to create these, but only use those created by this module. *filename* should be the full name of the archive member, and *date_time* should be a tuple containing six fields which describe the time of the last modification to the file; the fields are described in section :ref:`zipinfo-objects`. Close the archive file.  You must call :meth:`close` before exiting your program or essential records will not be written. Command-Line Interface Command-line options Comment for the individual archive member. Construct a :class:`ZipInfo` instance for a file on the filesystem, in preparation for adding it to a zip file. Create zipfile from source files. Day of month (one-based) Documentation on the ZIP file format by Phil Katz, the creator of the format and algorithms used. Expansion field data.  The `PKZIP Application Note`_ contains some comments on the internal structure of the data contained in this string. External file attributes. Extract a member from the archive to the current working directory; *member* must be its full name or a :class:`ZipInfo` object.  Its file information is extracted as accurately as possible.  *path* specifies a different directory to extract to.  *member* can be a filename or a :class:`ZipInfo` object. *pwd* is the password used for encrypted files. Extract all members from the archive to the current working directory.  *path* specifies a different directory to extract to.  *members* is optional and must be a subset of the list returned by :meth:`namelist`.  *pwd* is the password used for encrypted files. Extract zipfile into target directory. For a list of the files in a ZIP archive, use the :option:`-l` option: Hours (zero-based) If *arcname* is specified, it is used as the name within the archive. If *arcname* is not specified, the name will be the same as *filename*, but with any drive letter and leading path separators removed. If *pathname* is a file, the filename must end with :file:`.py`, and just the (corresponding :file:`\*.pyc`) file is added at the top level (no path information).  If *pathname* is a file that does not end with :file:`.py`, a :exc:`RuntimeError` will be raised.  If it is a directory, and the directory is not a package directory, then all the files :file:`\*.pyc` are added at the top level.  If the directory is a package directory, then all :file:`\*.pyc` are added under the package name as a file path, and if any subdirectories are package directories, all of these are added recursively. If ``arcname`` (or ``filename``, if ``arcname`` is  not given) contains a null byte, the name of the file in the archive will be truncated at the null byte. If a member filename is an absolute path, a drive/UNC sharepoint and leading (back)slashes will be stripped, e.g.: ``///foo/bar`` becomes ``foo/bar`` on Unix, and ``C:\foo\bar`` becomes ``foo\bar`` on Windows. And all ``".."`` components in a member filename will be removed, e.g.: ``../../foo../../ba..r`` becomes ``foo../ba..r``.  On Windows illegal characters (``:``, ``<``, ``>``, ``|``, ``"``, ``?``, and ``*``) replaced by underscore (``_``). If given, *compress_type* overrides the value given for the *compression* parameter to the constructor for the new entry, or in the *zinfo_or_arcname* (if that is a :class:`ZipInfo` instance). If the *optimize* parameter to :class:`PyZipFile` was ``0``, ``1`` or ``2``, only files with that optimization level (see :func:`compile`) are added to the archive, compiling if necessary. If the *optimize* parameter to :class:`PyZipFile` was not given or ``-1``, the corresponding file is a :file:`\*.pyc` file, compiling if necessary. If the file is created with mode ``'w'``, ``'x'`` or ``'a'`` and then :meth:`closed <close>` without adding any files to the archive, the appropriate ZIP structures for an empty archive will be written to the file. If you want to create a new ZIP archive, specify its name after the :option:`-c` option and then list the filename(s) that should be included: If you want to extract a ZIP archive into the specified directory, use the :option:`-e` option: Index Information about the Info-ZIP project's ZIP archive programs and development libraries. Instances have one method in addition to those of :class:`ZipFile` objects: Instances have the following methods and attributes: Instances of the :class:`ZipInfo` class are returned by the :meth:`.getinfo` and :meth:`.infolist` methods of :class:`ZipFile` objects.  Each object stores information about a single member of the ZIP archive. Internal attributes. List files in a zipfile. Minutes (zero-based) Month (one-based) Must be zero. Name of the ZIP file. Name of the file in the archive. Never extract archives from untrusted sources without prior inspection. It is possible that files are created outside of *path*, e.g. members that have absolute filenames starting with ``"/"`` or filenames with two dots ``".."``.  This module attempts to prevent that. See :meth:`extract` note. Open a ZIP file, where *file* can be a path to a file (a string), a file-like object or a :term:`path-like object`. The *mode* parameter should be ``'r'`` to read an existing file, ``'w'`` to truncate and write a new file, ``'a'`` to append to an existing file, or ``'x'`` to exclusively create and write a new file. If *mode* is ``'x'`` and *file* refers to an existing file, a :exc:`FileExistsError` will be raised. If *mode* is ``'a'`` and *file* refers to an existing ZIP file, then additional files are added to it.  If *file* does not refer to a ZIP file, then a new ZIP archive is appended to the file.  This is meant for adding a ZIP archive to another file (such as :file:`python.exe`).  If *mode* is ``'a'`` and the file does not exist at all, it is created. If *mode* is ``'r'`` or ``'a'``, the file should be seekable. *compression* is the ZIP compression method to use when writing the archive, and should be :const:`ZIP_STORED`, :const:`ZIP_DEFLATED`, :const:`ZIP_BZIP2` or :const:`ZIP_LZMA`; unrecognized values will cause :exc:`NotImplementedError` to be raised.  If :const:`ZIP_DEFLATED`, :const:`ZIP_BZIP2` or :const:`ZIP_LZMA` is specified but the corresponding module (:mod:`zlib`, :mod:`bz2` or :mod:`lzma`) is not available, :exc:`RuntimeError` is raised. The default is :const:`ZIP_STORED`.  If *allowZip64* is ``True`` (the default) zipfile will create ZIP files that use the ZIP64 extensions when the zipfile is larger than 4 GiB. If it is  false :mod:`zipfile` will raise an exception when the ZIP file would require ZIP64 extensions. PKZIP version needed to extract archive. PKZIP version which created ZIP archive. Passing a directory is also acceptable: Previously, a plain :exc:`RuntimeError` was raised for unrecognized compression values. Print a table of contents for the archive to ``sys.stdout``. PyZipFile Objects Read all the files in the archive and check their CRC's and file headers. Return the name of the first bad file, or else return ``None``. Removed support of ``mode='U'``.  Use :class:`io.TextIOWrapper` for reading compressed text files in :term:`universal newlines` mode. Return ``True`` if this archive member is a directory. Return a :class:`ZipInfo` object with information about the archive member *name*.  Calling :meth:`getinfo` for a name not currently contained in the archive will raise a :exc:`KeyError`. Return a list containing a :class:`ZipInfo` object for each member of the archive.  The objects are in the same order as their entries in the actual ZIP file on disk if an existing archive was opened. Return a list of archive members by name. Return the bytes of the file *name* in the archive.  *name* is the name of the file in the archive, or a :class:`ZipInfo` object.  The archive must be open for read or append. *pwd* is the password used for encrypted  files and, if specified, it will override the default password set with :meth:`setpassword`.  Calling :meth:`read` on a ZipFile that uses a compression method other than :const:`ZIP_STORED`, :const:`ZIP_DEFLATED`, :const:`ZIP_BZIP2` or :const:`ZIP_LZMA` will raise a :exc:`NotImplementedError`. An error will also be raised if the corresponding compression module is not available. Returns ``True`` if *filename* is a valid ZIP file based on its magic number, otherwise returns ``False``.  *filename* may be a file or file-like object too. Returns the normalized path created (a directory or new file). Search for files :file:`\*.py` and add the corresponding file to the archive. Seconds (zero-based) Set *pwd* as default password to extract encrypted files. Size of the compressed data. Size of the uncompressed file. Support for file and file-like objects. System which created ZIP archive. Test whether the zipfile is valid or not. The *compress_type* argument. The *file* parameter accepts a :term:`path-like object`. The *filename* parameter accepts a :term:`path-like object`. The *filterfunc* parameter. The *optimize* parameter. The *path* parameter accepts a :term:`path-like object`. The *pathname* parameter accepts a :term:`path-like object`. The :class:`PyZipFile` constructor takes the same parameters as the :class:`ZipFile` constructor, and one additional parameter, *optimize*. The :meth:`.open`, :meth:`read` and :meth:`extract` methods can take a filename or a :class:`ZipInfo` object.  You will appreciate this when trying to read a ZIP file that contains members with duplicate names. The :meth:`writepy` method makes archives with file names like this:: The :mod:`zipfile` module provides a simple command-line interface to interact with ZIP archives. The ZIP file format does not support timestamps before 1980. The ZIP file format is a common archive and compression standard. This module provides tools to create, read, write, append, and list a ZIP file.  Any advanced use of this module will require an understanding of the format, as defined in `PKZIP Application Note`_. The ZIP file format specification has included support for bzip2 compression since 2001, and for LZMA compression since 2006. However, some tools (including older Python releases) do not support these compression methods, and may either refuse to process the ZIP file altogether, or fail to extract individual files. The class for reading and writing ZIP files.  See section :ref:`zipfile-objects` for constructor details. The comment text associated with the ZIP file.  If assigning a comment to a :class:`ZipFile` instance created with mode ``'w'``, ``'x'`` or ``'a'``, this should be a string no longer than 65535 bytes.  Comments longer than this will be truncated in the written archive when :meth:`close` is called. The error raised for bad ZIP files. The error raised when a ZIP file would require ZIP64 functionality but that has not been enabled. The following data attributes are also available: The level of debug output to use.  This may be set from ``0`` (the default, no output) to ``3`` (the most output).  Debugging information is written to ``sys.stdout``. The module defines the following items: The numeric constant for an uncompressed archive member. The numeric constant for the BZIP2 compression method.  This requires the :mod:`bz2` module. The numeric constant for the LZMA compression method.  This requires the :mod:`lzma` module. The numeric constant for the usual ZIP compression method.  This requires the :mod:`zlib` module. The time and date of the last modification to the archive member.  This is a tuple of six values: There is no official file name encoding for ZIP files. If you have unicode file names, you must convert them to byte strings in your desired encoding before passing them to :meth:`write`. WinZip interprets all file names as encoded in CP437, also known as DOS Latin. There is one classmethod to make a :class:`ZipInfo` instance for a filesystem file: This module does not currently handle multi-disk ZIP files. It can handle ZIP files that use the ZIP64 extensions (that is ZIP files that are more than 4 GiB in size).  It supports decryption of encrypted files in ZIP archives, but it currently cannot create an encrypted file.  Decryption is extremely slow as it is implemented in native Python rather than C. This uses the entry's name: directories should always end with ``/``. Type of compression for the archive member. Value Volume number of file header. When passing a :class:`ZipInfo` instance as the *zinfo_or_arcname* parameter, the compression method used will be that specified in the *compress_type* member of the given :class:`ZipInfo` instance.  By default, the :class:`ZipInfo` constructor sets this member to :const:`ZIP_STORED`. When writing a file, if the file size is not known in advance but may exceed 2 GiB, pass ``force_zip64=True`` to ensure that the header format is capable of supporting large files.  If the file size is known in advance, construct a :class:`ZipInfo` object with :attr:`~ZipInfo.file_size` set, and use that as the *name* parameter. With *mode* ``'r'`` the file-like object (``ZipExtFile``) is read-only and provides the following methods: :meth:`~io.BufferedIOBase.read`, :meth:`~io.IOBase.readline`, :meth:`~io.IOBase.readlines`, :meth:`__iter__`, :meth:`~iterator.__next__`.  These objects can operate independently of the ZipFile. With ``mode='w'``, a writable file handle is returned, which supports the :meth:`~io.BufferedIOBase.write` method.  While a writable file handle is open, attempting to read or write other files in the ZIP file will raise a :exc:`ValueError`. Write the file named *filename* to the archive, giving it the archive name *arcname* (by default, this will be the same as *filename*, but without a drive letter and with leading path separators removed).  If given, *compress_type* overrides the value given for the *compression* parameter to the constructor for the new entry. The archive must be open with mode ``'w'``, ``'x'`` or ``'a'``. Write the string *data* to the archive; *zinfo_or_arcname* is either the file name it will be given in the archive, or a :class:`ZipInfo` instance.  If it's an instance, at least the filename, date, and time must be given.  If it's a name, the date and time is set to the current date and time. The archive must be opened with mode ``'w'``, ``'x'`` or ``'a'``. Year (>= 1980) ZIP flag bits. ZIP64 extensions are enabled by default. ZipFile Objects ZipFile is also a context manager and therefore supports the :keyword:`with` statement.  In the example, *myzip* is closed after the :keyword:`with` statement's suite is finished---even if an exception occurs:: ZipInfo Objects `Info-ZIP Home Page <http://www.info-zip.org/>`_ `PKZIP Application Note`_ ``0`` ``1`` ``2`` ``3`` ``4`` ``5`` 