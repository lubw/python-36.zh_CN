��    x      �              �  '   �  /   �    �  �  	  �   �
  �   �  E     9   S  6   �  K   �  ?     ?   P  4   �     �    �  �   �  :   �  ?  �  2   �  1   .  <   `  N   �  z   �  �   g  P   1  -   �  �   �  .   ]  ,   �  .   �  .   �  6     �   N  �   0  ,     =   F  ?   �  x   �  5   =  �   s  >     �   S     2  N   9  �  �  �   x  �   i  c   �  9   W     �  /   �  �   �  ?   X  T   �  =   �  D   +   6   p   :   �   N   �   T   1!  �   �!  �   F"  �   �"  &   T#  )   {#  1   �#  0   �#  b   $  8   k$  6   �$  G   �$  X   #%  �  |%  �   Y'  �   (  ^   )  �   m)  -   K*  !   y*  j  �*  #   ,    *,  W   6-  9   �-  b  �-     +/  F   ./  
   u/  @   �/  3   �/  �   �/  t   �0     1     $1     ;1     [1     u1     �1     �1     �1     �1     �1     �1     2     /2  (   L2  )   u2  #   �2     �2     �2     �2     3     23     R3      q3     �3     �3  "   �3     �3  �  �3  '   �5  /   �5    
6  �  (7  �   9  �   �9  E   ":  9   h:  6   �:  K   �:  ?   %;  ?   e;  4   �;     �;    �;  �   
=  :   �=  ?  �=  2   ?  1   C?  <   u?  N   �?  z   @  �   |@  P   FA  -   �A  �   �A  .   rB  ,   �B  .   �B  .   �B  6   ,C  �   cC  �   ED  ,   .E  =   [E  ?   �E  x   �E  5   RF  �   �F  >   )G  �   hG     GH  N   NH  �  �H  �   �J  �   ~K  c   L  9   lL     �L  /   �L  �   �L  ?   mM  T   �M  =   N  D   @N  6   �N  :   �N  N   �N  T   FO  �   �O  �   [P  �   �P  &   iQ  )   �Q  1   �Q  0   �Q  b   R  8   �R  6   �R  G   �R  X   8S  �  �S  �   nU  �   &V  ^   #W  �   �W  -   `X  !   �X  j  �X  #   Z    ?Z  W   K[  9   �[  b  �[     @]  F   C]  
   �]  @   �]  3   �]  �   
^  t   �^     _     9_     P_     p_     �_     �_     �_     �_     �_     �_     `     %`     D`  (   a`  )   �`  #   �`     �`     �`     a     *a     Ga     ga      �a     �a     �a  "   �a     �a   **Source code:** :source:`Lib/lib2to3/` 2to3 - Automated Python 2 to 3 code translation 2to3 can also refactor doctests.  To enable this mode, use the :option:`!-d` flag.  Note that *only* doctests will be refactored.  This also doesn't require the module to be valid Python.  For example, doctest like examples in a reST document could also be refactored with this option. 2to3 is a Python program that reads Python 2.x source code and applies a series of *fixers* to transform it into valid Python 3.x code.  The standard library contains a rich set of fixers that will handle almost all code.  2to3 supporting library :mod:`lib2to3` is, however, a flexible and generic library, so it is possible to write your own fixers for 2to3.  :mod:`lib2to3` could also be adapted to custom applications in which Python code needs to be edited automatically. 2to3 will usually be installed with the Python interpreter as a script.  It is also located in the :file:`Tools/scripts` directory of the Python root. 2to3's basic arguments are a list of files or directories to transform.  The directories are recursively traversed for Python sources. :meth:`assertAlmostEqual(a, b) <unittest.TestCase.assertAlmostEqual>` :meth:`assertEqual(a, b) <unittest.TestCase.assertEqual>` :meth:`assertFalse(a) <unittest.TestCase.assertFalse>` :meth:`assertNotAlmostEqual(a, b) <unittest.TestCase.assertNotAlmostEqual>` :meth:`assertNotEqual(a, b) <unittest.TestCase.assertNotEqual>` :meth:`assertRaises(exc, cal) <unittest.TestCase.assertRaises>` :meth:`assertTrue(a) <unittest.TestCase.assertTrue>` :mod:`lib2to3` - 2to3's library A diff against the original source file is printed.  2to3 can also write the needed modifications right back to the source file.  (A backup of the original file is made unless :option:`!-n` is also given.)  Writing the changes back is enabled with the :option:`!-w` flag: Add extra parenthesis where they are required in list comprehensions.  For example, ``[x for x in 1, 2]`` becomes ``[x for x in (1, 2)]``. After transformation, :file:`example.py` looks like this:: By default, 2to3 runs a set of :ref:`predefined fixers <2to3-fixers>`.  The :option:`!-l` flag lists all available fixers.  An explicit set of fixers to run can be given with :option:`!-f`.  Likewise the :option:`!-x` explicitly disables a fixer.  The following example runs only the ``imports`` and ``has_key`` fixers: Changes :data:`sys.maxint` to :data:`sys.maxsize`. Changes ``dict.has_key(key)`` to ``key in dict``. Changes ``for x in file.xreadlines()`` to ``for x in file``. Changes assignment of :attr:`sys.exitfunc` to use of the :mod:`atexit` module. Changes the deprecated :data:`sys.exc_value`, :data:`sys.exc_type`, :data:`sys.exc_traceback` to use :func:`sys.exc_info`. Changes usage of :func:`itertools.ifilter`, :func:`itertools.izip`, and :func:`itertools.imap` to their built-in equivalents. :func:`itertools.ifilterfalse` is changed to :func:`itertools.filterfalse`. Comments and exact indentation are preserved throughout the translation process. Converts :class:`basestring` to :class:`str`. Converts :class:`buffer` to :class:`memoryview`.  This fixer is optional because the :class:`memoryview` API is similar but not exactly the same as that of :class:`buffer`. Converts :func:`intern` to :func:`sys.intern`. Converts :func:`raw_input` to :func:`input`. Converts :func:`reload` to :func:`imp.reload`. Converts ``except X, T`` to ``except X as T``. Converts ``input(prompt)`` to ``eval(input(prompt))``. Converts ``raise E, V`` to ``raise E(V)``, and ``raise E, V, T`` to ``raise E(V).with_traceback(T)``.  If ``E`` is a tuple, the translation will be incorrect because substituting tuples for exceptions has been removed in 3.0. Converts calls to various functions in the :mod:`operator` module to other, but equivalent, function calls.  When needed, the appropriate ``import`` statements are added, e.g. ``import collections``.  The following mapping are made: Converts octal literals into the new syntax. Converts the ``exec`` statement to the :func:`exec` function. Converts the ``print`` statement to the :func:`print` function. Converts the old metaclass syntax (``__metaclass__ = Meta`` in the class body) to the new (``class X(metaclass=Meta)``). Converts the old not-equal syntax, ``<>``, to ``!=``. Converts the use of iterator's :meth:`~iterator.next` methods to the :func:`next` function.  It also renames :meth:`next` methods to :meth:`~iterator.__next__`. Detects sibling imports and converts them to relative imports. Each step of transforming code is encapsulated in a fixer.  The command ``2to3 -l`` lists them.  As :ref:`documented above <2to3-using>`, each can be turned on and off individually.  They are described here in more detail. Fixers Fixes code broken from the removal of some members in the :mod:`types` module. Fixes dictionary iteration methods.  :meth:`dict.iteritems` is converted to :meth:`dict.items`, :meth:`dict.iterkeys` to :meth:`dict.keys`, and :meth:`dict.itervalues` to :meth:`dict.values`.  Similarly, :meth:`dict.viewitems`, :meth:`dict.viewkeys` and :meth:`dict.viewvalues` are converted respectively to :meth:`dict.items`, :meth:`dict.keys` and :meth:`dict.values`.  It also wraps existing usages of :meth:`dict.items`, :meth:`dict.keys`, and :meth:`dict.values` in a call to :class:`list`. Fixes duplicate types in the second argument of :func:`isinstance`.  For example, ``isinstance(x, (int, int))`` is converted to ``isinstance(x, int)`` and ``isinstance(x, (int, float, int))`` is converted to ``isinstance(x, (int, float))``. Fixes function attributes that have been renamed.  For example, ``my_function.func_closure`` is converted to ``my_function.__closure__``. Fixes old method attribute names.  For example, ``meth.im_func`` is converted to ``meth.__func__``. Fixes the API change in generator's :meth:`throw` method. From Handles module renames in the standard library. Handles other modules renames in the standard library.  It is separate from the :2to3fixer:`imports` fixer only because of technical limitations. Handles the move of :func:`reduce` to :func:`functools.reduce`. Handles the rename of :mod:`urllib` and :mod:`urllib2` to the :mod:`urllib` package. Here is a sample Python 2.x source file, :file:`example.py`:: It can be converted to Python 3.x code via 2to3 on the command line: Notice how passing ``all`` enables all default fixers. Removes ``from __future__ import new_feature`` statements. Removes excess whitespace from comma separated items.  This fixer is optional. Removes implicit tuple parameter unpacking.  This fixer inserts temporary variables. Removes imports of :func:`itertools.ifilter`, :func:`itertools.izip`, and :func:`itertools.imap`.  Imports of :func:`itertools.ifilterfalse` are also changed to :func:`itertools.filterfalse`. Removes usage of :func:`apply`.  For example ``apply(function, *args, **kwargs)`` is converted to ``function(*args, **kwargs)``. Removes usage of :func:`execfile`.  The argument to :func:`execfile` is wrapped in calls to :func:`open`, :func:`compile`, and :func:`exec`. Renames :class:`long` to :class:`int`. Renames :class:`unicode` to :class:`str`. Renames :exc:`StandardError` to :exc:`Exception`. Renames :func:`os.getcwdu` to :func:`os.getcwd`. Renames :func:`xrange` to :func:`range` and wraps existing :func:`range` calls with :class:`list`. Renames :meth:`__nonzero__` to :meth:`~object.__bool__`. Replaces backtick repr with the :func:`repr` function. Replaces deprecated :mod:`unittest` method names with the correct ones. Replaces use of the :class:`set` constructor with set literals.  This fixer is optional. Since some print statements can be parsed as function calls or statements, 2to3 cannot always read files containing the print function.  When 2to3 detects the presence of the ``from __future__ import print_function`` compiler directive, it modifies its internal grammar to interpret :func:`print` as a function.  This change can also be enabled manually with the :option:`!-p` flag.  Use :option:`!-p` to run fixers on code that already has had its print statements converted. Some fixers are *explicit*, meaning they aren't run by default and must be listed on the command line to be run.  Here, in addition to the default fixers, the ``idioms`` fixer is run: Sometimes 2to3 will find a place in your source code that needs to be changed, but 2to3 cannot fix automatically.  In this case, 2to3 will print a warning beneath the diff for a file.  You should address the warning in order to have compliant 3.x code. The :mod:`lib2to3` API should be considered unstable and may change drastically in the future. The :option:`!--add-suffix` option specifies a string to append to all output filenames.  The :option:`!-n` flag is required when specifying this as backups are not necessary when writing to different filenames.  Example: The :option:`!--add-suffix` option was added. The :option:`!-W` flag was added. The :option:`!-W` or :option:`!--write-unchanged-files` flag tells 2to3 to always write output files even if no changes were required to the file.  This is most useful with :option:`!-o` so that an entire Python source tree is copied with translation from one directory to another. This option implies the :option:`!-w` flag as it would not make sense otherwise. The :option:`!-o` option was added. The :option:`!-o` or :option:`!--output-dir` option allows specification of an alternate directory for processed output files to be written to.  The :option:`!-n` flag is required when using this as backup files do not make sense when not overwriting the input files. The :option:`!-v` option enables output of more information on the translation process. This command runs every fixer except the ``apply`` fixer: This optional fixer performs several transformations that make Python code more idiomatic.  Type comparisons like ``type(x) is SomeClass`` and ``type(x) == SomeClass`` are converted to ``isinstance(x, SomeClass)``. ``while 1`` becomes ``while True``.  This fixer also tries to make use of :func:`sorted` in appropriate places.  For example, this block :: To To translate an entire project from one directory tree to another use: Using 2to3 Will cause a converted file named ``example.py3`` to be written. Wraps :func:`filter` usage in a :class:`list` call. Wraps :func:`map` in a :class:`list` call.  It also changes ``map(None, x)`` to ``list(x)``.  Using ``from future_builtins import map`` disables this fixer. Wraps :func:`zip` usage in a :class:`list` call.  This is disabled when ``from future_builtins import zip`` appears. ``assertAlmostEquals(a, b)`` ``assertEquals(a, b)`` ``assertNotAlmostEquals(a, b)`` ``assertNotEquals(a, b)`` ``assert_(a)`` ``failIf(a)`` ``failIfAlmostEqual(a, b)`` ``failIfEqual(a, b)`` ``failUnless(a)`` ``failUnlessAlmostEqual(a, b)`` ``failUnlessEqual(a, b)`` ``failUnlessRaises(exc, cal)`` ``hasattr(obj, '__call__')`` ``isinstance(obj, collections.Mapping)`` ``isinstance(obj, collections.Sequence)`` ``isinstance(obj, numbers.Number)`` ``operator.contains(obj)`` ``operator.imul(obj, n)`` ``operator.irepeat(obj, n)`` ``operator.isCallable(obj)`` ``operator.isMappingType(obj)`` ``operator.isNumberType(obj)`` ``operator.isSequenceType(obj)`` ``operator.mul(obj, n)`` ``operator.repeat(obj, n)`` ``operator.sequenceIncludes(obj)`` is changed to :: Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/lib2to3/` 2to3 - Automated Python 2 to 3 code translation 2to3 can also refactor doctests.  To enable this mode, use the :option:`!-d` flag.  Note that *only* doctests will be refactored.  This also doesn't require the module to be valid Python.  For example, doctest like examples in a reST document could also be refactored with this option. 2to3 is a Python program that reads Python 2.x source code and applies a series of *fixers* to transform it into valid Python 3.x code.  The standard library contains a rich set of fixers that will handle almost all code.  2to3 supporting library :mod:`lib2to3` is, however, a flexible and generic library, so it is possible to write your own fixers for 2to3.  :mod:`lib2to3` could also be adapted to custom applications in which Python code needs to be edited automatically. 2to3 will usually be installed with the Python interpreter as a script.  It is also located in the :file:`Tools/scripts` directory of the Python root. 2to3's basic arguments are a list of files or directories to transform.  The directories are recursively traversed for Python sources. :meth:`assertAlmostEqual(a, b) <unittest.TestCase.assertAlmostEqual>` :meth:`assertEqual(a, b) <unittest.TestCase.assertEqual>` :meth:`assertFalse(a) <unittest.TestCase.assertFalse>` :meth:`assertNotAlmostEqual(a, b) <unittest.TestCase.assertNotAlmostEqual>` :meth:`assertNotEqual(a, b) <unittest.TestCase.assertNotEqual>` :meth:`assertRaises(exc, cal) <unittest.TestCase.assertRaises>` :meth:`assertTrue(a) <unittest.TestCase.assertTrue>` :mod:`lib2to3` - 2to3's library A diff against the original source file is printed.  2to3 can also write the needed modifications right back to the source file.  (A backup of the original file is made unless :option:`!-n` is also given.)  Writing the changes back is enabled with the :option:`!-w` flag: Add extra parenthesis where they are required in list comprehensions.  For example, ``[x for x in 1, 2]`` becomes ``[x for x in (1, 2)]``. After transformation, :file:`example.py` looks like this:: By default, 2to3 runs a set of :ref:`predefined fixers <2to3-fixers>`.  The :option:`!-l` flag lists all available fixers.  An explicit set of fixers to run can be given with :option:`!-f`.  Likewise the :option:`!-x` explicitly disables a fixer.  The following example runs only the ``imports`` and ``has_key`` fixers: Changes :data:`sys.maxint` to :data:`sys.maxsize`. Changes ``dict.has_key(key)`` to ``key in dict``. Changes ``for x in file.xreadlines()`` to ``for x in file``. Changes assignment of :attr:`sys.exitfunc` to use of the :mod:`atexit` module. Changes the deprecated :data:`sys.exc_value`, :data:`sys.exc_type`, :data:`sys.exc_traceback` to use :func:`sys.exc_info`. Changes usage of :func:`itertools.ifilter`, :func:`itertools.izip`, and :func:`itertools.imap` to their built-in equivalents. :func:`itertools.ifilterfalse` is changed to :func:`itertools.filterfalse`. Comments and exact indentation are preserved throughout the translation process. Converts :class:`basestring` to :class:`str`. Converts :class:`buffer` to :class:`memoryview`.  This fixer is optional because the :class:`memoryview` API is similar but not exactly the same as that of :class:`buffer`. Converts :func:`intern` to :func:`sys.intern`. Converts :func:`raw_input` to :func:`input`. Converts :func:`reload` to :func:`imp.reload`. Converts ``except X, T`` to ``except X as T``. Converts ``input(prompt)`` to ``eval(input(prompt))``. Converts ``raise E, V`` to ``raise E(V)``, and ``raise E, V, T`` to ``raise E(V).with_traceback(T)``.  If ``E`` is a tuple, the translation will be incorrect because substituting tuples for exceptions has been removed in 3.0. Converts calls to various functions in the :mod:`operator` module to other, but equivalent, function calls.  When needed, the appropriate ``import`` statements are added, e.g. ``import collections``.  The following mapping are made: Converts octal literals into the new syntax. Converts the ``exec`` statement to the :func:`exec` function. Converts the ``print`` statement to the :func:`print` function. Converts the old metaclass syntax (``__metaclass__ = Meta`` in the class body) to the new (``class X(metaclass=Meta)``). Converts the old not-equal syntax, ``<>``, to ``!=``. Converts the use of iterator's :meth:`~iterator.next` methods to the :func:`next` function.  It also renames :meth:`next` methods to :meth:`~iterator.__next__`. Detects sibling imports and converts them to relative imports. Each step of transforming code is encapsulated in a fixer.  The command ``2to3 -l`` lists them.  As :ref:`documented above <2to3-using>`, each can be turned on and off individually.  They are described here in more detail. Fixers Fixes code broken from the removal of some members in the :mod:`types` module. Fixes dictionary iteration methods.  :meth:`dict.iteritems` is converted to :meth:`dict.items`, :meth:`dict.iterkeys` to :meth:`dict.keys`, and :meth:`dict.itervalues` to :meth:`dict.values`.  Similarly, :meth:`dict.viewitems`, :meth:`dict.viewkeys` and :meth:`dict.viewvalues` are converted respectively to :meth:`dict.items`, :meth:`dict.keys` and :meth:`dict.values`.  It also wraps existing usages of :meth:`dict.items`, :meth:`dict.keys`, and :meth:`dict.values` in a call to :class:`list`. Fixes duplicate types in the second argument of :func:`isinstance`.  For example, ``isinstance(x, (int, int))`` is converted to ``isinstance(x, int)`` and ``isinstance(x, (int, float, int))`` is converted to ``isinstance(x, (int, float))``. Fixes function attributes that have been renamed.  For example, ``my_function.func_closure`` is converted to ``my_function.__closure__``. Fixes old method attribute names.  For example, ``meth.im_func`` is converted to ``meth.__func__``. Fixes the API change in generator's :meth:`throw` method. From Handles module renames in the standard library. Handles other modules renames in the standard library.  It is separate from the :2to3fixer:`imports` fixer only because of technical limitations. Handles the move of :func:`reduce` to :func:`functools.reduce`. Handles the rename of :mod:`urllib` and :mod:`urllib2` to the :mod:`urllib` package. Here is a sample Python 2.x source file, :file:`example.py`:: It can be converted to Python 3.x code via 2to3 on the command line: Notice how passing ``all`` enables all default fixers. Removes ``from __future__ import new_feature`` statements. Removes excess whitespace from comma separated items.  This fixer is optional. Removes implicit tuple parameter unpacking.  This fixer inserts temporary variables. Removes imports of :func:`itertools.ifilter`, :func:`itertools.izip`, and :func:`itertools.imap`.  Imports of :func:`itertools.ifilterfalse` are also changed to :func:`itertools.filterfalse`. Removes usage of :func:`apply`.  For example ``apply(function, *args, **kwargs)`` is converted to ``function(*args, **kwargs)``. Removes usage of :func:`execfile`.  The argument to :func:`execfile` is wrapped in calls to :func:`open`, :func:`compile`, and :func:`exec`. Renames :class:`long` to :class:`int`. Renames :class:`unicode` to :class:`str`. Renames :exc:`StandardError` to :exc:`Exception`. Renames :func:`os.getcwdu` to :func:`os.getcwd`. Renames :func:`xrange` to :func:`range` and wraps existing :func:`range` calls with :class:`list`. Renames :meth:`__nonzero__` to :meth:`~object.__bool__`. Replaces backtick repr with the :func:`repr` function. Replaces deprecated :mod:`unittest` method names with the correct ones. Replaces use of the :class:`set` constructor with set literals.  This fixer is optional. Since some print statements can be parsed as function calls or statements, 2to3 cannot always read files containing the print function.  When 2to3 detects the presence of the ``from __future__ import print_function`` compiler directive, it modifies its internal grammar to interpret :func:`print` as a function.  This change can also be enabled manually with the :option:`!-p` flag.  Use :option:`!-p` to run fixers on code that already has had its print statements converted. Some fixers are *explicit*, meaning they aren't run by default and must be listed on the command line to be run.  Here, in addition to the default fixers, the ``idioms`` fixer is run: Sometimes 2to3 will find a place in your source code that needs to be changed, but 2to3 cannot fix automatically.  In this case, 2to3 will print a warning beneath the diff for a file.  You should address the warning in order to have compliant 3.x code. The :mod:`lib2to3` API should be considered unstable and may change drastically in the future. The :option:`!--add-suffix` option specifies a string to append to all output filenames.  The :option:`!-n` flag is required when specifying this as backups are not necessary when writing to different filenames.  Example: The :option:`!--add-suffix` option was added. The :option:`!-W` flag was added. The :option:`!-W` or :option:`!--write-unchanged-files` flag tells 2to3 to always write output files even if no changes were required to the file.  This is most useful with :option:`!-o` so that an entire Python source tree is copied with translation from one directory to another. This option implies the :option:`!-w` flag as it would not make sense otherwise. The :option:`!-o` option was added. The :option:`!-o` or :option:`!--output-dir` option allows specification of an alternate directory for processed output files to be written to.  The :option:`!-n` flag is required when using this as backup files do not make sense when not overwriting the input files. The :option:`!-v` option enables output of more information on the translation process. This command runs every fixer except the ``apply`` fixer: This optional fixer performs several transformations that make Python code more idiomatic.  Type comparisons like ``type(x) is SomeClass`` and ``type(x) == SomeClass`` are converted to ``isinstance(x, SomeClass)``. ``while 1`` becomes ``while True``.  This fixer also tries to make use of :func:`sorted` in appropriate places.  For example, this block :: To To translate an entire project from one directory tree to another use: Using 2to3 Will cause a converted file named ``example.py3`` to be written. Wraps :func:`filter` usage in a :class:`list` call. Wraps :func:`map` in a :class:`list` call.  It also changes ``map(None, x)`` to ``list(x)``.  Using ``from future_builtins import map`` disables this fixer. Wraps :func:`zip` usage in a :class:`list` call.  This is disabled when ``from future_builtins import zip`` appears. ``assertAlmostEquals(a, b)`` ``assertEquals(a, b)`` ``assertNotAlmostEquals(a, b)`` ``assertNotEquals(a, b)`` ``assert_(a)`` ``failIf(a)`` ``failIfAlmostEqual(a, b)`` ``failIfEqual(a, b)`` ``failUnless(a)`` ``failUnlessAlmostEqual(a, b)`` ``failUnlessEqual(a, b)`` ``failUnlessRaises(exc, cal)`` ``hasattr(obj, '__call__')`` ``isinstance(obj, collections.Mapping)`` ``isinstance(obj, collections.Sequence)`` ``isinstance(obj, numbers.Number)`` ``operator.contains(obj)`` ``operator.imul(obj, n)`` ``operator.irepeat(obj, n)`` ``operator.isCallable(obj)`` ``operator.isMappingType(obj)`` ``operator.isNumberType(obj)`` ``operator.isSequenceType(obj)`` ``operator.mul(obj, n)`` ``operator.repeat(obj, n)`` ``operator.sequenceIncludes(obj)`` is changed to :: 