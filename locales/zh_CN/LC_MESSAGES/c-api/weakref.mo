��          t               �   �   �   I  �  K    x   _  &   �  *   �  :   *  a   e  �   �     �  �  �  �   t
  I  p  K  �  x     &     *   �  :   �  a     �   n     M   Python supports *weak references* as first-class objects.  There are two specific object types which directly implement weak references.  The first is a simple reference object, and the second acts as a proxy for the original object as much as it can. Return a weak reference object for the object *ob*.  This will always return a new reference, but is not guaranteed to create a new object; an existing reference object may be returned.  The second parameter, *callback*, can be a callable object that receives notification when *ob* is garbage collected; it should accept a single parameter, which will be the weak reference object itself. *callback* may also be ``None`` or *NULL*.  If *ob* is not a weakly-referencable object, or if *callback* is not callable, ``None``, or *NULL*, this will return *NULL* and raise :exc:`TypeError`. Return a weak reference proxy object for the object *ob*.  This will always return a new reference, but is not guaranteed to create a new object; an existing proxy object may be returned.  The second parameter, *callback*, can be a callable object that receives notification when *ob* is garbage collected; it should accept a single parameter, which will be the weak reference object itself. *callback* may also be ``None`` or *NULL*.  If *ob* is not a weakly-referencable object, or if *callback* is not callable, ``None``, or *NULL*, this will return *NULL* and raise :exc:`TypeError`. Return the referenced object from a weak reference, *ref*.  If the referent is no longer live, returns :const:`Py_None`. Return true if *ob* is a proxy object. Return true if *ob* is a reference object. Return true if *ob* is either a reference or proxy object. Similar to :c:func:`PyWeakref_GetObject`, but implemented as a macro that does no error checking. This function returns a **borrowed reference** to the referenced object. This means that you should always call :c:func:`Py_INCREF` on the object except if you know that it cannot be destroyed while you are still using it. Weak Reference Objects Project-Id-Version: Python 3.6
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
 Python supports *weak references* as first-class objects.  There are two specific object types which directly implement weak references.  The first is a simple reference object, and the second acts as a proxy for the original object as much as it can. Return a weak reference object for the object *ob*.  This will always return a new reference, but is not guaranteed to create a new object; an existing reference object may be returned.  The second parameter, *callback*, can be a callable object that receives notification when *ob* is garbage collected; it should accept a single parameter, which will be the weak reference object itself. *callback* may also be ``None`` or *NULL*.  If *ob* is not a weakly-referencable object, or if *callback* is not callable, ``None``, or *NULL*, this will return *NULL* and raise :exc:`TypeError`. Return a weak reference proxy object for the object *ob*.  This will always return a new reference, but is not guaranteed to create a new object; an existing proxy object may be returned.  The second parameter, *callback*, can be a callable object that receives notification when *ob* is garbage collected; it should accept a single parameter, which will be the weak reference object itself. *callback* may also be ``None`` or *NULL*.  If *ob* is not a weakly-referencable object, or if *callback* is not callable, ``None``, or *NULL*, this will return *NULL* and raise :exc:`TypeError`. Return the referenced object from a weak reference, *ref*.  If the referent is no longer live, returns :const:`Py_None`. Return true if *ob* is a proxy object. Return true if *ob* is a reference object. Return true if *ob* is either a reference or proxy object. Similar to :c:func:`PyWeakref_GetObject`, but implemented as a macro that does no error checking. This function returns a **borrowed reference** to the referenced object. This means that you should always call :c:func:`Py_INCREF` on the object except if you know that it cannot be destroyed while you are still using it. Weak Reference Objects 