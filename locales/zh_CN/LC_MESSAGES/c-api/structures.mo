��    k      t              �     �  �   �     �     �    �     �     �     �     �     �     	  x  	  `  �
  �  �     �                    /  �   5  V   �  
        )  &  1  @  X  O  �  p   �     Z     f  
   r  .   }  1   �  y   �  Z   X  i   �          $     +     2     ;     C     I  
   P     [     d  
   p     {     �     �     �     �     �     �  T  �  �    �   �  I  2  �   |  �   U  �   5  �   �  �   �  �   j  r   �  �   c   ?  �   �  ="  ]   �#  [   P$  [   �$  �   %  u  �%  �   j'     (     (     (     (     &(     *(  7   1(  A   i(     �(     �(     �(     �(     �(  	   �(     �(     �(     �(  X   �(     S)  J   f)     �)  '   �)     �)     �)     *  J   
*  &   U*     |*     �*     �*     �*     �*     �*  �  �*     �,  �   �,     H-     T-    b-     u.     �.     �.     �.     �.     �.  x  �.  `  J0  �  �1     �3     �3     �3     �3     �3  �   �3  V   �4  
   �4     �4  &  �4  @  6  O  X7  p   �8     9     %9  
   19  .   <9  1   k9  y   �9  Z   :  i   r:     �:     �:     �:     �:     �:     ;     ;  
   ;     ;     #;  
   /;     :;     B;     K;     S;     Z;     b;     n;  T  w;  �  �<  �   n>  I  �>  �   ;A  �   B  �   �B  �   �C  �   �D  �   )E  r   �E  �   "F  ?  �F  �  �G  ]   �I  [   J  [   kJ  �   �J  u  �K  �   )M     �M     �M     �M     �M     �M     �M  7   �M  A   (N     jN     pN     tN     {N     N  	   �N     �N     �N     �N  X   �N     O  J   %O     pO  '   �O     �O     �O     �O  J   �O  &   P     ;P     IP     VP     dP     wP     �P   :attr:`!type` :attr:`!type` can be one of many ``T_`` macros corresponding to various C types.  When the member is accessed in Python, it will be converted to the equivalent Python type. :attr:`doc` :attr:`flags` :attr:`flags` can be ``0`` for write and read access or :c:macro:`READONLY` for read-only access.  Using :c:macro:`T_STRING` for :attr:`type` implies :c:macro:`READONLY`.  Only :c:macro:`T_OBJECT` and :c:macro:`T_OBJECT_EX` members can be deleted.  (They are set to *NULL*). :attr:`ml_doc` :attr:`ml_flags` :attr:`ml_meth` :attr:`ml_name` :attr:`name` :attr:`offset` :c:macro:`T_OBJECT` and :c:macro:`T_OBJECT_EX` differ in that :c:macro:`T_OBJECT` returns ``None`` if the member is *NULL* and :c:macro:`T_OBJECT_EX` raises an :exc:`AttributeError`.  Try to use :c:macro:`T_OBJECT_EX` over :c:macro:`T_OBJECT` because :c:macro:`T_OBJECT_EX` handles use of the :keyword:`del` statement on that attribute more correctly than :c:macro:`T_OBJECT`. All Python objects ultimately share a small number of fields at the beginning of the object's representation in memory.  These are represented by the :c:type:`PyObject` and :c:type:`PyVarObject` types, which are defined, in turn, by the expansions of some macros also used, whether directly or indirectly, in the definition of all other Python objects. All object types are extensions of this type.  This is a type which contains the information Python needs to treat a pointer to an object as an object.  In a normal "release" build, it contains only the object's reference count and a pointer to the corresponding type object. Nothing is actually declared to be a :c:type:`PyObject`, but every pointer to a Python object can be cast to a :c:type:`PyObject*`.  Access to the members must be done by using the macros :c:macro:`Py_REFCNT` and :c:macro:`Py_TYPE`. C Function to get the attribute C Type C type Common Object Structures Field In case the attribute should be deleted the second parameter is *NULL*. Should return ``0`` on success or ``-1`` with a set exception on failure. It should return a new reference on success or *NULL* with a set exception on failure. Macro name Meaning Methods with a single object argument can be listed with the :const:`METH_O` flag, instead of invoking :c:func:`PyArg_ParseTuple` with a ``"O"`` argument. They have the type :c:type:`PyCFunction`, with the *self* parameter, and a :c:type:`PyObject\*` parameter representing the single argument. Methods with these flags must be of type :c:type:`PyCFunctionWithKeywords`. The function expects three parameters: *self*, *args*, and a dictionary of all the keyword arguments.  The flag must be combined with :const:`METH_VARARGS`, and the parameters are typically processed using :c:func:`PyArg_ParseTupleAndKeywords`. Methods without parameters don't need to check whether arguments are given if they are listed with the :const:`METH_NOARGS` flag.  They need to be of type :c:type:`PyCFunction`.  The first parameter is typically named *self* and will hold a reference to the module or object instance.  In all cases the second parameter will be *NULL*. One other constant controls whether a method is loaded in place of another definition with the same method name. PyCFunction PyObject \* Py_ssize_t See documentation of :c:type:`PyObject` above. See documentation of :c:type:`PyVarObject` above. Structure to define property-like access for a type. See also description of the :c:member:`PyTypeObject.tp_getset` slot. Structure used to describe a method of an extension type.  This structure has four fields: Structure which describes an attribute of a type which corresponds to a C struct member.  Its fields are: T_BOOL T_BYTE T_CHAR T_DOUBLE T_FLOAT T_INT T_LONG T_LONGLONG T_OBJECT T_OBJECT_EX T_PYSSIZET T_SHORT T_STRING T_UBYTE T_UINT T_ULONG T_ULONGLONG T_USHORT The :attr:`ml_flags` field is a bitfield which can include the following flags. The individual flags indicate either a calling convention or a binding convention.  Of the calling convention flags, only :const:`METH_VARARGS` and :const:`METH_KEYWORDS` can be combined. Any of the calling convention flags can be combined with a binding flag. The :attr:`ml_meth` is a C function pointer.  The functions may be of different types, but they always return :c:type:`PyObject\*`.  If the function is not of the :c:type:`PyCFunction`, the compiler will require a cast in the method table. Even though :c:type:`PyCFunction` defines the first parameter as :c:type:`PyObject\*`, it is common that the method implementation uses the specific C type of the *self* object. The ``get`` function takes one :c:type:`PyObject\*` parameter (the instance) and a function pointer (the associated ``closure``):: The method will be loaded in place of existing definitions.  Without *METH_COEXIST*, the default is to skip repeated definitions.  Since slot wrappers are loaded before the method table, the existence of a *sq_contains* slot, for example, would generate a wrapped method named :meth:`__contains__` and preclude the loading of a corresponding PyCFunction with the same name.  With the flag defined, the PyCFunction will be loaded in place of the wrapper object and will co-exist with the slot.  This is helpful because calls to PyCFunctions are optimized more than wrapper object calls. The method will be passed *NULL* as the first parameter rather than an instance of the type.  This is used to create *static methods*, similar to what is created when using the :func:`staticmethod` built-in function. The method will be passed the type object as the first parameter rather than an instance of the type.  This is used to create *class methods*, similar to what is created when using the :func:`classmethod` built-in function. There are a large number of structures which are used in the definition of object types for Python.  This section describes these structures and how they are used. These two constants are not used to indicate the calling convention but the binding when use with methods of classes.  These may not be used for functions defined for modules.  At most one of these flags may be set for any given method. This is a macro used when declaring new types which represent objects with a length that varies from instance to instance. The PyObject_VAR_HEAD macro expands to:: This is a macro used when declaring new types which represent objects without a varying length.  The PyObject_HEAD macro expands to:: This is a macro which expands to initialization values for a new :c:type:`PyObject` type.  This macro expands to:: This is a macro which expands to initialization values for a new :c:type:`PyVarObject` type, including the :attr:`ob_size` field. This macro expands to:: This is an extension of :c:type:`PyObject` that adds the :attr:`ob_size` field.  This is only used for objects that have some notion of *length*. This type does not often appear in the Python/C API. Access to the members must be done by using the macros :c:macro:`Py_REFCNT`, :c:macro:`Py_TYPE`, and :c:macro:`Py_SIZE`. This is the typical calling convention, where the methods have the type :c:type:`PyCFunction`. The function expects two :c:type:`PyObject\*` values. The first one is the *self* object for methods; for module functions, it is the module object.  The second parameter (often called *args*) is a tuple object representing all arguments. This parameter is typically processed using :c:func:`PyArg_ParseTuple` or :c:func:`PyArg_UnpackTuple`. This macro is used to access the :attr:`ob_refcnt` member of a Python object. It expands to:: This macro is used to access the :attr:`ob_size` member of a Python object. It expands to:: This macro is used to access the :attr:`ob_type` member of a Python object. It expands to:: Type of the functions used to implement Python callables in C that take keyword arguments: they take three :c:type:`PyObject\*` parameters and return one such value.  See :c:type:`PyCFunction` above for the meaning of the return value. Type of the functions used to implement most Python callables in C. Functions of this type take two :c:type:`PyObject\*` parameters and return one such value.  If the return value is *NULL*, an exception shall have been set.  If not *NULL*, the return value is interpreted as the return value of the function as exposed in Python.  The function must return a new reference. ``set`` functions take two :c:type:`PyObject\*` parameters (the instance and the value to be set) and a function pointer (the associated ``closure``):: attribute name char char \* closure doc double flag bits indicating how the call should be constructed flag bits indicating if the field should be read-only or writable float get getter int long long long name name of the member name of the method optional C function to set or delete the attribute, if omitted the attribute is readonly optional docstring optional function pointer, providing additional data for getter and setter pointer to the C implementation points to the contents of the docstring set setter short the offset in bytes that the member is located on the type's object struct the type of the member in the C struct unsigned char unsigned int unsigned long unsigned long long unsigned short void \* Project-Id-Version: Python 3.6
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
 :attr:`!type` :attr:`!type` can be one of many ``T_`` macros corresponding to various C types.  When the member is accessed in Python, it will be converted to the equivalent Python type. :attr:`doc` :attr:`flags` :attr:`flags` can be ``0`` for write and read access or :c:macro:`READONLY` for read-only access.  Using :c:macro:`T_STRING` for :attr:`type` implies :c:macro:`READONLY`.  Only :c:macro:`T_OBJECT` and :c:macro:`T_OBJECT_EX` members can be deleted.  (They are set to *NULL*). :attr:`ml_doc` :attr:`ml_flags` :attr:`ml_meth` :attr:`ml_name` :attr:`name` :attr:`offset` :c:macro:`T_OBJECT` and :c:macro:`T_OBJECT_EX` differ in that :c:macro:`T_OBJECT` returns ``None`` if the member is *NULL* and :c:macro:`T_OBJECT_EX` raises an :exc:`AttributeError`.  Try to use :c:macro:`T_OBJECT_EX` over :c:macro:`T_OBJECT` because :c:macro:`T_OBJECT_EX` handles use of the :keyword:`del` statement on that attribute more correctly than :c:macro:`T_OBJECT`. All Python objects ultimately share a small number of fields at the beginning of the object's representation in memory.  These are represented by the :c:type:`PyObject` and :c:type:`PyVarObject` types, which are defined, in turn, by the expansions of some macros also used, whether directly or indirectly, in the definition of all other Python objects. All object types are extensions of this type.  This is a type which contains the information Python needs to treat a pointer to an object as an object.  In a normal "release" build, it contains only the object's reference count and a pointer to the corresponding type object. Nothing is actually declared to be a :c:type:`PyObject`, but every pointer to a Python object can be cast to a :c:type:`PyObject*`.  Access to the members must be done by using the macros :c:macro:`Py_REFCNT` and :c:macro:`Py_TYPE`. C Function to get the attribute C Type C type Common Object Structures Field In case the attribute should be deleted the second parameter is *NULL*. Should return ``0`` on success or ``-1`` with a set exception on failure. It should return a new reference on success or *NULL* with a set exception on failure. Macro name 意义 Methods with a single object argument can be listed with the :const:`METH_O` flag, instead of invoking :c:func:`PyArg_ParseTuple` with a ``"O"`` argument. They have the type :c:type:`PyCFunction`, with the *self* parameter, and a :c:type:`PyObject\*` parameter representing the single argument. Methods with these flags must be of type :c:type:`PyCFunctionWithKeywords`. The function expects three parameters: *self*, *args*, and a dictionary of all the keyword arguments.  The flag must be combined with :const:`METH_VARARGS`, and the parameters are typically processed using :c:func:`PyArg_ParseTupleAndKeywords`. Methods without parameters don't need to check whether arguments are given if they are listed with the :const:`METH_NOARGS` flag.  They need to be of type :c:type:`PyCFunction`.  The first parameter is typically named *self* and will hold a reference to the module or object instance.  In all cases the second parameter will be *NULL*. One other constant controls whether a method is loaded in place of another definition with the same method name. PyCFunction PyObject \* Py_ssize_t See documentation of :c:type:`PyObject` above. See documentation of :c:type:`PyVarObject` above. Structure to define property-like access for a type. See also description of the :c:member:`PyTypeObject.tp_getset` slot. Structure used to describe a method of an extension type.  This structure has four fields: Structure which describes an attribute of a type which corresponds to a C struct member.  Its fields are: T_BOOL T_BYTE T_CHAR T_DOUBLE T_FLOAT T_INT T_LONG T_LONGLONG T_OBJECT T_OBJECT_EX T_PYSSIZET T_SHORT T_STRING T_UBYTE T_UINT T_ULONG T_ULONGLONG T_USHORT The :attr:`ml_flags` field is a bitfield which can include the following flags. The individual flags indicate either a calling convention or a binding convention.  Of the calling convention flags, only :const:`METH_VARARGS` and :const:`METH_KEYWORDS` can be combined. Any of the calling convention flags can be combined with a binding flag. The :attr:`ml_meth` is a C function pointer.  The functions may be of different types, but they always return :c:type:`PyObject\*`.  If the function is not of the :c:type:`PyCFunction`, the compiler will require a cast in the method table. Even though :c:type:`PyCFunction` defines the first parameter as :c:type:`PyObject\*`, it is common that the method implementation uses the specific C type of the *self* object. The ``get`` function takes one :c:type:`PyObject\*` parameter (the instance) and a function pointer (the associated ``closure``):: The method will be loaded in place of existing definitions.  Without *METH_COEXIST*, the default is to skip repeated definitions.  Since slot wrappers are loaded before the method table, the existence of a *sq_contains* slot, for example, would generate a wrapped method named :meth:`__contains__` and preclude the loading of a corresponding PyCFunction with the same name.  With the flag defined, the PyCFunction will be loaded in place of the wrapper object and will co-exist with the slot.  This is helpful because calls to PyCFunctions are optimized more than wrapper object calls. The method will be passed *NULL* as the first parameter rather than an instance of the type.  This is used to create *static methods*, similar to what is created when using the :func:`staticmethod` built-in function. The method will be passed the type object as the first parameter rather than an instance of the type.  This is used to create *class methods*, similar to what is created when using the :func:`classmethod` built-in function. There are a large number of structures which are used in the definition of object types for Python.  This section describes these structures and how they are used. These two constants are not used to indicate the calling convention but the binding when use with methods of classes.  These may not be used for functions defined for modules.  At most one of these flags may be set for any given method. This is a macro used when declaring new types which represent objects with a length that varies from instance to instance. The PyObject_VAR_HEAD macro expands to:: This is a macro used when declaring new types which represent objects without a varying length.  The PyObject_HEAD macro expands to:: This is a macro which expands to initialization values for a new :c:type:`PyObject` type.  This macro expands to:: This is a macro which expands to initialization values for a new :c:type:`PyVarObject` type, including the :attr:`ob_size` field. This macro expands to:: This is an extension of :c:type:`PyObject` that adds the :attr:`ob_size` field.  This is only used for objects that have some notion of *length*. This type does not often appear in the Python/C API. Access to the members must be done by using the macros :c:macro:`Py_REFCNT`, :c:macro:`Py_TYPE`, and :c:macro:`Py_SIZE`. This is the typical calling convention, where the methods have the type :c:type:`PyCFunction`. The function expects two :c:type:`PyObject\*` values. The first one is the *self* object for methods; for module functions, it is the module object.  The second parameter (often called *args*) is a tuple object representing all arguments. This parameter is typically processed using :c:func:`PyArg_ParseTuple` or :c:func:`PyArg_UnpackTuple`. This macro is used to access the :attr:`ob_refcnt` member of a Python object. It expands to:: This macro is used to access the :attr:`ob_size` member of a Python object. It expands to:: This macro is used to access the :attr:`ob_type` member of a Python object. It expands to:: Type of the functions used to implement Python callables in C that take keyword arguments: they take three :c:type:`PyObject\*` parameters and return one such value.  See :c:type:`PyCFunction` above for the meaning of the return value. Type of the functions used to implement most Python callables in C. Functions of this type take two :c:type:`PyObject\*` parameters and return one such value.  If the return value is *NULL*, an exception shall have been set.  If not *NULL*, the return value is interpreted as the return value of the function as exposed in Python.  The function must return a new reference. ``set`` functions take two :c:type:`PyObject\*` parameters (the instance and the value to be set) and a function pointer (the associated ``closure``):: attribute name char char \* closure doc double flag bits indicating how the call should be constructed flag bits indicating if the field should be read-only or writable float get getter int long long long name name of the member name of the method optional C function to set or delete the attribute, if omitted the attribute is readonly optional docstring optional function pointer, providing additional data for getter and setter pointer to the C implementation points to the contents of the docstring set setter short the offset in bytes that the member is located on the type's object struct the type of the member in the C struct unsigned char unsigned int unsigned long unsigned long long unsigned short void \* 