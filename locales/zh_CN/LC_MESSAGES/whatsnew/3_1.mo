��    q      �              ,  5   -  H   c  9   �  +   �  Y     H   l  /   �      �  6   	  l   =	     �	  ,   �	  =   �	  =   4
  +   r
  i   �
  v     -        �  /   �  @   �  /   >  D   n  /   �  /   �  /     /   C  6   s  #   �  5   �  2     /   7  +   g  ,   �  ^   �  6     0  V  !   �  5   �  <  �  p     2  �  u   �    6  �   O  �   �  q   �  9  7  G  q     �     �  ;   �  H     J  ]  �   �    �  W   �       Z     1  p  �  �  /   �!  %   �!     �!     "     "  1   ;"  b   m"  R   �"     ##  �   9#     $  Q  #$  :   u%  9   �%  �   �%  i   z&  �   �&  `   h'  �  �'  �   q)  �   *  �  �*  <  y,    �-  ?   �.  �   /  _  �/  �   �1  �   �2  M  �3    �4  '  6  J   +7  H   v7  �   �7  n  e8    �9  �   �:  �   �;  X   �<  �  
=  ^  �>  d   "A  h   �A  F   �A  i   7B  s   �B    C     4E  f   ME  ]   �E  �  F  5   �G  H   �G  9   HH  +   �H  Y   �H  H   I  /   QI      �I  6   �I  l   �I     FJ  ,   eJ  =   �J  =   �J  +   K  i   :K  v   �K  -   L     IL  /   iL  @   �L  /   �L  D   
M  /   OM  /   M  /   �M  /   �M  6   N  #   FN  5   jN  2   �N  /   �N  +   O  ,   /O  ^   \O  6   �O  0  �O  !   #Q  5   EQ  <  {Q  p   �R  2  )S  u   \T    �T  �   �U  �   V  q   aW  9  �W  G  Y     UZ     \Z  ;   tZ  H   �Z  J  �Z  �   D\    :]  W   T^     �^  Z   �^  1  _  �  >`  /   >b  %   nb     �b     �b     �b  1   �b  b   	c  R   lc     �c  �   �c     �d  Q  �d  :   f  9   Lf  �   �f  i   g  �   �g  `   h  �  eh  �   j  �   �j  �  6k  <  m    Rn  ?   lo  �   �o  _  2p  �   �r  �   Vs  M  ?t    �u  '  �v  J   �w  H   x  �   [x  n  y    pz  �   �{  �   m|  X   M}  �  �}  ^  _  d   ��  h   #�  F   ��  i   ӂ  s   =�    ��     Ѕ  f   �  ]   P�   (Contributed by Alexander Belopolsky; :issue:`4201`.) (Contributed by Alexandre Vassalotti and Antoine Pitrou, :issue:`6137`.) (Contributed by Amaury Forgeot d'Arc and Antoine Pitrou.) (Contributed by Andi Vajda; :issue:`4195`.) (Contributed by Antoine Pitrou along with a number of other participants, :issue:`4753`). (Contributed by Antoine Pitrou and Amaury Forgeot d'Arc, :issue:`4868`.) (Contributed by Antoine Pitrou, :issue:`4688`.) (Contributed by Antoine Pitrou.) (Contributed by Benjamin Peterson and Antoine Pitrou.) (Contributed by Bob Ippolito and converted to Py3.1 by Antoine Pitrou and Benjamin Peterson; :issue:`4136`.) (Contributed by Brett Cannon.) (Contributed by David Laban; :issue:`4739`.) (Contributed by Derek Morr; :issue:`1655` and :issue:`1664`.) (Contributed by Eric Smith and Mark Dickinson; :issue:`1580`) (Contributed by Eric Smith; :issue:`5237`.) (Contributed by Fredrik Johansson, Victor Stinner, Raymond Hettinger, and Mark Dickinson; :issue:`3439`.) (Contributed by Georg Brandl and Mattias Brändström; `appspot issue 53094 <https://codereview.appspot.com/53094>`_.) (Contributed by Georg Brandl; :issue:`5675`.) (Contributed by Gregory Smith.) (Contributed by Guilherme Polo; :issue:`2983`.) (Contributed by Jake McGuire and Antoine Pitrou; :issue:`5084`.) (Contributed by Larry Hastings; :issue:`5630`.) (Contributed by Mark Dickinson and Lisandro Dalcrin; :issue:`5175`.) (Contributed by Mark Dickinson; :issue:`4258`.) (Contributed by Mark Dickinson; :issue:`4707`.) (Contributed by Mark Dickinson; :issue:`4910`.) (Contributed by Mark Dickinson; :issue:`5914`.) (Contributed by Raymond Hettinger and Mark Dickinson.) (Contributed by Raymond Hettinger.) (Contributed by Raymond Hettinger; :issue:`1696199`.) (Contributed by Raymond Hettinger; :issue:`1818`.) (Contributed by Roger D. Serwy; :issue:`5150`.) (Contributed by Ross Light; :issue:`4285`.) (Contributed by Vinay Sajip; :issue:`4384`). (Suggested by Antoine Pitrou and Jesse Noller.  Implemented by Jack Diederich; :issue:`5228`.) :class:`functools.partial` objects can now be pickled. :func:`collections.namedtuple` now supports a keyword argument *rename* which lets invalid fieldnames be automatically converted to positional names in the form _0, _1, etc.  This is useful when the field names are being created by an external source such as a CSV header, SQL field list, or user input:: :pep:`372` - Ordered Dictionaries :pep:`378` - Format Specifier for Thousands Separator A new module, :mod:`importlib` was added.  It provides a complete, portable, pure Python reference implementation of the :keyword:`import` statement and its counterpart, the :func:`__import__` function.  It represents a substantial step forward in documenting and defining the actions that take place during imports. Add :mod:`pydoc` help topics for symbols so that ``help('@')`` works as expected in the interactive environment. Added :c:type:`PyCapsule` as a replacement for the :c:type:`PyCObject` API. The principal difference is that the new type has a well defined interface for passing typing safety information and a less complicated signature for calling a destructor.  The old type had a problematic API and is now deprecated. Added a :class:`collections.Counter` class to support convenient counting of unique items in a sequence or iterable:: Added a heuristic so that tuples and dicts containing only untrackable objects are not tracked by the garbage collector. This can reduce the size of collections and therefore the garbage collection overhead on long-running programs, depending on their particular use of datatypes. Added a new :c:func:`PyOS_string_to_double` function to replace the deprecated functions :c:func:`PyOS_ascii_strtod` and :c:func:`PyOS_ascii_atof`. Added a new module, :mod:`tkinter.ttk` for access to the Tk themed widget set. The basic idea of ttk is to separate, to the extent possible, the code implementing a widget's behavior from the code implementing its appearance. Also, tests for exceptions have been builtout to work with context managers using the :keyword:`with` statement:: An unfortunate but unavoidable side-effect of this change is that protocol 2 pickles produced by Python 3.1 won't be readable with Python 3.0. The latest pickle protocol, protocol 3, should be used when migrating data between Python 3.x implementations, as it doesn't attempt to remain compatible with Python 2.x. Apart from the performance improvements this change should be invisible to end users, with one exception: for testing and debugging purposes there's a new :attr:`sys.int_info` that provides information about the internal format, giving the number of bits per digit and the size in bytes of the C type used to store each digit:: Author Build and C API Changes Changes to Python's build process and to the C API include: Deprecated :c:func:`PyNumber_Int`.  Use :c:func:`PyNumber_Long` instead. Directories and zip archives containing a :file:`__main__.py` file can now be executed directly by passing their name to the interpreter. The directory/zipfile is automatically inserted as the first entry in sys.path.  (Suggestion and initial patch by Andy Chu; revised patch by Phillip J. Eby and Nick Coghlan; :issue:`1739468`.) Discussions are underway about how to specify alternative separators like dots, spaces, apostrophes, or underscores.  Locale-aware applications should use the existing *n* format specifier which already has some support for thousands separators. Enabling a configure option named ``--with-computed-gotos`` on compilers that support it (notably: gcc, SunPro, icc), the bytecode evaluation loop is compiled with a new dispatch mechanism which gives speedups of up to 20%, depending on the system, the compiler, and the benchmark. Formerly, the string would have required numbered fields such as: ``'Sir {0} of {1}'``. IDLE IDLE's format menu now provides an option to strip trailing whitespace from a source file. In addition, several new assertion methods were added including :func:`assertSetEqual`, :func:`assertDictEqual`, :func:`assertDictContainsSubset`, :func:`assertListEqual`, :func:`assertTupleEqual`, :func:`assertSequenceEqual`, :func:`assertRaisesRegexp`, :func:`assertIsNone`, and :func:`assertIsNotNone`. Integers are now stored internally either in base 2**15 or in base 2**30, the base being determined at build time.  Previously, they were always stored in base 2**15.  Using base 2**30 gives significant performance improvements on 64-bit machines, but benchmark results on 32-bit machines have been mixed.  Therefore, the default is to use base 2**30 on 64-bit machines and base 2**15 on 32-bit machines; on Unix, there's a new configure option ``--enable-big-digits`` that can be used to override this default. Major performance enhancements have been added: New, Improved, and Deprecated Modules Optimizations Other Language Changes PEP 372: Ordered Dictionaries PEP 378: Format Specifier for Thousands Separator PEP written by Armin Ronacher and Raymond Hettinger.  Implementation written by Raymond Hettinger. PEP written by Raymond Hettinger and implemented by Eric Smith and Mark Dickinson. Porting to Python 3.1 Python now uses David Gay's algorithm for finding the shortest floating point representation that doesn't change its value.  This should help mitigate some of the confusion surrounding binary floating point numbers. Raymond Hettinger Regular Python dictionaries iterate over key/value pairs in arbitrary order. Over the years, a number of authors have written alternative implementations that remember the order that the keys were originally inserted.  Based on the experiences from those implementations, a new :class:`collections.OrderedDict` class has been introduced. Some smaller changes made to the core Python language are: The :attr:`sys.version_info` tuple is now a named tuple:: The :c:func:`PyLong_AsUnsignedLongLong()` function now handles a negative *pylong* by raising :exc:`OverflowError` instead of :exc:`TypeError`. The :class:`gzip.GzipFile` and :class:`bz2.BZ2File` classes now support the context management protocol:: The :func:`int` type gained a ``bit_length`` method that returns the number of bits necessary to represent its argument in binary:: The :func:`re.sub`, :func:`re.subn` and :func:`re.split` functions now accept a flags parameter. The :func:`string.maketrans` function is deprecated and is replaced by new static methods, :meth:`bytes.maketrans` and :meth:`bytearray.maketrans`. This change solves the confusion around which types were supported by the :mod:`string` module. Now, :class:`str`, :class:`bytes`, and :class:`bytearray` each have their own **maketrans** and **translate** methods with intermediate translation tables of the appropriate type. The :mod:`decimal` module now supports methods for creating a decimal object from a binary :class:`float`.  The conversion is exact but can sometimes be surprising:: The :mod:`io` module has three new constants for the :meth:`seek` method :data:`SEEK_SET`, :data:`SEEK_CUR`, and :data:`SEEK_END`. The :mod:`itertools` module grew two new functions.  The :func:`itertools.combinations_with_replacement` function is one of four for generating combinatorics including permutations and Cartesian products.  The :func:`itertools.compress` function mimics its namesake from APL.  Also, the existing :func:`itertools.count` function now has an optional *step* argument and can accept any type of counting sequence including :class:`fractions.Fraction` and :class:`decimal.Decimal`:: The :mod:`json` module now has a C extension to substantially improve its performance.  In addition, the API was modified so that json works only with :class:`str`, not with :class:`bytes`.  That change makes the module closely match the `JSON specification <http://json.org/>`_ which is defined in terms of Unicode. The :mod:`logging` module now implements a simple :class:`logging.NullHandler` class for applications that are not using logging but are calling library code that does.  Setting-up a null handler will suppress spurious warnings such as "No handlers could be found for logger foo":: The :mod:`nntplib` and :mod:`imaplib` modules now support IPv6. The :mod:`pdb` module can now access and display source code loaded via :mod:`zipimport` (or any other conformant :pep:`302` loader). The :mod:`pickle` module has been adapted for better interoperability with Python 2.x when used with protocol 2 or lower.  The reorganization of the standard library changed the formal reference for many objects.  For example, ``__builtin__.set`` in Python 2 is called ``builtins.set`` in Python 3. This change confounded efforts to share data between different versions of Python.  But now when protocol 2 or lower is selected, the pickler will automatically use the old Python 2 names for both loading and dumping. This remapping is turned-on by default but can be disabled with the *fix_imports* option:: The :mod:`runpy` module which supports the ``-m`` command line switch now supports the execution of packages by looking for and executing a ``__main__`` submodule when a package name is supplied. The :mod:`unittest` module now supports skipping individual tests or classes of tests. And it supports marking a test as an expected failure, a test that is known to be broken, but shouldn't be counted as a failure on a TestResult:: The OrderedDict API is substantially the same as regular dictionaries but will iterate over keys and values in a guaranteed order depending on when a key was first inserted.  If a new entry overwrites an existing entry, the original insertion position is left unchanged.  Deleting an entry and reinserting it will move it to the end. The automatic name remapping in the pickle module for protocol 2 or lower can make Python 3.1 pickles unreadable in Python 3.0.  One solution is to use protocol 3.  Another solution is to set the *fix_imports* option to ``False``. See the discussion above for more details. The built-in :func:`format` function and the :meth:`str.format` method use a mini-language that now includes a simple, non-locale aware way to format a number with a thousands separator.  That provides a way to humanize a program's output, improving its professional appearance and readability:: The decoding of UTF-8, UTF-16 and LATIN-1 is now two to four times faster. The fields in :func:`format` strings can now be automatically numbered:: The long decimal result shows the actual binary fraction being stored for *1.1*.  The fraction has many digits because *1.1* cannot be exactly represented in binary. The new I/O library (as defined in :pep:`3116`) was mostly written in Python and quickly proved to be a problematic bottleneck in Python 3.0. In Python 3.1, the I/O library has been entirely rewritten in C and is 2 to 20 times faster depending on the task at hand. The pure Python version is still available for experimentation purposes through the ``_pyio`` module. The new algorithm depends on certain features in the underlying floating point implementation.  If the required features are not found, the old algorithm will continue to be used.  Also, the text pickle protocols assure cross-platform portability by using the old algorithm. The new algorithm for ``repr(1.1)`` is smarter and returns ``'1.1'``. Effectively, it searches all equivalent string representations (ones that get stored with the same underlying float value) and returns the shortest representation. The new algorithm tends to emit cleaner representations when possible, but it does not change the underlying values.  So, it is still the case that ``1.1 + 2.2 != 3.3`` even though the representations may suggest otherwise. The new floating point string representations can break existing doctests. For example:: The significance is easily seen with a number like ``1.1`` which does not have an exact equivalent in binary floating point.  Since there is no exact equivalent, an expression like ``float('1.1')`` evaluates to the nearest representable value which is ``0x1.199999999999ap+0`` in hex or ``1.100000000000000088817841970012523233890533447265625`` in decimal. That nearest value was and still is used in subsequent floating point calculations. The standard library now supports use of ordered dictionaries in several modules.  The :mod:`configparser` module uses them by default.  This lets configuration files be read, modified, and then written back in their original order.  The *_asdict()* method for :func:`collections.namedtuple` now returns an ordered dictionary with the values appearing in the same order as the underlying tuple indicies.  The :mod:`json` module is being built-out with an *object_pairs_hook* to allow OrderedDicts to be built by the decoder. Support was also added for third-party tools like `PyYAML <http://pyyaml.org/>`_. The supported types are :class:`int`, :class:`float`, :class:`complex` and :class:`decimal.Decimal`. The syntax of the :keyword:`with` statement now allows multiple context managers in a single statement:: This article explains the new features in Python 3.1, compared to 3.0. This section lists previously described changes and other bugfixes that may require changes to your code: Unpickling now interns the attribute names of pickled objects.  This saves memory and allows pickles to be smaller. What is new is how the number gets displayed.  Formerly, Python used a simple approach.  The value of ``repr(1.1)`` was computed as ``format(1.1, '.17g')`` which evaluated to ``'1.1000000000000001'``. The advantage of using 17 digits was that it relied on IEEE-754 guarantees to assure that ``eval(repr(1.1))`` would round-trip exactly to its original value.  The disadvantage is that many people found the output to be confusing (mistaking intrinsic limitations of binary floating point representation as being a problem with Python itself). What's New In Python 3.1 With the new syntax, the :func:`contextlib.nested` function is no longer needed and is now deprecated. ``round(x, n)`` now returns an integer if *x* is an integer. Previously it returned a float:: Project-Id-Version: Python 3.6
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
 (Contributed by Alexander Belopolsky; :issue:`4201`.) (Contributed by Alexandre Vassalotti and Antoine Pitrou, :issue:`6137`.) (Contributed by Amaury Forgeot d'Arc and Antoine Pitrou.) (Contributed by Andi Vajda; :issue:`4195`.) (Contributed by Antoine Pitrou along with a number of other participants, :issue:`4753`). (Contributed by Antoine Pitrou and Amaury Forgeot d'Arc, :issue:`4868`.) (Contributed by Antoine Pitrou, :issue:`4688`.) (Contributed by Antoine Pitrou.) (Contributed by Benjamin Peterson and Antoine Pitrou.) (Contributed by Bob Ippolito and converted to Py3.1 by Antoine Pitrou and Benjamin Peterson; :issue:`4136`.) (Contributed by Brett Cannon.) (Contributed by David Laban; :issue:`4739`.) (Contributed by Derek Morr; :issue:`1655` and :issue:`1664`.) (Contributed by Eric Smith and Mark Dickinson; :issue:`1580`) (Contributed by Eric Smith; :issue:`5237`.) (Contributed by Fredrik Johansson, Victor Stinner, Raymond Hettinger, and Mark Dickinson; :issue:`3439`.) (Contributed by Georg Brandl and Mattias Brändström; `appspot issue 53094 <https://codereview.appspot.com/53094>`_.) (Contributed by Georg Brandl; :issue:`5675`.) (Contributed by Gregory Smith.) (Contributed by Guilherme Polo; :issue:`2983`.) (Contributed by Jake McGuire and Antoine Pitrou; :issue:`5084`.) (Contributed by Larry Hastings; :issue:`5630`.) (Contributed by Mark Dickinson and Lisandro Dalcrin; :issue:`5175`.) (Contributed by Mark Dickinson; :issue:`4258`.) (Contributed by Mark Dickinson; :issue:`4707`.) (Contributed by Mark Dickinson; :issue:`4910`.) (Contributed by Mark Dickinson; :issue:`5914`.) (Contributed by Raymond Hettinger and Mark Dickinson.) (Contributed by Raymond Hettinger.) (Contributed by Raymond Hettinger; :issue:`1696199`.) (Contributed by Raymond Hettinger; :issue:`1818`.) (Contributed by Roger D. Serwy; :issue:`5150`.) (Contributed by Ross Light; :issue:`4285`.) (Contributed by Vinay Sajip; :issue:`4384`). (Suggested by Antoine Pitrou and Jesse Noller.  Implemented by Jack Diederich; :issue:`5228`.) :class:`functools.partial` objects can now be pickled. :func:`collections.namedtuple` now supports a keyword argument *rename* which lets invalid fieldnames be automatically converted to positional names in the form _0, _1, etc.  This is useful when the field names are being created by an external source such as a CSV header, SQL field list, or user input:: :pep:`372` - Ordered Dictionaries :pep:`378` - Format Specifier for Thousands Separator A new module, :mod:`importlib` was added.  It provides a complete, portable, pure Python reference implementation of the :keyword:`import` statement and its counterpart, the :func:`__import__` function.  It represents a substantial step forward in documenting and defining the actions that take place during imports. Add :mod:`pydoc` help topics for symbols so that ``help('@')`` works as expected in the interactive environment. Added :c:type:`PyCapsule` as a replacement for the :c:type:`PyCObject` API. The principal difference is that the new type has a well defined interface for passing typing safety information and a less complicated signature for calling a destructor.  The old type had a problematic API and is now deprecated. Added a :class:`collections.Counter` class to support convenient counting of unique items in a sequence or iterable:: Added a heuristic so that tuples and dicts containing only untrackable objects are not tracked by the garbage collector. This can reduce the size of collections and therefore the garbage collection overhead on long-running programs, depending on their particular use of datatypes. Added a new :c:func:`PyOS_string_to_double` function to replace the deprecated functions :c:func:`PyOS_ascii_strtod` and :c:func:`PyOS_ascii_atof`. Added a new module, :mod:`tkinter.ttk` for access to the Tk themed widget set. The basic idea of ttk is to separate, to the extent possible, the code implementing a widget's behavior from the code implementing its appearance. Also, tests for exceptions have been builtout to work with context managers using the :keyword:`with` statement:: An unfortunate but unavoidable side-effect of this change is that protocol 2 pickles produced by Python 3.1 won't be readable with Python 3.0. The latest pickle protocol, protocol 3, should be used when migrating data between Python 3.x implementations, as it doesn't attempt to remain compatible with Python 2.x. Apart from the performance improvements this change should be invisible to end users, with one exception: for testing and debugging purposes there's a new :attr:`sys.int_info` that provides information about the internal format, giving the number of bits per digit and the size in bytes of the C type used to store each digit:: Author Build and C API Changes Changes to Python's build process and to the C API include: Deprecated :c:func:`PyNumber_Int`.  Use :c:func:`PyNumber_Long` instead. Directories and zip archives containing a :file:`__main__.py` file can now be executed directly by passing their name to the interpreter. The directory/zipfile is automatically inserted as the first entry in sys.path.  (Suggestion and initial patch by Andy Chu; revised patch by Phillip J. Eby and Nick Coghlan; :issue:`1739468`.) Discussions are underway about how to specify alternative separators like dots, spaces, apostrophes, or underscores.  Locale-aware applications should use the existing *n* format specifier which already has some support for thousands separators. Enabling a configure option named ``--with-computed-gotos`` on compilers that support it (notably: gcc, SunPro, icc), the bytecode evaluation loop is compiled with a new dispatch mechanism which gives speedups of up to 20%, depending on the system, the compiler, and the benchmark. Formerly, the string would have required numbered fields such as: ``'Sir {0} of {1}'``. IDLE IDLE's format menu now provides an option to strip trailing whitespace from a source file. In addition, several new assertion methods were added including :func:`assertSetEqual`, :func:`assertDictEqual`, :func:`assertDictContainsSubset`, :func:`assertListEqual`, :func:`assertTupleEqual`, :func:`assertSequenceEqual`, :func:`assertRaisesRegexp`, :func:`assertIsNone`, and :func:`assertIsNotNone`. Integers are now stored internally either in base 2**15 or in base 2**30, the base being determined at build time.  Previously, they were always stored in base 2**15.  Using base 2**30 gives significant performance improvements on 64-bit machines, but benchmark results on 32-bit machines have been mixed.  Therefore, the default is to use base 2**30 on 64-bit machines and base 2**15 on 32-bit machines; on Unix, there's a new configure option ``--enable-big-digits`` that can be used to override this default. Major performance enhancements have been added: New, Improved, and Deprecated Modules Optimizations Other Language Changes PEP 372: Ordered Dictionaries PEP 378: Format Specifier for Thousands Separator PEP written by Armin Ronacher and Raymond Hettinger.  Implementation written by Raymond Hettinger. PEP written by Raymond Hettinger and implemented by Eric Smith and Mark Dickinson. Porting to Python 3.1 Python now uses David Gay's algorithm for finding the shortest floating point representation that doesn't change its value.  This should help mitigate some of the confusion surrounding binary floating point numbers. Raymond Hettinger Regular Python dictionaries iterate over key/value pairs in arbitrary order. Over the years, a number of authors have written alternative implementations that remember the order that the keys were originally inserted.  Based on the experiences from those implementations, a new :class:`collections.OrderedDict` class has been introduced. Some smaller changes made to the core Python language are: The :attr:`sys.version_info` tuple is now a named tuple:: The :c:func:`PyLong_AsUnsignedLongLong()` function now handles a negative *pylong* by raising :exc:`OverflowError` instead of :exc:`TypeError`. The :class:`gzip.GzipFile` and :class:`bz2.BZ2File` classes now support the context management protocol:: The :func:`int` type gained a ``bit_length`` method that returns the number of bits necessary to represent its argument in binary:: The :func:`re.sub`, :func:`re.subn` and :func:`re.split` functions now accept a flags parameter. The :func:`string.maketrans` function is deprecated and is replaced by new static methods, :meth:`bytes.maketrans` and :meth:`bytearray.maketrans`. This change solves the confusion around which types were supported by the :mod:`string` module. Now, :class:`str`, :class:`bytes`, and :class:`bytearray` each have their own **maketrans** and **translate** methods with intermediate translation tables of the appropriate type. The :mod:`decimal` module now supports methods for creating a decimal object from a binary :class:`float`.  The conversion is exact but can sometimes be surprising:: The :mod:`io` module has three new constants for the :meth:`seek` method :data:`SEEK_SET`, :data:`SEEK_CUR`, and :data:`SEEK_END`. The :mod:`itertools` module grew two new functions.  The :func:`itertools.combinations_with_replacement` function is one of four for generating combinatorics including permutations and Cartesian products.  The :func:`itertools.compress` function mimics its namesake from APL.  Also, the existing :func:`itertools.count` function now has an optional *step* argument and can accept any type of counting sequence including :class:`fractions.Fraction` and :class:`decimal.Decimal`:: The :mod:`json` module now has a C extension to substantially improve its performance.  In addition, the API was modified so that json works only with :class:`str`, not with :class:`bytes`.  That change makes the module closely match the `JSON specification <http://json.org/>`_ which is defined in terms of Unicode. The :mod:`logging` module now implements a simple :class:`logging.NullHandler` class for applications that are not using logging but are calling library code that does.  Setting-up a null handler will suppress spurious warnings such as "No handlers could be found for logger foo":: The :mod:`nntplib` and :mod:`imaplib` modules now support IPv6. The :mod:`pdb` module can now access and display source code loaded via :mod:`zipimport` (or any other conformant :pep:`302` loader). The :mod:`pickle` module has been adapted for better interoperability with Python 2.x when used with protocol 2 or lower.  The reorganization of the standard library changed the formal reference for many objects.  For example, ``__builtin__.set`` in Python 2 is called ``builtins.set`` in Python 3. This change confounded efforts to share data between different versions of Python.  But now when protocol 2 or lower is selected, the pickler will automatically use the old Python 2 names for both loading and dumping. This remapping is turned-on by default but can be disabled with the *fix_imports* option:: The :mod:`runpy` module which supports the ``-m`` command line switch now supports the execution of packages by looking for and executing a ``__main__`` submodule when a package name is supplied. The :mod:`unittest` module now supports skipping individual tests or classes of tests. And it supports marking a test as an expected failure, a test that is known to be broken, but shouldn't be counted as a failure on a TestResult:: The OrderedDict API is substantially the same as regular dictionaries but will iterate over keys and values in a guaranteed order depending on when a key was first inserted.  If a new entry overwrites an existing entry, the original insertion position is left unchanged.  Deleting an entry and reinserting it will move it to the end. The automatic name remapping in the pickle module for protocol 2 or lower can make Python 3.1 pickles unreadable in Python 3.0.  One solution is to use protocol 3.  Another solution is to set the *fix_imports* option to ``False``. See the discussion above for more details. The built-in :func:`format` function and the :meth:`str.format` method use a mini-language that now includes a simple, non-locale aware way to format a number with a thousands separator.  That provides a way to humanize a program's output, improving its professional appearance and readability:: The decoding of UTF-8, UTF-16 and LATIN-1 is now two to four times faster. The fields in :func:`format` strings can now be automatically numbered:: The long decimal result shows the actual binary fraction being stored for *1.1*.  The fraction has many digits because *1.1* cannot be exactly represented in binary. The new I/O library (as defined in :pep:`3116`) was mostly written in Python and quickly proved to be a problematic bottleneck in Python 3.0. In Python 3.1, the I/O library has been entirely rewritten in C and is 2 to 20 times faster depending on the task at hand. The pure Python version is still available for experimentation purposes through the ``_pyio`` module. The new algorithm depends on certain features in the underlying floating point implementation.  If the required features are not found, the old algorithm will continue to be used.  Also, the text pickle protocols assure cross-platform portability by using the old algorithm. The new algorithm for ``repr(1.1)`` is smarter and returns ``'1.1'``. Effectively, it searches all equivalent string representations (ones that get stored with the same underlying float value) and returns the shortest representation. The new algorithm tends to emit cleaner representations when possible, but it does not change the underlying values.  So, it is still the case that ``1.1 + 2.2 != 3.3`` even though the representations may suggest otherwise. The new floating point string representations can break existing doctests. For example:: The significance is easily seen with a number like ``1.1`` which does not have an exact equivalent in binary floating point.  Since there is no exact equivalent, an expression like ``float('1.1')`` evaluates to the nearest representable value which is ``0x1.199999999999ap+0`` in hex or ``1.100000000000000088817841970012523233890533447265625`` in decimal. That nearest value was and still is used in subsequent floating point calculations. The standard library now supports use of ordered dictionaries in several modules.  The :mod:`configparser` module uses them by default.  This lets configuration files be read, modified, and then written back in their original order.  The *_asdict()* method for :func:`collections.namedtuple` now returns an ordered dictionary with the values appearing in the same order as the underlying tuple indicies.  The :mod:`json` module is being built-out with an *object_pairs_hook* to allow OrderedDicts to be built by the decoder. Support was also added for third-party tools like `PyYAML <http://pyyaml.org/>`_. The supported types are :class:`int`, :class:`float`, :class:`complex` and :class:`decimal.Decimal`. The syntax of the :keyword:`with` statement now allows multiple context managers in a single statement:: This article explains the new features in Python 3.1, compared to 3.0. This section lists previously described changes and other bugfixes that may require changes to your code: Unpickling now interns the attribute names of pickled objects.  This saves memory and allows pickles to be smaller. What is new is how the number gets displayed.  Formerly, Python used a simple approach.  The value of ``repr(1.1)`` was computed as ``format(1.1, '.17g')`` which evaluated to ``'1.1000000000000001'``. The advantage of using 17 digits was that it relied on IEEE-754 guarantees to assure that ``eval(repr(1.1))`` would round-trip exactly to its original value.  The disadvantage is that many people found the output to be confusing (mistaking intrinsic limitations of binary floating point representation as being a problem with Python itself). What's New In Python 3.1 With the new syntax, the :func:`contextlib.nested` function is no longer needed and is now deprecated. ``round(x, n)`` now returns an integer if *x* is an integer. Previously it returned a float:: 