��    M      �              �    �  1     �   7  _   
  d   j     �  �   �     �  5   �  h   �  �   ;	  [   �	  _    
     �
     �
  \   �
  �     [   �  �   T  3        ;  H   O     �  �   �  7   7  H   o  7   �  �   �  F   �  j     6   ~  �   �  G   8  P   �  Q   �  N   #     r     �  L   �  M   �  �   3     �     �     �     �               /  D   M     �  A   �  �  �  �   �  �   !  �   �  �   m  �   /        h     �   �  �   h  >   '  D  f  0   �  .   �  .     %   :  
   `  q   k     �    �     �  e      K   k     �      �!  �  �!    �#  1   �$  �   �$  _   �%  d   &     z&  �   �&     3'  5   G'  h   }'  �   �'  [   o(  _   �(     +)     <)  \   O)  �   �)  [   �*  �   �*  3   �+     �+  H   �+     C,  �   U,  7   �,  H   -  7   c-  �   �-  F   w.  j   �.  6   )/  �   `/  G   �/  P   +0  Q   |0  N   �0     1     01  L   C1  M   �1  �   �1     l2     |2     �2     �2     �2     �2     �2  D   �2     =3  A   [3  �  �3  �   @5  �   �5  �   T6  �   7  �   �7     �8  h   �8  �   39  �   :  >   �:  D  ;  0   V<  .   �<  .   �<  %   �<  
   =  q   =     �=    �=     �>  e   �>  K   ?    b?     |@   (This is a helper class instead of making :class:`StreamReader` itself a :class:`Protocol` subclass, because the :class:`StreamReader` has other potential uses, and to prevent the user of the :class:`StreamReader` from accidentally calling inappropriate methods of the protocol.) **Source code:** :source:`Lib/asyncio/streams.py` *stream_reader* is a :class:`StreamReader` instance, *client_connected_cb* is an optional function called with (stream_reader, stream_writer) when a connection is made, *loop* is the event loop instance to use. A wrapper for :meth:`~AbstractEventLoop.create_connection()` returning a (reader, writer) pair. A wrapper for :meth:`~AbstractEventLoop.create_unix_connection()` returning a (reader, writer) pair. Acknowledge the EOF. Additional optional keyword arguments are *loop* (to set the event loop instance to use) and *limit* (to set the buffer limit passed to the :class:`StreamReader`). Availability: UNIX. Close the transport: see :meth:`BaseTransport.close`. Close the write end of the transport after flushing buffered data: see :meth:`WriteTransport.write_eof`. Configured stream limit is used to check result. Limit sets the maximal length of data that can be returned, not counting the separator. Coroutine waiting until a socket receives data using the :func:`open_connection` function:: Feed *data* bytes in the internal buffer.  Any operations waiting for the data will be resumed. Get HTTP headers Get the exception. If EOF is received, and ``\n`` was not found, the method will return the partial read bytes. If an EOF occurs and the complete separator is still not found, an :exc:`IncompleteReadError` exception will be raised, and the internal buffer will be reset.  The :attr:`IncompleteReadError.partial` attribute may contain the separator partially. If the EOF was received and the internal buffer is empty, return an empty ``bytes`` object. If the data cannot be read because of over limit, a :exc:`LimitOverrunError` exception  will be raised, and the data will be left in the internal buffer, so it can be read again. Incomplete read error, subclass of :exc:`EOFError`. IncompleteReadError Let the write buffer of the underlying transport a chance to be flushed. LimitOverrunError On success, the data and separator will be removed from the internal buffer (consumed). Returned data will include the separator at the end. Reached the buffer limit while looking for a separator. Read bytes string before the end of stream was reached (:class:`bytes`). Read data from the stream until ``separator`` is found. Read exactly *n* bytes. Raise an :exc:`IncompleteReadError` if the end of the stream is reached before *n* can be read, the :attr:`IncompleteReadError.partial` attribute of the exception contains the partial read bytes. Read one line, where "line" is a sequence of bytes ending with ``\n``. Read up to *n* bytes.  If *n* is not provided, or set to ``-1``, read until EOF and return all read bytes. Register an open socket to wait for data using streams Return :const:`True` if the transport supports :meth:`write_eof`, :const:`False` if not. See :meth:`WriteTransport.can_write_eof`. Return ``True`` if the buffer is empty and :meth:`feed_eof` was called. Return optional transport information: see :meth:`BaseTransport.get_extra_info`. See :func:`open_connection` for information about return value and other details. See :func:`start_server` for information about return value and other details. Set the exception. Set the transport. Simple example querying HTTP headers of the URL passed on the command line:: Start a UNIX Domain Socket server, with a callback for each client connected. Start a socket server, with a callback for each client connected. The return value is the same as :meth:`~AbstractEventLoop.create_server()`. Stream examples Stream functions StreamReader StreamReaderProtocol StreamWriter Streams (coroutine based API) TCP echo client using streams TCP echo client using the :func:`asyncio.open_connection` function:: TCP echo server using streams TCP echo server using the :func:`asyncio.start_server` function:: The *client_connected_cb* parameter is called with two parameters: *client_reader*, *client_writer*.  *client_reader* is a :class:`StreamReader` object, while *client_writer* is a :class:`StreamWriter` object.  The *client_connected_cb* parameter can either be a plain callback function or a :ref:`coroutine function <coroutine>`; if it is a coroutine function, it will be automatically converted into a :class:`Task`. The :ref:`TCP echo client protocol <asyncio-tcp-echo-client-protocol>` example uses the :meth:`AbstractEventLoop.create_connection` method. The :ref:`TCP echo server protocol <asyncio-tcp-echo-server-protocol>` example uses the :meth:`AbstractEventLoop.create_server` method. The :ref:`register an open socket to wait for data using a protocol <asyncio-register-socket>` example uses a low-level protocol created by the :meth:`AbstractEventLoop.create_connection` method. The :ref:`watch a file descriptor for read events <asyncio-watch-read-event>` example uses the low-level :meth:`AbstractEventLoop.add_reader` method to register the file descriptor of a socket. The arguments are all the usual arguments to :meth:`AbstractEventLoop.create_connection` except *protocol_factory*; most common are positional host and port, with various optional keyword arguments following. The intended use is to write:: The reader returned is a :class:`StreamReader` instance; the writer is a :class:`StreamWriter` instance. The rest of the arguments are all the usual arguments to :meth:`~AbstractEventLoop.create_server()` except *protocol_factory*; most common are positional *host* and *port*, with various optional keyword arguments following. The top-level functions in this module are meant as convenience wrappers only; there's really nothing special there, and if they don't do exactly what you want, feel free to copy their code. This class is :ref:`not thread safe <asyncio-multithreading>`. This exposes :meth:`write`, :meth:`writelines`, :meth:`can_write_eof()`, :meth:`write_eof`, :meth:`get_extra_info` and :meth:`close`.  It adds :meth:`drain` which returns an optional :class:`Future` on which you can wait for flow control.  It also adds a transport attribute which references the :class:`Transport` directly. This function is a :ref:`coroutine <coroutine>`. This method is a :ref:`coroutine <coroutine>`. Total number of expected bytes (:class:`int`). Total number of to be consumed bytes. Transport. Trivial helper class to adapt between :class:`Protocol` and :class:`StreamReader`. Subclass of :class:`Protocol`. Usage:: When the size of the transport buffer reaches the high-water limit (the protocol is paused), block until the size of the buffer is drained down to the low-water limit and the protocol is resumed. When there is nothing to wait for, the yield-from continues immediately. Wraps a Transport. Write a list (or any iterable) of data bytes to the transport: see :meth:`WriteTransport.writelines`. Write some *data* bytes to the transport: see :meth:`WriteTransport.write`. Yielding from :meth:`drain` gives the opportunity for the loop to schedule the write operation and flush the buffer. It should especially be used when a possibly large amount of data is written to the transport, and the coroutine does not yield-from between calls to :meth:`write`. or with HTTPS:: Project-Id-Version: Python 3.6
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
 (This is a helper class instead of making :class:`StreamReader` itself a :class:`Protocol` subclass, because the :class:`StreamReader` has other potential uses, and to prevent the user of the :class:`StreamReader` from accidentally calling inappropriate methods of the protocol.) **Source code:** :source:`Lib/asyncio/streams.py` *stream_reader* is a :class:`StreamReader` instance, *client_connected_cb* is an optional function called with (stream_reader, stream_writer) when a connection is made, *loop* is the event loop instance to use. A wrapper for :meth:`~AbstractEventLoop.create_connection()` returning a (reader, writer) pair. A wrapper for :meth:`~AbstractEventLoop.create_unix_connection()` returning a (reader, writer) pair. Acknowledge the EOF. Additional optional keyword arguments are *loop* (to set the event loop instance to use) and *limit* (to set the buffer limit passed to the :class:`StreamReader`). Availability: UNIX. Close the transport: see :meth:`BaseTransport.close`. Close the write end of the transport after flushing buffered data: see :meth:`WriteTransport.write_eof`. Configured stream limit is used to check result. Limit sets the maximal length of data that can be returned, not counting the separator. Coroutine waiting until a socket receives data using the :func:`open_connection` function:: Feed *data* bytes in the internal buffer.  Any operations waiting for the data will be resumed. Get HTTP headers Get the exception. If EOF is received, and ``\n`` was not found, the method will return the partial read bytes. If an EOF occurs and the complete separator is still not found, an :exc:`IncompleteReadError` exception will be raised, and the internal buffer will be reset.  The :attr:`IncompleteReadError.partial` attribute may contain the separator partially. If the EOF was received and the internal buffer is empty, return an empty ``bytes`` object. If the data cannot be read because of over limit, a :exc:`LimitOverrunError` exception  will be raised, and the data will be left in the internal buffer, so it can be read again. Incomplete read error, subclass of :exc:`EOFError`. IncompleteReadError Let the write buffer of the underlying transport a chance to be flushed. LimitOverrunError On success, the data and separator will be removed from the internal buffer (consumed). Returned data will include the separator at the end. Reached the buffer limit while looking for a separator. Read bytes string before the end of stream was reached (:class:`bytes`). Read data from the stream until ``separator`` is found. Read exactly *n* bytes. Raise an :exc:`IncompleteReadError` if the end of the stream is reached before *n* can be read, the :attr:`IncompleteReadError.partial` attribute of the exception contains the partial read bytes. Read one line, where "line" is a sequence of bytes ending with ``\n``. Read up to *n* bytes.  If *n* is not provided, or set to ``-1``, read until EOF and return all read bytes. Register an open socket to wait for data using streams Return :const:`True` if the transport supports :meth:`write_eof`, :const:`False` if not. See :meth:`WriteTransport.can_write_eof`. Return ``True`` if the buffer is empty and :meth:`feed_eof` was called. Return optional transport information: see :meth:`BaseTransport.get_extra_info`. See :func:`open_connection` for information about return value and other details. See :func:`start_server` for information about return value and other details. Set the exception. Set the transport. Simple example querying HTTP headers of the URL passed on the command line:: Start a UNIX Domain Socket server, with a callback for each client connected. Start a socket server, with a callback for each client connected. The return value is the same as :meth:`~AbstractEventLoop.create_server()`. Stream examples Stream functions StreamReader StreamReaderProtocol StreamWriter Streams (coroutine based API) TCP echo client using streams TCP echo client using the :func:`asyncio.open_connection` function:: TCP echo server using streams TCP echo server using the :func:`asyncio.start_server` function:: The *client_connected_cb* parameter is called with two parameters: *client_reader*, *client_writer*.  *client_reader* is a :class:`StreamReader` object, while *client_writer* is a :class:`StreamWriter` object.  The *client_connected_cb* parameter can either be a plain callback function or a :ref:`coroutine function <coroutine>`; if it is a coroutine function, it will be automatically converted into a :class:`Task`. The :ref:`TCP echo client protocol <asyncio-tcp-echo-client-protocol>` example uses the :meth:`AbstractEventLoop.create_connection` method. The :ref:`TCP echo server protocol <asyncio-tcp-echo-server-protocol>` example uses the :meth:`AbstractEventLoop.create_server` method. The :ref:`register an open socket to wait for data using a protocol <asyncio-register-socket>` example uses a low-level protocol created by the :meth:`AbstractEventLoop.create_connection` method. The :ref:`watch a file descriptor for read events <asyncio-watch-read-event>` example uses the low-level :meth:`AbstractEventLoop.add_reader` method to register the file descriptor of a socket. The arguments are all the usual arguments to :meth:`AbstractEventLoop.create_connection` except *protocol_factory*; most common are positional host and port, with various optional keyword arguments following. The intended use is to write:: The reader returned is a :class:`StreamReader` instance; the writer is a :class:`StreamWriter` instance. The rest of the arguments are all the usual arguments to :meth:`~AbstractEventLoop.create_server()` except *protocol_factory*; most common are positional *host* and *port*, with various optional keyword arguments following. The top-level functions in this module are meant as convenience wrappers only; there's really nothing special there, and if they don't do exactly what you want, feel free to copy their code. This class is :ref:`not thread safe <asyncio-multithreading>`. This exposes :meth:`write`, :meth:`writelines`, :meth:`can_write_eof()`, :meth:`write_eof`, :meth:`get_extra_info` and :meth:`close`.  It adds :meth:`drain` which returns an optional :class:`Future` on which you can wait for flow control.  It also adds a transport attribute which references the :class:`Transport` directly. This function is a :ref:`coroutine <coroutine>`. This method is a :ref:`coroutine <coroutine>`. Total number of expected bytes (:class:`int`). Total number of to be consumed bytes. Transport. Trivial helper class to adapt between :class:`Protocol` and :class:`StreamReader`. Subclass of :class:`Protocol`. Usage:: When the size of the transport buffer reaches the high-water limit (the protocol is paused), block until the size of the buffer is drained down to the low-water limit and the protocol is resumed. When there is nothing to wait for, the yield-from continues immediately. Wraps a Transport. Write a list (or any iterable) of data bytes to the transport: see :meth:`WriteTransport.writelines`. Write some *data* bytes to the transport: see :meth:`WriteTransport.write`. Yielding from :meth:`drain` gives the opportunity for the loop to schedule the write operation and flush the buffer. It should especially be used when a possibly large amount of data is written to the transport, and the coroutine does not yield-from between calls to :meth:`write`. or with HTTPS:: 