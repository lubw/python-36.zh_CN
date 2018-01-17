��    '      T              �  )   �  1   �  M   �  �   7  ]   �  b   <  �   �  A   �  A   �  -   !  %   O  %   u     �  Z   �  ?     m   Q  �   �  �   y  �   	  :   �	  �   �	  c   X
  �   �
  ?   j  K   �  O   �  �  F  #   �  Z        _  m   y  �   �  9   �  �   �  :   }     �     �  �   �  �  �  )   j  1   �  M   �  �     ]   �  b     �   |  A   z  A   �  -   �  %   ,  %   R     x  Z   �  ?   �  m   .  �   �  �   V  �   �  :   v  �   �  c   5  �   �  ?   G  K   �  O   �  �  #  #   �  Z   �     <  m   V  �   �  9   f   �   �   :   Z!     �!     �!  �   �!   **Source code:** :source:`Lib/filecmp.py` :mod:`filecmp` --- File and Directory Comparisons A dictionary mapping names in :attr:`common_dirs` to :class:`dircmp` objects. Clear the filecmp cache. This may be useful if a file is compared so quickly after it is modified that it is within the mtime resolution of the underlying filesystem. Compare the files in the two directories *dir1* and *dir2* whose names are given by *common*. Compare the files named *f1* and *f2*, returning ``True`` if they seem equal, ``False`` otherwise. Construct a new directory comparison object, to compare the directories *a* and *b*.  *ignore* is a list of names to ignore, and defaults to :attr:`filecmp.DEFAULT_IGNORES`.  *hide* is a list of names to hide, and defaults to ``[os.curdir, os.pardir]``. Files and subdirectories in *a*, filtered by *hide* and *ignore*. Files and subdirectories in *b*, filtered by *hide* and *ignore*. Files and subdirectories in both *a* and *b*. Files and subdirectories only in *a*. Files and subdirectories only in *b*. Files in both *a* and *b*. Files which are identical in both *a* and *b*, using the class's file comparison operator. Files which are in both *a* and *b*, but could not be compared. Files which are in both *a* and *b*, whose contents differ according to the class's file comparison operator. For example, ``cmpfiles('a', 'b', ['c', 'd/e'])`` will compare ``a/c`` with ``b/c`` and ``a/d/e`` with ``b/d/e``.  ``'c'`` and ``'d/e'`` will each be in one of the three returned lists. Here is a simplified example of using the ``subdirs`` attribute to search recursively through two directories to show common different files:: If *shallow* is true, files with identical :func:`os.stat` signatures are taken to be equal.  Otherwise, the contents of the files are compared. List of directories ignored by :class:`dircmp` by default. Names in both *a* and *b*, such that the type differs between the directories, or names for which :func:`os.stat` reports an error. Note that no external programs are called from this function, giving it portability and efficiency. Note that via :meth:`__getattr__` hooks, all attributes are computed lazily, so there is no speed penalty if only those attributes which are lightweight to compute are used. Print (to :data:`sys.stdout`) a comparison between *a* and *b*. Print a comparison between *a* and *b* and common immediate subdirectories. Print a comparison between *a* and *b* and common subdirectories (recursively). Returns three lists of file names: *match*, *mismatch*, *errors*.  *match* contains the list of files that match, *mismatch* contains the names of those that don't, and *errors* lists the names of files which could not be compared.  Files are listed in *errors* if they don't exist in one of the directories, the user lacks permission to read them or if the comparison could not be done for some other reason. Subdirectories in both *a* and *b*. The *shallow* parameter has the same meaning and default value as for :func:`filecmp.cmp`. The :class:`dircmp` class The :class:`dircmp` class compares files by doing *shallow* comparisons as described for :func:`filecmp.cmp`. The :class:`dircmp` class offers a number of interesting attributes that may be used to get various bits of information about the directory trees being compared. The :class:`dircmp` class provides the following methods: The :mod:`filecmp` module defines functions to compare files and directories, with various optional time/correctness trade-offs. For comparing files, see also the :mod:`difflib` module. The :mod:`filecmp` module defines the following functions: The directory *a*. The directory *b*. This function uses a cache for past comparisons and the results, with cache entries invalidated if the :func:`os.stat` information for the file changes.  The entire cache may be cleared using :func:`clear_cache`. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/filecmp.py` :mod:`filecmp` --- File and Directory Comparisons A dictionary mapping names in :attr:`common_dirs` to :class:`dircmp` objects. Clear the filecmp cache. This may be useful if a file is compared so quickly after it is modified that it is within the mtime resolution of the underlying filesystem. Compare the files in the two directories *dir1* and *dir2* whose names are given by *common*. Compare the files named *f1* and *f2*, returning ``True`` if they seem equal, ``False`` otherwise. Construct a new directory comparison object, to compare the directories *a* and *b*.  *ignore* is a list of names to ignore, and defaults to :attr:`filecmp.DEFAULT_IGNORES`.  *hide* is a list of names to hide, and defaults to ``[os.curdir, os.pardir]``. Files and subdirectories in *a*, filtered by *hide* and *ignore*. Files and subdirectories in *b*, filtered by *hide* and *ignore*. Files and subdirectories in both *a* and *b*. Files and subdirectories only in *a*. Files and subdirectories only in *b*. Files in both *a* and *b*. Files which are identical in both *a* and *b*, using the class's file comparison operator. Files which are in both *a* and *b*, but could not be compared. Files which are in both *a* and *b*, whose contents differ according to the class's file comparison operator. For example, ``cmpfiles('a', 'b', ['c', 'd/e'])`` will compare ``a/c`` with ``b/c`` and ``a/d/e`` with ``b/d/e``.  ``'c'`` and ``'d/e'`` will each be in one of the three returned lists. Here is a simplified example of using the ``subdirs`` attribute to search recursively through two directories to show common different files:: If *shallow* is true, files with identical :func:`os.stat` signatures are taken to be equal.  Otherwise, the contents of the files are compared. List of directories ignored by :class:`dircmp` by default. Names in both *a* and *b*, such that the type differs between the directories, or names for which :func:`os.stat` reports an error. Note that no external programs are called from this function, giving it portability and efficiency. Note that via :meth:`__getattr__` hooks, all attributes are computed lazily, so there is no speed penalty if only those attributes which are lightweight to compute are used. Print (to :data:`sys.stdout`) a comparison between *a* and *b*. Print a comparison between *a* and *b* and common immediate subdirectories. Print a comparison between *a* and *b* and common subdirectories (recursively). Returns three lists of file names: *match*, *mismatch*, *errors*.  *match* contains the list of files that match, *mismatch* contains the names of those that don't, and *errors* lists the names of files which could not be compared.  Files are listed in *errors* if they don't exist in one of the directories, the user lacks permission to read them or if the comparison could not be done for some other reason. Subdirectories in both *a* and *b*. The *shallow* parameter has the same meaning and default value as for :func:`filecmp.cmp`. The :class:`dircmp` class The :class:`dircmp` class compares files by doing *shallow* comparisons as described for :func:`filecmp.cmp`. The :class:`dircmp` class offers a number of interesting attributes that may be used to get various bits of information about the directory trees being compared. The :class:`dircmp` class provides the following methods: The :mod:`filecmp` module defines functions to compare files and directories, with various optional time/correctness trade-offs. For comparing files, see also the :mod:`difflib` module. The :mod:`filecmp` module defines the following functions: The directory *a*. The directory *b*. This function uses a cache for past comparisons and the results, with cache entries invalidated if the :func:`os.stat` information for the file changes.  The entire cache may be cleared using :func:`clear_cache`. 