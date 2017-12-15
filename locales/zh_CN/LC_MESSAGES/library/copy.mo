��          �               �  &   �  0   �  �   �  �   j  G    u   I    �  Y   �  &  (     O     b  "   w  �   �     	     6	  �   T	  7   �	  �   7
  8  �
  a     Z   m  \   �  �  %  &   �  0     �   4  �   �  G  P  u   �      Y     &  w     �     �  "   �  �   �     j     �  �   �  7   N  �   �  8  !  a   Z  Z   �  \      **Source code:** :source:`Lib/copy.py` :mod:`copy` --- Shallow and deep copy operations A *deep copy* constructs a new compound object and then, recursively, inserts *copies* into it of the objects found in the original. A *shallow copy* constructs a new compound object and then (to the extent possible) inserts *references* into it to the objects found in the original. Assignment statements in Python do not copy objects, they create bindings between a target and an object. For collections that are mutable or contain mutable items, a copy is sometimes needed so one can change one copy without changing the other. This module provides generic shallow and deep copy operations (explained below). Because deep copy copies everything it may copy too much, such as data which is intended to be shared between copies. Classes can use the same interfaces to control copying that they use to control pickling.  See the description of module :mod:`pickle` for information on these methods.  In fact, the :mod:`copy` module uses the registered pickle functions from the :mod:`copyreg` module. Discussion of the special methods used to support object state retrieval and restoration. In order for a class to define its own copy implementation, it can define special methods :meth:`__copy__` and :meth:`__deepcopy__`.  The former is called to implement the shallow copy operation; no additional arguments are passed. The latter is called to implement the deep copy operation; it is passed one argument, the memo dictionary.  If the :meth:`__deepcopy__` implementation needs to make a deep copy of a component, it should call the :func:`deepcopy` function with the component as first argument and the memo dictionary as second argument. Interface summary: Module :mod:`pickle` Raised for module specific errors. Recursive objects (compound objects that, directly or indirectly, contain a reference to themselves) may cause a recursive loop. Return a deep copy of *x*. Return a shallow copy of *x*. Shallow copies of dictionaries can be made using :meth:`dict.copy`, and of lists by assigning a slice of the entire list, for example, ``copied_list = original_list[:]``. The :func:`deepcopy` function avoids these problems by: The difference between shallow and deep copying is only relevant for compound objects (objects that contain other objects, like lists or class instances): This module does not copy types like module, method, stack trace, stack frame, file, socket, window, array, or any similar types.  It does "copy" functions and classes (shallow and deeply), by returning the original object unchanged; this is compatible with the way these are treated by the :mod:`pickle` module. Two problems often exist with deep copy operations that don't exist with shallow copy operations: keeping a "memo" dictionary of objects already copied during the current copying pass; and letting user-defined classes override the copying operation or the set of components copied. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/copy.py` :mod:`copy` --- Shallow and deep copy operations A *deep copy* constructs a new compound object and then, recursively, inserts *copies* into it of the objects found in the original. A *shallow copy* constructs a new compound object and then (to the extent possible) inserts *references* into it to the objects found in the original. Assignment statements in Python do not copy objects, they create bindings between a target and an object. For collections that are mutable or contain mutable items, a copy is sometimes needed so one can change one copy without changing the other. This module provides generic shallow and deep copy operations (explained below). Because deep copy copies everything it may copy too much, such as data which is intended to be shared between copies. Classes can use the same interfaces to control copying that they use to control pickling.  See the description of module :mod:`pickle` for information on these methods.  In fact, the :mod:`copy` module uses the registered pickle functions from the :mod:`copyreg` module. Discussion of the special methods used to support object state retrieval and restoration. In order for a class to define its own copy implementation, it can define special methods :meth:`__copy__` and :meth:`__deepcopy__`.  The former is called to implement the shallow copy operation; no additional arguments are passed. The latter is called to implement the deep copy operation; it is passed one argument, the memo dictionary.  If the :meth:`__deepcopy__` implementation needs to make a deep copy of a component, it should call the :func:`deepcopy` function with the component as first argument and the memo dictionary as second argument. Interface summary: Module :mod:`pickle` Raised for module specific errors. Recursive objects (compound objects that, directly or indirectly, contain a reference to themselves) may cause a recursive loop. Return a deep copy of *x*. Return a shallow copy of *x*. Shallow copies of dictionaries can be made using :meth:`dict.copy`, and of lists by assigning a slice of the entire list, for example, ``copied_list = original_list[:]``. The :func:`deepcopy` function avoids these problems by: The difference between shallow and deep copying is only relevant for compound objects (objects that contain other objects, like lists or class instances): This module does not copy types like module, method, stack trace, stack frame, file, socket, window, array, or any similar types.  It does "copy" functions and classes (shallow and deeply), by returning the original object unchanged; this is compatible with the way these are treated by the :mod:`pickle` module. Two problems often exist with deep copy operations that don't exist with shallow copy operations: keeping a "memo" dictionary of objects already copied during the current copying pass; and letting user-defined classes override the copying operation or the set of components copied. 