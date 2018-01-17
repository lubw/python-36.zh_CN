��    +      t              �  6   �  2     �   7  J     !   S  a   u  �   �     �     �  	   �  -  �    "  [  ;	  q   �
  _   	  �   i    �  U   �  �  I  f  �  ~   b  �   �  �   �  4  ^  X   �  �  �  /  �  M     �   b  s     �  �  �  >  d   �  �   ,     �     �  (   �  A        F  N   `  #   �  *   �  �  �  6   �   2   �   �   0!  J   "  !   L"  a   n"  �   �"     �#     �#     �$  -  �$    &  [  1'  q   �(  _   �(  �   _)    �)  U   �*  �  ?+  f  �,  ~   X.  �   �.  �   �/  4  T0  X   �1  �  �1  /  �3  M   
5  �   X5  s   6  �  �6  �  48  d   �:  �   ";     �;     �;  (   �;  A   �;     <<  N   V<  #   �<  *   �<   **Source code:** :source:`Lib/email/contentmanager.py` :mod:`email.contentmanager`: Managing MIME Content A *cte* of ``binary`` does not actually work correctly yet. The ``EmailMessage`` object as modified by ``set_content`` is correct, but :class:`~email.generator.BytesGenerator` does not serialize it correctly. Add a :mailheader:`Content-Type` header with a ``maintype/subtype`` value. Add headers and payload to *msg*: Also add a :mailheader:`MIME-Version` header if one is not present (see also :class:`.MIMEPart`). Base class for content managers.  Provides the standard registry mechanisms to register converters between MIME content and other representations, as well as the ``get_content`` and ``set_content`` dispatch methods. Content Manager Instances Currently the email package provides only one concrete content manager, :data:`raw_data_manager`, although more may be added in the future. :data:`raw_data_manager` is the :attr:`~email.policy.EmailPolicy.content_manager` provided by :attr:`~email.policy.EmailPolicy` and its derivatives. Footnotes For *<'list'>*, which should be a list of :class:`~email.message.EmailMessage` objects, set the ``maintype`` to ``multipart``, and the ``subtype`` to *subtype* if it is specified, and ``mixed`` if it is not.  If the message parts in the *<'list'>* have :mailheader:`MIME-Version` headers, remove them. For :class:`~email.message.EmailMessage` objects, set the maintype to ``message``, and set the subtype to *subtype* if it is specified or ``rfc822`` if it is not.  If *subtype* is ``partial``, raise an error (``bytes`` objects must be used to construct ``message/partial`` parts). For :class:`~email.message.EmailMessage`, per :rfc:`2046`, raise an error if a *cte* of ``quoted-printable`` or ``base64`` is requested for *subtype* ``rfc822``, and for any *cte* other than ``7bit`` for *subtype* ``external-body``.  For ``message/rfc822``, use ``8bit`` if *cte* is not specified.  For all other values of *subtype*, use ``7bit``. For ``bytes``, use the specified *maintype* and *subtype*, or raise a :exc:`TypeError` if they are not specified. For ``str`` objects, if *cte* is not set use heuristics to determine the most compact encoding. For ``str``, set the MIME ``maintype`` to ``text``, and set the subtype to *subtype* if it is specified, or ``plain`` if it is not. If *charset* is provided (which is valid only for ``str``), encode the string to bytes using the specified character set.  The default is ``utf-8``.  If the specified *charset* is a known alias for a standard MIME charset name, use the standard charset instead. If *cid* is specified, add a :mailheader:`Content-ID` header with *cid* as its value. If *cte* is set, encode the payload using the specified content transfer encoding, and set the :mailheader:`Content-Transfer-Encoding` header to that value.  Possible values for *cte* are ``quoted-printable``, ``base64``, ``7bit``, ``8bit``, and ``binary``.  If the input cannot be encoded in the specified encoding (for example, specifying a *cte* of ``7bit`` for an input that contains non-ASCII values), raise a :exc:`ValueError`. If *disposition* is set, use it as the value of the :mailheader:`Content-Disposition` header.  If not specified, and *filename* is specified, add the header with the value ``attachment``. If *disposition* is not specified and *filename* is also not specified, do not add the header.  The only valid values for *disposition* are ``attachment`` and ``inline``. If *filename* is specified, use it as the value of the ``filename`` parameter of the :mailheader:`Content-Disposition` header. If *headers* is specified and is a list of strings of the form ``headername: headervalue`` or a list of ``header`` objects (distinguished from strings by having a ``name`` attribute), add the headers to *msg*. If *params* is specified, iterate its ``items`` method and use the resulting ``(key, value)`` pairs to set additional parameters on the :mailheader:`Content-Type` header. If none of the above match, repeat all of the checks above for each of the types in the :term:`MRO` (``typ.__mro__``).  Finally, if no other key yields a handler, check for a handler for the key ``None``.  If there is no handler for ``None``, raise a :exc:`KeyError` for the fully qualified name of the type. If none of these keys produce a handler, raise a :exc:`KeyError` for the full MIME type. If the ``maintype`` is ``multipart``, raise a :exc:`TypeError`; otherwise look up a handler function based on the type of *obj* (see next paragraph), call :meth:`~email.message.EmailMessage.clear_content` on the *msg*, and call the handler function, passing through all arguments.  The expectation is that the handler will transform and store *obj* into *msg*, possibly making other changes to *msg* as well, such as adding various MIME headers to encode information needed to interpret the stored data. Look up a handler function based on the ``mimetype`` of *msg* (see next paragraph), call it, passing through all arguments, and return the result of the call.  The expectation is that the handler will extract the payload from *msg* and return an object that encodes information about the extracted data. Originally added in 3.4 as a :term:`provisional module <provisional package>` Record *handler* as the function to call when an object of a type matching *typekey* is passed to :meth:`set_content`.  For the possible values of *typekey*, see :meth:`set_content`. Record the function *handler* as the handler for *key*.  For the possible values of *key*, see :meth:`get_content`. Return the payload of the part as either a string (for ``text`` parts), an :class:`~email.message.EmailMessage` object (for ``message/rfc822`` parts), or a ``bytes`` object (for all other non-multipart types).  Raise a :exc:`KeyError` if called on a ``multipart``.  If the part is a ``text`` part and *errors* is specified, use it as the error handler when decoding the payload to unicode.  The default error handler is ``replace``. This content manager provides only a minimum interface beyond that provided by :class:`~email.message.Message` itself:  it deals only with text, raw byte strings, and :class:`~email.message.Message` objects.  Nevertheless, it provides significant advantages compared to the base API: ``get_content`` on a text part will return a unicode string without the application needing to manually decode it, ``set_content`` provides a rich set of options for controlling the headers added to a part and controlling the content transfer encoding, and it enables the use of the various ``add_`` methods, thereby simplifying the creation of multipart messages. To find the handler, look for the following keys in the registry, stopping with the first one found: To find the handler, obtain the type of *obj* (``typ = type(obj)``), and look for the following keys in the registry, stopping with the first one found: [1]_ the empty string the string representing the ``maintype`` the string representing the full MIME type (``maintype/subtype``) the type itself (``typ``) the type's fully qualified name (``typ.__module__ + '.' + typ.__qualname__``). the type's name (``typ.__name__``). the type's qualname (``typ.__qualname__``) Project-Id-Version: Python 3.6
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-01-05 15:01+0000
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Jerry Chen <jerrychen9657@gmail.com>, 2017
Language: zh_Hans_CN
Language-Team: Chinese (China) (https://www.transifex.com/python-doc/teams/5390/zh_CN/)
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.1
 **Source code:** :source:`Lib/email/contentmanager.py` :mod:`email.contentmanager`: Managing MIME Content A *cte* of ``binary`` does not actually work correctly yet. The ``EmailMessage`` object as modified by ``set_content`` is correct, but :class:`~email.generator.BytesGenerator` does not serialize it correctly. Add a :mailheader:`Content-Type` header with a ``maintype/subtype`` value. Add headers and payload to *msg*: Also add a :mailheader:`MIME-Version` header if one is not present (see also :class:`.MIMEPart`). Base class for content managers.  Provides the standard registry mechanisms to register converters between MIME content and other representations, as well as the ``get_content`` and ``set_content`` dispatch methods. Content Manager Instances Currently the email package provides only one concrete content manager, :data:`raw_data_manager`, although more may be added in the future. :data:`raw_data_manager` is the :attr:`~email.policy.EmailPolicy.content_manager` provided by :attr:`~email.policy.EmailPolicy` and its derivatives. 脚注 For *<'list'>*, which should be a list of :class:`~email.message.EmailMessage` objects, set the ``maintype`` to ``multipart``, and the ``subtype`` to *subtype* if it is specified, and ``mixed`` if it is not.  If the message parts in the *<'list'>* have :mailheader:`MIME-Version` headers, remove them. For :class:`~email.message.EmailMessage` objects, set the maintype to ``message``, and set the subtype to *subtype* if it is specified or ``rfc822`` if it is not.  If *subtype* is ``partial``, raise an error (``bytes`` objects must be used to construct ``message/partial`` parts). For :class:`~email.message.EmailMessage`, per :rfc:`2046`, raise an error if a *cte* of ``quoted-printable`` or ``base64`` is requested for *subtype* ``rfc822``, and for any *cte* other than ``7bit`` for *subtype* ``external-body``.  For ``message/rfc822``, use ``8bit`` if *cte* is not specified.  For all other values of *subtype*, use ``7bit``. For ``bytes``, use the specified *maintype* and *subtype*, or raise a :exc:`TypeError` if they are not specified. For ``str`` objects, if *cte* is not set use heuristics to determine the most compact encoding. For ``str``, set the MIME ``maintype`` to ``text``, and set the subtype to *subtype* if it is specified, or ``plain`` if it is not. If *charset* is provided (which is valid only for ``str``), encode the string to bytes using the specified character set.  The default is ``utf-8``.  If the specified *charset* is a known alias for a standard MIME charset name, use the standard charset instead. If *cid* is specified, add a :mailheader:`Content-ID` header with *cid* as its value. If *cte* is set, encode the payload using the specified content transfer encoding, and set the :mailheader:`Content-Transfer-Encoding` header to that value.  Possible values for *cte* are ``quoted-printable``, ``base64``, ``7bit``, ``8bit``, and ``binary``.  If the input cannot be encoded in the specified encoding (for example, specifying a *cte* of ``7bit`` for an input that contains non-ASCII values), raise a :exc:`ValueError`. If *disposition* is set, use it as the value of the :mailheader:`Content-Disposition` header.  If not specified, and *filename* is specified, add the header with the value ``attachment``. If *disposition* is not specified and *filename* is also not specified, do not add the header.  The only valid values for *disposition* are ``attachment`` and ``inline``. If *filename* is specified, use it as the value of the ``filename`` parameter of the :mailheader:`Content-Disposition` header. If *headers* is specified and is a list of strings of the form ``headername: headervalue`` or a list of ``header`` objects (distinguished from strings by having a ``name`` attribute), add the headers to *msg*. If *params* is specified, iterate its ``items`` method and use the resulting ``(key, value)`` pairs to set additional parameters on the :mailheader:`Content-Type` header. If none of the above match, repeat all of the checks above for each of the types in the :term:`MRO` (``typ.__mro__``).  Finally, if no other key yields a handler, check for a handler for the key ``None``.  If there is no handler for ``None``, raise a :exc:`KeyError` for the fully qualified name of the type. If none of these keys produce a handler, raise a :exc:`KeyError` for the full MIME type. If the ``maintype`` is ``multipart``, raise a :exc:`TypeError`; otherwise look up a handler function based on the type of *obj* (see next paragraph), call :meth:`~email.message.EmailMessage.clear_content` on the *msg*, and call the handler function, passing through all arguments.  The expectation is that the handler will transform and store *obj* into *msg*, possibly making other changes to *msg* as well, such as adding various MIME headers to encode information needed to interpret the stored data. Look up a handler function based on the ``mimetype`` of *msg* (see next paragraph), call it, passing through all arguments, and return the result of the call.  The expectation is that the handler will extract the payload from *msg* and return an object that encodes information about the extracted data. Originally added in 3.4 as a :term:`provisional module <provisional package>` Record *handler* as the function to call when an object of a type matching *typekey* is passed to :meth:`set_content`.  For the possible values of *typekey*, see :meth:`set_content`. Record the function *handler* as the handler for *key*.  For the possible values of *key*, see :meth:`get_content`. Return the payload of the part as either a string (for ``text`` parts), an :class:`~email.message.EmailMessage` object (for ``message/rfc822`` parts), or a ``bytes`` object (for all other non-multipart types).  Raise a :exc:`KeyError` if called on a ``multipart``.  If the part is a ``text`` part and *errors* is specified, use it as the error handler when decoding the payload to unicode.  The default error handler is ``replace``. This content manager provides only a minimum interface beyond that provided by :class:`~email.message.Message` itself:  it deals only with text, raw byte strings, and :class:`~email.message.Message` objects.  Nevertheless, it provides significant advantages compared to the base API: ``get_content`` on a text part will return a unicode string without the application needing to manually decode it, ``set_content`` provides a rich set of options for controlling the headers added to a part and controlling the content transfer encoding, and it enables the use of the various ``add_`` methods, thereby simplifying the creation of multipart messages. To find the handler, look for the following keys in the registry, stopping with the first one found: To find the handler, obtain the type of *obj* (``typ = type(obj)``), and look for the following keys in the registry, stopping with the first one found: [1]_ the empty string the string representing the ``maintype`` the string representing the full MIME type (``maintype/subtype``) the type itself (``typ``) the type's fully qualified name (``typ.__module__ + '.' + typ.__qualname__``). the type's name (``typ.__name__``). the type's qualname (``typ.__qualname__``) 