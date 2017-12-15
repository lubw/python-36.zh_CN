��    M      �              �  .   �  c     �   �  '     '   +  7   S  �   �  ?     �   R  2   �  L       l
  �   �
  �   D  �   �  `     �   �  '   �     �  �       �  �   �  �  k  4  �  �   %    �  �   �  G   �  �    v  �  �  Y       �   6     �       g   $     �  �   �  C     �   `  �   -  N   �  @  8     y!  �   �"  �   #  N   �#  :   $  9   X$  r  �$  H   &  �   N&  x   ('  _   �'  m   (  -   o(  �   �(  b  W)  7   �*  �  �*  �   �,  �   �-  M  �.  e  �/  �   a1     2     32     M2    n3  �   �4  S  45  �   �6  b   [7  �  �7    �9  �   �;  �  -<  .   �=  c   >  �   w>  '   �>  '   "?  7   J?  �   �?  ?   	@  �   I@  2   �@  L  A     cC  �   wC  �   ;D  �   �D  `   vE  �   �E  '   �F     �F  �  �F     �I  �   �I  �  bJ  4  �K  �   M    �M  �   �N  G   �O  �  P  v  �Q  �  PS     U  �   -U     �U     V  g   V     �V  �   �V  C   W  �   WW  �   $X  N   �X  @  /Y    pZ  �   �[  �   \  N   �\  :   ]  9   O]  r  �]  H   �^  �   E_  x   `  _   �`  m   �`  -   fa  �   �a  b  Nb  7   �c  �  �c  �   �e  �   �f  M  �g  e  �h  �   Xj     k     *k     Dk    el  �   zm  S  +n  �   o  b   Rp  �  �p    r  �   �t   **Source code:** :source:`Lib/socketserver.py` :attr:`StreamRequestHandler.wfile` also supports the :class:`io.BufferedIOBase` writable interface. :class:`ForkingMixIn` and the Forking classes mentioned below are only available on POSIX platforms that support :func:`~os.fork`. :class:`socketserver.TCPServer` Example :class:`socketserver.UDPServer` Example :mod:`socketserver` --- A framework for network servers Actually processes the request by instantiating :attr:`RequestHandlerClass` and calling its :meth:`~BaseRequestHandler.handle` method. Added ``service_actions`` call to the ``serve_forever`` method. An alternative request handler class that makes use of streams (file-like objects that simplify communication by providing the standard file interface):: An example for the :class:`ThreadingMixIn` class:: Another approach to handling multiple simultaneous requests in an environment that supports neither threads nor :func:`~os.fork` (or where these are too expensive or inappropriate for the service) is to maintain an explicit table of partially finished requests and to use :mod:`selectors` to decide which request to work on next (or whether to handle a new incoming request).  This is particularly important for stream services where each client can potentially be connected for a long time (if threads or subprocesses cannot be used).  See :mod:`asyncore` for another way to manage this. Asynchronous Mixins Called after the :meth:`handle` method to perform any clean-up actions required.  The default implementation does nothing.  If :meth:`setup` raises an exception, this function will not be called. Called before the :meth:`handle` method to perform any initialization actions required.  The default implementation does nothing. Called by the server's constructor to activate the server.  The default behavior for a TCP server just invokes :meth:`~socket.socket.listen` on the server's socket.  May be overridden. Called by the server's constructor to bind the socket to the desired address. May be overridden. Calls :meth:`finish_request` to create an instance of the :attr:`RequestHandlerClass`.  If desired, this function can create a new process or thread to handle the request; the :class:`ForkingMixIn` and :class:`ThreadingMixIn` classes do this. Clean up the server. May be overridden. Client: Creating a server requires several steps.  First, you must create a request handler class by subclassing the :class:`BaseRequestHandler` class and overriding its :meth:`~BaseRequestHandler.handle` method; this method will process incoming requests.  Second, you must instantiate one of the server classes, passing it the server's address and the request handler class. It is recommended to use the server in a :keyword:`with` statement. Then call the :meth:`~BaseServer.handle_request` or :meth:`~BaseServer.serve_forever` method of the server object to process one or many requests.  Finally, call :meth:`~BaseServer.server_close` to close the socket (unless you used a :keyword:`with` statement). Examples Forking and threading versions of each type of server can be created using these mix-in classes.  For instance, :class:`ThreadingUDPServer` is created as follows:: Handle requests until an explicit :meth:`shutdown` request.  Poll for shutdown every *poll_interval* seconds. Ignores the :attr:`timeout` attribute.  It also calls :meth:`service_actions`, which may be used by a subclass or mixin to provide actions specific to a given service.  For example, the :class:`ForkingMixIn` class uses :meth:`service_actions` to clean up zombie child processes. In some cases, it may be appropriate to process part of a request synchronously, but to finish processing in a forked child depending on the request data.  This can be implemented by using a synchronous server and doing an explicit fork in the request handler class :meth:`~BaseRequestHandler.handle` method. Must accept a request from the socket, and return a 2-tuple containing the *new* socket object to be used to communicate with the client, and the client's address. Must return a Boolean value; if the value is :const:`True`, the request will be processed, and if it's :const:`False`, the request will be denied.  This function can be overridden to implement access controls for a server. The default implementation always returns :const:`True`. Note that :class:`UnixDatagramServer` derives from :class:`UDPServer`, not from :class:`UnixStreamServer` --- the only difference between an IP and a Unix stream server is the address family, which is simply repeated in both Unix server classes. Now only called for exceptions derived from the :exc:`Exception` class. Of course, you still have to use your head!  For instance, it makes no sense to use a forking server if the service contains state in memory that can be modified by different requests, since the modifications in the child process would never reach the initial state kept in the parent process and passed to each child.  In this case, you can use a threading server, but you will probably have to use locks to protect the integrity of the shared data. On the other hand, if you are building an HTTP server where all data is stored externally (for instance, in the file system), a synchronous class will essentially render the service "deaf" while one request is being handled -- which may be for a very long time if a client is slow to receive all the data it has requested.  Here a threading or forking server is appropriate. Process a single request.  This function calls the following methods in order: :meth:`get_request`, :meth:`verify_request`, and :meth:`process_request`.  If the user-provided :meth:`~BaseRequestHandler.handle` method of the handler class raises an exception, the server's :meth:`handle_error` method will be called.  If no request is received within :attr:`timeout` seconds, :meth:`handle_timeout` will be called and :meth:`handle_request` will return. Request Handler Objects Return an integer file descriptor for the socket on which the server is listening.  This function is most commonly passed to :mod:`selectors`, to allow monitoring multiple servers in the same process. Server Creation Notes Server Objects Server classes have the same external methods and attributes, no matter what network protocol they use. Server: Support for the :term:`context manager` protocol was added.  Exiting the context manager is equivalent to calling :meth:`server_close`. Tell the :meth:`serve_forever` loop to stop and wait until it does. The :attr:`rfile` attributes of both classes support the :class:`io.BufferedIOBase` readable interface, and :attr:`DatagramRequestHandler.wfile` supports the :class:`io.BufferedIOBase` writable interface. The :class:`ForkingMixIn` class is used in the same way, except that the server will spawn a new process for each request. Available only on POSIX platforms that support :func:`~os.fork`. The :mod:`socketserver` module simplifies the task of writing network servers. The address on which the server is listening.  The format of addresses varies depending on the protocol family; see the documentation for the :mod:`socket` module for details.  For Internet protocols, this is a tuple containing a string giving the address, and an integer port number: ``('127.0.0.1', 80)``, for example. The difference is that the ``readline()`` call in the second handler will call ``recv()`` multiple times until it encounters a newline character, while the single ``recv()`` call in the first handler will just return what has been sent from the client in one ``sendall()`` call. The family of protocols to which the server's socket belongs. Common examples are :const:`socket.AF_INET` and :const:`socket.AF_UNIX`. The mix-in class comes first, since it overrides a method defined in :class:`UDPServer`.  Setting the various attributes also changes the behavior of the underlying server mechanism. The output of the example should look exactly like for the TCP server example. The output of the example should look something like this: The server classes support the following class variables: The size of the request queue.  If it takes a long time to process a single request, any requests that arrive while the server is busy are placed into a queue, up to :attr:`request_queue_size` requests.  Once the queue is full, further requests from clients will get a "Connection denied" error.  The default value is usually 5, but this can be overridden by subclasses. The socket object on which the server will listen for incoming requests. The type of :attr:`self.request` is different for datagram or stream services.  For stream services, :attr:`self.request` is a socket object; for datagram services, :attr:`self.request` is a pair of string and socket. The type of socket used by the server; :const:`socket.SOCK_STREAM` and :const:`socket.SOCK_DGRAM` are two common values. The user-provided request handler class; an instance of this class is created for each request. There are five classes in an inheritance diagram, four of which represent synchronous servers of four types:: There are four basic concrete server classes: There are various server methods that can be overridden by subclasses of base server classes like :class:`TCPServer`; these methods aren't useful to external users of the server object. These :class:`BaseRequestHandler` subclasses override the :meth:`~BaseRequestHandler.setup` and :meth:`~BaseRequestHandler.finish` methods, and provide :attr:`self.rfile` and :attr:`self.wfile` attributes. The :attr:`self.rfile` and :attr:`self.wfile` attributes can be read or written, respectively, to get the request data or return data to the client. These classes are pre-defined using the mix-in classes. These four classes process requests :dfn:`synchronously`; each request must be completed before the next request can be started.  This isn't suitable if each request takes a long time to complete, because it requires a lot of computation, or because it returns a lot of data which the client is slow to process.  The solution is to create a separate process or thread to handle each request; the :class:`ForkingMixIn` and :class:`ThreadingMixIn` mix-in classes can be used to support asynchronous behaviour. These more infrequently used classes are similar to the TCP and UDP classes, but use Unix domain sockets; they're not available on non-Unix platforms.  The parameters are the same as for :class:`TCPServer`. This function is called if the :meth:`~BaseRequestHandler.handle` method of a :attr:`RequestHandlerClass` instance raises an exception.  The default action is to print the traceback to standard error and continue handling further requests. This function is called when the :attr:`timeout` attribute has been set to a value other than :const:`None` and the timeout period has passed with no requests being received.  The default action for forking servers is to collect the status of any child processes that have exited, while in threading servers this method does nothing. This function must do all the work required to service a request.  The default implementation does nothing.  Several instance attributes are available to it; the request is available as :attr:`self.request`; the client address as :attr:`self.client_address`; and the server instance as :attr:`self.server`, in case it needs access to per-server information. This is called in the :meth:`serve_forever` loop. This method can be overridden by subclasses or mixin classes to perform actions specific to a given service, such as cleanup actions. This is the client side:: This is the server side:: This is the superclass of all Server objects in the module.  It defines the interface, given below, but does not implement most of the methods, which is done in subclasses.  The two parameters are stored in the respective :attr:`server_address` and :attr:`RequestHandlerClass` attributes. This is the superclass of all request handler objects.  It defines the interface, given below.  A concrete request handler subclass must define a new :meth:`handle` method, and can override any of the other methods.  A new instance of the subclass is created for each request. This uses datagrams, which are discrete packets of information that may arrive out of order or be lost while in transit.  The parameters are the same as for :class:`TCPServer`. This uses the Internet TCP protocol, which provides for continuous streams of data between the client and server. If *bind_and_activate* is true, the constructor automatically attempts to invoke :meth:`~BaseServer.server_bind` and :meth:`~BaseServer.server_activate`.  The other parameters are passed to the :class:`BaseServer` base class. Timeout duration, measured in seconds, or :const:`None` if no timeout is desired.  If :meth:`handle_request` receives no incoming requests within the timeout period, the :meth:`handle_timeout` method is called. To build asynchronous handlers, use the :class:`ThreadingMixIn` and :class:`ForkingMixIn` classes. To implement a service, you must derive a class from :class:`BaseRequestHandler` and redefine its :meth:`~BaseRequestHandler.handle` method. You can then run various versions of the service by combining one of the server classes with your request handler class.  The request handler class must be different for datagram or stream services.  This can be hidden by using the handler subclasses :class:`StreamRequestHandler` or :class:`DatagramRequestHandler`. When inheriting from :class:`ThreadingMixIn` for threaded connection behavior, you should explicitly declare how you want your threads to behave on an abrupt shutdown.  The :class:`ThreadingMixIn` class defines an attribute *daemon_threads*, which indicates whether or not the server should wait for thread termination.  You should set the flag explicitly if you would like threads to behave autonomously; the default is :const:`False`, meaning that Python will not exit until all threads created by :class:`ThreadingMixIn` have exited. Whether the server will allow the reuse of an address.  This defaults to :const:`False`, and can be set in subclasses to change the policy. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/socketserver.py` :attr:`StreamRequestHandler.wfile` also supports the :class:`io.BufferedIOBase` writable interface. :class:`ForkingMixIn` and the Forking classes mentioned below are only available on POSIX platforms that support :func:`~os.fork`. :class:`socketserver.TCPServer` Example :class:`socketserver.UDPServer` Example :mod:`socketserver` --- A framework for network servers Actually processes the request by instantiating :attr:`RequestHandlerClass` and calling its :meth:`~BaseRequestHandler.handle` method. Added ``service_actions`` call to the ``serve_forever`` method. An alternative request handler class that makes use of streams (file-like objects that simplify communication by providing the standard file interface):: An example for the :class:`ThreadingMixIn` class:: Another approach to handling multiple simultaneous requests in an environment that supports neither threads nor :func:`~os.fork` (or where these are too expensive or inappropriate for the service) is to maintain an explicit table of partially finished requests and to use :mod:`selectors` to decide which request to work on next (or whether to handle a new incoming request).  This is particularly important for stream services where each client can potentially be connected for a long time (if threads or subprocesses cannot be used).  See :mod:`asyncore` for another way to manage this. Asynchronous Mixins Called after the :meth:`handle` method to perform any clean-up actions required.  The default implementation does nothing.  If :meth:`setup` raises an exception, this function will not be called. Called before the :meth:`handle` method to perform any initialization actions required.  The default implementation does nothing. Called by the server's constructor to activate the server.  The default behavior for a TCP server just invokes :meth:`~socket.socket.listen` on the server's socket.  May be overridden. Called by the server's constructor to bind the socket to the desired address. May be overridden. Calls :meth:`finish_request` to create an instance of the :attr:`RequestHandlerClass`.  If desired, this function can create a new process or thread to handle the request; the :class:`ForkingMixIn` and :class:`ThreadingMixIn` classes do this. Clean up the server. May be overridden. Client: Creating a server requires several steps.  First, you must create a request handler class by subclassing the :class:`BaseRequestHandler` class and overriding its :meth:`~BaseRequestHandler.handle` method; this method will process incoming requests.  Second, you must instantiate one of the server classes, passing it the server's address and the request handler class. It is recommended to use the server in a :keyword:`with` statement. Then call the :meth:`~BaseServer.handle_request` or :meth:`~BaseServer.serve_forever` method of the server object to process one or many requests.  Finally, call :meth:`~BaseServer.server_close` to close the socket (unless you used a :keyword:`with` statement). Examples Forking and threading versions of each type of server can be created using these mix-in classes.  For instance, :class:`ThreadingUDPServer` is created as follows:: Handle requests until an explicit :meth:`shutdown` request.  Poll for shutdown every *poll_interval* seconds. Ignores the :attr:`timeout` attribute.  It also calls :meth:`service_actions`, which may be used by a subclass or mixin to provide actions specific to a given service.  For example, the :class:`ForkingMixIn` class uses :meth:`service_actions` to clean up zombie child processes. In some cases, it may be appropriate to process part of a request synchronously, but to finish processing in a forked child depending on the request data.  This can be implemented by using a synchronous server and doing an explicit fork in the request handler class :meth:`~BaseRequestHandler.handle` method. Must accept a request from the socket, and return a 2-tuple containing the *new* socket object to be used to communicate with the client, and the client's address. Must return a Boolean value; if the value is :const:`True`, the request will be processed, and if it's :const:`False`, the request will be denied.  This function can be overridden to implement access controls for a server. The default implementation always returns :const:`True`. Note that :class:`UnixDatagramServer` derives from :class:`UDPServer`, not from :class:`UnixStreamServer` --- the only difference between an IP and a Unix stream server is the address family, which is simply repeated in both Unix server classes. Now only called for exceptions derived from the :exc:`Exception` class. Of course, you still have to use your head!  For instance, it makes no sense to use a forking server if the service contains state in memory that can be modified by different requests, since the modifications in the child process would never reach the initial state kept in the parent process and passed to each child.  In this case, you can use a threading server, but you will probably have to use locks to protect the integrity of the shared data. On the other hand, if you are building an HTTP server where all data is stored externally (for instance, in the file system), a synchronous class will essentially render the service "deaf" while one request is being handled -- which may be for a very long time if a client is slow to receive all the data it has requested.  Here a threading or forking server is appropriate. Process a single request.  This function calls the following methods in order: :meth:`get_request`, :meth:`verify_request`, and :meth:`process_request`.  If the user-provided :meth:`~BaseRequestHandler.handle` method of the handler class raises an exception, the server's :meth:`handle_error` method will be called.  If no request is received within :attr:`timeout` seconds, :meth:`handle_timeout` will be called and :meth:`handle_request` will return. Request Handler Objects Return an integer file descriptor for the socket on which the server is listening.  This function is most commonly passed to :mod:`selectors`, to allow monitoring multiple servers in the same process. Server Creation Notes Server Objects Server classes have the same external methods and attributes, no matter what network protocol they use. Server: Support for the :term:`context manager` protocol was added.  Exiting the context manager is equivalent to calling :meth:`server_close`. Tell the :meth:`serve_forever` loop to stop and wait until it does. The :attr:`rfile` attributes of both classes support the :class:`io.BufferedIOBase` readable interface, and :attr:`DatagramRequestHandler.wfile` supports the :class:`io.BufferedIOBase` writable interface. The :class:`ForkingMixIn` class is used in the same way, except that the server will spawn a new process for each request. Available only on POSIX platforms that support :func:`~os.fork`. The :mod:`socketserver` module simplifies the task of writing network servers. The address on which the server is listening.  The format of addresses varies depending on the protocol family; see the documentation for the :mod:`socket` module for details.  For Internet protocols, this is a tuple containing a string giving the address, and an integer port number: ``('127.0.0.1', 80)``, for example. The difference is that the ``readline()`` call in the second handler will call ``recv()`` multiple times until it encounters a newline character, while the single ``recv()`` call in the first handler will just return what has been sent from the client in one ``sendall()`` call. The family of protocols to which the server's socket belongs. Common examples are :const:`socket.AF_INET` and :const:`socket.AF_UNIX`. The mix-in class comes first, since it overrides a method defined in :class:`UDPServer`.  Setting the various attributes also changes the behavior of the underlying server mechanism. The output of the example should look exactly like for the TCP server example. The output of the example should look something like this: The server classes support the following class variables: The size of the request queue.  If it takes a long time to process a single request, any requests that arrive while the server is busy are placed into a queue, up to :attr:`request_queue_size` requests.  Once the queue is full, further requests from clients will get a "Connection denied" error.  The default value is usually 5, but this can be overridden by subclasses. The socket object on which the server will listen for incoming requests. The type of :attr:`self.request` is different for datagram or stream services.  For stream services, :attr:`self.request` is a socket object; for datagram services, :attr:`self.request` is a pair of string and socket. The type of socket used by the server; :const:`socket.SOCK_STREAM` and :const:`socket.SOCK_DGRAM` are two common values. The user-provided request handler class; an instance of this class is created for each request. There are five classes in an inheritance diagram, four of which represent synchronous servers of four types:: There are four basic concrete server classes: There are various server methods that can be overridden by subclasses of base server classes like :class:`TCPServer`; these methods aren't useful to external users of the server object. These :class:`BaseRequestHandler` subclasses override the :meth:`~BaseRequestHandler.setup` and :meth:`~BaseRequestHandler.finish` methods, and provide :attr:`self.rfile` and :attr:`self.wfile` attributes. The :attr:`self.rfile` and :attr:`self.wfile` attributes can be read or written, respectively, to get the request data or return data to the client. These classes are pre-defined using the mix-in classes. These four classes process requests :dfn:`synchronously`; each request must be completed before the next request can be started.  This isn't suitable if each request takes a long time to complete, because it requires a lot of computation, or because it returns a lot of data which the client is slow to process.  The solution is to create a separate process or thread to handle each request; the :class:`ForkingMixIn` and :class:`ThreadingMixIn` mix-in classes can be used to support asynchronous behaviour. These more infrequently used classes are similar to the TCP and UDP classes, but use Unix domain sockets; they're not available on non-Unix platforms.  The parameters are the same as for :class:`TCPServer`. This function is called if the :meth:`~BaseRequestHandler.handle` method of a :attr:`RequestHandlerClass` instance raises an exception.  The default action is to print the traceback to standard error and continue handling further requests. This function is called when the :attr:`timeout` attribute has been set to a value other than :const:`None` and the timeout period has passed with no requests being received.  The default action for forking servers is to collect the status of any child processes that have exited, while in threading servers this method does nothing. This function must do all the work required to service a request.  The default implementation does nothing.  Several instance attributes are available to it; the request is available as :attr:`self.request`; the client address as :attr:`self.client_address`; and the server instance as :attr:`self.server`, in case it needs access to per-server information. This is called in the :meth:`serve_forever` loop. This method can be overridden by subclasses or mixin classes to perform actions specific to a given service, such as cleanup actions. This is the client side:: This is the server side:: This is the superclass of all Server objects in the module.  It defines the interface, given below, but does not implement most of the methods, which is done in subclasses.  The two parameters are stored in the respective :attr:`server_address` and :attr:`RequestHandlerClass` attributes. This is the superclass of all request handler objects.  It defines the interface, given below.  A concrete request handler subclass must define a new :meth:`handle` method, and can override any of the other methods.  A new instance of the subclass is created for each request. This uses datagrams, which are discrete packets of information that may arrive out of order or be lost while in transit.  The parameters are the same as for :class:`TCPServer`. This uses the Internet TCP protocol, which provides for continuous streams of data between the client and server. If *bind_and_activate* is true, the constructor automatically attempts to invoke :meth:`~BaseServer.server_bind` and :meth:`~BaseServer.server_activate`.  The other parameters are passed to the :class:`BaseServer` base class. Timeout duration, measured in seconds, or :const:`None` if no timeout is desired.  If :meth:`handle_request` receives no incoming requests within the timeout period, the :meth:`handle_timeout` method is called. To build asynchronous handlers, use the :class:`ThreadingMixIn` and :class:`ForkingMixIn` classes. To implement a service, you must derive a class from :class:`BaseRequestHandler` and redefine its :meth:`~BaseRequestHandler.handle` method. You can then run various versions of the service by combining one of the server classes with your request handler class.  The request handler class must be different for datagram or stream services.  This can be hidden by using the handler subclasses :class:`StreamRequestHandler` or :class:`DatagramRequestHandler`. When inheriting from :class:`ThreadingMixIn` for threaded connection behavior, you should explicitly declare how you want your threads to behave on an abrupt shutdown.  The :class:`ThreadingMixIn` class defines an attribute *daemon_threads*, which indicates whether or not the server should wait for thread termination.  You should set the flag explicitly if you would like threads to behave autonomously; the default is :const:`False`, meaning that Python will not exit until all threads created by :class:`ThreadingMixIn` have exited. Whether the server will allow the reuse of an address.  This defaults to :const:`False`, and can be set in subclasses to change the policy. 