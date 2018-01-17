��    d      <              \     ]     _  �   f  �   �  �   �  �   x    g	  �   {
  M   g  �   �  �   s  �     p  �    c  p   {  �   �  �   �     b     r     �  /  �     �    �     �     �  �     M  �     �  5    �   D  �   �     �  �   �  U   �  �   �  �   �  �   P  �   �  �   �  �   �   �   6!  s   ("  �   �"  �   c#  �  J$  �   B&  �   �&  h   }'  �   �'     t(     y(  4  �(  �   �)  (   �*  �   �*  �   8+     �+  �   ,  �   �,  x   l-  �   �-  �   �.  �   c/  �   H0    1  �   2  �   �2  �   �3  �   �4  �   95  $  6  .   @7  0   o7  3   �7  c   �7  =   88    v8  �   �9     ;:  �   =:  �   5;  v   "<  �   �<  <   =     [=     m=     t=     �=  	   �=  �   �=  �   )>     �>     ?     ?     4?     :?     U?  
   ]?     h?  �  l?     #A     %A  �   ,A  �   �A  �   �B  �   >C    -D  �   AE  M   -F  �   {F  �   9G  �   �G  p  �H    )J  p   AL  �   �L  �   �M     (N     8N     MN  /  ^N     �P    �P     �Q     �Q  �   �Q  M  wR     �S  5  �S  �   
U  �   �U     �V  �   �V  U   cW  �   �W  �   bX  �   Y  �   �Y  �   �Z  �   J[  �   �[  s   �\  �   b]  �   )^  �  _  �   a  �   �a  h   Cb  �   �b     :c     ?c  4  ^c  �   �d  (   Me  �   ve  �   �e     �f  �   �f  �   kg  x   2h  �   �h  �   �i  �   )j  �   k    �k  �   �l  �   �m  �   Kn  �   Fo  �   �o  $  �p  .   r  0   5r  3   fr  c   �r  =   �r    <s  �   [t     u  �   u  �   �u  v   �v  �   _w  <   �w     !x     3x     :x     Nx  	   Ux  �   _x  �   �x     �y     �y     �y     �y      z     z  
   #z     .z   0 1 or 0 :c:macro:`PyBUF_FORMAT` can be \|'d to any of the flags except :c:macro:`PyBUF_SIMPLE`. The latter already implies format ``B`` (unsigned bytes). :c:macro:`PyBUF_WRITABLE` can be \|'d to any of the flags in the next section. Since :c:macro:`PyBUF_SIMPLE` is defined as 0, :c:macro:`PyBUF_WRITABLE` can be used as a stand-alone flag to request a simple writable buffer. A *NUL* terminated string in :mod:`struct` module style syntax describing the contents of a single item. If this is *NULL*, ``"B"`` (unsigned bytes) is assumed. A new reference to the exporting object. The reference is owned by the consumer and automatically decremented and set to *NULL* by :c:func:`PyBuffer_Release`. The field is the equivalent of the return value of any standard C-API function. A pointer to the start of the logical structure described by the buffer fields. This can be any location within the underlying physical memory block of the exporter. For example, with negative :c:member:`~Py_buffer.strides` the value may point to the end of the memory block. Accessing ``((char *)buf)[0] up to ((char *)buf)[len-1]`` is only valid if the buffer has been obtained by a request that guarantees contiguity. In most cases such a request will be :c:macro:`PyBUF_SIMPLE` or :c:macro:`PyBUF_WRITABLE`. All :c:data:`Py_buffer` fields are unambiguously defined by the request type. All possible requests are fully defined by some combination of the flags in the previous section. For convenience, the buffer protocol provides frequently used combinations as single flags. An array of :c:type:`Py_ssize_t` of length :c:member:`~Py_buffer.ndim` giving the number of bytes to skip to get to a new element in each dimension. An array of :c:type:`Py_ssize_t` of length :c:member:`~Py_buffer.ndim` indicating the shape of the memory as an n-dimensional array. Note that ``shape[0] * ... * shape[ndim-1] * itemsize`` MUST be equal to :c:member:`~Py_buffer.len`. An array of :c:type:`Py_ssize_t` of length :c:member:`~Py_buffer.ndim`. If ``suboffsets[n] >= 0``, the values stored along the nth dimension are pointers and the suboffset value dictates how many bytes to add to each pointer after de-referencing. A suboffset value that is negative indicates that no de-referencing should occur (striding in a contiguous memory block). An example consumer of the buffer interface is the :meth:`~io.BufferedIOBase.write` method of file objects: any object that can export a series of bytes through the buffer interface can be written to a file.  While :meth:`write` only needs read-only access to the internal contents of the object passed to it, other methods such as :meth:`~io.BufferedIOBase.readinto` need write access to the contents of their argument.  The buffer interface allows objects to selectively allow or reject exporting of read-write and read-only buffers. An indicator of whether the buffer is read-only. This field is controlled by the :c:macro:`PyBUF_WRITABLE` flag. As a special case, for *temporary* buffers that are wrapped by :c:func:`PyMemoryView_FromBuffer` or :c:func:`PyBuffer_FillInfo` this field is *NULL*. In general, exporting objects MUST NOT use this scheme. As noted above, :c:member:`~Py_buffer.buf` can point to any location within the actual memory block. An exporter can check the validity of a buffer with this function: Buffer Protocol Buffer request types Buffer structure Buffer structures (or simply "buffers") are useful as a way to expose the binary data from another object to the Python programmer.  They can also be used as a zero-copy slicing mechanism.  Using their ability to reference a block of memory, it is possible to expose any data to the Python programmer quite easily.  The memory could be a large, constant array in a C extension, it could be a raw block of memory for manipulation before passing to an operating system library, or it could be used to pass around structured data in its native, in-memory format. Buffer-related functions Buffers are usually obtained by sending a buffer request to an exporting object via :c:func:`PyObject_GetBuffer`. Since the complexity of the logical structure of the memory can vary drastically, the consumer uses the *flags* argument to specify the exact buffer type it can handle. C C or F C or Fortran :term:`contiguity <contiguous>` can be explicitly requested, with and without stride information. Without stride information, the buffer must be C-contiguous. Certain objects available in Python wrap access to an underlying memory array or *buffer*.  Such objects include the built-in :class:`bytes` and :class:`bytearray`, and some extension types like :class:`array.array`. Third-party libraries may define their own types for special purposes, such as image processing or numeric analysis. Complex arrays Contrary to most data types exposed by the Python interpreter, buffers are not :c:type:`PyObject` pointers but rather simple C structures.  This allows them to be created and copied very simply.  When a generic wrapper around a buffer is needed, a :ref:`memoryview <memoryview-objects>` object can be created. Controls the :c:member:`~Py_buffer.format` field. If set, this field MUST be filled in correctly. Otherwise, this field MUST be *NULL*. Controls the :c:member:`~Py_buffer.readonly` field. If set, the exporter MUST provide a writable buffer or else report failure. Otherwise, the exporter MAY provide either a read-only or writable buffer, but the choice MUST be consistent for all consumers. F Fill the *strides* array with byte-strides of a :term:`contiguous` (C-style if *order* is ``'C'`` or Fortran-style if *order* is ``'F'``) array of the given shape with the given number of bytes per element. For :term:`contiguous` arrays, the value points to the beginning of the memory block. For short instructions how to write an exporting object, see :ref:`Buffer Object Structures <buffer-structs>`. For obtaining a buffer, see :c:func:`PyObject_GetBuffer`. Handle buffer requests for an exporter that wants to expose *buf* of size *len* with writability set according to *readonly*. *buf* is interpreted as a sequence of unsigned bytes. Here is a function that returns a pointer to the element in an N-D array pointed to by an N-dimensional index when there are both non-NULL strides and suboffsets:: If :c:member:`~Py_buffer.shape` is *NULL* as a result of a :c:macro:`PyBUF_SIMPLE` or a :c:macro:`PyBUF_WRITABLE` request, the consumer must disregard :c:member:`~Py_buffer.itemsize` and assume ``itemsize == 1``. If :c:member:`~Py_buffer.shape` is present, the equality ``product(shape) * itemsize == len`` still holds and the consumer can use :c:member:`~Py_buffer.itemsize` to navigate the buffer. If :c:member:`~Py_buffer.strides` is *NULL*, the array is interpreted as a standard n-dimensional C-array. Otherwise, the consumer must access an n-dimensional array as follows: If ``ndim == 0``, the memory location pointed to by :c:member:`~Py_buffer.buf` is interpreted as a scalar of size :c:member:`~Py_buffer.itemsize`. In that case, both :c:member:`~Py_buffer.shape` and :c:member:`~Py_buffer.strides` are *NULL*. If all suboffsets are negative (i.e. no de-referencing is needed, then this field must be NULL (the default value). If this function is used as part of a :ref:`getbufferproc <buffer-structs>`, *exporter* MUST be set to the exporting object and *flags* must be passed unmodified. Otherwise, *exporter* MUST be NULL. Important exception: If a consumer requests a buffer without the :c:macro:`PyBUF_FORMAT` flag, :c:member:`~Py_buffer.format` will be set to  *NULL*,  but :c:member:`~Py_buffer.itemsize` still has the value for the original format. In addition to the regular items, PIL-style arrays can contain pointers that must be followed in order to get to the next element in a dimension. For example, the regular three-dimensional C-array ``char v[2][2][3]`` can also be viewed as an array of 2 pointers to 2 two-dimensional arrays: ``char (*v[2])[2][3]``. In suboffsets representation, those two pointers can be embedded at the start of :c:member:`~Py_buffer.buf`, pointing to two ``char x[2][3]`` arrays that can be located anywhere in memory. In both cases, :c:func:`PyBuffer_Release` must be called when the buffer isn't needed anymore.  Failure to do so could lead to various issues such as resource leaks. In the following table *U* stands for undefined contiguity. The consumer would have to call :c:func:`PyBuffer_IsContiguous` to determine contiguity. It is an error to call this function on a buffer that was not obtained via :c:func:`PyObject_GetBuffer`. Item size in bytes of a single element. Same as the value of :func:`struct.calcsize` called on non-NULL :c:member:`~Py_buffer.format` values. NULL NumPy-style: shape and strides On success, fill in *view*, set :c:member:`view->obj` to a new reference to *exporter* and return 0. In the case of chained buffer providers that redirect requests to a single object, :c:member:`view->obj` MAY refer to this object instead of *exporter* (See :ref:`Buffer Object Structures <buffer-structs>`). On success, set :c:member:`view->obj` to a new reference to *exporter* and return 0. Otherwise, raise :c:data:`PyExc_BufferError`, set :c:member:`view->obj` to *NULL* and return ``-1``; PIL-style: shape, strides and suboffsets Python provides such a facility at the C level in the form of the :ref:`buffer protocol <bufferobjects>`.  This protocol has two sides: Release the buffer *view* and decrement the reference count for :c:member:`view->obj`. This function MUST be called when the buffer is no longer being used, otherwise reference leaks may occur. Request Return ``1`` if *obj* supports the buffer interface otherwise ``0``.  When ``1`` is returned, it doesn't guarantee that :c:func:`PyObject_GetBuffer` will succeed. Return ``1`` if the memory defined by the *view* is C-style (*order* is ``'C'``) or Fortran-style (*order* is ``'F'``) :term:`contiguous` or either one (*order* is ``'A'``).  Return ``0`` otherwise. Return the implied :c:data:`~Py_buffer.itemsize` from :c:data:`~Py_buffer.format`. This function is not yet implemented. Send a request to *exporter* to fill in *view* as specified by  *flags*. If the exporter cannot provide a buffer of the exact type, it MUST raise :c:data:`PyExc_BufferError`, set :c:member:`view->obj` to *NULL* and return ``-1``. Shape values are restricted to ``shape[n] >= 0``. The case ``shape[n] == 0`` requires special attention. See `complex arrays`_ for further information. Simple objects such as :class:`bytes` and :class:`bytearray` expose their underlying buffer in byte-oriented form.  Other forms are possible; for example, the elements exposed by an :class:`array.array` can be multi-byte values. Stride values can be any integer. For regular arrays, strides are usually positive, but a consumer MUST be able to handle the case ``strides[n] <= 0``. See `complex arrays`_ for further information. Successful calls to :c:func:`PyObject_GetBuffer` must be paired with calls to :c:func:`PyBuffer_Release`, similar to :c:func:`malloc` and :c:func:`free`. Thus, after the consumer is done with the buffer, :c:func:`PyBuffer_Release` must be called exactly once. The *flags* argument indicates the request type. This function always fills in *view* as specified by flags, unless *buf* has been designated as read-only and :c:macro:`PyBUF_WRITABLE` is set in *flags*. The flags that control the logical structure of the memory are listed in decreasing order of complexity. Note that each flag contains all bits of the flags below it. The following fields are not influenced by *flags* and must always be filled in with the correct values: :c:member:`~Py_buffer.obj`, :c:member:`~Py_buffer.buf`, :c:member:`~Py_buffer.len`, :c:member:`~Py_buffer.itemsize`, :c:member:`~Py_buffer.ndim`. The logical structure of NumPy-style arrays is defined by :c:member:`~Py_buffer.itemsize`, :c:member:`~Py_buffer.ndim`, :c:member:`~Py_buffer.shape` and :c:member:`~Py_buffer.strides`. The macro :c:macro:`PyBUF_MAX_NDIM` limits the maximum number of dimensions to 64. Exporters MUST respect this limit, consumers of multi-dimensional buffers SHOULD be able to handle up to :c:macro:`PyBUF_MAX_NDIM` dimensions. The number of dimensions the memory represents as an n-dimensional array. If it is ``0``, :c:member:`~Py_buffer.buf` points to a single item representing a scalar. In this case, :c:member:`~Py_buffer.shape`, :c:member:`~Py_buffer.strides` and :c:member:`~Py_buffer.suboffsets` MUST be *NULL*. The shape array is read-only for the consumer. The strides array is read-only for the consumer. The suboffsets array is read-only for the consumer. There are two ways for a consumer of the buffer interface to acquire a buffer over a target object: This field is controlled by the :c:macro:`PyBUF_FORMAT` flag. This is for use internally by the exporting object. For example, this might be re-cast as an integer by the exporter and used to store flags about whether or not the shape, strides, and suboffsets arrays must be freed when the buffer is released. The consumer MUST NOT alter this value. This type of array representation is used by the Python Imaging Library (PIL). See `complex arrays`_ for further information how to access elements of such an array. U While each of these types have their own semantics, they share the common characteristic of being backed by a possibly large memory buffer.  It is then desirable, in some situations, to access that buffer directly and without intermediate copying. ``product(shape) * itemsize``. For contiguous arrays, this is the length of the underlying memory block. For non-contiguous arrays, it is the length that the logical structure would have if it were copied to a contiguous representation. ``ptr = (char *)buf + indices[0] * strides[0] + ... + indices[n-1] * strides[n-1]`` ``item = *((typeof(item) *)ptr);`` call :c:func:`PyArg_ParseTuple` (or one of its siblings) with one of the ``y*``, ``w*`` or ``s*`` :ref:`format codes <arg-parsing>`. call :c:func:`PyObject_GetBuffer` with the right parameters; compound requests contig contiguity requests format if needed on the consumer side, several means are available to obtain a pointer to the raw underlying data of an object (for example a method parameter). on the producer side, a type can export a "buffer interface" which allows objects of that type to expose information about their underlying buffer. This interface is described in the section :ref:`buffer-structs`; readonly readonly, format request-independent fields shape shape, strides, suboffsets strides suboffsets yes Project-Id-Version: Python 3.6
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
 0 1 or 0 :c:macro:`PyBUF_FORMAT` can be \|'d to any of the flags except :c:macro:`PyBUF_SIMPLE`. The latter already implies format ``B`` (unsigned bytes). :c:macro:`PyBUF_WRITABLE` can be \|'d to any of the flags in the next section. Since :c:macro:`PyBUF_SIMPLE` is defined as 0, :c:macro:`PyBUF_WRITABLE` can be used as a stand-alone flag to request a simple writable buffer. A *NUL* terminated string in :mod:`struct` module style syntax describing the contents of a single item. If this is *NULL*, ``"B"`` (unsigned bytes) is assumed. A new reference to the exporting object. The reference is owned by the consumer and automatically decremented and set to *NULL* by :c:func:`PyBuffer_Release`. The field is the equivalent of the return value of any standard C-API function. A pointer to the start of the logical structure described by the buffer fields. This can be any location within the underlying physical memory block of the exporter. For example, with negative :c:member:`~Py_buffer.strides` the value may point to the end of the memory block. Accessing ``((char *)buf)[0] up to ((char *)buf)[len-1]`` is only valid if the buffer has been obtained by a request that guarantees contiguity. In most cases such a request will be :c:macro:`PyBUF_SIMPLE` or :c:macro:`PyBUF_WRITABLE`. All :c:data:`Py_buffer` fields are unambiguously defined by the request type. All possible requests are fully defined by some combination of the flags in the previous section. For convenience, the buffer protocol provides frequently used combinations as single flags. An array of :c:type:`Py_ssize_t` of length :c:member:`~Py_buffer.ndim` giving the number of bytes to skip to get to a new element in each dimension. An array of :c:type:`Py_ssize_t` of length :c:member:`~Py_buffer.ndim` indicating the shape of the memory as an n-dimensional array. Note that ``shape[0] * ... * shape[ndim-1] * itemsize`` MUST be equal to :c:member:`~Py_buffer.len`. An array of :c:type:`Py_ssize_t` of length :c:member:`~Py_buffer.ndim`. If ``suboffsets[n] >= 0``, the values stored along the nth dimension are pointers and the suboffset value dictates how many bytes to add to each pointer after de-referencing. A suboffset value that is negative indicates that no de-referencing should occur (striding in a contiguous memory block). An example consumer of the buffer interface is the :meth:`~io.BufferedIOBase.write` method of file objects: any object that can export a series of bytes through the buffer interface can be written to a file.  While :meth:`write` only needs read-only access to the internal contents of the object passed to it, other methods such as :meth:`~io.BufferedIOBase.readinto` need write access to the contents of their argument.  The buffer interface allows objects to selectively allow or reject exporting of read-write and read-only buffers. An indicator of whether the buffer is read-only. This field is controlled by the :c:macro:`PyBUF_WRITABLE` flag. As a special case, for *temporary* buffers that are wrapped by :c:func:`PyMemoryView_FromBuffer` or :c:func:`PyBuffer_FillInfo` this field is *NULL*. In general, exporting objects MUST NOT use this scheme. As noted above, :c:member:`~Py_buffer.buf` can point to any location within the actual memory block. An exporter can check the validity of a buffer with this function: Buffer Protocol Buffer request types Buffer structure Buffer structures (or simply "buffers") are useful as a way to expose the binary data from another object to the Python programmer.  They can also be used as a zero-copy slicing mechanism.  Using their ability to reference a block of memory, it is possible to expose any data to the Python programmer quite easily.  The memory could be a large, constant array in a C extension, it could be a raw block of memory for manipulation before passing to an operating system library, or it could be used to pass around structured data in its native, in-memory format. Buffer-related functions Buffers are usually obtained by sending a buffer request to an exporting object via :c:func:`PyObject_GetBuffer`. Since the complexity of the logical structure of the memory can vary drastically, the consumer uses the *flags* argument to specify the exact buffer type it can handle. C C or F C or Fortran :term:`contiguity <contiguous>` can be explicitly requested, with and without stride information. Without stride information, the buffer must be C-contiguous. Certain objects available in Python wrap access to an underlying memory array or *buffer*.  Such objects include the built-in :class:`bytes` and :class:`bytearray`, and some extension types like :class:`array.array`. Third-party libraries may define their own types for special purposes, such as image processing or numeric analysis. Complex arrays Contrary to most data types exposed by the Python interpreter, buffers are not :c:type:`PyObject` pointers but rather simple C structures.  This allows them to be created and copied very simply.  When a generic wrapper around a buffer is needed, a :ref:`memoryview <memoryview-objects>` object can be created. Controls the :c:member:`~Py_buffer.format` field. If set, this field MUST be filled in correctly. Otherwise, this field MUST be *NULL*. Controls the :c:member:`~Py_buffer.readonly` field. If set, the exporter MUST provide a writable buffer or else report failure. Otherwise, the exporter MAY provide either a read-only or writable buffer, but the choice MUST be consistent for all consumers. F Fill the *strides* array with byte-strides of a :term:`contiguous` (C-style if *order* is ``'C'`` or Fortran-style if *order* is ``'F'``) array of the given shape with the given number of bytes per element. For :term:`contiguous` arrays, the value points to the beginning of the memory block. For short instructions how to write an exporting object, see :ref:`Buffer Object Structures <buffer-structs>`. For obtaining a buffer, see :c:func:`PyObject_GetBuffer`. Handle buffer requests for an exporter that wants to expose *buf* of size *len* with writability set according to *readonly*. *buf* is interpreted as a sequence of unsigned bytes. Here is a function that returns a pointer to the element in an N-D array pointed to by an N-dimensional index when there are both non-NULL strides and suboffsets:: If :c:member:`~Py_buffer.shape` is *NULL* as a result of a :c:macro:`PyBUF_SIMPLE` or a :c:macro:`PyBUF_WRITABLE` request, the consumer must disregard :c:member:`~Py_buffer.itemsize` and assume ``itemsize == 1``. If :c:member:`~Py_buffer.shape` is present, the equality ``product(shape) * itemsize == len`` still holds and the consumer can use :c:member:`~Py_buffer.itemsize` to navigate the buffer. If :c:member:`~Py_buffer.strides` is *NULL*, the array is interpreted as a standard n-dimensional C-array. Otherwise, the consumer must access an n-dimensional array as follows: If ``ndim == 0``, the memory location pointed to by :c:member:`~Py_buffer.buf` is interpreted as a scalar of size :c:member:`~Py_buffer.itemsize`. In that case, both :c:member:`~Py_buffer.shape` and :c:member:`~Py_buffer.strides` are *NULL*. If all suboffsets are negative (i.e. no de-referencing is needed, then this field must be NULL (the default value). If this function is used as part of a :ref:`getbufferproc <buffer-structs>`, *exporter* MUST be set to the exporting object and *flags* must be passed unmodified. Otherwise, *exporter* MUST be NULL. Important exception: If a consumer requests a buffer without the :c:macro:`PyBUF_FORMAT` flag, :c:member:`~Py_buffer.format` will be set to  *NULL*,  but :c:member:`~Py_buffer.itemsize` still has the value for the original format. In addition to the regular items, PIL-style arrays can contain pointers that must be followed in order to get to the next element in a dimension. For example, the regular three-dimensional C-array ``char v[2][2][3]`` can also be viewed as an array of 2 pointers to 2 two-dimensional arrays: ``char (*v[2])[2][3]``. In suboffsets representation, those two pointers can be embedded at the start of :c:member:`~Py_buffer.buf`, pointing to two ``char x[2][3]`` arrays that can be located anywhere in memory. In both cases, :c:func:`PyBuffer_Release` must be called when the buffer isn't needed anymore.  Failure to do so could lead to various issues such as resource leaks. In the following table *U* stands for undefined contiguity. The consumer would have to call :c:func:`PyBuffer_IsContiguous` to determine contiguity. It is an error to call this function on a buffer that was not obtained via :c:func:`PyObject_GetBuffer`. Item size in bytes of a single element. Same as the value of :func:`struct.calcsize` called on non-NULL :c:member:`~Py_buffer.format` values. NULL NumPy-style: shape and strides On success, fill in *view*, set :c:member:`view->obj` to a new reference to *exporter* and return 0. In the case of chained buffer providers that redirect requests to a single object, :c:member:`view->obj` MAY refer to this object instead of *exporter* (See :ref:`Buffer Object Structures <buffer-structs>`). On success, set :c:member:`view->obj` to a new reference to *exporter* and return 0. Otherwise, raise :c:data:`PyExc_BufferError`, set :c:member:`view->obj` to *NULL* and return ``-1``; PIL-style: shape, strides and suboffsets Python provides such a facility at the C level in the form of the :ref:`buffer protocol <bufferobjects>`.  This protocol has two sides: Release the buffer *view* and decrement the reference count for :c:member:`view->obj`. This function MUST be called when the buffer is no longer being used, otherwise reference leaks may occur. Request Return ``1`` if *obj* supports the buffer interface otherwise ``0``.  When ``1`` is returned, it doesn't guarantee that :c:func:`PyObject_GetBuffer` will succeed. Return ``1`` if the memory defined by the *view* is C-style (*order* is ``'C'``) or Fortran-style (*order* is ``'F'``) :term:`contiguous` or either one (*order* is ``'A'``).  Return ``0`` otherwise. Return the implied :c:data:`~Py_buffer.itemsize` from :c:data:`~Py_buffer.format`. This function is not yet implemented. Send a request to *exporter* to fill in *view* as specified by  *flags*. If the exporter cannot provide a buffer of the exact type, it MUST raise :c:data:`PyExc_BufferError`, set :c:member:`view->obj` to *NULL* and return ``-1``. Shape values are restricted to ``shape[n] >= 0``. The case ``shape[n] == 0`` requires special attention. See `complex arrays`_ for further information. Simple objects such as :class:`bytes` and :class:`bytearray` expose their underlying buffer in byte-oriented form.  Other forms are possible; for example, the elements exposed by an :class:`array.array` can be multi-byte values. Stride values can be any integer. For regular arrays, strides are usually positive, but a consumer MUST be able to handle the case ``strides[n] <= 0``. See `complex arrays`_ for further information. Successful calls to :c:func:`PyObject_GetBuffer` must be paired with calls to :c:func:`PyBuffer_Release`, similar to :c:func:`malloc` and :c:func:`free`. Thus, after the consumer is done with the buffer, :c:func:`PyBuffer_Release` must be called exactly once. The *flags* argument indicates the request type. This function always fills in *view* as specified by flags, unless *buf* has been designated as read-only and :c:macro:`PyBUF_WRITABLE` is set in *flags*. The flags that control the logical structure of the memory are listed in decreasing order of complexity. Note that each flag contains all bits of the flags below it. The following fields are not influenced by *flags* and must always be filled in with the correct values: :c:member:`~Py_buffer.obj`, :c:member:`~Py_buffer.buf`, :c:member:`~Py_buffer.len`, :c:member:`~Py_buffer.itemsize`, :c:member:`~Py_buffer.ndim`. The logical structure of NumPy-style arrays is defined by :c:member:`~Py_buffer.itemsize`, :c:member:`~Py_buffer.ndim`, :c:member:`~Py_buffer.shape` and :c:member:`~Py_buffer.strides`. The macro :c:macro:`PyBUF_MAX_NDIM` limits the maximum number of dimensions to 64. Exporters MUST respect this limit, consumers of multi-dimensional buffers SHOULD be able to handle up to :c:macro:`PyBUF_MAX_NDIM` dimensions. The number of dimensions the memory represents as an n-dimensional array. If it is ``0``, :c:member:`~Py_buffer.buf` points to a single item representing a scalar. In this case, :c:member:`~Py_buffer.shape`, :c:member:`~Py_buffer.strides` and :c:member:`~Py_buffer.suboffsets` MUST be *NULL*. The shape array is read-only for the consumer. The strides array is read-only for the consumer. The suboffsets array is read-only for the consumer. There are two ways for a consumer of the buffer interface to acquire a buffer over a target object: This field is controlled by the :c:macro:`PyBUF_FORMAT` flag. This is for use internally by the exporting object. For example, this might be re-cast as an integer by the exporter and used to store flags about whether or not the shape, strides, and suboffsets arrays must be freed when the buffer is released. The consumer MUST NOT alter this value. This type of array representation is used by the Python Imaging Library (PIL). See `complex arrays`_ for further information how to access elements of such an array. U While each of these types have their own semantics, they share the common characteristic of being backed by a possibly large memory buffer.  It is then desirable, in some situations, to access that buffer directly and without intermediate copying. ``product(shape) * itemsize``. For contiguous arrays, this is the length of the underlying memory block. For non-contiguous arrays, it is the length that the logical structure would have if it were copied to a contiguous representation. ``ptr = (char *)buf + indices[0] * strides[0] + ... + indices[n-1] * strides[n-1]`` ``item = *((typeof(item) *)ptr);`` call :c:func:`PyArg_ParseTuple` (or one of its siblings) with one of the ``y*``, ``w*`` or ``s*`` :ref:`format codes <arg-parsing>`. call :c:func:`PyObject_GetBuffer` with the right parameters; compound requests contig contiguity requests format if needed on the consumer side, several means are available to obtain a pointer to the raw underlying data of an object (for example a method parameter). on the producer side, a type can export a "buffer interface" which allows objects of that type to expose information about their underlying buffer. This interface is described in the section :ref:`buffer-structs`; readonly readonly, format request-independent fields shape shape, strides, suboffsets strides suboffsets yes 