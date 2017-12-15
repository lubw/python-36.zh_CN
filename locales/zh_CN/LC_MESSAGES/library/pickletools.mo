��          �               <  -   =  2   k  3   �     �     �  B   �  2   =  n  p     �  d  �  �   [     (  9   A  �  {  �  	  [   �
  L   /  �  |  -   3  2   a  3   �     �     �  B   �  2   3  n  f     �  d  �  �   Q       9   7  �  q  �    [   �  L   %   **Source code:** :source:`Lib/pickletools.py` :mod:`pickletools` --- Tools for pickle developers Annotate each line with a short opcode description. Command line options Command line usage For example, with a tuple ``(1, 2)`` pickled in file ``x.pickle``: Name of a file where the output should be written. Outputs a symbolic disassembly of the pickle to the file-like object *out*, defaulting to ``sys.stdout``.  *pickle* can be a string or a file-like object.  *memo* can be a Python dictionary that will be used as the pickle's memo; it can be used to perform disassemblies across multiple pickles created by the same pickler. Successive levels, indicated by ``MARK`` opcodes in the stream, are indented by *indentlevel* spaces.  If a nonzero value is given to *annotate*, each opcode in the output is annotated with a short description.  The value of *annotate* is used as a hint for the column where annotation should start. Programmatic Interface Provides an :term:`iterator` over all of the opcodes in a pickle, returning a sequence of ``(opcode, arg, pos)`` triples.  *opcode* is an instance of an :class:`OpcodeInfo` class; *arg* is the decoded value, as a Python object, of the opcode's argument; *pos* is the position at which this opcode is located. *pickle* can be a string or a file-like object. Returns a new equivalent pickle string after eliminating unused ``PUT`` opcodes. The optimized pickle is shorter, takes less transmission time, requires less storage space, and unpickles more efficiently. The *annotate* argument. The number of blanks by which to indent a new MARK level. This module contains various constants relating to the intimate details of the :mod:`pickle` module, some lengthy comments about the implementation, and a few useful functions for analyzing pickled data.  The contents of this module are useful for Python core developers who are working on the :mod:`pickle`; ordinary users of the :mod:`pickle` module probably won't find the :mod:`pickletools` module relevant. When invoked from the command line, ``python -m pickletools`` will disassemble the contents of one or more pickle files.  Note that if you want to see the Python object stored in the pickle rather than the details of pickle format, you may want to use ``-m pickle`` instead. However, when the pickle file that you want to examine comes from an untrusted source, ``-m pickletools`` is a safer option because it does not execute pickle bytecode. When more than one pickle file are specified, print given preamble before each disassembly. When multiple objects are disassembled, preserve memo between disassemblies. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/pickletools.py` :mod:`pickletools` --- Tools for pickle developers Annotate each line with a short opcode description. Command line options Command line usage For example, with a tuple ``(1, 2)`` pickled in file ``x.pickle``: Name of a file where the output should be written. Outputs a symbolic disassembly of the pickle to the file-like object *out*, defaulting to ``sys.stdout``.  *pickle* can be a string or a file-like object.  *memo* can be a Python dictionary that will be used as the pickle's memo; it can be used to perform disassemblies across multiple pickles created by the same pickler. Successive levels, indicated by ``MARK`` opcodes in the stream, are indented by *indentlevel* spaces.  If a nonzero value is given to *annotate*, each opcode in the output is annotated with a short description.  The value of *annotate* is used as a hint for the column where annotation should start. Programmatic Interface Provides an :term:`iterator` over all of the opcodes in a pickle, returning a sequence of ``(opcode, arg, pos)`` triples.  *opcode* is an instance of an :class:`OpcodeInfo` class; *arg* is the decoded value, as a Python object, of the opcode's argument; *pos* is the position at which this opcode is located. *pickle* can be a string or a file-like object. Returns a new equivalent pickle string after eliminating unused ``PUT`` opcodes. The optimized pickle is shorter, takes less transmission time, requires less storage space, and unpickles more efficiently. The *annotate* argument. The number of blanks by which to indent a new MARK level. This module contains various constants relating to the intimate details of the :mod:`pickle` module, some lengthy comments about the implementation, and a few useful functions for analyzing pickled data.  The contents of this module are useful for Python core developers who are working on the :mod:`pickle`; ordinary users of the :mod:`pickle` module probably won't find the :mod:`pickletools` module relevant. When invoked from the command line, ``python -m pickletools`` will disassemble the contents of one or more pickle files.  Note that if you want to see the Python object stored in the pickle rather than the details of pickle format, you may want to use ``-m pickle`` instead. However, when the pickle file that you want to examine comes from an untrusted source, ``-m pickletools`` is a safer option because it does not execute pickle bytecode. When more than one pickle file are specified, print given preamble before each disassembly. When multiple objects are disassembled, preserve memo between disassemblies. 