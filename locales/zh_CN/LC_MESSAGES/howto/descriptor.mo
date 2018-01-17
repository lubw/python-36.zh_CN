��    I      d              �  j   �       Y   0     �  *  �     �     �     �  �   �  �  �     	  p  	  0  �
     �     �     �       r    �   �  {  /  A  �  �  �     �  [   �  �   D  >  8     w  �   �  w   ?  B   �  
   �  �        �  M   �  f   �      V  2  w  �   �  �   T  )  �  �    L   �  K   �  %  =   �   c!  %   "  �  ,"  �   �#  I  �$  C   !&    e&  �   t'  r   t(    �(     �)  �   *  k   �*  l   1+  (   �+  1   �+  ,   �+     &,  7   2,  >   j,  	   �,     �,     �,     �,     �,  @   �,  G   2-     z-  �  �-  j   >/     �/  Y   �/     0  *  $0     O1     V1     j1  �   �1  �  2     �3  p  �3  0  5     O6     k6     ~6     �6  r  �6  �   8  {  �8  A  <:  �  ~<     c>  [   y>  �   �>  >  �?     A  �   A  w   �A  B   HB  
   �B  �   �B      C  M   2C  f   �C      �C  2  D  �   ;E  �   �E  )  �F  �  �H  L   5J  K   �J  %  �J  �   �K  %   �L  �  �L  �   iN  I  hO  C   �P    �P  �   R  r   S    xS     �T  �   �T  k   VU  l   �U  (   /V  1   XV  ,   �V     �V  7   �V  >   �V  	   :W     DW     UW     dW     yW  @   �W  G   �W     X   :meth:`object.__getattribute__` and :meth:`type.__getattribute__` make different calls to :meth:`__get__`. <python at rcn dot com> A descriptor can be called directly by its method name.  For example, ``d.__get__(obj)``. Abstract Alternatively, it is more common for a descriptor to be invoked automatically upon attribute access.  For example, ``obj.d`` looks up ``d`` in the dictionary of ``obj``.  If ``d`` defines the method :meth:`__get__`, then ``d.__get__(obj)`` is invoked according to the precedence rules listed below. Author Called from a Class Called from an Object Calling :func:`property` is a succinct way of building a data descriptor that triggers function calls upon access to an attribute.  Its signature is:: Class dictionaries store methods as functions.  In a class definition, methods are written using :keyword:`def` or :keyword:`lambda`, the usual tools for creating functions.  Methods only differ from regular functions in that the first argument is reserved for the object instance.  By Python convention, the instance reference is called *self* but may be called *this* or any other variable name. Contact Data and non-data descriptors differ in how overrides are calculated with respect to entries in an instance's dictionary.  If an instance's dictionary has an entry with the same name as a data descriptor, the data descriptor takes precedence.  If an instance's dictionary has an entry with the same name as a non-data descriptor, the dictionary entry takes precedence. Defines descriptors, summarizes the protocol, and shows how descriptors are called.  Examines a custom descriptor and several built-in python descriptors including functions, properties, static methods, and class methods.  Shows how each works by giving a pure Python equivalent and a sample application. Definition and Introduction Descriptor Example Descriptor HowTo Guide Descriptor Protocol Descriptors are a powerful, general purpose protocol.  They are the mechanism behind properties, methods, static methods, class methods, and :func:`super()`. They are used throughout Python itself to implement the new style classes introduced in version 2.2.  Descriptors simplify the underlying C-code and offer a flexible set of new tools for everyday Python programs. For classes, the machinery is in :meth:`type.__getattribute__` which transforms ``B.x`` into ``B.__dict__['x'].__get__(None, B)``.  In pure Python, it looks like:: For instance, a spreadsheet class may grant access to a cell value through ``Cell('b10').value``. Subsequent improvements to the program require the cell to be recalculated on every access; however, the programmer does not want to affect existing client code accessing the attribute directly.  The solution is to wrap access to the value attribute in a property data descriptor:: For instance, a statistics package may include a container class for experimental data.  The class provides normal methods for computing the average, mean, median, and other descriptive statistics that depend on the data. However, there may be useful functions which are conceptually related but do not depend on the data.  For instance, ``erf(x)`` is handy conversion routine that comes up in statistical work but does not directly depend on a particular dataset. It can be called either from an object or the class:  ``s.erf(1.5) --> .9332`` or ``Sample.erf(1.5) --> .9332``. For objects, the machinery is in :meth:`object.__getattribute__` which transforms ``b.x`` into ``type(b).__dict__['x'].__get__(b, type(b))``.  The implementation works through a precedence chain that gives data descriptors priority over instance variables, instance variables priority over non-data descriptors, and assigns lowest priority to :meth:`__getattr__` if provided. The full C implementation can be found in :c:func:`PyObject_GenericGetAttr()` in :source:`Objects/object.c`. Functions and Methods Good candidates for static methods are methods that do not reference the ``self`` variable. If an object defines both :meth:`__get__` and :meth:`__set__`, it is considered a data descriptor.  Descriptors that only define :meth:`__get__` are called non-data descriptors (they are typically used for methods but other uses are possible). In general, a descriptor is an object attribute with "binding behavior", one whose attribute access has been overridden by methods in the descriptor protocol.  Those methods are :meth:`__get__`, :meth:`__set__`, and :meth:`__delete__`.  If any of those methods are defined for an object, it is said to be a descriptor. Invoking Descriptors Learning about descriptors not only provides access to a larger toolset, it creates a deeper understanding of how Python works and an appreciation for the elegance of its design. Non-data descriptors provide a simple mechanism for variations on the usual patterns of binding functions into methods. Now a new dictionary of unique keys can be constructed like this:: Properties Python's object oriented features are built upon a function based environment. Using non-data descriptors, the two are merged seamlessly. Raymond Hettinger Running the interpreter shows how the function descriptor works in practice:: Since staticmethods return the underlying function with no changes, the example calls are unexciting:: Static Methods and Class Methods Static methods return the underlying function without changes.  Calling either ``c.f`` or ``C.f`` is the equivalent of a direct lookup into ``object.__getattribute__(c, "f")`` or ``object.__getattribute__(C, "f")``. As a result, the function becomes identically accessible from either an object or a class. That is all there is to it.  Define any of these methods and an object is considered a descriptor and can override default behavior upon being looked up as an attribute. The :func:`property` builtin helps whenever a user interface has granted attribute access and then subsequent changes require the intervention of a method. The default behavior for attribute access is to get, set, or delete the attribute from an object's dictionary.  For instance, ``a.x`` has a lookup chain starting with ``a.__dict__['x']``, then ``type(a).__dict__['x']``, and continuing through the base classes of ``type(a)`` excluding metaclasses. If the looked-up value is an object defining one of the descriptor methods, then Python may override the default behavior and invoke the descriptor method instead. Where this occurs in the precedence chain depends on which descriptor methods were defined. The details above show that the mechanism for descriptors is embedded in the :meth:`__getattribute__()` methods for :class:`object`, :class:`type`, and :func:`super`.  Classes inherit this machinery when they derive from :class:`object` or if they have a meta-class providing similar functionality. Likewise, classes can turn-off descriptor invocation by overriding :meth:`__getattribute__()`. The details of invocation depend on whether ``obj`` is an object or a class. The documentation shows a typical use to define a managed attribute ``x``:: The following code creates a class whose objects are data descriptors which print a message for each get or set.  Overriding :meth:`__getattribute__` is alternate approach that could do this for every attribute.  However, this descriptor is useful for monitoring just a few chosen attributes:: The implementation details are in :c:func:`super_getattro()` in :source:`Objects/typeobject.c`.  and a pure Python equivalent can be found in `Guido's Tutorial`_. The important points to remember are: The object returned by ``super()`` also has a custom :meth:`__getattribute__` method for invoking descriptors.  The call ``super(B, obj).m()`` searches ``obj.__class__.__mro__`` for the base class ``A`` immediately following ``B`` and then returns ``A.__dict__['m'].__get__(obj, B)``.  If not a descriptor, ``m`` is returned unchanged.  If not in the dictionary, ``m`` reverts to a search using :meth:`object.__getattribute__`. The protocol is simple and offers exciting possibilities.  Several use cases are so common that they have been packaged into individual function calls. Properties, bound methods, static methods, and class methods are all based on the descriptor protocol. This behavior is useful whenever the function only needs to have a class reference and does not care about any underlying data.  One use for classmethods is to create alternate class constructors.  In Python 2.3, the classmethod :func:`dict.fromkeys` creates a new dictionary from a list of keys.  The pure Python equivalent is:: This chart summarizes the binding and its two most useful variants: To make a read-only data descriptor, define both :meth:`__get__` and :meth:`__set__` with the :meth:`__set__` raising an :exc:`AttributeError` when called.  Defining the :meth:`__set__` method with an exception raising placeholder is enough to make it a data descriptor. To recap, functions have a :meth:`__get__` method so that they can be converted to a method when accessed as attributes.  The non-data descriptor transforms an ``obj.f(*args)`` call into ``f(obj, *args)``.  Calling ``klass.f(*args)`` becomes ``f(*args)``. To see how :func:`property` is implemented in terms of the descriptor protocol, here is a pure Python equivalent:: To support method calls, functions include the :meth:`__get__` method for binding methods during attribute access.  This means that all functions are non-data descriptors which return bound methods when they are invoked from an object.  In pure python, it works like this:: Transformation Unlike static methods, class methods prepend the class reference to the argument list before calling the function.  This format is the same for whether the caller is an object or a class:: Using the non-data descriptor protocol, a pure Python version of :func:`classmethod` would look like this:: Using the non-data descriptor protocol, a pure Python version of :func:`staticmethod` would look like this:: ``descr.__delete__(self, obj) --> None`` ``descr.__get__(self, obj, type=None) --> value`` ``descr.__set__(self, obj, value) --> None`` classmethod data descriptors always override instance dictionaries. descriptors are invoked by the :meth:`__getattribute__` method f(\*args) f(klass, \*args) f(obj, \*args) f(type(obj), \*args) function non-data descriptors may be overridden by instance dictionaries. overriding :meth:`__getattribute__` prevents automatic descriptor calls staticmethod Project-Id-Version: Python 3.6
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
 :meth:`object.__getattribute__` and :meth:`type.__getattribute__` make different calls to :meth:`__get__`. <python at rcn dot com> A descriptor can be called directly by its method name.  For example, ``d.__get__(obj)``. Abstract Alternatively, it is more common for a descriptor to be invoked automatically upon attribute access.  For example, ``obj.d`` looks up ``d`` in the dictionary of ``obj``.  If ``d`` defines the method :meth:`__get__`, then ``d.__get__(obj)`` is invoked according to the precedence rules listed below. Author Called from a Class Called from an Object Calling :func:`property` is a succinct way of building a data descriptor that triggers function calls upon access to an attribute.  Its signature is:: Class dictionaries store methods as functions.  In a class definition, methods are written using :keyword:`def` or :keyword:`lambda`, the usual tools for creating functions.  Methods only differ from regular functions in that the first argument is reserved for the object instance.  By Python convention, the instance reference is called *self* but may be called *this* or any other variable name. Contact Data and non-data descriptors differ in how overrides are calculated with respect to entries in an instance's dictionary.  If an instance's dictionary has an entry with the same name as a data descriptor, the data descriptor takes precedence.  If an instance's dictionary has an entry with the same name as a non-data descriptor, the dictionary entry takes precedence. Defines descriptors, summarizes the protocol, and shows how descriptors are called.  Examines a custom descriptor and several built-in python descriptors including functions, properties, static methods, and class methods.  Shows how each works by giving a pure Python equivalent and a sample application. Definition and Introduction Descriptor Example Descriptor HowTo Guide Descriptor Protocol Descriptors are a powerful, general purpose protocol.  They are the mechanism behind properties, methods, static methods, class methods, and :func:`super()`. They are used throughout Python itself to implement the new style classes introduced in version 2.2.  Descriptors simplify the underlying C-code and offer a flexible set of new tools for everyday Python programs. For classes, the machinery is in :meth:`type.__getattribute__` which transforms ``B.x`` into ``B.__dict__['x'].__get__(None, B)``.  In pure Python, it looks like:: For instance, a spreadsheet class may grant access to a cell value through ``Cell('b10').value``. Subsequent improvements to the program require the cell to be recalculated on every access; however, the programmer does not want to affect existing client code accessing the attribute directly.  The solution is to wrap access to the value attribute in a property data descriptor:: For instance, a statistics package may include a container class for experimental data.  The class provides normal methods for computing the average, mean, median, and other descriptive statistics that depend on the data. However, there may be useful functions which are conceptually related but do not depend on the data.  For instance, ``erf(x)`` is handy conversion routine that comes up in statistical work but does not directly depend on a particular dataset. It can be called either from an object or the class:  ``s.erf(1.5) --> .9332`` or ``Sample.erf(1.5) --> .9332``. For objects, the machinery is in :meth:`object.__getattribute__` which transforms ``b.x`` into ``type(b).__dict__['x'].__get__(b, type(b))``.  The implementation works through a precedence chain that gives data descriptors priority over instance variables, instance variables priority over non-data descriptors, and assigns lowest priority to :meth:`__getattr__` if provided. The full C implementation can be found in :c:func:`PyObject_GenericGetAttr()` in :source:`Objects/object.c`. Functions and Methods Good candidates for static methods are methods that do not reference the ``self`` variable. If an object defines both :meth:`__get__` and :meth:`__set__`, it is considered a data descriptor.  Descriptors that only define :meth:`__get__` are called non-data descriptors (they are typically used for methods but other uses are possible). In general, a descriptor is an object attribute with "binding behavior", one whose attribute access has been overridden by methods in the descriptor protocol.  Those methods are :meth:`__get__`, :meth:`__set__`, and :meth:`__delete__`.  If any of those methods are defined for an object, it is said to be a descriptor. Invoking Descriptors Learning about descriptors not only provides access to a larger toolset, it creates a deeper understanding of how Python works and an appreciation for the elegance of its design. Non-data descriptors provide a simple mechanism for variations on the usual patterns of binding functions into methods. Now a new dictionary of unique keys can be constructed like this:: Properties Python's object oriented features are built upon a function based environment. Using non-data descriptors, the two are merged seamlessly. Raymond Hettinger Running the interpreter shows how the function descriptor works in practice:: Since staticmethods return the underlying function with no changes, the example calls are unexciting:: Static Methods and Class Methods Static methods return the underlying function without changes.  Calling either ``c.f`` or ``C.f`` is the equivalent of a direct lookup into ``object.__getattribute__(c, "f")`` or ``object.__getattribute__(C, "f")``. As a result, the function becomes identically accessible from either an object or a class. That is all there is to it.  Define any of these methods and an object is considered a descriptor and can override default behavior upon being looked up as an attribute. The :func:`property` builtin helps whenever a user interface has granted attribute access and then subsequent changes require the intervention of a method. The default behavior for attribute access is to get, set, or delete the attribute from an object's dictionary.  For instance, ``a.x`` has a lookup chain starting with ``a.__dict__['x']``, then ``type(a).__dict__['x']``, and continuing through the base classes of ``type(a)`` excluding metaclasses. If the looked-up value is an object defining one of the descriptor methods, then Python may override the default behavior and invoke the descriptor method instead. Where this occurs in the precedence chain depends on which descriptor methods were defined. The details above show that the mechanism for descriptors is embedded in the :meth:`__getattribute__()` methods for :class:`object`, :class:`type`, and :func:`super`.  Classes inherit this machinery when they derive from :class:`object` or if they have a meta-class providing similar functionality. Likewise, classes can turn-off descriptor invocation by overriding :meth:`__getattribute__()`. The details of invocation depend on whether ``obj`` is an object or a class. The documentation shows a typical use to define a managed attribute ``x``:: The following code creates a class whose objects are data descriptors which print a message for each get or set.  Overriding :meth:`__getattribute__` is alternate approach that could do this for every attribute.  However, this descriptor is useful for monitoring just a few chosen attributes:: The implementation details are in :c:func:`super_getattro()` in :source:`Objects/typeobject.c`.  and a pure Python equivalent can be found in `Guido's Tutorial`_. The important points to remember are: The object returned by ``super()`` also has a custom :meth:`__getattribute__` method for invoking descriptors.  The call ``super(B, obj).m()`` searches ``obj.__class__.__mro__`` for the base class ``A`` immediately following ``B`` and then returns ``A.__dict__['m'].__get__(obj, B)``.  If not a descriptor, ``m`` is returned unchanged.  If not in the dictionary, ``m`` reverts to a search using :meth:`object.__getattribute__`. The protocol is simple and offers exciting possibilities.  Several use cases are so common that they have been packaged into individual function calls. Properties, bound methods, static methods, and class methods are all based on the descriptor protocol. This behavior is useful whenever the function only needs to have a class reference and does not care about any underlying data.  One use for classmethods is to create alternate class constructors.  In Python 2.3, the classmethod :func:`dict.fromkeys` creates a new dictionary from a list of keys.  The pure Python equivalent is:: This chart summarizes the binding and its two most useful variants: To make a read-only data descriptor, define both :meth:`__get__` and :meth:`__set__` with the :meth:`__set__` raising an :exc:`AttributeError` when called.  Defining the :meth:`__set__` method with an exception raising placeholder is enough to make it a data descriptor. To recap, functions have a :meth:`__get__` method so that they can be converted to a method when accessed as attributes.  The non-data descriptor transforms an ``obj.f(*args)`` call into ``f(obj, *args)``.  Calling ``klass.f(*args)`` becomes ``f(*args)``. To see how :func:`property` is implemented in terms of the descriptor protocol, here is a pure Python equivalent:: To support method calls, functions include the :meth:`__get__` method for binding methods during attribute access.  This means that all functions are non-data descriptors which return bound methods when they are invoked from an object.  In pure python, it works like this:: Transformation Unlike static methods, class methods prepend the class reference to the argument list before calling the function.  This format is the same for whether the caller is an object or a class:: Using the non-data descriptor protocol, a pure Python version of :func:`classmethod` would look like this:: Using the non-data descriptor protocol, a pure Python version of :func:`staticmethod` would look like this:: ``descr.__delete__(self, obj) --> None`` ``descr.__get__(self, obj, type=None) --> value`` ``descr.__set__(self, obj, value) --> None`` classmethod data descriptors always override instance dictionaries. descriptors are invoked by the :meth:`__getattribute__` method f(\*args) f(klass, \*args) f(obj, \*args) f(type(obj), \*args) function non-data descriptors may be overridden by instance dictionaries. overriding :meth:`__getattribute__` prevents automatic descriptor calls staticmethod 