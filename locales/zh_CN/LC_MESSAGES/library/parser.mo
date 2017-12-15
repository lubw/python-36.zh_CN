��    2      �              <  +   =  l   i  (  �     �       �  )  %     D  6     {  �   �    6  �   U     #     8  �  L  �  �  �   �     ?  
   U  &   `  �   �  �   <  $   6     [     s  -   �  .   �  S  �  W  =    �    �  E  �  �  �  �  �!  �  `#  �   D%  �   �%  X   �&  �   '  �  (  t  �+  �   .    �.  m   �/    l0  ?   �1  a   �1  �  .2  �   �3  �  �4  +   ^6  l   �6  (  �6      9     69  �  J9  %   1>  D  W>     �@  �   �@    WA  �   vB     DC     YC  �  mC  �  H  �   �I     `J  
   vJ  &   �J  �   �J  �   ]K  $   WL     |L     �L  -   �L  .   �L  S  
M  W  ^N    �O    �P  E  �Q  �  S  �  �T  �  �V  �   eX  �   Y  X   �Y  �   2Z  �  ,[  t  �^  �   $a    b  m   c    �c  ?   �d  a   �d  �  Oe  �   �f   :mod:`parser` --- Access Python parse trees An application which needs both ST and code objects can package this code into readily available functions:: Compiling an ST object may result in exceptions related to compilation; an example would be a :exc:`SyntaxError` caused by the parse tree for ``del f(0)``: this statement is considered legal within the formal grammar for Python but is not a legal language construct.  The :exc:`SyntaxError` raised for this condition is actually generated by the Python byte-compiler normally, which is why it can be raised at this point by the :mod:`parser` module.  Most causes of compilation failure can be diagnosed programmatically by inspection of the parse tree. Converting ST Objects Creating ST Objects Each element of the sequences returned by :func:`st2list` or :func:`st2tuple` has a simple form.  Sequences representing non-terminal elements in the grammar always have a length greater than one.  The first element is an integer which identifies a production in the grammar.  These integers are given symbolic names in the C header file :file:`Include/graminit.h` and the Python module :mod:`symbol`.  Each additional element of the sequence represents a component of the production as recognized in the input string: these are always sequences which have the same form as the parent.  An important aspect of this structure which should be noted is that keywords used to identify the parent node type, such as the keyword :keyword:`if` in an :const:`if_stmt`, are included in the node tree without any special treatment.  For example, the :keyword:`if` keyword is represented by the tuple ``(1, 'if')``, where ``1`` is the numeric value associated with all :const:`NAME` tokens, including variable and function names defined by the user.  In an alternate form returned when line number information is requested, the same token might be represented as ``(1, 'if', 12)``, where the ``12`` represents the line number at which the terminal symbol was found. Example: Emulation of :func:`compile` Exception raised when a failure occurs within the parser module.  This is generally produced for validation failures rather than the built-in :exc:`SyntaxError` raised during normal parsing. The exception argument is either a string describing the reason of the failure or a tuple containing a sequence causing the failure from a parse tree passed to :func:`sequence2st` and an explanatory string.  Calls to :func:`sequence2st` need to be able to handle either type of exception, while calls to other functions in the module will only need to be aware of the simple string values. Exceptions and Error Handling From Python 2.5 onward, it's much more convenient to cut in at the Abstract Syntax Tree (AST) generation and compilation stage, using the :mod:`ast` module. If *line_info* is true, line number information will be included for all terminal tokens as a third element of the list representing the token.  Note that the line number provided specifies the line on which the token *ends*. This information is omitted if the flag is false or omitted. If *line_info* is true, line number information will be included for all terminal tokens as a third element of the list representing the token.  This information is omitted if the flag is false or omitted. Module :mod:`symbol` Module :mod:`token` Most importantly, a good understanding of the Python grammar processed by the internal parser is required.  For full information on the language syntax, refer to :ref:`reference-index`.  The parser itself is created from a grammar specification defined in the file :file:`Grammar/Grammar` in the standard Python distribution.  The parse trees stored in the ST objects created by this module are the actual output from the internal parser when created by the :func:`expr` or :func:`suite` functions, described below.  The ST objects created by :func:`sequence2st` faithfully simulate those structures.  Be aware that the values of the sequences which are considered "correct" will vary from one version of Python to another as the formal grammar for the language is revised.  However, transporting code from one Python version to another as source text will always allow correct parse trees to be created in the target version, with the only restriction being that migrating to an older version of the interpreter will not support more recent language constructs.  The parse trees are not typically compatible from one version to another, whereas source code has always been forward-compatible. Note that the functions :func:`compilest`, :func:`expr`, and :func:`suite` may raise exceptions which are normally raised by the parsing and compilation process.  These include the built in exceptions :exc:`MemoryError`, :exc:`OverflowError`, :exc:`SyntaxError`, and :exc:`SystemError`.  In these cases, these exceptions carry all the meaning normally associated with them. Refer to the descriptions of each function for detailed information. Ordered and equality comparisons are supported between ST objects. Pickling of ST objects (using the :mod:`pickle` module) is also supported. Queries on ST Objects ST Objects ST objects have the following methods: ST objects may be created from source code or from a parse tree. When creating an ST object from source, different functions are used to create the ``'eval'`` and ``'exec'`` forms. ST objects, regardless of the input used to create them, may be converted to parse trees represented as list- or tuple- trees, or may be compiled into executable code objects.  Parse trees may be extracted with or without line numbering information. Same as ``compilest(st, filename)``. Same as ``isexpr(st)``. Same as ``issuite(st)``. Same as ``st2list(st, line_info, col_info)``. Same as ``st2tuple(st, line_info, col_info)``. Sequences representing terminal tokens may be represented as either two-element lists of the form ``(1, 'name')`` or as three-element lists of the form ``(1, 'name', 56)``.  If the third element is present, it is assumed to be a valid line number.  The line number may be specified for any subset of the terminal symbols in the input tree. Terminal elements are represented in much the same way, but without any child elements and the addition of the source text which was identified.  The example of the :keyword:`if` keyword above is representative.  The various types of terminal symbols are defined in the C header file :file:`Include/token.h` and the Python module :mod:`token`. The :func:`expr` function parses the parameter *source* as if it were an input to ``compile(source, 'file.py', 'eval')``.  If the parse succeeds, an ST object is created to hold the internal parse tree representation, otherwise an appropriate exception is raised. The :func:`suite` function parses the parameter *source* as if it were an input to ``compile(source, 'file.py', 'exec')``.  If the parse succeeds, an ST object is created to hold the internal parse tree representation, otherwise an appropriate exception is raised. The :mod:`parser` module defines functions for a few distinct purposes.  The most important purposes are to create ST objects and to convert ST objects to other representations such as parse trees and compiled code objects, but there are also functions which serve to query the type of parse tree represented by an ST object. The :mod:`parser` module provides an interface to Python's internal parser and byte-code compiler.  The primary purpose for this interface is to allow Python code to edit the parse tree of a Python expression and create executable code from this.  This is better than trying to parse and modify an arbitrary Python code fragment as a string because parsing is performed in a manner identical to the code forming the application.  It is also faster. The Python byte compiler can be invoked on an ST object to produce code objects which can be used as part of a call to the built-in :func:`exec` or :func:`eval` functions. This function provides the interface to the compiler, passing the internal parse tree from *st* to the parser, using the source file name specified by the *filename* parameter. The default value supplied for *filename* indicates that the source was an ST object. The ST objects are not required to support the functionality of this module, but are provided for three purposes: to allow an application to amortize the cost of processing complex parse trees, to provide a parse tree representation which conserves memory space when compared to the Python list or tuple representation, and to ease the creation of additional modules in C which manipulate parse trees.  A simple "wrapper" class may be created in Python to hide the use of ST objects. The equivalent operation using the :mod:`parser` module is somewhat longer, and allows the intermediate internal parse tree to be retained as an ST object:: The parser module defines a single exception, but may also pass other built-in exceptions from other portions of the Python runtime environment.  See each function for information about the exceptions it can raise. The type of the objects returned by :func:`expr`, :func:`suite` and :func:`sequence2st`. There are a few things to note about this module which are important to making use of the data structures created.  This is not a tutorial on editing the parse trees for Python code, but some examples of using the :mod:`parser` module are presented. This function accepts a parse tree represented as a sequence and builds an internal representation if possible.  If it can validate that the tree conforms to the Python grammar and all nodes are valid node types in the host version of Python, an ST object is created from the internal representation and returned to the called.  If there is a problem creating the internal representation, or if the tree cannot be validated, a :exc:`ParserError` exception is raised.  An ST object created this way should not be assumed to compile correctly; normal exceptions raised by compilation may still be initiated when the ST object is passed to :func:`compilest`.  This may indicate problems not related to syntax (such as a :exc:`MemoryError` exception), but may also be due to constructs such as the result of parsing ``del f(0)``, which escapes the Python parser but is checked by the bytecode compiler. This function accepts an ST object from the caller in *st* and returns a Python list representing the equivalent parse tree.  The resulting list representation can be used for inspection or the creation of a new parse tree in list form.  This function does not fail so long as memory is available to build the list representation.  If the parse tree will only be used for inspection, :func:`st2tuple` should be used instead to reduce memory consumption and fragmentation.  When the list representation is required, this function is significantly faster than retrieving a tuple representation and converting that to nested lists. This function accepts an ST object from the caller in *st* and returns a Python tuple representing the equivalent parse tree.  Other than returning a tuple instead of a list, this function is identical to :func:`st2list`. This function mirrors :func:`isexpr` in that it reports whether an ST object represents an ``'exec'`` form, commonly known as a "suite."  It is not safe to assume that this function is equivalent to ``not isexpr(st)``, as additional syntactic fragments may be supported in the future. This is the same function as :func:`sequence2st`.  This entry point is maintained for backward compatibility. Two functions are provided which allow an application to determine if an ST was created as an expression or a suite.  Neither of these functions can be used to determine if an ST was created from source code via :func:`expr` or :func:`suite` or from a parse tree via :func:`sequence2st`. Useful constants representing internal nodes of the parse tree. Useful constants representing leaf nodes of the parse tree and functions for testing node values. When *st* represents an ``'eval'`` form, this function returns true, otherwise it returns false.  This is useful, since code objects normally cannot be queried for this information using existing built-in functions.  Note that the code objects created by :func:`compilest` cannot be queried like this either, and are identical to those created by the built-in :func:`compile` function. While many useful operations may take place between parsing and bytecode generation, the simplest operation is to do nothing.  For this purpose, using the :mod:`parser` module to produce an intermediate data structure is equivalent to the code :: Project-Id-Version: Python 3.6
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
 :mod:`parser` --- Access Python parse trees An application which needs both ST and code objects can package this code into readily available functions:: Compiling an ST object may result in exceptions related to compilation; an example would be a :exc:`SyntaxError` caused by the parse tree for ``del f(0)``: this statement is considered legal within the formal grammar for Python but is not a legal language construct.  The :exc:`SyntaxError` raised for this condition is actually generated by the Python byte-compiler normally, which is why it can be raised at this point by the :mod:`parser` module.  Most causes of compilation failure can be diagnosed programmatically by inspection of the parse tree. Converting ST Objects Creating ST Objects Each element of the sequences returned by :func:`st2list` or :func:`st2tuple` has a simple form.  Sequences representing non-terminal elements in the grammar always have a length greater than one.  The first element is an integer which identifies a production in the grammar.  These integers are given symbolic names in the C header file :file:`Include/graminit.h` and the Python module :mod:`symbol`.  Each additional element of the sequence represents a component of the production as recognized in the input string: these are always sequences which have the same form as the parent.  An important aspect of this structure which should be noted is that keywords used to identify the parent node type, such as the keyword :keyword:`if` in an :const:`if_stmt`, are included in the node tree without any special treatment.  For example, the :keyword:`if` keyword is represented by the tuple ``(1, 'if')``, where ``1`` is the numeric value associated with all :const:`NAME` tokens, including variable and function names defined by the user.  In an alternate form returned when line number information is requested, the same token might be represented as ``(1, 'if', 12)``, where the ``12`` represents the line number at which the terminal symbol was found. Example: Emulation of :func:`compile` Exception raised when a failure occurs within the parser module.  This is generally produced for validation failures rather than the built-in :exc:`SyntaxError` raised during normal parsing. The exception argument is either a string describing the reason of the failure or a tuple containing a sequence causing the failure from a parse tree passed to :func:`sequence2st` and an explanatory string.  Calls to :func:`sequence2st` need to be able to handle either type of exception, while calls to other functions in the module will only need to be aware of the simple string values. Exceptions and Error Handling From Python 2.5 onward, it's much more convenient to cut in at the Abstract Syntax Tree (AST) generation and compilation stage, using the :mod:`ast` module. If *line_info* is true, line number information will be included for all terminal tokens as a third element of the list representing the token.  Note that the line number provided specifies the line on which the token *ends*. This information is omitted if the flag is false or omitted. If *line_info* is true, line number information will be included for all terminal tokens as a third element of the list representing the token.  This information is omitted if the flag is false or omitted. Module :mod:`symbol` Module :mod:`token` Most importantly, a good understanding of the Python grammar processed by the internal parser is required.  For full information on the language syntax, refer to :ref:`reference-index`.  The parser itself is created from a grammar specification defined in the file :file:`Grammar/Grammar` in the standard Python distribution.  The parse trees stored in the ST objects created by this module are the actual output from the internal parser when created by the :func:`expr` or :func:`suite` functions, described below.  The ST objects created by :func:`sequence2st` faithfully simulate those structures.  Be aware that the values of the sequences which are considered "correct" will vary from one version of Python to another as the formal grammar for the language is revised.  However, transporting code from one Python version to another as source text will always allow correct parse trees to be created in the target version, with the only restriction being that migrating to an older version of the interpreter will not support more recent language constructs.  The parse trees are not typically compatible from one version to another, whereas source code has always been forward-compatible. Note that the functions :func:`compilest`, :func:`expr`, and :func:`suite` may raise exceptions which are normally raised by the parsing and compilation process.  These include the built in exceptions :exc:`MemoryError`, :exc:`OverflowError`, :exc:`SyntaxError`, and :exc:`SystemError`.  In these cases, these exceptions carry all the meaning normally associated with them. Refer to the descriptions of each function for detailed information. Ordered and equality comparisons are supported between ST objects. Pickling of ST objects (using the :mod:`pickle` module) is also supported. Queries on ST Objects ST Objects ST objects have the following methods: ST objects may be created from source code or from a parse tree. When creating an ST object from source, different functions are used to create the ``'eval'`` and ``'exec'`` forms. ST objects, regardless of the input used to create them, may be converted to parse trees represented as list- or tuple- trees, or may be compiled into executable code objects.  Parse trees may be extracted with or without line numbering information. Same as ``compilest(st, filename)``. Same as ``isexpr(st)``. Same as ``issuite(st)``. Same as ``st2list(st, line_info, col_info)``. Same as ``st2tuple(st, line_info, col_info)``. Sequences representing terminal tokens may be represented as either two-element lists of the form ``(1, 'name')`` or as three-element lists of the form ``(1, 'name', 56)``.  If the third element is present, it is assumed to be a valid line number.  The line number may be specified for any subset of the terminal symbols in the input tree. Terminal elements are represented in much the same way, but without any child elements and the addition of the source text which was identified.  The example of the :keyword:`if` keyword above is representative.  The various types of terminal symbols are defined in the C header file :file:`Include/token.h` and the Python module :mod:`token`. The :func:`expr` function parses the parameter *source* as if it were an input to ``compile(source, 'file.py', 'eval')``.  If the parse succeeds, an ST object is created to hold the internal parse tree representation, otherwise an appropriate exception is raised. The :func:`suite` function parses the parameter *source* as if it were an input to ``compile(source, 'file.py', 'exec')``.  If the parse succeeds, an ST object is created to hold the internal parse tree representation, otherwise an appropriate exception is raised. The :mod:`parser` module defines functions for a few distinct purposes.  The most important purposes are to create ST objects and to convert ST objects to other representations such as parse trees and compiled code objects, but there are also functions which serve to query the type of parse tree represented by an ST object. The :mod:`parser` module provides an interface to Python's internal parser and byte-code compiler.  The primary purpose for this interface is to allow Python code to edit the parse tree of a Python expression and create executable code from this.  This is better than trying to parse and modify an arbitrary Python code fragment as a string because parsing is performed in a manner identical to the code forming the application.  It is also faster. The Python byte compiler can be invoked on an ST object to produce code objects which can be used as part of a call to the built-in :func:`exec` or :func:`eval` functions. This function provides the interface to the compiler, passing the internal parse tree from *st* to the parser, using the source file name specified by the *filename* parameter. The default value supplied for *filename* indicates that the source was an ST object. The ST objects are not required to support the functionality of this module, but are provided for three purposes: to allow an application to amortize the cost of processing complex parse trees, to provide a parse tree representation which conserves memory space when compared to the Python list or tuple representation, and to ease the creation of additional modules in C which manipulate parse trees.  A simple "wrapper" class may be created in Python to hide the use of ST objects. The equivalent operation using the :mod:`parser` module is somewhat longer, and allows the intermediate internal parse tree to be retained as an ST object:: The parser module defines a single exception, but may also pass other built-in exceptions from other portions of the Python runtime environment.  See each function for information about the exceptions it can raise. The type of the objects returned by :func:`expr`, :func:`suite` and :func:`sequence2st`. There are a few things to note about this module which are important to making use of the data structures created.  This is not a tutorial on editing the parse trees for Python code, but some examples of using the :mod:`parser` module are presented. This function accepts a parse tree represented as a sequence and builds an internal representation if possible.  If it can validate that the tree conforms to the Python grammar and all nodes are valid node types in the host version of Python, an ST object is created from the internal representation and returned to the called.  If there is a problem creating the internal representation, or if the tree cannot be validated, a :exc:`ParserError` exception is raised.  An ST object created this way should not be assumed to compile correctly; normal exceptions raised by compilation may still be initiated when the ST object is passed to :func:`compilest`.  This may indicate problems not related to syntax (such as a :exc:`MemoryError` exception), but may also be due to constructs such as the result of parsing ``del f(0)``, which escapes the Python parser but is checked by the bytecode compiler. This function accepts an ST object from the caller in *st* and returns a Python list representing the equivalent parse tree.  The resulting list representation can be used for inspection or the creation of a new parse tree in list form.  This function does not fail so long as memory is available to build the list representation.  If the parse tree will only be used for inspection, :func:`st2tuple` should be used instead to reduce memory consumption and fragmentation.  When the list representation is required, this function is significantly faster than retrieving a tuple representation and converting that to nested lists. This function accepts an ST object from the caller in *st* and returns a Python tuple representing the equivalent parse tree.  Other than returning a tuple instead of a list, this function is identical to :func:`st2list`. This function mirrors :func:`isexpr` in that it reports whether an ST object represents an ``'exec'`` form, commonly known as a "suite."  It is not safe to assume that this function is equivalent to ``not isexpr(st)``, as additional syntactic fragments may be supported in the future. This is the same function as :func:`sequence2st`.  This entry point is maintained for backward compatibility. Two functions are provided which allow an application to determine if an ST was created as an expression or a suite.  Neither of these functions can be used to determine if an ST was created from source code via :func:`expr` or :func:`suite` or from a parse tree via :func:`sequence2st`. Useful constants representing internal nodes of the parse tree. Useful constants representing leaf nodes of the parse tree and functions for testing node values. When *st* represents an ``'eval'`` form, this function returns true, otherwise it returns false.  This is useful, since code objects normally cannot be queried for this information using existing built-in functions.  Note that the code objects created by :func:`compilest` cannot be queried like this either, and are identical to those created by the built-in :func:`compile` function. While many useful operations may take place between parsing and bytecode generation, the simplest operation is to do nothing.  For this purpose, using the :mod:`parser` module to produce an intermediate data structure is equivalent to the code :: 