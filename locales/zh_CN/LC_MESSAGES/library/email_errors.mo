��          �               �  .   �  w   �  m   4  �   �  �   �  j   S  h   �  �   '  .    w   0  |   �  1   %  K   W     �  v  �  ?  9
  _  y  L  �  N   &  :   u  �   �  �   ^  �  8  .   �  w     m   �  �     �   �  j   �  h      �   �  .  c  w   �  |   
  1   �  K   �       v  $  ?  �  _  �  L  ;  N   �   :   �   �   !  �   �!   **Source code:** :source:`Lib/email/errors.py` :class:`CloseBoundaryNotFoundDefect` -- A start boundary was found, but no corresponding close boundary was ever found. :class:`FirstHeaderLineIsContinuationDefect` -- The message had a continuation line as its first header line. :class:`InvalidBase64CharactersDefect` -- When decoding a block of base64 encoded bytes, characters outside the base64 alphabet were encountered. The characters are ignored, but the resulting decoded bytes may be invalid. :class:`InvalidBase64PaddingDefect` -- When decoding a block of base64 encoded bytes, the padding was not correct.  Enough padding is added to perform the decode, but the resulting decoded bytes may be invalid. :class:`MalformedHeaderDefect` -- A header was found that was missing a colon, or was otherwise malformed. :class:`MisplacedEnvelopeHeaderDefect` - A "Unix From" header was found in the middle of a header block. :class:`MissingHeaderBodySeparatorDefect` - A line was found while parsing headers that had no leading white space but contained no ':'.  Parsing continues assuming that the line represents the first line of the body. :class:`MultipartInvariantViolationDefect` -- A message claimed to be a :mimetype:`multipart`, but no subparts were found.  Note that when a message has this defect, its :meth:`~email.message.Message.is_multipart` method may return false even though its content type claims to be :mimetype:`multipart`. :class:`NoBoundaryInMultipartDefect` -- A message claimed to be a multipart, but had no :mimetype:`boundary` parameter. :class:`StartBoundaryNotFoundDefect` -- The start boundary claimed in the :mailheader:`Content-Type` header was never found. :mod:`email.errors`: Exception and Defect classes All defect classes are subclassed from :class:`email.errors.MessageDefect`. Deprecated and no longer used. Here is the list of the defects that the :class:`~email.parser.FeedParser` can find while parsing messages.  Note that the defects are added to the message where the problem was found, so for example, if a message nested inside a :mimetype:`multipart/alternative` had a malformed header, that nested message object would have a defect, but the containing messages would not. Raised under some error conditions when parsing the :rfc:`5322` headers of a message, this class is derived from :exc:`MessageParseError`.  The :meth:`~email.message.EmailMessage.set_boundary` method will raise this error if the content type is unknown when the method is called. :class:`~email.header.Header` may raise this error for certain base64 decoding errors, and when an attempt is made to create a header that appears to contain an embedded header (that is, there is what is supposed to be a continuation line that has no leading whitespace and looks like a header). Raised when a payload is added to a :class:`~email.message.Message` object using :meth:`add_payload`, but the payload is already a scalar and the message's :mailheader:`Content-Type` main type is not either :mimetype:`multipart` or missing.  :exc:`MultipartConversionError` multiply inherits from :exc:`MessageError` and the built-in :exc:`TypeError`. Since :meth:`Message.add_payload` is deprecated, this exception is rarely raised in practice.  However the exception may also be raised if the :meth:`~email.message.Message.attach` method is called on an instance of a class derived from :class:`~email.mime.nonmultipart.MIMENonMultipart` (e.g. :class:`~email.mime.image.MIMEImage`). The following exception classes are defined in the :mod:`email.errors` module: This defect has not been used for several Python versions. This is the base class for all exceptions that the :mod:`email` package can raise.  It is derived from the standard :exc:`Exception` class and defines no additional methods. This is the base class for exceptions raised by the :class:`~email.parser.Parser` class.  It is derived from :exc:`MessageError`.  This class is also used internally by the parser used by :mod:`~email.headerregistry`. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/email/errors.py` :class:`CloseBoundaryNotFoundDefect` -- A start boundary was found, but no corresponding close boundary was ever found. :class:`FirstHeaderLineIsContinuationDefect` -- The message had a continuation line as its first header line. :class:`InvalidBase64CharactersDefect` -- When decoding a block of base64 encoded bytes, characters outside the base64 alphabet were encountered. The characters are ignored, but the resulting decoded bytes may be invalid. :class:`InvalidBase64PaddingDefect` -- When decoding a block of base64 encoded bytes, the padding was not correct.  Enough padding is added to perform the decode, but the resulting decoded bytes may be invalid. :class:`MalformedHeaderDefect` -- A header was found that was missing a colon, or was otherwise malformed. :class:`MisplacedEnvelopeHeaderDefect` - A "Unix From" header was found in the middle of a header block. :class:`MissingHeaderBodySeparatorDefect` - A line was found while parsing headers that had no leading white space but contained no ':'.  Parsing continues assuming that the line represents the first line of the body. :class:`MultipartInvariantViolationDefect` -- A message claimed to be a :mimetype:`multipart`, but no subparts were found.  Note that when a message has this defect, its :meth:`~email.message.Message.is_multipart` method may return false even though its content type claims to be :mimetype:`multipart`. :class:`NoBoundaryInMultipartDefect` -- A message claimed to be a multipart, but had no :mimetype:`boundary` parameter. :class:`StartBoundaryNotFoundDefect` -- The start boundary claimed in the :mailheader:`Content-Type` header was never found. :mod:`email.errors`: Exception and Defect classes All defect classes are subclassed from :class:`email.errors.MessageDefect`. Deprecated and no longer used. Here is the list of the defects that the :class:`~email.parser.FeedParser` can find while parsing messages.  Note that the defects are added to the message where the problem was found, so for example, if a message nested inside a :mimetype:`multipart/alternative` had a malformed header, that nested message object would have a defect, but the containing messages would not. Raised under some error conditions when parsing the :rfc:`5322` headers of a message, this class is derived from :exc:`MessageParseError`.  The :meth:`~email.message.EmailMessage.set_boundary` method will raise this error if the content type is unknown when the method is called. :class:`~email.header.Header` may raise this error for certain base64 decoding errors, and when an attempt is made to create a header that appears to contain an embedded header (that is, there is what is supposed to be a continuation line that has no leading whitespace and looks like a header). Raised when a payload is added to a :class:`~email.message.Message` object using :meth:`add_payload`, but the payload is already a scalar and the message's :mailheader:`Content-Type` main type is not either :mimetype:`multipart` or missing.  :exc:`MultipartConversionError` multiply inherits from :exc:`MessageError` and the built-in :exc:`TypeError`. Since :meth:`Message.add_payload` is deprecated, this exception is rarely raised in practice.  However the exception may also be raised if the :meth:`~email.message.Message.attach` method is called on an instance of a class derived from :class:`~email.mime.nonmultipart.MIMENonMultipart` (e.g. :class:`~email.mime.image.MIMEImage`). The following exception classes are defined in the :mod:`email.errors` module: This defect has not been used for several Python versions. This is the base class for all exceptions that the :mod:`email` package can raise.  It is derived from the standard :exc:`Exception` class and defines no additional methods. This is the base class for exceptions raised by the :class:`~email.parser.Parser` class.  It is derived from :exc:`MessageError`.  This class is also used internally by the parser used by :mod:`~email.headerregistry`. 