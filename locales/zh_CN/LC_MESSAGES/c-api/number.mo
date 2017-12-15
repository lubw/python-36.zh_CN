��    )      d              �  �  �     H  N  X  �  �  z   /  �   �  f   B     �  o   )	  �   �	  �   \
  �   �
  �   �  �   E  �     s   �  �     �   �  u     ~   �  @    �   U  u     �   �  �   N  �   �     �  �     �   �  �   h  �   3  �   �  �   �  �     �   �  �   g  �   &  �   �  �  6    �  �  �  �  �      4"  N  D"  �  �#  z   %  �   �%  f   .&     �&  o   '  �   �'  �   H(  �   �(  �   �)  �   1*  �   �*  s   }+  �   �+  �   },  u   -  ~   �-  @   .  �   A/  u   0  �   }0  �   :1  �   �1     w2  �   �2  �   �3  �   T4  �   5  �   �5  �   o6  �   �6  �   �7  �   S8  �   9  �   �9  �  ":    �;   If *o* can be converted to a Python int but the attempt to convert to a Py_ssize_t value would raise an :exc:`OverflowError`, then the *exc* argument is the type of exception that will be raised (usually :exc:`IndexError` or :exc:`OverflowError`).  If *exc* is *NULL*, then the exception is cleared and the value is clipped to *PY_SSIZE_T_MIN* for a negative integer or *PY_SSIZE_T_MAX* for a positive integer. Number Protocol Return a reasonable approximation for the mathematical value of *o1* divided by *o2*, or *NULL* on failure.  The return value is "approximate" because binary floating point numbers are approximate; it is not possible to represent all real numbers in base two.  This function can return a floating point value when passed two integers. Return a reasonable approximation for the mathematical value of *o1* divided by *o2*, or *NULL* on failure.  The return value is "approximate" because binary floating point numbers are approximate; it is not possible to represent all real numbers in base two.  This function can return a floating point value when passed two integers.  The operation is done *in-place* when *o1* supports it. Return the floor of *o1* divided by *o2*, or *NULL* on failure.  This is equivalent to the "classic" division of integers. Returns *o* converted to a Py_ssize_t value if *o* can be interpreted as an integer.  If the call fails, an exception is raised and ``-1`` is returned. Returns *o* on success, or *NULL* on failure.  This is the equivalent of the Python expression ``+o``. Returns ``1`` if *o* is an index integer (has the nb_index slot of  the tp_as_number structure filled in), and ``0`` otherwise. Returns ``1`` if the object *o* provides numeric protocols, and false otherwise. This function always succeeds. Returns the "bitwise and" of *o1* and *o2* on success and *NULL* on failure. The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 &= o2``. Returns the "bitwise and" of *o1* and *o2* on success and *NULL* on failure. This is the equivalent of the Python expression ``o1 & o2``. Returns the "bitwise exclusive or" of *o1* by *o2* on success, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 ^= o2``. Returns the "bitwise exclusive or" of *o1* by *o2* on success, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 ^ o2``. Returns the "bitwise or" of *o1* and *o2* on success, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 |= o2``. Returns the "bitwise or" of *o1* and *o2* on success, or *NULL* on failure. This is the equivalent of the Python expression ``o1 | o2``. Returns the *o* converted to a Python int on success or *NULL* with a :exc:`TypeError` exception raised on failure. Returns the *o* converted to a float object on success, or *NULL* on failure. This is the equivalent of the Python expression ``float(o)``. Returns the *o* converted to an integer object on success, or *NULL* on failure.  This is the equivalent of the Python expression ``int(o)``. Returns the absolute value of *o*, or *NULL* on failure.  This is the equivalent of the Python expression ``abs(o)``. Returns the bitwise negation of *o* on success, or *NULL* on failure.  This is the equivalent of the Python expression ``~o``. Returns the integer *n* converted to base *base* as a string.  The *base* argument must be one of 2, 8, 10, or 16.  For base 2, 8, or 16, the returned string is prefixed with a base marker of ``'0b'``, ``'0o'``, or ``'0x'``, respectively.  If *n* is not a Python int, it is converted with :c:func:`PyNumber_Index` first. Returns the mathematical floor of dividing *o1* by *o2*, or *NULL* on failure. The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 //= o2``. Returns the negation of *o* on success, or *NULL* on failure. This is the equivalent of the Python expression ``-o``. Returns the remainder of dividing *o1* by *o2*, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 %= o2``. Returns the remainder of dividing *o1* by *o2*, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 % o2``. Returns the result of adding *o1* and *o2*, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 += o2``. Returns the result of adding *o1* and *o2*, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 + o2``. Returns the result of left shifting *o1* by *o2* on success, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 <<= o2``. Returns the result of left shifting *o1* by *o2* on success, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 << o2``. Returns the result of matrix multiplication on *o1* and *o2*, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 @= o2``. Returns the result of matrix multiplication on *o1* and *o2*, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 @ o2``. Returns the result of multiplying *o1* and *o2*, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 *= o2``. Returns the result of multiplying *o1* and *o2*, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 * o2``. Returns the result of right shifting *o1* by *o2* on success, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 >>= o2``. Returns the result of right shifting *o1* by *o2* on success, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 >> o2``. Returns the result of subtracting *o2* from *o1*, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 -= o2``. Returns the result of subtracting *o2* from *o1*, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 - o2``. See the built-in function :func:`divmod`. Returns *NULL* on failure.  This is the equivalent of the Python expression ``divmod(o1, o2)``. See the built-in function :func:`pow`. Returns *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 **= o2`` when o3 is :c:data:`Py_None`, or an in-place variant of ``pow(o1, o2, o3)`` otherwise. If *o3* is to be ignored, pass :c:data:`Py_None` in its place (passing *NULL* for *o3* would cause an illegal memory access). See the built-in function :func:`pow`. Returns *NULL* on failure.  This is the equivalent of the Python expression ``pow(o1, o2, o3)``, where *o3* is optional. If *o3* is to be ignored, pass :c:data:`Py_None` in its place (passing *NULL* for *o3* would cause an illegal memory access). Project-Id-Version: Python 3.6
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
 If *o* can be converted to a Python int but the attempt to convert to a Py_ssize_t value would raise an :exc:`OverflowError`, then the *exc* argument is the type of exception that will be raised (usually :exc:`IndexError` or :exc:`OverflowError`).  If *exc* is *NULL*, then the exception is cleared and the value is clipped to *PY_SSIZE_T_MIN* for a negative integer or *PY_SSIZE_T_MAX* for a positive integer. Number Protocol Return a reasonable approximation for the mathematical value of *o1* divided by *o2*, or *NULL* on failure.  The return value is "approximate" because binary floating point numbers are approximate; it is not possible to represent all real numbers in base two.  This function can return a floating point value when passed two integers. Return a reasonable approximation for the mathematical value of *o1* divided by *o2*, or *NULL* on failure.  The return value is "approximate" because binary floating point numbers are approximate; it is not possible to represent all real numbers in base two.  This function can return a floating point value when passed two integers.  The operation is done *in-place* when *o1* supports it. Return the floor of *o1* divided by *o2*, or *NULL* on failure.  This is equivalent to the "classic" division of integers. Returns *o* converted to a Py_ssize_t value if *o* can be interpreted as an integer.  If the call fails, an exception is raised and ``-1`` is returned. Returns *o* on success, or *NULL* on failure.  This is the equivalent of the Python expression ``+o``. Returns ``1`` if *o* is an index integer (has the nb_index slot of  the tp_as_number structure filled in), and ``0`` otherwise. Returns ``1`` if the object *o* provides numeric protocols, and false otherwise. This function always succeeds. Returns the "bitwise and" of *o1* and *o2* on success and *NULL* on failure. The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 &= o2``. Returns the "bitwise and" of *o1* and *o2* on success and *NULL* on failure. This is the equivalent of the Python expression ``o1 & o2``. Returns the "bitwise exclusive or" of *o1* by *o2* on success, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 ^= o2``. Returns the "bitwise exclusive or" of *o1* by *o2* on success, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 ^ o2``. Returns the "bitwise or" of *o1* and *o2* on success, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 |= o2``. Returns the "bitwise or" of *o1* and *o2* on success, or *NULL* on failure. This is the equivalent of the Python expression ``o1 | o2``. Returns the *o* converted to a Python int on success or *NULL* with a :exc:`TypeError` exception raised on failure. Returns the *o* converted to a float object on success, or *NULL* on failure. This is the equivalent of the Python expression ``float(o)``. Returns the *o* converted to an integer object on success, or *NULL* on failure.  This is the equivalent of the Python expression ``int(o)``. Returns the absolute value of *o*, or *NULL* on failure.  This is the equivalent of the Python expression ``abs(o)``. Returns the bitwise negation of *o* on success, or *NULL* on failure.  This is the equivalent of the Python expression ``~o``. Returns the integer *n* converted to base *base* as a string.  The *base* argument must be one of 2, 8, 10, or 16.  For base 2, 8, or 16, the returned string is prefixed with a base marker of ``'0b'``, ``'0o'``, or ``'0x'``, respectively.  If *n* is not a Python int, it is converted with :c:func:`PyNumber_Index` first. Returns the mathematical floor of dividing *o1* by *o2*, or *NULL* on failure. The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 //= o2``. Returns the negation of *o* on success, or *NULL* on failure. This is the equivalent of the Python expression ``-o``. Returns the remainder of dividing *o1* by *o2*, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 %= o2``. Returns the remainder of dividing *o1* by *o2*, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 % o2``. Returns the result of adding *o1* and *o2*, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 += o2``. Returns the result of adding *o1* and *o2*, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 + o2``. Returns the result of left shifting *o1* by *o2* on success, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 <<= o2``. Returns the result of left shifting *o1* by *o2* on success, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 << o2``. Returns the result of matrix multiplication on *o1* and *o2*, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 @= o2``. Returns the result of matrix multiplication on *o1* and *o2*, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 @ o2``. Returns the result of multiplying *o1* and *o2*, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 *= o2``. Returns the result of multiplying *o1* and *o2*, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 * o2``. Returns the result of right shifting *o1* by *o2* on success, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 >>= o2``. Returns the result of right shifting *o1* by *o2* on success, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 >> o2``. Returns the result of subtracting *o2* from *o1*, or *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 -= o2``. Returns the result of subtracting *o2* from *o1*, or *NULL* on failure.  This is the equivalent of the Python expression ``o1 - o2``. See the built-in function :func:`divmod`. Returns *NULL* on failure.  This is the equivalent of the Python expression ``divmod(o1, o2)``. See the built-in function :func:`pow`. Returns *NULL* on failure.  The operation is done *in-place* when *o1* supports it.  This is the equivalent of the Python statement ``o1 **= o2`` when o3 is :c:data:`Py_None`, or an in-place variant of ``pow(o1, o2, o3)`` otherwise. If *o3* is to be ignored, pass :c:data:`Py_None` in its place (passing *NULL* for *o3* would cause an illegal memory access). See the built-in function :func:`pow`. Returns *NULL* on failure.  This is the equivalent of the Python expression ``pow(o1, o2, o3)``, where *o3* is optional. If *o3* is to be ignored, pass :c:data:`Py_None` in its place (passing *NULL* for *o3* would cause an illegal memory access). 