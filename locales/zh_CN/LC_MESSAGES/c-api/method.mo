��          �               <  �   =  <   �     :  Q   R  I   �  E   �     4  �   C  �   �  �   �  D   d  =   �  6   �  l     ~   �  y   
  �   �  �    �   �	  <   �
     �
  Q   �
  I   *  E   t     �  �   �  �   y  �     D   �  =   /  6   m  l   �  ~     y   �  �   
   An instance method is a wrapper for a :c:data:`PyCFunction` and the new way to bind a :c:data:`PyCFunction` to a class object. It replaces the former call ``PyMethod_New(func, NULL, class)``. Clear the free list. Return the total number of freed items. Instance Method Objects Macro version of :c:func:`PyInstanceMethod_Function` which avoids error checking. Macro version of :c:func:`PyMethod_Function` which avoids error checking. Macro version of :c:func:`PyMethod_Self` which avoids error checking. Method Objects Methods are bound function objects. Methods are always bound to an instance of a user-defined class. Unbound methods (methods bound to a class object) are no longer available. Return a new instance method object, with *func* being any callable object *func* is the function that will be called when the instance method is called. Return a new method object, with *func* being any callable object and *self* the instance the method should be bound. *func* is the function that will be called when the method is called. *self* must not be *NULL*. Return the function object associated with the instance method *im*. Return the function object associated with the method *meth*. Return the instance associated with the method *meth*. Return true if *o* is a method object (has type :c:data:`PyMethod_Type`).  The parameter must not be *NULL*. Return true if *o* is an instance method object (has type :c:data:`PyInstanceMethod_Type`).  The parameter must not be *NULL*. This instance of :c:type:`PyTypeObject` represents the Python instance method type. It is not exposed to Python programs. This instance of :c:type:`PyTypeObject` represents the Python method type.  This is exposed to Python programs as ``types.MethodType``. Project-Id-Version: Python 3.6
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
 An instance method is a wrapper for a :c:data:`PyCFunction` and the new way to bind a :c:data:`PyCFunction` to a class object. It replaces the former call ``PyMethod_New(func, NULL, class)``. Clear the free list. Return the total number of freed items. Instance Method Objects Macro version of :c:func:`PyInstanceMethod_Function` which avoids error checking. Macro version of :c:func:`PyMethod_Function` which avoids error checking. Macro version of :c:func:`PyMethod_Self` which avoids error checking. Method Objects Methods are bound function objects. Methods are always bound to an instance of a user-defined class. Unbound methods (methods bound to a class object) are no longer available. Return a new instance method object, with *func* being any callable object *func* is the function that will be called when the instance method is called. Return a new method object, with *func* being any callable object and *self* the instance the method should be bound. *func* is the function that will be called when the method is called. *self* must not be *NULL*. Return the function object associated with the instance method *im*. Return the function object associated with the method *meth*. Return the instance associated with the method *meth*. Return true if *o* is a method object (has type :c:data:`PyMethod_Type`).  The parameter must not be *NULL*. Return true if *o* is an instance method object (has type :c:data:`PyInstanceMethod_Type`).  The parameter must not be *NULL*. This instance of :c:type:`PyTypeObject` represents the Python instance method type. It is not exposed to Python programs. This instance of :c:type:`PyTypeObject` represents the Python method type.  This is exposed to Python programs as ``types.MethodType``. 