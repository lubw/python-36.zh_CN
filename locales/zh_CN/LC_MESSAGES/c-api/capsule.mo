��                        �     �  d     2  k  t   �  �     �  �  �   �  �   P  �     �   �  /   r	  K   �	  ^   �	  I   M
  �   �
  �     b   �  e   V  _   �  5     P   R  6   �  4   �  �     S   �  �     �     >   �  �    �  �     C  d   L  2  �  t   �  �   Y  �  -  �   �  �   �  �   L  �     /   �  K   �  ^   4  I   �  �   �  �   a  b   9  e   �  _     5   b  P   �  6   �  4       �   U   S   !  �   b!  �   M"  >   
#  �  I#   Capsules Create a :c:type:`PyCapsule` encapsulating the *pointer*.  The *pointer* argument may not be *NULL*. Determines whether or not *capsule* is a valid capsule.  A valid capsule is non-*NULL*, passes :c:func:`PyCapsule_CheckExact`, has a non-*NULL* pointer stored in it, and its internal name matches the *name* parameter.  (See :c:func:`PyCapsule_GetPointer` for information on how capsule names are compared.) If the *destructor* argument is not *NULL*, it will be called with the capsule as its argument when it is destroyed. If this capsule will be stored as an attribute of a module, the *name* should be specified as ``modulename.attributename``.  This will enable other modules to import the capsule using :c:func:`PyCapsule_Import`. Import a pointer to a C object from a capsule attribute in a module.  The *name* parameter should specify the full name to the attribute, as in ``module.attribute``.  The *name* stored in the capsule must match this string exactly.  If *no_block* is true, import the module without blocking (using :c:func:`PyImport_ImportModuleNoBlock`).  If *no_block* is false, import the module conventionally (using :c:func:`PyImport_ImportModule`). In other words, if :c:func:`PyCapsule_IsValid` returns a true value, calls to any of the accessors (any function starting with :c:func:`PyCapsule_Get`) are guaranteed to succeed. It is legal for a capsule to have a *NULL* context.  This makes a *NULL* return code somewhat ambiguous; use :c:func:`PyCapsule_IsValid` or :c:func:`PyErr_Occurred` to disambiguate. It is legal for a capsule to have a *NULL* destructor.  This makes a *NULL* return code somewhat ambiguous; use :c:func:`PyCapsule_IsValid` or :c:func:`PyErr_Occurred` to disambiguate. It is legal for a capsule to have a *NULL* name.  This makes a *NULL* return code somewhat ambiguous; use :c:func:`PyCapsule_IsValid` or :c:func:`PyErr_Occurred` to disambiguate. On failure, set an exception and return *NULL*. Refer to :ref:`using-capsules` for more information on using these objects. Retrieve the *pointer* stored in the capsule.  On failure, set an exception and return *NULL*. Return ``0`` on success.  Return nonzero and set an exception on failure. Return a nonzero value if the object is valid and matches the name passed in. Return ``0`` otherwise.  This function will not fail. Return the capsule's internal *pointer* on success.  On failure, set an exception and return *NULL*.  However, if :c:func:`PyCapsule_Import` failed to import the module, and *no_block* was true, no exception is set. Return the current context stored in the capsule.  On failure, set an exception and return *NULL*. Return the current destructor stored in the capsule.  On failure, set an exception and return *NULL*. Return the current name stored in the capsule.  On failure, set an exception and return *NULL*. Return true if its argument is a :c:type:`PyCapsule`. See :c:func:`PyCapsule_New` for the semantics of PyCapsule_Destructor callbacks. Set the context pointer inside *capsule* to *context*. Set the destructor inside *capsule* to *destructor*. Set the name inside *capsule* to *name*.  If non-*NULL*, the name must outlive the capsule.  If the previous *name* stored in the capsule was not *NULL*, no attempt is made to free it. Set the void pointer inside *capsule* to *pointer*.  The pointer may not be *NULL*. The *name* parameter must compare exactly to the name stored in the capsule. If the name stored in the capsule is *NULL*, the *name* passed in must also be *NULL*.  Python uses the C function :c:func:`strcmp` to compare capsule names. The *name* string may either be *NULL* or a pointer to a valid C string.  If non-*NULL*, this string must outlive the capsule.  (Though it is permitted to free it inside the *destructor*.) The type of a destructor callback for a capsule.  Defined as:: This subtype of :c:type:`PyObject` represents an opaque value, useful for C extension modules who need to pass an opaque value (as a :c:type:`void\*` pointer) through Python code to other C code.  It is often used to make a C function pointer defined in one module available to other modules, so the regular import mechanism can be used to access C APIs defined in dynamically loaded modules. Project-Id-Version: Python 3.6
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
 Capsules Create a :c:type:`PyCapsule` encapsulating the *pointer*.  The *pointer* argument may not be *NULL*. Determines whether or not *capsule* is a valid capsule.  A valid capsule is non-*NULL*, passes :c:func:`PyCapsule_CheckExact`, has a non-*NULL* pointer stored in it, and its internal name matches the *name* parameter.  (See :c:func:`PyCapsule_GetPointer` for information on how capsule names are compared.) If the *destructor* argument is not *NULL*, it will be called with the capsule as its argument when it is destroyed. If this capsule will be stored as an attribute of a module, the *name* should be specified as ``modulename.attributename``.  This will enable other modules to import the capsule using :c:func:`PyCapsule_Import`. Import a pointer to a C object from a capsule attribute in a module.  The *name* parameter should specify the full name to the attribute, as in ``module.attribute``.  The *name* stored in the capsule must match this string exactly.  If *no_block* is true, import the module without blocking (using :c:func:`PyImport_ImportModuleNoBlock`).  If *no_block* is false, import the module conventionally (using :c:func:`PyImport_ImportModule`). In other words, if :c:func:`PyCapsule_IsValid` returns a true value, calls to any of the accessors (any function starting with :c:func:`PyCapsule_Get`) are guaranteed to succeed. It is legal for a capsule to have a *NULL* context.  This makes a *NULL* return code somewhat ambiguous; use :c:func:`PyCapsule_IsValid` or :c:func:`PyErr_Occurred` to disambiguate. It is legal for a capsule to have a *NULL* destructor.  This makes a *NULL* return code somewhat ambiguous; use :c:func:`PyCapsule_IsValid` or :c:func:`PyErr_Occurred` to disambiguate. It is legal for a capsule to have a *NULL* name.  This makes a *NULL* return code somewhat ambiguous; use :c:func:`PyCapsule_IsValid` or :c:func:`PyErr_Occurred` to disambiguate. On failure, set an exception and return *NULL*. Refer to :ref:`using-capsules` for more information on using these objects. Retrieve the *pointer* stored in the capsule.  On failure, set an exception and return *NULL*. Return ``0`` on success.  Return nonzero and set an exception on failure. Return a nonzero value if the object is valid and matches the name passed in. Return ``0`` otherwise.  This function will not fail. Return the capsule's internal *pointer* on success.  On failure, set an exception and return *NULL*.  However, if :c:func:`PyCapsule_Import` failed to import the module, and *no_block* was true, no exception is set. Return the current context stored in the capsule.  On failure, set an exception and return *NULL*. Return the current destructor stored in the capsule.  On failure, set an exception and return *NULL*. Return the current name stored in the capsule.  On failure, set an exception and return *NULL*. Return true if its argument is a :c:type:`PyCapsule`. See :c:func:`PyCapsule_New` for the semantics of PyCapsule_Destructor callbacks. Set the context pointer inside *capsule* to *context*. Set the destructor inside *capsule* to *destructor*. Set the name inside *capsule* to *name*.  If non-*NULL*, the name must outlive the capsule.  If the previous *name* stored in the capsule was not *NULL*, no attempt is made to free it. Set the void pointer inside *capsule* to *pointer*.  The pointer may not be *NULL*. The *name* parameter must compare exactly to the name stored in the capsule. If the name stored in the capsule is *NULL*, the *name* passed in must also be *NULL*.  Python uses the C function :c:func:`strcmp` to compare capsule names. The *name* string may either be *NULL* or a pointer to a valid C string.  If non-*NULL*, this string must outlive the capsule.  (Though it is permitted to free it inside the *destructor*.) The type of a destructor callback for a capsule.  Defined as:: This subtype of :c:type:`PyObject` represents an opaque value, useful for C extension modules who need to pass an opaque value (as a :c:type:`void\*` pointer) through Python code to other C code.  It is often used to make a C function pointer defined in one module available to other modules, so the regular import mechanism can be used to access C APIs defined in dynamically loaded modules. 