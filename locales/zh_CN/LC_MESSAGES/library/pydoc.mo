��          �               <  '   =  ?   e  �   �  @  1     r  �  �  *  G  b  r    �  �   �  �   �	  +   b
  m  �
    �  �   
  w  �  ;  ^  �  �  '   Q  ?   y  �   �  @  E     �  �  �  *  [  b  �    �  �     �   �  +   v  m  �      �     w  �  ;  r!   **Source code:** :source:`Lib/pydoc.py` :mod:`pydoc` --- Documentation generator and online help system :mod:`pydoc` now uses :func:`inspect.signature` rather than :func:`inspect.getfullargspec` to extract signature information from callables. :program:`pydoc -b` will start the server and additionally open a web browser to a module index page.  Each served page has a navigation bar at the top where you can *Get* help on an individual item, *Search* all modules with a keyword in their synopsis line, and go to the *Module index*, *Topics* and *Keywords* pages. Added the ``-b`` option. For modules, classes, functions and methods, the displayed documentation is derived from the docstring (i.e. the :attr:`__doc__` attribute) of the object, and recursively of its documentable members.  If there is no docstring, :mod:`pydoc` tries to obtain a description from the block of comment lines just above the definition of the class, function or method in the source file, or at the top of the module (see :func:`inspect.getcomments`). In order to find objects and their documentation, :mod:`pydoc` imports the module(s) to be documented.  Therefore, any code on module level will be executed on that occasion.  Use an ``if __name__ == '__main__':`` guard to only execute code when a file is invoked as a script and not just imported. Module docs for core modules are assumed to reside in ``https://docs.python.org/X.Y/library/`` where ``X`` and ``Y`` are the major and minor version numbers of the Python interpreter.  This can be overridden by setting the :envvar:`PYTHONDOCS` environment variable to a different URL or to a local directory containing the Library Reference Manual pages. Specifying a ``-k`` flag before the argument will search the synopsis lines of all available modules for the keyword given as the argument, again in a manner similar to the Unix :program:`man` command.  The synopsis line of a module is the first line of its documentation string. Specifying a ``-w`` flag before the argument will cause HTML documentation to be written out to a file in the current directory, instead of displaying text on the console. The :mod:`pydoc` module automatically generates documentation from Python modules.  The documentation can be presented as pages of text on the console, served to a Web browser, or saved to HTML files. The ``-g`` command line option was removed. The built-in function :func:`help` invokes the online help system in the interactive interpreter, which uses :mod:`pydoc` to generate its documentation as text on the console.  The same text documentation can also be viewed from outside the Python interpreter by running :program:`pydoc` as a script at the operating system's command prompt. For example, running :: When :program:`pydoc` generates documentation, it uses the current environment and path to locate modules.  Thus, invoking :program:`pydoc spam` documents precisely the version of the module you would get if you started the Python interpreter and typed ``import spam``. When printing output to the console, :program:`pydoc` attempts to paginate the output for easier reading.  If the :envvar:`PAGER` environment variable is set, :program:`pydoc` will use its value as a pagination program. You can also use :program:`pydoc` to start an HTTP server on the local machine that will serve documentation to visiting Web browsers.  :program:`pydoc -p 1234` will start a HTTP server on port 1234, allowing you to browse the documentation at ``http://localhost:1234/`` in your preferred Web browser. Specifying ``0`` as the port number will select an arbitrary unused port. at a shell prompt will display documentation on the :mod:`sys` module, in a style similar to the manual pages shown by the Unix :program:`man` command.  The argument to :program:`pydoc` can be the name of a function, module, or package, or a dotted reference to a class, method, or function within a module or module in a package.  If the argument to :program:`pydoc` looks like a path (that is, it contains the path separator for your operating system, such as a slash in Unix), and refers to an existing Python source file, then documentation is produced for that file. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/pydoc.py` :mod:`pydoc` --- Documentation generator and online help system :mod:`pydoc` now uses :func:`inspect.signature` rather than :func:`inspect.getfullargspec` to extract signature information from callables. :program:`pydoc -b` will start the server and additionally open a web browser to a module index page.  Each served page has a navigation bar at the top where you can *Get* help on an individual item, *Search* all modules with a keyword in their synopsis line, and go to the *Module index*, *Topics* and *Keywords* pages. Added the ``-b`` option. For modules, classes, functions and methods, the displayed documentation is derived from the docstring (i.e. the :attr:`__doc__` attribute) of the object, and recursively of its documentable members.  If there is no docstring, :mod:`pydoc` tries to obtain a description from the block of comment lines just above the definition of the class, function or method in the source file, or at the top of the module (see :func:`inspect.getcomments`). In order to find objects and their documentation, :mod:`pydoc` imports the module(s) to be documented.  Therefore, any code on module level will be executed on that occasion.  Use an ``if __name__ == '__main__':`` guard to only execute code when a file is invoked as a script and not just imported. Module docs for core modules are assumed to reside in ``https://docs.python.org/X.Y/library/`` where ``X`` and ``Y`` are the major and minor version numbers of the Python interpreter.  This can be overridden by setting the :envvar:`PYTHONDOCS` environment variable to a different URL or to a local directory containing the Library Reference Manual pages. Specifying a ``-k`` flag before the argument will search the synopsis lines of all available modules for the keyword given as the argument, again in a manner similar to the Unix :program:`man` command.  The synopsis line of a module is the first line of its documentation string. Specifying a ``-w`` flag before the argument will cause HTML documentation to be written out to a file in the current directory, instead of displaying text on the console. The :mod:`pydoc` module automatically generates documentation from Python modules.  The documentation can be presented as pages of text on the console, served to a Web browser, or saved to HTML files. The ``-g`` command line option was removed. The built-in function :func:`help` invokes the online help system in the interactive interpreter, which uses :mod:`pydoc` to generate its documentation as text on the console.  The same text documentation can also be viewed from outside the Python interpreter by running :program:`pydoc` as a script at the operating system's command prompt. For example, running :: When :program:`pydoc` generates documentation, it uses the current environment and path to locate modules.  Thus, invoking :program:`pydoc spam` documents precisely the version of the module you would get if you started the Python interpreter and typed ``import spam``. When printing output to the console, :program:`pydoc` attempts to paginate the output for easier reading.  If the :envvar:`PAGER` environment variable is set, :program:`pydoc` will use its value as a pagination program. You can also use :program:`pydoc` to start an HTTP server on the local machine that will serve documentation to visiting Web browsers.  :program:`pydoc -p 1234` will start a HTTP server on port 1234, allowing you to browse the documentation at ``http://localhost:1234/`` in your preferred Web browser. Specifying ``0`` as the port number will select an arbitrary unused port. at a shell prompt will display documentation on the :mod:`sys` module, in a style similar to the manual pages shown by the Unix :program:`man` command.  The argument to :program:`pydoc` can be the name of a function, module, or package, or a dotted reference to a class, method, or function within a module or module in a package.  If the argument to :program:`pydoc` looks like a path (that is, it contains the path separator for your operating system, such as a slash in Unix), and refers to an existing Python source file, then documentation is produced for that file. 