��    4      �              \  *   ]  -   �  /   �  �   �  Z  �  /  �      �   	  R  �	  
  �
    �  �     U  �  p   O  �   �  h   n  �   �  !   �  �   �  �   8           :  $     _  �   e  k   �  �  b  -     .   6  (   e  �   �  �     �   �  �   w  "   _  �   �  2     8  N    �  #  �   �  �!  -  o#  �   �%  e   N&  k   �&  �    '     �'     �'     �'  "   �'  "   (  �  6(  *   �)  -   *  /   F*  �   v*  Z  +  /  x,    �-  �   �/  R  00  
  �1    �2  �   �3  U  �4  p   �5  �   P6  h   �6  �   g7  !   8  �   48  �   �8     �9    �9  :  �:     �<  �   �<  k   �=  �  �=  -   �@  .   �@  (   �@  �   A  �   �A  �   iB  �   C  "   �C  �   D  2   �D  8  �D    F  #  G  �  AH  -  �I  �   -L  e   �L  k   DM  �   �M     BN     XN     kN  "   �N  "   �N   **Source code:** :source:`Lib/asyncore.py` *family* and *type* arguments can be omitted. :mod:`asyncore` --- Asynchronous socket handler A :class:`dispatcher` subclass which adds simple buffered output capability, useful for simple clients. For more sophisticated usage use :class:`asynchat.async_chat`. A file_dispatcher takes a file descriptor or :term:`file object` along with an optional map argument and wraps it for use with the :c:func:`poll` or :c:func:`loop` functions.  If provided a file object or anything with a :c:func:`fileno` method, that method will be called and passed to the :class:`file_wrapper` constructor.  Availability: UNIX. A file_wrapper takes an integer file descriptor and calls :func:`os.dup` to duplicate the handle so that the original handle may be closed independently of the file_wrapper.  This class implements sufficient methods to emulate a socket for use by the :class:`file_dispatcher` class.  Availability: UNIX. Accept a connection.  The socket must be bound to an address and listening for connections.  The return value can be either ``None`` or a pair ``(conn, address)`` where *conn* is a *new* socket object usable to send and receive data on the connection, and *address* is the address bound to the socket on the other end of the connection. When ``None`` is returned it means the connection didn't take place, in which case the server should just ignore this event and keep listening for further incoming connections. As with the normal socket object, *address* is a tuple with the first element the host to connect to, and the second the port number. Bind the socket to *address*.  The socket must not already be bound.  (The format of *address* depends on the address family --- refer to the :mod:`socket` documentation for more information.)  To mark the socket as re-usable (setting the :const:`SO_REUSEADDR` option), call the :class:`dispatcher` object's :meth:`set_reuse_addr` method. Called each time around the asynchronous loop to determine whether a channel's socket should be added to the list on which read events can occur.  The default method simply returns ``True``, indicating that by default, all channels will be interested in read events. Called each time around the asynchronous loop to determine whether a channel's socket should be added to the list on which write events can occur.  The default method simply returns ``True``, indicating that by default, all channels will be interested in write events. Called on listening channels (passive openers) when a connection can be established with a new remote endpoint that has issued a :meth:`connect` call for the local endpoint. Deprecated in version 3.2; use :meth:`handle_accepted` instead. Called on listening channels (passive openers) when a connection has been established with a new remote endpoint that has issued a :meth:`connect` call for the local endpoint.  *sock* is a *new* socket object usable to send and receive data on the connection, and *addr* is the address bound to the socket on the other end of the connection. Called when an exception is raised and not otherwise handled.  The default version prints a condensed traceback. Called when the active opener's socket actually makes a connection.  Might send a "welcome" banner, or initiate a protocol negotiation with the remote endpoint, for example. Called when the asynchronous loop detects that a :meth:`read` call on the channel's socket will succeed. Called when the asynchronous loop detects that a writable socket can be written.  Often this method will implement the necessary buffering for performance.  For example:: Called when the socket is closed. Called when there is out of band (OOB) data for a socket connection.  This will almost never happen, as OOB is tenuously supported and rarely used. Close the socket.  All future operations on the socket object will fail. The remote end-point will receive no more data (after queued data is flushed).  Sockets are automatically closed when they are garbage-collected. Description During asynchronous processing, each mapped channel's :meth:`readable` and :meth:`writable` methods are used to determine whether the channel's socket should be added to the list of channels :c:func:`select`\ ed or :c:func:`poll`\ ed for read and write events. Enter a polling loop that terminates after count passes or all open channels have been closed.  All arguments are optional.  The *count* parameter defaults to ``None``, resulting in the loop terminating only when all channels have been closed.  The *timeout* argument sets the timeout parameter for the appropriate :func:`~select.select` or :func:`~select.poll` call, measured in seconds; the default is 30 seconds.  The *use_poll* parameter, if true, indicates that :func:`~select.poll` should be used in preference to :func:`~select.select` (the default is ``False``). Event Here is a basic echo server that uses the :class:`dispatcher` class to accept connections and dispatches the incoming connections to a handler:: Here is a very basic HTTP client that uses the :class:`dispatcher` class to implement its socket handling:: If your operating system supports the :c:func:`select` system call in its I/O library (and nearly all do), then you can use it to juggle multiple communication channels at once; doing other work while your I/O is taking place in the "background."  Although this strategy can seem strange and complex, especially at first, it is in many ways easier to understand and control than multi-threaded programming.  The :mod:`asyncore` module solves many of the difficult problems for you, making the task of building sophisticated high-performance network servers and clients a snap.  For "conversational" applications and protocols the companion :mod:`asynchat` module is invaluable. Implied by a read event on a listening socket Implied by a read event with no data available Implied by the first read or write event In addition, each channel delegates or extends many of the socket methods. Most of these are nearly identical to their socket partners. Listen for connections made to the socket.  The *backlog* argument specifies the maximum number of queued connections and should be at least 1; the maximum value is system-dependent (usually 5). Note that :meth:`recv` may raise :exc:`BlockingIOError` , even though :func:`select.select` or :func:`select.poll` has reported the socket ready for reading. Once the initial channel(s) is(are) created, calling the :func:`loop` function activates channel service, which continues until the last channel (including any that have been added to the map during asynchronous service) is closed. Please use :mod:`asyncio` instead. Read at most *buffer_size* bytes from the socket's remote end-point.  An empty bytes object implies that the channel has been closed from the other end. Send *data* to the remote end-point of the socket. The *map* parameter is a dictionary whose items are the channels to watch. As channels are closed they are deleted from their map.  If *map* is omitted, a global map is used. Channels (instances of :class:`asyncore.dispatcher`, :class:`asynchat.async_chat` and subclasses thereof) can freely be mixed in the map. The :class:`dispatcher` class is a thin wrapper around a low-level socket object. To make it more useful, it has a few methods for event-handling which are called from the asynchronous loop.   Otherwise, it can be treated as a normal non-blocking socket object. The basic idea behind both modules is to create one or more network *channels*, instances of class :class:`asyncore.dispatcher` and :class:`asynchat.async_chat`.  Creating the channels adds them to a global map, used by the :func:`loop` function if you do not provide it with your own *map*. The firing of low-level events at certain times or in certain connection states tells the asynchronous loop that certain higher-level events have taken place.  For example, if we have asked for a socket to connect to another host, we know that the connection has been made when the socket becomes writable for the first time (at this point you know that you may write to it with the expectation of success).  The implied higher-level events are: There are only two ways to have a program on a single processor do  "more than one thing at a time." Multi-threaded programming is the  simplest and most popular way to do it, but there is another very different technique, that lets you have nearly all the advantages of  multi-threading, without actually using multiple threads.  It's really  only practical if your program is largely I/O bound.  If your program is processor bound, then pre-emptive scheduled threads are probably what you really need.  Network servers are rarely processor bound, however. This is identical to the creation of a normal socket, and will use the same options for creation.  Refer to the :mod:`socket` documentation for information on creating sockets. This module exists for backwards compatibility only.  For new code we recommend using :mod:`asyncio`. This module provides the basic infrastructure for writing asynchronous  socket service clients and servers. Thus, the set of channel events is larger than the basic socket events.  The full set of methods that can be overridden in your subclass follows: ``handle_accepted()`` ``handle_close()`` ``handle_connect()`` asyncore Example basic HTTP client asyncore Example basic echo server Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/asyncore.py` *family* and *type* arguments can be omitted. :mod:`asyncore` --- Asynchronous socket handler A :class:`dispatcher` subclass which adds simple buffered output capability, useful for simple clients. For more sophisticated usage use :class:`asynchat.async_chat`. A file_dispatcher takes a file descriptor or :term:`file object` along with an optional map argument and wraps it for use with the :c:func:`poll` or :c:func:`loop` functions.  If provided a file object or anything with a :c:func:`fileno` method, that method will be called and passed to the :class:`file_wrapper` constructor.  Availability: UNIX. A file_wrapper takes an integer file descriptor and calls :func:`os.dup` to duplicate the handle so that the original handle may be closed independently of the file_wrapper.  This class implements sufficient methods to emulate a socket for use by the :class:`file_dispatcher` class.  Availability: UNIX. Accept a connection.  The socket must be bound to an address and listening for connections.  The return value can be either ``None`` or a pair ``(conn, address)`` where *conn* is a *new* socket object usable to send and receive data on the connection, and *address* is the address bound to the socket on the other end of the connection. When ``None`` is returned it means the connection didn't take place, in which case the server should just ignore this event and keep listening for further incoming connections. As with the normal socket object, *address* is a tuple with the first element the host to connect to, and the second the port number. Bind the socket to *address*.  The socket must not already be bound.  (The format of *address* depends on the address family --- refer to the :mod:`socket` documentation for more information.)  To mark the socket as re-usable (setting the :const:`SO_REUSEADDR` option), call the :class:`dispatcher` object's :meth:`set_reuse_addr` method. Called each time around the asynchronous loop to determine whether a channel's socket should be added to the list on which read events can occur.  The default method simply returns ``True``, indicating that by default, all channels will be interested in read events. Called each time around the asynchronous loop to determine whether a channel's socket should be added to the list on which write events can occur.  The default method simply returns ``True``, indicating that by default, all channels will be interested in write events. Called on listening channels (passive openers) when a connection can be established with a new remote endpoint that has issued a :meth:`connect` call for the local endpoint. Deprecated in version 3.2; use :meth:`handle_accepted` instead. Called on listening channels (passive openers) when a connection has been established with a new remote endpoint that has issued a :meth:`connect` call for the local endpoint.  *sock* is a *new* socket object usable to send and receive data on the connection, and *addr* is the address bound to the socket on the other end of the connection. Called when an exception is raised and not otherwise handled.  The default version prints a condensed traceback. Called when the active opener's socket actually makes a connection.  Might send a "welcome" banner, or initiate a protocol negotiation with the remote endpoint, for example. Called when the asynchronous loop detects that a :meth:`read` call on the channel's socket will succeed. Called when the asynchronous loop detects that a writable socket can be written.  Often this method will implement the necessary buffering for performance.  For example:: Called when the socket is closed. Called when there is out of band (OOB) data for a socket connection.  This will almost never happen, as OOB is tenuously supported and rarely used. Close the socket.  All future operations on the socket object will fail. The remote end-point will receive no more data (after queued data is flushed).  Sockets are automatically closed when they are garbage-collected. Description During asynchronous processing, each mapped channel's :meth:`readable` and :meth:`writable` methods are used to determine whether the channel's socket should be added to the list of channels :c:func:`select`\ ed or :c:func:`poll`\ ed for read and write events. Enter a polling loop that terminates after count passes or all open channels have been closed.  All arguments are optional.  The *count* parameter defaults to ``None``, resulting in the loop terminating only when all channels have been closed.  The *timeout* argument sets the timeout parameter for the appropriate :func:`~select.select` or :func:`~select.poll` call, measured in seconds; the default is 30 seconds.  The *use_poll* parameter, if true, indicates that :func:`~select.poll` should be used in preference to :func:`~select.select` (the default is ``False``). Event Here is a basic echo server that uses the :class:`dispatcher` class to accept connections and dispatches the incoming connections to a handler:: Here is a very basic HTTP client that uses the :class:`dispatcher` class to implement its socket handling:: If your operating system supports the :c:func:`select` system call in its I/O library (and nearly all do), then you can use it to juggle multiple communication channels at once; doing other work while your I/O is taking place in the "background."  Although this strategy can seem strange and complex, especially at first, it is in many ways easier to understand and control than multi-threaded programming.  The :mod:`asyncore` module solves many of the difficult problems for you, making the task of building sophisticated high-performance network servers and clients a snap.  For "conversational" applications and protocols the companion :mod:`asynchat` module is invaluable. Implied by a read event on a listening socket Implied by a read event with no data available Implied by the first read or write event In addition, each channel delegates or extends many of the socket methods. Most of these are nearly identical to their socket partners. Listen for connections made to the socket.  The *backlog* argument specifies the maximum number of queued connections and should be at least 1; the maximum value is system-dependent (usually 5). Note that :meth:`recv` may raise :exc:`BlockingIOError` , even though :func:`select.select` or :func:`select.poll` has reported the socket ready for reading. Once the initial channel(s) is(are) created, calling the :func:`loop` function activates channel service, which continues until the last channel (including any that have been added to the map during asynchronous service) is closed. Please use :mod:`asyncio` instead. Read at most *buffer_size* bytes from the socket's remote end-point.  An empty bytes object implies that the channel has been closed from the other end. Send *data* to the remote end-point of the socket. The *map* parameter is a dictionary whose items are the channels to watch. As channels are closed they are deleted from their map.  If *map* is omitted, a global map is used. Channels (instances of :class:`asyncore.dispatcher`, :class:`asynchat.async_chat` and subclasses thereof) can freely be mixed in the map. The :class:`dispatcher` class is a thin wrapper around a low-level socket object. To make it more useful, it has a few methods for event-handling which are called from the asynchronous loop.   Otherwise, it can be treated as a normal non-blocking socket object. The basic idea behind both modules is to create one or more network *channels*, instances of class :class:`asyncore.dispatcher` and :class:`asynchat.async_chat`.  Creating the channels adds them to a global map, used by the :func:`loop` function if you do not provide it with your own *map*. The firing of low-level events at certain times or in certain connection states tells the asynchronous loop that certain higher-level events have taken place.  For example, if we have asked for a socket to connect to another host, we know that the connection has been made when the socket becomes writable for the first time (at this point you know that you may write to it with the expectation of success).  The implied higher-level events are: There are only two ways to have a program on a single processor do  "more than one thing at a time." Multi-threaded programming is the  simplest and most popular way to do it, but there is another very different technique, that lets you have nearly all the advantages of  multi-threading, without actually using multiple threads.  It's really  only practical if your program is largely I/O bound.  If your program is processor bound, then pre-emptive scheduled threads are probably what you really need.  Network servers are rarely processor bound, however. This is identical to the creation of a normal socket, and will use the same options for creation.  Refer to the :mod:`socket` documentation for information on creating sockets. This module exists for backwards compatibility only.  For new code we recommend using :mod:`asyncio`. This module provides the basic infrastructure for writing asynchronous  socket service clients and servers. Thus, the set of channel events is larger than the basic socket events.  The full set of methods that can be overridden in your subclass follows: ``handle_accepted()`` ``handle_close()`` ``handle_connect()`` asyncore Example basic HTTP client asyncore Example basic echo server 