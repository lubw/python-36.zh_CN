��          t               �   '   �   7   �   �   -  �   �  *   �  &   �  =   �  �   (     �  [  �  �  0  '   �  7     �   G  �     *   �  &   �  =   	  �   B	     �	  [  �	   **Source code:** :source:`Lib/token.py` :mod:`token` --- Constants used with Python parse trees Added :data:`AWAIT` and :data:`ASYNC` tokens. Starting with Python 3.7, "async" and "await" will be tokenized as :data:`NAME` tokens, and :data:`AWAIT` and :data:`ASYNC` will be removed. Dictionary mapping the numeric values of the constants defined in this module back to name strings, allowing more human-readable representation of parse trees to be generated. Return true for non-terminal token values. Return true for terminal token values. Return true if *x* is the marker indicating the end of input. The module also provides a mapping from numeric codes to names and some functions.  The functions mirror definitions in the Python C header files. The token constants are: This module provides constants which represent the numeric values of leaf nodes of the parse tree (terminal tokens).  Refer to the file :file:`Grammar/Grammar` in the Python distribution for the definitions of the names in the context of the language grammar.  The specific numeric values which the names map to may change between Python versions. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/token.py` :mod:`token` --- Constants used with Python parse trees Added :data:`AWAIT` and :data:`ASYNC` tokens. Starting with Python 3.7, "async" and "await" will be tokenized as :data:`NAME` tokens, and :data:`AWAIT` and :data:`ASYNC` will be removed. Dictionary mapping the numeric values of the constants defined in this module back to name strings, allowing more human-readable representation of parse trees to be generated. Return true for non-terminal token values. Return true for terminal token values. Return true if *x* is the marker indicating the end of input. The module also provides a mapping from numeric codes to names and some functions.  The functions mirror definitions in the Python C header files. The token constants are: This module provides constants which represent the numeric values of leaf nodes of the parse tree (terminal tokens).  Refer to the file :file:`Grammar/Grammar` in the Python distribution for the definitions of the names in the context of the language grammar.  The specific numeric values which the names map to may change between Python versions. 