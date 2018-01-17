��    m      �              �  �   �     �  ;     �   Y  3   +	  #   _	  1   �	  X   �	  l   
  k   {
  :   �
  n   "  _   �  S  �    E  F   Q  �   �  �   K     �  �   	  K   �  j  6  �   �  q   %  A  �  h   �  o  B  u  �     (  !   H     j  �   x  �     �   �  4  g  Y   �  �   �  �   �  �   �  �   5   �   �   /   Y!  �   �!  >   P"  }   �"  a  #  �   o$  �  d%  �   5(  V   �(     @)     V)  f   m)  -   �)  �   *  �   �*  A   +    a+    s-  l   {.  �   �.  G   ~/  �   �/  �  g0  �   52  [   �2  �  B3  .   �5  �   �5  x   �6  0  7  �   88  N   �8  6   9     U9  (   m9  �   �9  �   $:  '  ;  =   0<  ?   n<  ?   �<  S   �<  Z  B=  �   �@  +  �A  �   �B  6   �C  g   �C  �   GD  �   �D  T   �E  �   �E  �   �F  �   ZG  �   GH  S   �H  -   7I  4   eI  �   �I  �   lJ    �J  �   L      �L  .   M  .   FM  �   uM    N  �  -P  �   �Q     �R  ;   S  �   PS  3   "T  #   VT  1   zT  X   �T  l   U  k   rU  :   �U  n   V  _   �V  S  �V    <X  F   HY  �   �Y  �   BZ     �Z  �    [  K   �[  j  -\  �   �^  q   _  A  �_  h   �`  o  9a  u  �b     e  !   ?e     ae  �   oe  �   
f  �   �f  4  ^g  Y   �h  �   �h  �   �i  �   �j  �   ,k  �   �k  /   Pl  �   �l  >   Gm  }   �m  a  n  �   fo  �  [p  �   ,s  V   �s     7t     Mt  f   dt  -   �t  �   �t  �   ~u  A   v    Xv    jx  l   ry  �   �y  G   uz  �   �z  �  ^{  �   ,}  [   �}  �  9~  .   ƀ  �   ��  x   ��  0  ��  �   /�  N   ƃ  6   �     L�  (   d�  �   ��  �   �  '  ��  =   '�  ?   e�  ?   ��  S   �  Z  9�  �   ��  +  ��  �   ��  6   ��  g   ֎  �   >�  �   ҏ  T   ��  �   �  �   ��  �   Q�  �   >�  S   ړ  -   .�  4   \�  �   ��  �   c�    �  �   �      �  .   �  .   =�  �   l�    �   *blocked* is an iterable of module names that are replaced with ``None`` in the module cache during the import to ensure that attempts to import them raise :exc:`ImportError`. *fresh* is an iterable of additional module names that are also removed from the ``sys.modules`` cache before doing the import. :mod:`test.support` --- Utilities for the Python test suite :mod:`test.support` is not a public module.  It is documented here to help Python developers write tests.  The API of this module is subject to change without backwards compatibility concerns between releases. :mod:`test` --- Regression tests package for Python A basic boilerplate is often used:: A book by Kent Beck on writing tests before code. A context manager that creates a temporary directory at *path* and yields the directory. A context manager that temporarily changes the current working directory to *path* and yields the directory. A context manager that temporarily creates a new directory and changes the current working directory (CWD). A context manager that temporarily sets the process umask. A context manager used to try to prevent crash dialog popups on tests that are expected to crash a subprocess. A context managers that temporarily replaces the named stream with :class:`io.StringIO` object. A convenience wrapper for :func:`warnings.catch_warnings()` that makes it easier to test that a warning was correctly raised.  It is approximately equivalent to calling ``warnings.catch_warnings(record=True)`` with :meth:`warnings.simplefilter` set to ``always`` and with the option to automatically validate the results that are recorded. A decorator for running a function in a different locale, correctly resetting it after it has finished.  *catstr* is the locale category as a string (for example ``"LC_ALL"``).  The *locales* passed will be tried sequentially, and the first valid locale will be used. A decorator for running tests that require support for symbolic links. A decorator to conditionally mark tests with :func:`unittest.expectedFailure`. Any use of this decorator should have an associated comment identifying the relevant tracker issue. Add an explicit test for any bugs discovered for the tested code. This will make sure that the error does not crop up again if the code is changed in the future. Added dictionary interface. Additionally, if the :const:`~socket.SO_EXCLUSIVEADDRUSE` socket option is available (i.e. on Windows), it will be set on the socket.  This will prevent anyone else from binding to our host/port for the duration of the test. Assert that the ``__all__`` variable of *module* contains all public names. Bind the socket to a free port and return the port number.  Relies on ephemeral ports in order to ensure we are using an unbound port.  This is important as many tests may be running simultaneously, especially in a buildbot environment.  This method raises an exception if the ``sock.family`` is :const:`~socket.AF_INET` and ``sock.type`` is :const:`~socket.SOCK_STREAM`, and the socket has :const:`~socket.SO_REUSEADDR` or :const:`~socket.SO_REUSEPORT` set on it. Tests should never set these socket options for TCP/IP sockets. The only case for setting these options is testing multicasting via multiple UDP sockets. By default this skips private attributes beginning with '_' but includes all magic methods, i.e. those starting and ending in '__'. Class used to record warnings for unit tests. See documentation of :func:`check_warnings` above for more details. Class used to temporarily set or unset environment variables.  Instances can be used as a context manager and have a complete dictionary interface for querying/modifying the underlying ``os.environ``. After exit from the context manager all changes to environment variables done through this instance will be rolled back. Create an invalid file descriptor by opening and closing a temporary file, and returning its descriptor. Each module in the :mod:`test` package whose name starts with ``test_`` is a testing suite for a specific module or feature. All new tests should be written using the :mod:`unittest` or :mod:`doctest` module.  Some older tests are written using a "traditional" testing style that compares output printed to ``sys.stdout``; this style of test is considered deprecated. Either this method or :func:`bind_port` should be used for any tests where a server socket needs to be bound to a particular port for the duration of the test. Which one to use depends on whether the calling code is creating a python socket, or if an unused port needs to be provided in a constructor or passed to an external program (i.e. the ``-accept`` argument to openssl's s_server mode).  Always prefer :func:`bind_port` over :func:`find_unused_port` where possible.  Using a hard coded port is discouraged since it can make multiple instances of the test impossible to run simultaneously, which is a problem for buildbots. Example use with input stream:: Example use with output streams:: Example use:: Exception to be raised when a test fails. This is deprecated in favor of :mod:`unittest`\ -based tests and :class:`unittest.TestCase`'s assertion methods. Execute :class:`unittest.TestCase` subclasses passed to the function. The function scans the classes for methods starting with the prefix ``test_`` and executes the tests individually. Exhaust as many code paths as possible. Test where branching occurs and thus tailor input to make sure as many different paths through the code are taken. Generic implementation of the :mod:`unittest` ``load_tests`` protocol for use in test packages.  *pkg_dir* is the root directory of the package; *loader*, *standard_tests*, and *pattern* are the arguments expected by ``load_tests``.  In simple cases, the test package's ``__init__.py`` can be the following:: Here all warnings will be caught, and the test code tests the captured warnings directly. If *path* is ``None``, the temporary directory is created using :func:`tempfile.mkdtemp`.  If *quiet* is ``False``, the context manager raises an exception on error.  Otherwise, if *path* is specified and cannot be created, only a warning is issued. If *quiet* is ``False`` and it is not possible to create or change the CWD, an error is raised.  Otherwise, only a warning is raised and the original CWD is used. If *quiet* is ``False``, the context manager raises an exception on error.  Otherwise, it issues only a warning and keeps the current working directory the same. If *verbosity* is ``None``, :func:`doctest.testmod` is run with verbosity set to :data:`verbose`.  Otherwise, it is run with verbosity set to ``None``. If a test is dependent on a specific condition of the operating system then verify the condition already exists before attempting the test. If no arguments are specified, it defaults to:: Import as few modules as possible and do it as soon as possible. This minimizes external dependencies of tests and also minimizes possible anomalous behavior from side-effects of importing a module. In this case all warnings are caught and no errors are raised. In this case if either warning was not raised, or some other warning was raised, :func:`check_warnings` would raise an error. Instances are a context manager that raises :exc:`ResourceDenied` if the specified exception type is raised.  Any keyword arguments are treated as attribute/value pairs to be compared against any exception raised within the :keyword:`with` statement.  Only if all pairs match properly against attributes on the exception is :exc:`ResourceDenied` raised. It is also legal to pass strings as parameters; these should be keys in ``sys.modules``. Each associated module will be scanned by ``unittest.TestLoader.loadTestsFromModule()``. This is usually seen in the following :func:`test_main` function:: It is preferred that tests that use the :mod:`unittest` module follow a few guidelines. One is to name the test module by starting it with ``test_`` and end it with the name of the module being tested. The test methods in the test module should start with ``test_`` and end with a description of what the method is testing. This is needed so that the methods are recognized by the test driver as test methods. Also, no documentation string for the method should be included. A comment (such as ``# Tests function returns only True or False``) should be used to provide documentation for test methods. This is done because documentation strings get printed out if they exist and thus what test is being run is not stated. Make sure all possible values are tested including invalid ones. This makes sure that not only all valid values are acceptable but also that improper values are handled correctly. Make sure to clean up after your tests (such as close and remove all temporary files). Module :mod:`doctest` Module :mod:`unittest` Module and package deprecation messages are suppressed during this import if *deprecated* is ``True``. New optional arguments *filters* and *quiet*. On UNIX, :func:`resource.setrlimit` is used to set :attr:`resource.RLIMIT_CORE`'s soft limit to 0 to prevent coredump file creation. On Windows, it disables Windows Error Reporting dialogs using `SetErrorMode <https://msdn.microsoft.com/en-us/library/windows/desktop/ms680621.aspx>`_. On both platforms, the old value is restored by :meth:`__exit__`. On entry to the context manager, a :class:`WarningRecorder` instance is returned. The underlying warnings list from :func:`~warnings.catch_warnings` is available via the recorder object's :attr:`warnings` attribute.  As a convenience, the attributes of the object representing the most recent warning can also be accessed directly through the recorder object (see example below).  If no warning has been raised, then any of the attributes that would otherwise be expected on an object representing a warning will return ``None``. Raise :exc:`ResourceDenied` if *resource* is not available. *msg* is the argument to :exc:`ResourceDenied` if it is raised. Always returns ``True`` if called by a function whose ``__name__`` is ``'__main__'``. Used when tests are executed by :mod:`test.regrtest`. Remove the module named *module_name* from ``sys.modules`` and delete any byte-compiled files of the module. Return ``True`` if *resource* is enabled and available. The list of available resources is only set when :mod:`test.regrtest` is executing the tests. Return ``True`` if the OS supports symbolic links, ``False`` otherwise. Return the path to the file named *filename*. If no match is found *filename* is returned. This does not equal a failure since it could be the path to the file. Returns an unused port that should be suitable for binding.  This is achieved by creating a temporary socket with the same family and type as the ``sock`` parameter (default is :const:`~socket.AF_INET`, :const:`~socket.SOCK_STREAM`), and binding it to the specified host address (defaults to ``0.0.0.0``) with the port set to 0, eliciting an unused ephemeral port from the OS. The temporary socket is then closed and deleted, and the ephemeral port is returned. Returns the set of attributes, functions or methods of *ref_api* not found on *other_api*, except for a defined list of items to be ignored in this check specified in *ignore*. Run :func:`doctest.testmod` on the given *module*.  Return ``(failure_count, test_count)``. Running :mod:`test` directly allows what resources are available for tests to use to be set. You do this by using the ``-u`` command-line option. Specifying ``all`` as the value for the ``-u`` option enables all possible resources: :program:`python -m test -uall`. If all but one resource is desired (a more common case), a comma-separated list of resources that are not desired may be listed after ``all``. The command :program:`python -m test -uall,-audio,-largefile` will run :mod:`test` with all resources except the ``audio`` and ``largefile`` resources. For a list of all resources and more command-line options, run :program:`python -m test -h`. Running tests using the command-line interface Set to a name that is safe to use as the name of a temporary file.  Any temporary file that is created should be closed and unlinked (removed). Setting *subdir* indicates a relative path to use to find the file rather than looking directly in the path directories. Some other ways to execute the regression tests depend on what platform the tests are being executed on. On Unix, you can run :program:`make test` at the top-level directory where Python was built. On Windows, executing :program:`rt.bat` from your :file:`PCBuild` directory will run all regression tests. Subclass of :exc:`unittest.SkipTest`. Raised when a resource (such as a network connection) is not available. Raised by the :func:`requires` function. Temporarily set the environment variable ``envvar`` to the value of ``value``. Temporarily unset the environment variable ``envvar``. Test Driven Development Tests embedded in documentation strings. The *blacklist* argument can be a set of names that must not be treated as part of the public API even though their names indicate otherwise. The *extra* argument can be a set of names that wouldn't otherwise be automatically detected as "public", like objects without a proper ``__module__`` attribute. If provided, it will be added to the automatically detected ones. The *name_of_module* argument can specify (as a string or tuple thereof) what module(s) an API could be defined in in order to be detected as a public API. One case for this is when *module* imports part of its public API from other modules, possibly a C backend (like ``csv`` and its ``_csv``). The :mod:`test.support` module defines the following classes: The :mod:`test.support` module defines the following constants: The :mod:`test.support` module defines the following functions: The :mod:`test.support` module provides support for Python's regression test suite. The :mod:`test` package can be run as a script to drive Python's regression test suite, thanks to the :option:`-m` option: :program:`python -m test`. Under the hood, it uses :mod:`test.regrtest`; the call :program:`python -m test.regrtest` used in previous Python versions still works.  Running the script by itself automatically starts running all regression tests in the :mod:`test` package. It does this by finding all modules in the package whose name starts with ``test_``, importing them, and executing the function :func:`test_main` if present or loading the tests via unittest.TestLoader.loadTestsFromModule if ``test_main`` does not exist.  The names of tests to execute may also be passed to the script. Specifying a single regression test (:program:`python -m test test_spam`) will minimize output and only print whether the test passed or failed. The :mod:`test` package contains all regression tests for Python as well as the modules :mod:`test.support` and :mod:`test.regrtest`. :mod:`test.support` is used to enhance your tests while :mod:`test.regrtest` drives the testing suite. The :mod:`test` package is meant for internal use by Python only. It is documented for the benefit of the core developers of Python. Any use of this package outside of Python's standard library is discouraged as code mentioned here can change or be removed without notice between releases of Python. The context manager creates a temporary directory in the current directory with name *name* before temporarily changing the current working directory.  If *name* is ``None``, the temporary directory is created using :func:`tempfile.mkdtemp`. The context manager is designed to be used like this:: The goal for regression testing is to try to break code. This leads to a few guidelines to be followed: The module's public names (its API) are detected automatically based on whether they match the public name convention and were defined in *module*. The named module and any modules named in the *fresh* and *blocked* parameters are saved before starting the import and then reinserted into ``sys.modules`` when the fresh import is complete. The recorder object also has a :meth:`reset` method, which clears the warnings list. The testing suite should exercise all classes, functions, and constants. This includes not just the external API that is to be presented to the outside world but also "private" code. This code pattern allows the testing suite to be run by :mod:`test.regrtest`, on its own as a script that supports the :mod:`unittest` CLI, or via the ``python -m unittest`` CLI. This function imports and returns a fresh copy of the named Python module by removing the named module from ``sys.modules`` before doing the import. Note that unlike :func:`reload`, the original module is not affected by this operation. This function imports and returns the named module. Unlike a normal import, this function raises :exc:`unittest.SkipTest` if the module cannot be imported. This function will raise :exc:`ImportError` if the named module cannot be imported. This module defines the following exceptions: This will run all tests defined in the named module. Try to maximize code reuse. On occasion, tests will vary by something as small as what type of input is used. Minimize code duplication by subclassing a basic test class with a class that specifies the input:: When a test needs to look more deeply into the warnings, rather than just checking whether or not they occurred, code like this can be used:: When using this pattern, remember that all classes that inherit from :class:`unittest.TestCase` are run as tests.  The :class:`Mixin` class in the example above does not have any data and so can't be run by itself, thus it does not inherit from :class:`unittest.TestCase`. Whitebox testing (examining the code being tested when the tests are being written) is preferred. Blackbox testing (testing only the published user interface) is not complete enough to make sure all boundary and edge cases are tested. Writing PyUnit regression tests. Writing Unit Tests for the :mod:`test` package ``True`` if the running interpreter is Jython. ``True`` when verbose output is enabled. Should be checked when more detailed information is desired about a running test. *verbose* is set by :mod:`test.regrtest`. ``check_warnings`` accepts 2-tuples of the form ``("message regexp", WarningCategory)`` as positional arguments. If one or more *filters* are provided, or if the optional keyword argument *quiet* is ``False``, it checks to make sure the warnings are as expected:  each specified filter must match at least one of the warnings raised by the enclosed code or the test fails, and if any warnings are raised that do not match any of the specified filters the test fails.  To disable the first of these checks, set *quiet* to ``True``. Project-Id-Version: Python 3.6
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
 *blocked* is an iterable of module names that are replaced with ``None`` in the module cache during the import to ensure that attempts to import them raise :exc:`ImportError`. *fresh* is an iterable of additional module names that are also removed from the ``sys.modules`` cache before doing the import. :mod:`test.support` --- Utilities for the Python test suite :mod:`test.support` is not a public module.  It is documented here to help Python developers write tests.  The API of this module is subject to change without backwards compatibility concerns between releases. :mod:`test` --- Regression tests package for Python A basic boilerplate is often used:: A book by Kent Beck on writing tests before code. A context manager that creates a temporary directory at *path* and yields the directory. A context manager that temporarily changes the current working directory to *path* and yields the directory. A context manager that temporarily creates a new directory and changes the current working directory (CWD). A context manager that temporarily sets the process umask. A context manager used to try to prevent crash dialog popups on tests that are expected to crash a subprocess. A context managers that temporarily replaces the named stream with :class:`io.StringIO` object. A convenience wrapper for :func:`warnings.catch_warnings()` that makes it easier to test that a warning was correctly raised.  It is approximately equivalent to calling ``warnings.catch_warnings(record=True)`` with :meth:`warnings.simplefilter` set to ``always`` and with the option to automatically validate the results that are recorded. A decorator for running a function in a different locale, correctly resetting it after it has finished.  *catstr* is the locale category as a string (for example ``"LC_ALL"``).  The *locales* passed will be tried sequentially, and the first valid locale will be used. A decorator for running tests that require support for symbolic links. A decorator to conditionally mark tests with :func:`unittest.expectedFailure`. Any use of this decorator should have an associated comment identifying the relevant tracker issue. Add an explicit test for any bugs discovered for the tested code. This will make sure that the error does not crop up again if the code is changed in the future. Added dictionary interface. Additionally, if the :const:`~socket.SO_EXCLUSIVEADDRUSE` socket option is available (i.e. on Windows), it will be set on the socket.  This will prevent anyone else from binding to our host/port for the duration of the test. Assert that the ``__all__`` variable of *module* contains all public names. Bind the socket to a free port and return the port number.  Relies on ephemeral ports in order to ensure we are using an unbound port.  This is important as many tests may be running simultaneously, especially in a buildbot environment.  This method raises an exception if the ``sock.family`` is :const:`~socket.AF_INET` and ``sock.type`` is :const:`~socket.SOCK_STREAM`, and the socket has :const:`~socket.SO_REUSEADDR` or :const:`~socket.SO_REUSEPORT` set on it. Tests should never set these socket options for TCP/IP sockets. The only case for setting these options is testing multicasting via multiple UDP sockets. By default this skips private attributes beginning with '_' but includes all magic methods, i.e. those starting and ending in '__'. Class used to record warnings for unit tests. See documentation of :func:`check_warnings` above for more details. Class used to temporarily set or unset environment variables.  Instances can be used as a context manager and have a complete dictionary interface for querying/modifying the underlying ``os.environ``. After exit from the context manager all changes to environment variables done through this instance will be rolled back. Create an invalid file descriptor by opening and closing a temporary file, and returning its descriptor. Each module in the :mod:`test` package whose name starts with ``test_`` is a testing suite for a specific module or feature. All new tests should be written using the :mod:`unittest` or :mod:`doctest` module.  Some older tests are written using a "traditional" testing style that compares output printed to ``sys.stdout``; this style of test is considered deprecated. Either this method or :func:`bind_port` should be used for any tests where a server socket needs to be bound to a particular port for the duration of the test. Which one to use depends on whether the calling code is creating a python socket, or if an unused port needs to be provided in a constructor or passed to an external program (i.e. the ``-accept`` argument to openssl's s_server mode).  Always prefer :func:`bind_port` over :func:`find_unused_port` where possible.  Using a hard coded port is discouraged since it can make multiple instances of the test impossible to run simultaneously, which is a problem for buildbots. Example use with input stream:: Example use with output streams:: Example use:: Exception to be raised when a test fails. This is deprecated in favor of :mod:`unittest`\ -based tests and :class:`unittest.TestCase`'s assertion methods. Execute :class:`unittest.TestCase` subclasses passed to the function. The function scans the classes for methods starting with the prefix ``test_`` and executes the tests individually. Exhaust as many code paths as possible. Test where branching occurs and thus tailor input to make sure as many different paths through the code are taken. Generic implementation of the :mod:`unittest` ``load_tests`` protocol for use in test packages.  *pkg_dir* is the root directory of the package; *loader*, *standard_tests*, and *pattern* are the arguments expected by ``load_tests``.  In simple cases, the test package's ``__init__.py`` can be the following:: Here all warnings will be caught, and the test code tests the captured warnings directly. If *path* is ``None``, the temporary directory is created using :func:`tempfile.mkdtemp`.  If *quiet* is ``False``, the context manager raises an exception on error.  Otherwise, if *path* is specified and cannot be created, only a warning is issued. If *quiet* is ``False`` and it is not possible to create or change the CWD, an error is raised.  Otherwise, only a warning is raised and the original CWD is used. If *quiet* is ``False``, the context manager raises an exception on error.  Otherwise, it issues only a warning and keeps the current working directory the same. If *verbosity* is ``None``, :func:`doctest.testmod` is run with verbosity set to :data:`verbose`.  Otherwise, it is run with verbosity set to ``None``. If a test is dependent on a specific condition of the operating system then verify the condition already exists before attempting the test. If no arguments are specified, it defaults to:: Import as few modules as possible and do it as soon as possible. This minimizes external dependencies of tests and also minimizes possible anomalous behavior from side-effects of importing a module. In this case all warnings are caught and no errors are raised. In this case if either warning was not raised, or some other warning was raised, :func:`check_warnings` would raise an error. Instances are a context manager that raises :exc:`ResourceDenied` if the specified exception type is raised.  Any keyword arguments are treated as attribute/value pairs to be compared against any exception raised within the :keyword:`with` statement.  Only if all pairs match properly against attributes on the exception is :exc:`ResourceDenied` raised. It is also legal to pass strings as parameters; these should be keys in ``sys.modules``. Each associated module will be scanned by ``unittest.TestLoader.loadTestsFromModule()``. This is usually seen in the following :func:`test_main` function:: It is preferred that tests that use the :mod:`unittest` module follow a few guidelines. One is to name the test module by starting it with ``test_`` and end it with the name of the module being tested. The test methods in the test module should start with ``test_`` and end with a description of what the method is testing. This is needed so that the methods are recognized by the test driver as test methods. Also, no documentation string for the method should be included. A comment (such as ``# Tests function returns only True or False``) should be used to provide documentation for test methods. This is done because documentation strings get printed out if they exist and thus what test is being run is not stated. Make sure all possible values are tested including invalid ones. This makes sure that not only all valid values are acceptable but also that improper values are handled correctly. Make sure to clean up after your tests (such as close and remove all temporary files). Module :mod:`doctest` Module :mod:`unittest` Module and package deprecation messages are suppressed during this import if *deprecated* is ``True``. New optional arguments *filters* and *quiet*. On UNIX, :func:`resource.setrlimit` is used to set :attr:`resource.RLIMIT_CORE`'s soft limit to 0 to prevent coredump file creation. On Windows, it disables Windows Error Reporting dialogs using `SetErrorMode <https://msdn.microsoft.com/en-us/library/windows/desktop/ms680621.aspx>`_. On both platforms, the old value is restored by :meth:`__exit__`. On entry to the context manager, a :class:`WarningRecorder` instance is returned. The underlying warnings list from :func:`~warnings.catch_warnings` is available via the recorder object's :attr:`warnings` attribute.  As a convenience, the attributes of the object representing the most recent warning can also be accessed directly through the recorder object (see example below).  If no warning has been raised, then any of the attributes that would otherwise be expected on an object representing a warning will return ``None``. Raise :exc:`ResourceDenied` if *resource* is not available. *msg* is the argument to :exc:`ResourceDenied` if it is raised. Always returns ``True`` if called by a function whose ``__name__`` is ``'__main__'``. Used when tests are executed by :mod:`test.regrtest`. Remove the module named *module_name* from ``sys.modules`` and delete any byte-compiled files of the module. Return ``True`` if *resource* is enabled and available. The list of available resources is only set when :mod:`test.regrtest` is executing the tests. Return ``True`` if the OS supports symbolic links, ``False`` otherwise. Return the path to the file named *filename*. If no match is found *filename* is returned. This does not equal a failure since it could be the path to the file. Returns an unused port that should be suitable for binding.  This is achieved by creating a temporary socket with the same family and type as the ``sock`` parameter (default is :const:`~socket.AF_INET`, :const:`~socket.SOCK_STREAM`), and binding it to the specified host address (defaults to ``0.0.0.0``) with the port set to 0, eliciting an unused ephemeral port from the OS. The temporary socket is then closed and deleted, and the ephemeral port is returned. Returns the set of attributes, functions or methods of *ref_api* not found on *other_api*, except for a defined list of items to be ignored in this check specified in *ignore*. Run :func:`doctest.testmod` on the given *module*.  Return ``(failure_count, test_count)``. Running :mod:`test` directly allows what resources are available for tests to use to be set. You do this by using the ``-u`` command-line option. Specifying ``all`` as the value for the ``-u`` option enables all possible resources: :program:`python -m test -uall`. If all but one resource is desired (a more common case), a comma-separated list of resources that are not desired may be listed after ``all``. The command :program:`python -m test -uall,-audio,-largefile` will run :mod:`test` with all resources except the ``audio`` and ``largefile`` resources. For a list of all resources and more command-line options, run :program:`python -m test -h`. Running tests using the command-line interface Set to a name that is safe to use as the name of a temporary file.  Any temporary file that is created should be closed and unlinked (removed). Setting *subdir* indicates a relative path to use to find the file rather than looking directly in the path directories. Some other ways to execute the regression tests depend on what platform the tests are being executed on. On Unix, you can run :program:`make test` at the top-level directory where Python was built. On Windows, executing :program:`rt.bat` from your :file:`PCBuild` directory will run all regression tests. Subclass of :exc:`unittest.SkipTest`. Raised when a resource (such as a network connection) is not available. Raised by the :func:`requires` function. Temporarily set the environment variable ``envvar`` to the value of ``value``. Temporarily unset the environment variable ``envvar``. Test Driven Development Tests embedded in documentation strings. The *blacklist* argument can be a set of names that must not be treated as part of the public API even though their names indicate otherwise. The *extra* argument can be a set of names that wouldn't otherwise be automatically detected as "public", like objects without a proper ``__module__`` attribute. If provided, it will be added to the automatically detected ones. The *name_of_module* argument can specify (as a string or tuple thereof) what module(s) an API could be defined in in order to be detected as a public API. One case for this is when *module* imports part of its public API from other modules, possibly a C backend (like ``csv`` and its ``_csv``). The :mod:`test.support` module defines the following classes: The :mod:`test.support` module defines the following constants: The :mod:`test.support` module defines the following functions: The :mod:`test.support` module provides support for Python's regression test suite. The :mod:`test` package can be run as a script to drive Python's regression test suite, thanks to the :option:`-m` option: :program:`python -m test`. Under the hood, it uses :mod:`test.regrtest`; the call :program:`python -m test.regrtest` used in previous Python versions still works.  Running the script by itself automatically starts running all regression tests in the :mod:`test` package. It does this by finding all modules in the package whose name starts with ``test_``, importing them, and executing the function :func:`test_main` if present or loading the tests via unittest.TestLoader.loadTestsFromModule if ``test_main`` does not exist.  The names of tests to execute may also be passed to the script. Specifying a single regression test (:program:`python -m test test_spam`) will minimize output and only print whether the test passed or failed. The :mod:`test` package contains all regression tests for Python as well as the modules :mod:`test.support` and :mod:`test.regrtest`. :mod:`test.support` is used to enhance your tests while :mod:`test.regrtest` drives the testing suite. The :mod:`test` package is meant for internal use by Python only. It is documented for the benefit of the core developers of Python. Any use of this package outside of Python's standard library is discouraged as code mentioned here can change or be removed without notice between releases of Python. The context manager creates a temporary directory in the current directory with name *name* before temporarily changing the current working directory.  If *name* is ``None``, the temporary directory is created using :func:`tempfile.mkdtemp`. The context manager is designed to be used like this:: The goal for regression testing is to try to break code. This leads to a few guidelines to be followed: The module's public names (its API) are detected automatically based on whether they match the public name convention and were defined in *module*. The named module and any modules named in the *fresh* and *blocked* parameters are saved before starting the import and then reinserted into ``sys.modules`` when the fresh import is complete. The recorder object also has a :meth:`reset` method, which clears the warnings list. The testing suite should exercise all classes, functions, and constants. This includes not just the external API that is to be presented to the outside world but also "private" code. This code pattern allows the testing suite to be run by :mod:`test.regrtest`, on its own as a script that supports the :mod:`unittest` CLI, or via the ``python -m unittest`` CLI. This function imports and returns a fresh copy of the named Python module by removing the named module from ``sys.modules`` before doing the import. Note that unlike :func:`reload`, the original module is not affected by this operation. This function imports and returns the named module. Unlike a normal import, this function raises :exc:`unittest.SkipTest` if the module cannot be imported. This function will raise :exc:`ImportError` if the named module cannot be imported. This module defines the following exceptions: This will run all tests defined in the named module. Try to maximize code reuse. On occasion, tests will vary by something as small as what type of input is used. Minimize code duplication by subclassing a basic test class with a class that specifies the input:: When a test needs to look more deeply into the warnings, rather than just checking whether or not they occurred, code like this can be used:: When using this pattern, remember that all classes that inherit from :class:`unittest.TestCase` are run as tests.  The :class:`Mixin` class in the example above does not have any data and so can't be run by itself, thus it does not inherit from :class:`unittest.TestCase`. Whitebox testing (examining the code being tested when the tests are being written) is preferred. Blackbox testing (testing only the published user interface) is not complete enough to make sure all boundary and edge cases are tested. Writing PyUnit regression tests. Writing Unit Tests for the :mod:`test` package ``True`` if the running interpreter is Jython. ``True`` when verbose output is enabled. Should be checked when more detailed information is desired about a running test. *verbose* is set by :mod:`test.regrtest`. ``check_warnings`` accepts 2-tuples of the form ``("message regexp", WarningCategory)`` as positional arguments. If one or more *filters* are provided, or if the optional keyword argument *quiet* is ``False``, it checks to make sure the warnings are as expected:  each specified filter must match at least one of the warnings raised by the enclosed code or the test fails, and if any warnings are raised that do not match any of the specified filters the test fails.  To disable the first of these checks, set *quiet* to ``True``. 