��    7      �              �  m   �  �   �  e   �  �   �  P  �  �   �  �  �  �  �	  !  d  �  �  H  �  �  �  �  �  1  j  �   �  	  z  �   �  �     �   �  �   &  �  �    ]  �   `  �   8  �   8  �   �  �   y  }   �  �   {   �   -!     "    "  �   '#  �   �#  �   y$  �   1%  �   �%  !  V&  �   x'  �   (  l   �(  �   T)  �   �)  �   �*  �   M+  �   B,  u   %-  X   �-  1   �-  @   &.  r   g.  �  �.  �   e0  �  [1  �  ?3  m   �4  �   d5  e   �5  �   Q6  P  �6  �   L8  �  D9  �  ,;  !  �<  �  �=  H  �?  �  5A  �  C  1  �D  �   F  	  �F  �   �G  �   zH  �   I  �   �I  �  J    �K  �   �M  �   �N  �   �O  �   OP  �   �P  }   fQ  �   �Q  �   �R     tS    �S  �   �T  �   )U  �   �U  �   �V  �   -W  !  �W  �   �X  �   kY  l   PZ  �   �Z  �   _[  �   \  �   �\  �   �]  u   �^  X   _  1   ]_  @   �_  r   �_  �  C`  �   �a  �  �b   A generic implementation for the getter of a ``__dict__`` descriptor. It creates the dictionary if necessary. A generic implementation for the setter of a ``__dict__`` descriptor. This implementation does not allow the dictionary to be deleted. An instance *inst* can override what is considered its class by having a :attr:`__class__` attribute. An object *cls* can override if it is considered a class, and what its base classes are, by having a :attr:`__bases__` attribute (which must be a tuple of base classes). As :c:func:`PyObject_Repr`, compute a string representation of object *o*, but escape the non-ASCII characters in the string returned by :c:func:`PyObject_Repr` with ``\x``, ``\u`` or ``\U`` escapes.  This generates a string similar to that returned by :c:func:`PyObject_Repr` in Python 2. Called by the :func:`ascii` built-in function. Call a callable Python object *callable*, with a variable number of :c:type:`PyObject\*` arguments.  The arguments are provided as a variable number of parameters followed by *NULL*. Returns the result of the call on success, or *NULL* on failure. Call a callable Python object *callable*, with a variable number of C arguments. The C arguments are described using a :c:func:`Py_BuildValue` style format string.  The format may be *NULL*, indicating that no arguments are provided. Returns the result of the call on success, or *NULL* on failure.  This is the equivalent of the Python expression ``callable(*args)``. Note that if you only pass :c:type:`PyObject \*` args, :c:func:`PyObject_CallFunctionObjArgs` is a faster alternative. Call a callable Python object *callable_object*, with arguments given by the tuple *args*, and named arguments given by the dictionary *kw*. If no named arguments are needed, *kw* may be *NULL*. *args* must not be *NULL*, use an empty tuple if no arguments are needed. Returns the result of the call on success, or *NULL* on failure.  This is the equivalent of the Python expression ``callable_object(*args, **kw)``. Call a callable Python object *callable_object*, with arguments given by the tuple *args*.  If no arguments are needed, then *args* may be *NULL*.  Returns the result of the call on success, or *NULL* on failure.  This is the equivalent of the Python expression ``callable_object(*args)``. Call the method named *method* of object *o* with a variable number of C arguments.  The C arguments are described by a :c:func:`Py_BuildValue` format string that should  produce a tuple.  The format may be *NULL*, indicating that no arguments are provided. Returns the result of the call on success, or *NULL* on failure.  This is the equivalent of the Python expression ``o.method(args)``. Note that if you only pass :c:type:`PyObject \*` args, :c:func:`PyObject_CallMethodObjArgs` is a faster alternative. Calls a method of the object *o*, where the name of the method is given as a Python string object in *name*.  It is called with a variable number of :c:type:`PyObject\*` arguments.  The arguments are provided as a variable number of parameters followed by *NULL*. Returns the result of the call on success, or *NULL* on failure. Compare the values of *o1* and *o2* using the operation specified by *opid*, which must be one of :const:`Py_LT`, :const:`Py_LE`, :const:`Py_EQ`, :const:`Py_NE`, :const:`Py_GT`, or :const:`Py_GE`, corresponding to ``<``, ``<=``, ``==``, ``!=``, ``>``, or ``>=`` respectively. Returns ``-1`` on error, ``0`` if the result is false, ``1`` otherwise. This is the equivalent of the Python expression ``o1 op o2``, where ``op`` is the operator corresponding to *opid*. Compare the values of *o1* and *o2* using the operation specified by *opid*, which must be one of :const:`Py_LT`, :const:`Py_LE`, :const:`Py_EQ`, :const:`Py_NE`, :const:`Py_GT`, or :const:`Py_GE`, corresponding to ``<``, ``<=``, ``==``, ``!=``, ``>``, or ``>=`` respectively. This is the equivalent of the Python expression ``o1 op o2``, where ``op`` is the operator corresponding to *opid*. Returns the value of the comparison on success, or *NULL* on failure. Compute a bytes representation of object *o*.  *NULL* is returned on failure and a bytes object on success.  This is equivalent to the Python expression ``bytes(o)``, when *o* is not an integer.  Unlike ``bytes(o)``, a TypeError is raised when *o* is an integer instead of a zero-initialized bytes object. Compute a string representation of object *o*.  Returns the string representation on success, *NULL* on failure.  This is the equivalent of the Python expression ``repr(o)``.  Called by the :func:`repr` built-in function. Compute a string representation of object *o*.  Returns the string representation on success, *NULL* on failure.  This is the equivalent of the Python expression ``str(o)``.  Called by the :func:`str` built-in function and, therefore, by the :func:`print` function. Compute and return the hash value of an object *o*.  On failure, return ``-1``. This is the equivalent of the Python expression ``hash(o)``. Delete attribute named *attr_name*, for object *o*. Returns ``-1`` on failure. This is the equivalent of the Python statement ``del o.attr_name``. Delete the mapping for *key* from *o*.  Returns ``-1`` on failure. This is the equivalent of the Python statement ``del o[key]``. Determine if the object *o* is callable.  Return ``1`` if the object is callable and ``0`` otherwise.  This function always succeeds. Generic attribute getter function that is meant to be put into a type object's ``tp_getattro`` slot.  It looks for a descriptor in the dictionary of classes in the object's MRO as well as an attribute in the object's :attr:`~object.__dict__` (if present).  As outlined in :ref:`descriptors`, data descriptors take preference over instance attributes, while non-data descriptors don't.  Otherwise, an :exc:`AttributeError` is raised. Generic attribute setter and deleter function that is meant to be put into a type object's :c:member:`~PyTypeObject.tp_setattro` slot.  It looks for a data descriptor in the dictionary of classes in the object's MRO, and if found it takes preference over setting or deleting the attribute in the instance dictionary. Otherwise, the attribute is set or deleted in the object's :attr:`~object.__dict__` (if present). On success, ``0`` is returned, otherwise an :exc:`AttributeError` is raised and ``-1`` is returned. If *cls* has a :meth:`~class.__instancecheck__` method, it will be called to determine the subclass status as described in :pep:`3119`.  Otherwise, *inst* is an instance of *cls* if its class is a subclass of *cls*. If *cls* has a :meth:`~class.__subclasscheck__` method, it will be called to determine the subclass status as described in :pep:`3119`.  Otherwise, *derived* is a subclass of *cls* if it is a direct or indirect subclass, i.e. contained in ``cls.__mro__``. If *cls* is a tuple, the check will be done against every entry in *cls*. The result will be ``1`` when at least one of the checks returns ``1``, otherwise it will be ``0``. If *o1* and *o2* are the same object, :c:func:`PyObject_RichCompareBool` will always return ``1`` for :const:`Py_EQ` and ``0`` for :const:`Py_NE`. If *v* is *NULL*, the attribute is deleted, however this feature is deprecated in favour of using :c:func:`PyObject_DelAttrString`. If *v* is *NULL*, the attribute is deleted, however this feature is deprecated in favour of using :c:func:`PyObject_DelAttr`. Map the object *key* to the value *v*.  Raise an exception and return ``-1`` on failure; return ``0`` on success.  This is the equivalent of the Python statement ``o[key] = v``. Normally only class objects, i.e. instances of :class:`type` or a derived class, are considered classes.  However, objects can override this by having a :attr:`__bases__` attribute (which must be a tuple of base classes). Object Protocol Print an object *o*, on file *fp*.  Returns ``-1`` on error.  The flags argument is used to enable certain printing options.  The only option currently supported is :const:`Py_PRINT_RAW`; if given, the :func:`str` of the object is written instead of the :func:`repr`. Properly handle returning :c:data:`Py_NotImplemented` from within a C function (that is, increment the reference count of NotImplemented and return it). Retrieve an attribute named *attr_name* from object *o*. Returns the attribute value on success, or *NULL* on failure.  This is the equivalent of the Python expression ``o.attr_name``. Retrieve an attribute named *attr_name* from object *o*. Returns the attribute value on success, or *NULL* on failure. This is the equivalent of the Python expression ``o.attr_name``. Return ``1`` if *inst* is an instance of the class *cls* or a subclass of *cls*, or ``0`` if not.  On error, returns ``-1`` and sets an exception. Return ``1`` if the class *derived* is identical to or derived from the class *cls*, otherwise return ``0``.  In case of an error, return ``-1``. Return an estimated length for the object *o*. First try to return its actual length, then an estimate using :meth:`~object.__length_hint__`, and finally return the default value. On error return ``-1``. This is the equivalent to the Python expression ``operator.length_hint(o, default)``. Return element of *o* corresponding to the object *key* or *NULL* on failure. This is the equivalent of the Python expression ``o[key]``. Return the length of object *o*.  If the object *o* provides either the sequence and mapping protocols, the sequence length is returned.  On error, ``-1`` is returned.  This is the equivalent to the Python expression ``len(o)``. Return true if the object *o* is of type *type* or a subtype of *type*.  Both parameters must be non-*NULL*. Returns ``0`` if the object *o* is considered to be true, and ``1`` otherwise. This is equivalent to the Python expression ``not o``.  On failure, return ``-1``. Returns ``1`` if *o* has the attribute *attr_name*, and ``0`` otherwise.  This is equivalent to the Python expression ``hasattr(o, attr_name)``.  This function always succeeds. Returns ``1`` if the object *o* is considered to be true, and ``0`` otherwise. This is equivalent to the Python expression ``not not o``.  On failure, return ``-1``. Set a :exc:`TypeError` indicating that ``type(o)`` is not hashable and return ``-1``. This function receives special treatment when stored in a ``tp_hash`` slot, allowing a type to explicitly indicate to the interpreter that it is not hashable. Set the value of the attribute named *attr_name*, for object *o*, to the value *v*. Raise an exception and return ``-1`` on failure; return ``0`` on success.  This is the equivalent of the Python statement ``o.attr_name = v``. The ``NotImplemented`` singleton, used to signal that an operation is not implemented for the given type combination. The return type is now Py_hash_t.  This is a signed integer the same size as Py_ssize_t. The type of *format* was changed from ``char *``. The types of *method* and *format* were changed from ``char *``. This function now includes a debug assertion to help ensure that it does not silently discard an active exception. This is equivalent to the Python expression ``dir(o)``, returning a (possibly empty) list of strings appropriate for the object argument, or *NULL* if there was an error.  If the argument is *NULL*, this is like the Python ``dir()``, returning the names of the current locals; in this case, if no execution frame is active then *NULL* is returned but :c:func:`PyErr_Occurred` will return false. This is equivalent to the Python expression ``iter(o)``. It returns a new iterator for the object argument, or the object  itself if the object is already an iterator.  Raises :exc:`TypeError` and returns *NULL* if the object cannot be iterated. When *o* is non-*NULL*, returns a type object corresponding to the object type of object *o*. On failure, raises :exc:`SystemError` and returns *NULL*.  This is equivalent to the Python expression ``type(o)``. This function increments the reference count of the return value. There's really no reason to use this function instead of the common expression ``o->ob_type``, which returns a pointer of type :c:type:`PyTypeObject\*`, except when the incremented reference count is needed. Project-Id-Version: Python 3.6
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
 A generic implementation for the getter of a ``__dict__`` descriptor. It creates the dictionary if necessary. A generic implementation for the setter of a ``__dict__`` descriptor. This implementation does not allow the dictionary to be deleted. An instance *inst* can override what is considered its class by having a :attr:`__class__` attribute. An object *cls* can override if it is considered a class, and what its base classes are, by having a :attr:`__bases__` attribute (which must be a tuple of base classes). As :c:func:`PyObject_Repr`, compute a string representation of object *o*, but escape the non-ASCII characters in the string returned by :c:func:`PyObject_Repr` with ``\x``, ``\u`` or ``\U`` escapes.  This generates a string similar to that returned by :c:func:`PyObject_Repr` in Python 2. Called by the :func:`ascii` built-in function. Call a callable Python object *callable*, with a variable number of :c:type:`PyObject\*` arguments.  The arguments are provided as a variable number of parameters followed by *NULL*. Returns the result of the call on success, or *NULL* on failure. Call a callable Python object *callable*, with a variable number of C arguments. The C arguments are described using a :c:func:`Py_BuildValue` style format string.  The format may be *NULL*, indicating that no arguments are provided. Returns the result of the call on success, or *NULL* on failure.  This is the equivalent of the Python expression ``callable(*args)``. Note that if you only pass :c:type:`PyObject \*` args, :c:func:`PyObject_CallFunctionObjArgs` is a faster alternative. Call a callable Python object *callable_object*, with arguments given by the tuple *args*, and named arguments given by the dictionary *kw*. If no named arguments are needed, *kw* may be *NULL*. *args* must not be *NULL*, use an empty tuple if no arguments are needed. Returns the result of the call on success, or *NULL* on failure.  This is the equivalent of the Python expression ``callable_object(*args, **kw)``. Call a callable Python object *callable_object*, with arguments given by the tuple *args*.  If no arguments are needed, then *args* may be *NULL*.  Returns the result of the call on success, or *NULL* on failure.  This is the equivalent of the Python expression ``callable_object(*args)``. Call the method named *method* of object *o* with a variable number of C arguments.  The C arguments are described by a :c:func:`Py_BuildValue` format string that should  produce a tuple.  The format may be *NULL*, indicating that no arguments are provided. Returns the result of the call on success, or *NULL* on failure.  This is the equivalent of the Python expression ``o.method(args)``. Note that if you only pass :c:type:`PyObject \*` args, :c:func:`PyObject_CallMethodObjArgs` is a faster alternative. Calls a method of the object *o*, where the name of the method is given as a Python string object in *name*.  It is called with a variable number of :c:type:`PyObject\*` arguments.  The arguments are provided as a variable number of parameters followed by *NULL*. Returns the result of the call on success, or *NULL* on failure. Compare the values of *o1* and *o2* using the operation specified by *opid*, which must be one of :const:`Py_LT`, :const:`Py_LE`, :const:`Py_EQ`, :const:`Py_NE`, :const:`Py_GT`, or :const:`Py_GE`, corresponding to ``<``, ``<=``, ``==``, ``!=``, ``>``, or ``>=`` respectively. Returns ``-1`` on error, ``0`` if the result is false, ``1`` otherwise. This is the equivalent of the Python expression ``o1 op o2``, where ``op`` is the operator corresponding to *opid*. Compare the values of *o1* and *o2* using the operation specified by *opid*, which must be one of :const:`Py_LT`, :const:`Py_LE`, :const:`Py_EQ`, :const:`Py_NE`, :const:`Py_GT`, or :const:`Py_GE`, corresponding to ``<``, ``<=``, ``==``, ``!=``, ``>``, or ``>=`` respectively. This is the equivalent of the Python expression ``o1 op o2``, where ``op`` is the operator corresponding to *opid*. Returns the value of the comparison on success, or *NULL* on failure. Compute a bytes representation of object *o*.  *NULL* is returned on failure and a bytes object on success.  This is equivalent to the Python expression ``bytes(o)``, when *o* is not an integer.  Unlike ``bytes(o)``, a TypeError is raised when *o* is an integer instead of a zero-initialized bytes object. Compute a string representation of object *o*.  Returns the string representation on success, *NULL* on failure.  This is the equivalent of the Python expression ``repr(o)``.  Called by the :func:`repr` built-in function. Compute a string representation of object *o*.  Returns the string representation on success, *NULL* on failure.  This is the equivalent of the Python expression ``str(o)``.  Called by the :func:`str` built-in function and, therefore, by the :func:`print` function. Compute and return the hash value of an object *o*.  On failure, return ``-1``. This is the equivalent of the Python expression ``hash(o)``. Delete attribute named *attr_name*, for object *o*. Returns ``-1`` on failure. This is the equivalent of the Python statement ``del o.attr_name``. Delete the mapping for *key* from *o*.  Returns ``-1`` on failure. This is the equivalent of the Python statement ``del o[key]``. Determine if the object *o* is callable.  Return ``1`` if the object is callable and ``0`` otherwise.  This function always succeeds. Generic attribute getter function that is meant to be put into a type object's ``tp_getattro`` slot.  It looks for a descriptor in the dictionary of classes in the object's MRO as well as an attribute in the object's :attr:`~object.__dict__` (if present).  As outlined in :ref:`descriptors`, data descriptors take preference over instance attributes, while non-data descriptors don't.  Otherwise, an :exc:`AttributeError` is raised. Generic attribute setter and deleter function that is meant to be put into a type object's :c:member:`~PyTypeObject.tp_setattro` slot.  It looks for a data descriptor in the dictionary of classes in the object's MRO, and if found it takes preference over setting or deleting the attribute in the instance dictionary. Otherwise, the attribute is set or deleted in the object's :attr:`~object.__dict__` (if present). On success, ``0`` is returned, otherwise an :exc:`AttributeError` is raised and ``-1`` is returned. If *cls* has a :meth:`~class.__instancecheck__` method, it will be called to determine the subclass status as described in :pep:`3119`.  Otherwise, *inst* is an instance of *cls* if its class is a subclass of *cls*. If *cls* has a :meth:`~class.__subclasscheck__` method, it will be called to determine the subclass status as described in :pep:`3119`.  Otherwise, *derived* is a subclass of *cls* if it is a direct or indirect subclass, i.e. contained in ``cls.__mro__``. If *cls* is a tuple, the check will be done against every entry in *cls*. The result will be ``1`` when at least one of the checks returns ``1``, otherwise it will be ``0``. If *o1* and *o2* are the same object, :c:func:`PyObject_RichCompareBool` will always return ``1`` for :const:`Py_EQ` and ``0`` for :const:`Py_NE`. If *v* is *NULL*, the attribute is deleted, however this feature is deprecated in favour of using :c:func:`PyObject_DelAttrString`. If *v* is *NULL*, the attribute is deleted, however this feature is deprecated in favour of using :c:func:`PyObject_DelAttr`. Map the object *key* to the value *v*.  Raise an exception and return ``-1`` on failure; return ``0`` on success.  This is the equivalent of the Python statement ``o[key] = v``. Normally only class objects, i.e. instances of :class:`type` or a derived class, are considered classes.  However, objects can override this by having a :attr:`__bases__` attribute (which must be a tuple of base classes). Object Protocol Print an object *o*, on file *fp*.  Returns ``-1`` on error.  The flags argument is used to enable certain printing options.  The only option currently supported is :const:`Py_PRINT_RAW`; if given, the :func:`str` of the object is written instead of the :func:`repr`. Properly handle returning :c:data:`Py_NotImplemented` from within a C function (that is, increment the reference count of NotImplemented and return it). Retrieve an attribute named *attr_name* from object *o*. Returns the attribute value on success, or *NULL* on failure.  This is the equivalent of the Python expression ``o.attr_name``. Retrieve an attribute named *attr_name* from object *o*. Returns the attribute value on success, or *NULL* on failure. This is the equivalent of the Python expression ``o.attr_name``. Return ``1`` if *inst* is an instance of the class *cls* or a subclass of *cls*, or ``0`` if not.  On error, returns ``-1`` and sets an exception. Return ``1`` if the class *derived* is identical to or derived from the class *cls*, otherwise return ``0``.  In case of an error, return ``-1``. Return an estimated length for the object *o*. First try to return its actual length, then an estimate using :meth:`~object.__length_hint__`, and finally return the default value. On error return ``-1``. This is the equivalent to the Python expression ``operator.length_hint(o, default)``. Return element of *o* corresponding to the object *key* or *NULL* on failure. This is the equivalent of the Python expression ``o[key]``. Return the length of object *o*.  If the object *o* provides either the sequence and mapping protocols, the sequence length is returned.  On error, ``-1`` is returned.  This is the equivalent to the Python expression ``len(o)``. Return true if the object *o* is of type *type* or a subtype of *type*.  Both parameters must be non-*NULL*. Returns ``0`` if the object *o* is considered to be true, and ``1`` otherwise. This is equivalent to the Python expression ``not o``.  On failure, return ``-1``. Returns ``1`` if *o* has the attribute *attr_name*, and ``0`` otherwise.  This is equivalent to the Python expression ``hasattr(o, attr_name)``.  This function always succeeds. Returns ``1`` if the object *o* is considered to be true, and ``0`` otherwise. This is equivalent to the Python expression ``not not o``.  On failure, return ``-1``. Set a :exc:`TypeError` indicating that ``type(o)`` is not hashable and return ``-1``. This function receives special treatment when stored in a ``tp_hash`` slot, allowing a type to explicitly indicate to the interpreter that it is not hashable. Set the value of the attribute named *attr_name*, for object *o*, to the value *v*. Raise an exception and return ``-1`` on failure; return ``0`` on success.  This is the equivalent of the Python statement ``o.attr_name = v``. The ``NotImplemented`` singleton, used to signal that an operation is not implemented for the given type combination. The return type is now Py_hash_t.  This is a signed integer the same size as Py_ssize_t. The type of *format* was changed from ``char *``. The types of *method* and *format* were changed from ``char *``. This function now includes a debug assertion to help ensure that it does not silently discard an active exception. This is equivalent to the Python expression ``dir(o)``, returning a (possibly empty) list of strings appropriate for the object argument, or *NULL* if there was an error.  If the argument is *NULL*, this is like the Python ``dir()``, returning the names of the current locals; in this case, if no execution frame is active then *NULL* is returned but :c:func:`PyErr_Occurred` will return false. This is equivalent to the Python expression ``iter(o)``. It returns a new iterator for the object argument, or the object  itself if the object is already an iterator.  Raises :exc:`TypeError` and returns *NULL* if the object cannot be iterated. When *o* is non-*NULL*, returns a type object corresponding to the object type of object *o*. On failure, raises :exc:`SystemError` and returns *NULL*.  This is equivalent to the Python expression ``type(o)``. This function increments the reference count of the return value. There's really no reason to use this function instead of the common expression ``o->ob_type``, which returns a pointer of type :c:type:`PyTypeObject\*`, except when the incremented reference count is needed. 