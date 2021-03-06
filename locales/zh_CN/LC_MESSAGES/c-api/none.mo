��          D               l   �   m   �   l  �   �     �  �  �  �   e  �   d  �   �     �   Note that the :c:type:`PyTypeObject` for ``None`` is not directly exposed in the Python/C API.  Since ``None`` is a singleton, testing for object identity (using ``==`` in C) is sufficient. There is no :c:func:`PyNone_Check` function for the same reason. Properly handle returning :c:data:`Py_None` from within a C function (that is, increment the reference count of ``None`` and return it.) The Python ``None`` object, denoting lack of value.  This object has no methods. It needs to be treated just like any other object with respect to reference counts. The ``None`` Object Project-Id-Version: Python 3.6
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
 Note that the :c:type:`PyTypeObject` for ``None`` is not directly exposed in the Python/C API.  Since ``None`` is a singleton, testing for object identity (using ``==`` in C) is sufficient. There is no :c:func:`PyNone_Check` function for the same reason. Properly handle returning :c:data:`Py_None` from within a C function (that is, increment the reference count of ``None`` and return it.) The Python ``None`` object, denoting lack of value.  This object has no methods. It needs to be treated just like any other object with respect to reference counts. The ``None`` Object 