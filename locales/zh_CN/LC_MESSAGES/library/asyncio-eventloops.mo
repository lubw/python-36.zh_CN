��    8      �              �  0   �  ,   �  +   �  +   '  e   S  �   �  a   �  w   �  t   \  J   �  �     �   �      i  <   �     �     �  �   �  %   ~	  K   �	  !   �	  C   
  C   V
  G   �
  X   �
     ;  g  P  *   �     �     �       8     �   W  "   �  +     }   4     �  �  �  �   S  y        �  n   �  �     S   �  [     5   g  �   �  t  9    �  �   �  F  P  �   �  :   q     �  �   �  y   9  �  �  0   j  ,   �  +   �  +   �  e      �   �  a   O  w   �  t   )  J   �  �   �  �   �       6!  <   W!     �!     �!  �   �!  %   K"  K   q"  !   �"  C   �"  C   ##  G   g#  X   �#     $  g  $  *   �%     �%     �%     �%  8   �%  �   $&  "   �&  +   �&  }   '     '  �  �'  �    )  y   �)     _*  n   p*  �   �*  S   �+  [   �+  5   4,  �   j,  t  -    {.  �   �/  F  0  �   d1  :   >2     y2  �   �2  y   3   **Source code:** :source:`Lib/asyncio/events.py` :class:`ProactorEventLoop` now supports SSL. :class:`ProactorEventLoop` specific limits: :class:`SelectorEventLoop` specific limits: :class:`~selectors.SelectSelector` is used which only supports sockets and is limited to 512 sockets. :meth:`EventLoopPolicy.set_child_watcher` is not supported. :class:`ProactorEventLoop` supports subprocesses. It has only one implementation to watch child processes, there is no need to configure it. :meth:`~AbstractEventLoop.add_reader` and :meth:`~AbstractEventLoop.add_writer` are not supported :meth:`~AbstractEventLoop.add_reader` and :meth:`~AbstractEventLoop.add_writer` only accept file descriptors of sockets :meth:`~AbstractEventLoop.add_signal_handler` and :meth:`~AbstractEventLoop.remove_signal_handler` are not supported :meth:`~AbstractEventLoop.create_datagram_endpoint` (UDP) is not supported :meth:`~AbstractEventLoop.create_unix_connection` and :meth:`~AbstractEventLoop.create_unix_server` are not supported: the socket family :data:`socket.AF_UNIX` is specific to UNIX :ref:`Subprocesses <asyncio-subprocess>` are not supported (ex: :meth:`~AbstractEventLoop.subprocess_exec`, :meth:`~AbstractEventLoop.subprocess_shell`) Access to the global loop policy An event loop policy must implement the following interface: Availability: Windows. Available event loops Character devices like PTY are only well supported since Mavericks (Mac OS 10.9). They are not supported at all on Mac OS 10.5 and older. Common limits of Windows event loops: Create and return a new event loop object according to this policy's rules. Customizing the event loop policy Equivalent to calling ``get_event_loop_policy().get_event_loop()``. Equivalent to calling ``get_event_loop_policy().new_event_loop()``. Equivalent to calling ``get_event_loop_policy().set_event_loop(loop)``. Event loop based on the :mod:`selectors` module. Subclass of :class:`AbstractEventLoop`. Event loop functions Event loop management is abstracted with a *policy* pattern, to provide maximal flexibility for custom platforms and frameworks. Throughout the execution of a process, a single global policy object manages the event loops available to the process based on the calling context. A policy is an object implementing the :class:`AbstractEventLoopPolicy` interface. Event loop policies and the default policy Event loop policy interface Event loop policy. Event loops Example to use a :class:`ProactorEventLoop` on Windows:: For most users of :mod:`asyncio`, policies never have to be dealt with explicitly, since the default global policy is sufficient (see below). Get the current event loop policy. Get the event loop for the current context. If there's need to set this loop as the event loop for the current context, :meth:`set_event_loop` must be called explicitly. Mac OS X On Mac OS 10.6, 10.7 and 10.8, the default event loop is :class:`SelectorEventLoop` which uses :class:`selectors.KqueueSelector`. :class:`selectors.KqueueSelector` does not support character devices on these versions.  The :class:`SelectorEventLoop` can be used with :class:`~selectors.SelectSelector` or :class:`~selectors.PollSelector` to support character devices on these versions of Mac OS X. Example:: On Windows, only sockets are supported (ex: pipes are not supported): see the `MSDN documentation of select <https://msdn.microsoft.com/en-us/library/windows/desktop/ms740141%28v=vs.85%29.aspx>`_. Pipes are not supported (ex: :meth:`~AbstractEventLoop.connect_read_pipe`, :meth:`~AbstractEventLoop.connect_write_pipe`) Platform support Proactor event loop for Windows using "I/O Completion Ports" aka IOCP. Subclass of :class:`AbstractEventLoop`. Raises an exception in case no event loop has been set for the current context and the current policy does not specify to create one. It must never return ``None``. Returns an event loop object implementing the :class:`AbstractEventLoop` interface. Set the current event loop policy. If *policy* is ``None``, the default policy is restored. Set the event loop for the current context to *loop*. The :mod:`asyncio` module has been designed to be portable, but each platform still has subtle differences and may not support all :mod:`asyncio` features. The default policy defines context as the current thread, and manages an event loop per thread that interacts with :mod:`asyncio`.  If the current thread doesn't already have an event loop associated with it, the default policy's :meth:`~AbstractEventLoopPolicy.get_event_loop` method creates one when called from the main thread, but raises :exc:`RuntimeError` otherwise. The following functions are convenient shortcuts to accessing the methods of the global policy. Note that this provides access to the default policy, unless an alternative policy was set by calling :func:`set_event_loop_policy` earlier in the execution of the process. The module-level functions :func:`get_event_loop` and :func:`set_event_loop` provide convenient access to event loops managed by the default policy. The resolution of the monotonic clock on Windows is usually around 15.6 msec. The best resolution is 0.5 msec. The resolution depends on the hardware (availability of `HPET <https://en.wikipedia.org/wiki/High_Precision_Event_Timer>`_) and on the Windows configuration. See :ref:`asyncio delayed calls <asyncio-delayed-calls>`. To implement a new event loop policy, it is recommended you subclass the concrete default event loop policy :class:`DefaultEventLoopPolicy` and override the methods for which you want to change behavior, for example:: Use the most efficient selector available on the platform. Windows `MSDN documentation on I/O Completion Ports <https://msdn.microsoft.com/en-us/library/windows/desktop/aa365198%28v=vs.85%29.aspx>`_. asyncio currently provides two implementations of event loops: :class:`SelectorEventLoop` and :class:`ProactorEventLoop`. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/asyncio/events.py` :class:`ProactorEventLoop` now supports SSL. :class:`ProactorEventLoop` specific limits: :class:`SelectorEventLoop` specific limits: :class:`~selectors.SelectSelector` is used which only supports sockets and is limited to 512 sockets. :meth:`EventLoopPolicy.set_child_watcher` is not supported. :class:`ProactorEventLoop` supports subprocesses. It has only one implementation to watch child processes, there is no need to configure it. :meth:`~AbstractEventLoop.add_reader` and :meth:`~AbstractEventLoop.add_writer` are not supported :meth:`~AbstractEventLoop.add_reader` and :meth:`~AbstractEventLoop.add_writer` only accept file descriptors of sockets :meth:`~AbstractEventLoop.add_signal_handler` and :meth:`~AbstractEventLoop.remove_signal_handler` are not supported :meth:`~AbstractEventLoop.create_datagram_endpoint` (UDP) is not supported :meth:`~AbstractEventLoop.create_unix_connection` and :meth:`~AbstractEventLoop.create_unix_server` are not supported: the socket family :data:`socket.AF_UNIX` is specific to UNIX :ref:`Subprocesses <asyncio-subprocess>` are not supported (ex: :meth:`~AbstractEventLoop.subprocess_exec`, :meth:`~AbstractEventLoop.subprocess_shell`) Access to the global loop policy An event loop policy must implement the following interface: Availability: Windows. Available event loops Character devices like PTY are only well supported since Mavericks (Mac OS 10.9). They are not supported at all on Mac OS 10.5 and older. Common limits of Windows event loops: Create and return a new event loop object according to this policy's rules. Customizing the event loop policy Equivalent to calling ``get_event_loop_policy().get_event_loop()``. Equivalent to calling ``get_event_loop_policy().new_event_loop()``. Equivalent to calling ``get_event_loop_policy().set_event_loop(loop)``. Event loop based on the :mod:`selectors` module. Subclass of :class:`AbstractEventLoop`. Event loop functions Event loop management is abstracted with a *policy* pattern, to provide maximal flexibility for custom platforms and frameworks. Throughout the execution of a process, a single global policy object manages the event loops available to the process based on the calling context. A policy is an object implementing the :class:`AbstractEventLoopPolicy` interface. Event loop policies and the default policy Event loop policy interface Event loop policy. Event loops Example to use a :class:`ProactorEventLoop` on Windows:: For most users of :mod:`asyncio`, policies never have to be dealt with explicitly, since the default global policy is sufficient (see below). Get the current event loop policy. Get the event loop for the current context. If there's need to set this loop as the event loop for the current context, :meth:`set_event_loop` must be called explicitly. Mac OS X On Mac OS 10.6, 10.7 and 10.8, the default event loop is :class:`SelectorEventLoop` which uses :class:`selectors.KqueueSelector`. :class:`selectors.KqueueSelector` does not support character devices on these versions.  The :class:`SelectorEventLoop` can be used with :class:`~selectors.SelectSelector` or :class:`~selectors.PollSelector` to support character devices on these versions of Mac OS X. Example:: On Windows, only sockets are supported (ex: pipes are not supported): see the `MSDN documentation of select <https://msdn.microsoft.com/en-us/library/windows/desktop/ms740141%28v=vs.85%29.aspx>`_. Pipes are not supported (ex: :meth:`~AbstractEventLoop.connect_read_pipe`, :meth:`~AbstractEventLoop.connect_write_pipe`) Platform support Proactor event loop for Windows using "I/O Completion Ports" aka IOCP. Subclass of :class:`AbstractEventLoop`. Raises an exception in case no event loop has been set for the current context and the current policy does not specify to create one. It must never return ``None``. Returns an event loop object implementing the :class:`AbstractEventLoop` interface. Set the current event loop policy. If *policy* is ``None``, the default policy is restored. Set the event loop for the current context to *loop*. The :mod:`asyncio` module has been designed to be portable, but each platform still has subtle differences and may not support all :mod:`asyncio` features. The default policy defines context as the current thread, and manages an event loop per thread that interacts with :mod:`asyncio`.  If the current thread doesn't already have an event loop associated with it, the default policy's :meth:`~AbstractEventLoopPolicy.get_event_loop` method creates one when called from the main thread, but raises :exc:`RuntimeError` otherwise. The following functions are convenient shortcuts to accessing the methods of the global policy. Note that this provides access to the default policy, unless an alternative policy was set by calling :func:`set_event_loop_policy` earlier in the execution of the process. The module-level functions :func:`get_event_loop` and :func:`set_event_loop` provide convenient access to event loops managed by the default policy. The resolution of the monotonic clock on Windows is usually around 15.6 msec. The best resolution is 0.5 msec. The resolution depends on the hardware (availability of `HPET <https://en.wikipedia.org/wiki/High_Precision_Event_Timer>`_) and on the Windows configuration. See :ref:`asyncio delayed calls <asyncio-delayed-calls>`. To implement a new event loop policy, it is recommended you subclass the concrete default event loop policy :class:`DefaultEventLoopPolicy` and override the methods for which you want to change behavior, for example:: Use the most efficient selector available on the platform. Windows `MSDN documentation on I/O Completion Ports <https://msdn.microsoft.com/en-us/library/windows/desktop/aa365198%28v=vs.85%29.aspx>`_. asyncio currently provides two implementations of event loops: :class:`SelectorEventLoop` and :class:`ProactorEventLoop`. 