��    4      �              \  (   ]     �  g     �   n  �   <  �     �   �  �   o  ?     �   ^  �  �  I   �
  |     ^        �  �   �  5  �  �   �  ~   �  �   ;  o   �  n   9  n   �  n     �   �  �   #  (     (   E    n  n   q  ]   �  �   >  \   �  \   !  \   ~    �  �  �  l   �         /  Z  F  �   �  �   {  `     J   l  �   �  �  �     9!     O!  q  n!  S  �"  �  4$  (   �%     &  g   �&  �   �&  �   �'  �   �(  �   {)  �   �)  ?   �*  �   �*  �  �+  I   F-  |   �-  ^   .     l.  �   �.  5  &/  �   \0  ~   J1  �   �1  o   W2  n   �2  n   63  n   �3  �   4  �   �4  (   �5  (   �5    �5  n   �6  ]   n7  �   �7  \   R8  \   �8  \   9    i9  �  �:  l   :<    �<     �=  Z  �=  �   /?  �   	@  `   �@  J   �@  �   EA  �  :B     �C     �C  q  �C  S  nE   **Source code:** :source:`Lib/base64.py` *adobe* controls whether the encoded byte sequence is framed with ``<~`` and ``~>``, which is used by the Adobe implementation. *adobe* controls whether the input sequence is in Adobe Ascii85 format (i.e. is framed with <~ and ~>). *foldspaces* is a flag that specifies whether the 'y' short sequence should be accepted as shorthand for 4 consecutive spaces (ASCII 0x20). This feature is not supported by the "standard" Ascii85 encoding. *foldspaces* is an optional flag that uses the special short sequence 'y' instead of 4 consecutive spaces (ASCII 0x20) as supported by 'btoa'. This feature is not supported by the "standard" Ascii85 encoding. *ignorechars* should be a :term:`bytes-like object` or ASCII string containing characters to ignore from the input. This should only contain whitespace characters, and by default contains all whitespace characters in ASCII. *pad* controls whether the input is padded to a multiple of 4 before encoding. Note that the ``btoa`` implementation always pads. *wrapcol* controls whether the output should have newline (``b'\n'``) characters added to it. If this is non-zero, each output line will be at most this many characters long. :mod:`base64` --- Base16, Base32, Base64, Base85 Data Encodings :rfc:`1521` - MIME (Multipurpose Internet Mail Extensions) Part One: Mechanisms for Specifying and Describing the Format of Internet Message Bodies :rfc:`3548` allows for optional mapping of the digit 0 (zero) to the letter O (oh), and for optional mapping of the digit 1 (one) to either the letter I (eye) or letter L (el).  The optional argument *map01* when not ``None``, specifies which letter the digit 1 should be mapped to (when *map01* is not ``None``, the digit 0 is always mapped to the letter O).  For security purposes the default is ``None``, so that 0 and 1 are not allowed in the input. A :exc:`binascii.Error` exception is raised if *s* is incorrectly padded. A :exc:`binascii.Error` is raised if *s* is incorrectly padded or if there are non-alphabet characters present in the input. ASCII-only Unicode strings are now accepted by the decoding functions of the modern interface. An example usage of the module: Any :term:`bytes-like objects <bytes-like object>` are now accepted by all encoding and decoding functions in this module.  Ascii85/Base85 support added. Both Base85 and Ascii85 have an expansion factor of 5 to 4 (5 Base85 or Ascii85 characters can encode 4 binary bytes), while the better-known Base64 has an expansion factor of 6 to 4.  They are therefore more efficient when space expensive.  They differ by details such as the character map used for encoding. Decode :term:`bytes-like object` or ASCII string *s* using the URL- and filesystem-safe alphabet, which substitutes ``-`` instead of ``+`` and ``_`` instead of ``/`` in the standard Base64 alphabet, and return the decoded :class:`bytes`. Decode :term:`bytes-like object` or ASCII string *s* using the standard Base64 alphabet and return the decoded :class:`bytes`. Decode the :term:`bytes-like object` *s*, which must contain one or more lines of base64 encoded data, and return the decoded :class:`bytes`. Decode the Ascii85 encoded :term:`bytes-like object` or ASCII string *b* and return the decoded :class:`bytes`. Decode the Base16 encoded :term:`bytes-like object` or ASCII string *s* and return the decoded :class:`bytes`. Decode the Base32 encoded :term:`bytes-like object` or ASCII string *s* and return the decoded :class:`bytes`. Decode the Base64 encoded :term:`bytes-like object` or ASCII string *s* and return the decoded :class:`bytes`. Decode the base85-encoded :term:`bytes-like object` or ASCII string *b* and return the decoded :class:`bytes`.  Padding is implicitly removed, if necessary. Decode the contents of the binary *input* file and write the resulting binary data to the *output* file. *input* and *output* must be :term:`file objects <file object>`. *input* will be read until ``input.readline()`` returns an empty bytes object. Deprecated alias of :func:`decodebytes`. Deprecated alias of :func:`encodebytes`. Encode :term:`bytes-like object` *s* using the URL- and filesystem-safe alphabet, which substitutes ``-`` instead of ``+`` and ``_`` instead of ``/`` in the standard Base64 alphabet, and return the encoded :class:`bytes`.  The result can still contain ``=``. Encode :term:`bytes-like object` *s* using the standard Base64 alphabet and return the encoded :class:`bytes`. Encode the :term:`bytes-like object` *b* using Ascii85 and return the encoded :class:`bytes`. Encode the :term:`bytes-like object` *b* using base85 (as used in e.g. git-style binary diffs) and return the encoded :class:`bytes`. Encode the :term:`bytes-like object` *s* using Base16 and return the encoded :class:`bytes`. Encode the :term:`bytes-like object` *s* using Base32 and return the encoded :class:`bytes`. Encode the :term:`bytes-like object` *s* using Base64 and return the encoded :class:`bytes`. Encode the :term:`bytes-like object` *s*, which can contain arbitrary binary data, and return :class:`bytes` containing the base64-encoded data, with newlines (``b'\n'``) inserted after every 76 bytes of output, and ensuring that there is a trailing newline, as per :rfc:`2045` (MIME). Encode the contents of the binary *input* file and write the resulting base64 encoded data to the *output* file. *input* and *output* must be :term:`file objects <file object>`. *input* will be read until ``input.read()`` returns an empty bytes object. :func:`encode` inserts a newline character (``b'\n'``) after every 76 bytes of the output, as well as ensuring that the output always ends with a newline, as per :rfc:`2045` (MIME). If *pad* is true, the input is padded with ``b'\0'`` so its length is a multiple of 4 bytes before encoding. If *validate* is ``False`` (the default), characters that are neither in the normal base-64 alphabet nor the alternative alphabet are discarded prior to the padding check.  If *validate* is ``True``, these non-alphabet characters in the input result in a :exc:`binascii.Error`. Module :mod:`binascii` Optional *altchars* must be a :term:`bytes-like object` of at least length 2 (additional characters are ignored) which specifies an alternative alphabet for the ``+`` and ``/`` characters.  This allows an application to e.g. generate URL or filesystem safe Base64 strings.  The default is ``None``, for which the standard Base64 alphabet is used. Optional *altchars* must be a :term:`bytes-like object` or ASCII string of at least length 2 (additional characters are ignored) which specifies the alternative alphabet used instead of the ``+`` and ``/`` characters. Optional *casefold* is a flag specifying whether a lowercase alphabet is acceptable as input.  For security purposes, the default is ``False``. Section 5.2, "Base64 Content-Transfer-Encoding," provides the definition of the base64 encoding. Support module containing ASCII-to-binary and binary-to-ASCII conversions. The :rfc:`3548` encodings are suitable for encoding binary data so that it can safely sent by email, used as parts of URLs, or included as part of an HTTP POST request.  The encoding algorithm is not the same as the :program:`uuencode` program. The legacy interface does not support decoding from strings, but it does provide functions for encoding and decoding to and from :term:`file objects <file object>`.  It only supports the Base64 standard alphabet, and it adds newlines every 76 characters as per :rfc:`2045`.  Note that if you are looking for :rfc:`2045` support you probably want to be looking at the :mod:`email` package instead. The legacy interface: The modern interface provides: There are two interfaces provided by this module.  The modern interface supports encoding :term:`bytes-like objects <bytes-like object>` to ASCII :class:`bytes`, and decoding :term:`bytes-like objects <bytes-like object>` or strings containing ASCII to :class:`bytes`.  Both base-64 alphabets defined in :rfc:`3548` (normal, and URL- and filesystem-safe) are supported. This module provides functions for encoding binary data to printable ASCII characters and decoding such encodings back to binary data. It provides encoding and decoding functions for the encodings specified in :rfc:`3548`, which defines the Base16, Base32, and Base64 algorithms, and for the de-facto standard Ascii85 and Base85 encodings. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/base64.py` *adobe* controls whether the encoded byte sequence is framed with ``<~`` and ``~>``, which is used by the Adobe implementation. *adobe* controls whether the input sequence is in Adobe Ascii85 format (i.e. is framed with <~ and ~>). *foldspaces* is a flag that specifies whether the 'y' short sequence should be accepted as shorthand for 4 consecutive spaces (ASCII 0x20). This feature is not supported by the "standard" Ascii85 encoding. *foldspaces* is an optional flag that uses the special short sequence 'y' instead of 4 consecutive spaces (ASCII 0x20) as supported by 'btoa'. This feature is not supported by the "standard" Ascii85 encoding. *ignorechars* should be a :term:`bytes-like object` or ASCII string containing characters to ignore from the input. This should only contain whitespace characters, and by default contains all whitespace characters in ASCII. *pad* controls whether the input is padded to a multiple of 4 before encoding. Note that the ``btoa`` implementation always pads. *wrapcol* controls whether the output should have newline (``b'\n'``) characters added to it. If this is non-zero, each output line will be at most this many characters long. :mod:`base64` --- Base16, Base32, Base64, Base85 Data Encodings :rfc:`1521` - MIME (Multipurpose Internet Mail Extensions) Part One: Mechanisms for Specifying and Describing the Format of Internet Message Bodies :rfc:`3548` allows for optional mapping of the digit 0 (zero) to the letter O (oh), and for optional mapping of the digit 1 (one) to either the letter I (eye) or letter L (el).  The optional argument *map01* when not ``None``, specifies which letter the digit 1 should be mapped to (when *map01* is not ``None``, the digit 0 is always mapped to the letter O).  For security purposes the default is ``None``, so that 0 and 1 are not allowed in the input. A :exc:`binascii.Error` exception is raised if *s* is incorrectly padded. A :exc:`binascii.Error` is raised if *s* is incorrectly padded or if there are non-alphabet characters present in the input. ASCII-only Unicode strings are now accepted by the decoding functions of the modern interface. An example usage of the module: Any :term:`bytes-like objects <bytes-like object>` are now accepted by all encoding and decoding functions in this module.  Ascii85/Base85 support added. Both Base85 and Ascii85 have an expansion factor of 5 to 4 (5 Base85 or Ascii85 characters can encode 4 binary bytes), while the better-known Base64 has an expansion factor of 6 to 4.  They are therefore more efficient when space expensive.  They differ by details such as the character map used for encoding. Decode :term:`bytes-like object` or ASCII string *s* using the URL- and filesystem-safe alphabet, which substitutes ``-`` instead of ``+`` and ``_`` instead of ``/`` in the standard Base64 alphabet, and return the decoded :class:`bytes`. Decode :term:`bytes-like object` or ASCII string *s* using the standard Base64 alphabet and return the decoded :class:`bytes`. Decode the :term:`bytes-like object` *s*, which must contain one or more lines of base64 encoded data, and return the decoded :class:`bytes`. Decode the Ascii85 encoded :term:`bytes-like object` or ASCII string *b* and return the decoded :class:`bytes`. Decode the Base16 encoded :term:`bytes-like object` or ASCII string *s* and return the decoded :class:`bytes`. Decode the Base32 encoded :term:`bytes-like object` or ASCII string *s* and return the decoded :class:`bytes`. Decode the Base64 encoded :term:`bytes-like object` or ASCII string *s* and return the decoded :class:`bytes`. Decode the base85-encoded :term:`bytes-like object` or ASCII string *b* and return the decoded :class:`bytes`.  Padding is implicitly removed, if necessary. Decode the contents of the binary *input* file and write the resulting binary data to the *output* file. *input* and *output* must be :term:`file objects <file object>`. *input* will be read until ``input.readline()`` returns an empty bytes object. Deprecated alias of :func:`decodebytes`. Deprecated alias of :func:`encodebytes`. Encode :term:`bytes-like object` *s* using the URL- and filesystem-safe alphabet, which substitutes ``-`` instead of ``+`` and ``_`` instead of ``/`` in the standard Base64 alphabet, and return the encoded :class:`bytes`.  The result can still contain ``=``. Encode :term:`bytes-like object` *s* using the standard Base64 alphabet and return the encoded :class:`bytes`. Encode the :term:`bytes-like object` *b* using Ascii85 and return the encoded :class:`bytes`. Encode the :term:`bytes-like object` *b* using base85 (as used in e.g. git-style binary diffs) and return the encoded :class:`bytes`. Encode the :term:`bytes-like object` *s* using Base16 and return the encoded :class:`bytes`. Encode the :term:`bytes-like object` *s* using Base32 and return the encoded :class:`bytes`. Encode the :term:`bytes-like object` *s* using Base64 and return the encoded :class:`bytes`. Encode the :term:`bytes-like object` *s*, which can contain arbitrary binary data, and return :class:`bytes` containing the base64-encoded data, with newlines (``b'\n'``) inserted after every 76 bytes of output, and ensuring that there is a trailing newline, as per :rfc:`2045` (MIME). Encode the contents of the binary *input* file and write the resulting base64 encoded data to the *output* file. *input* and *output* must be :term:`file objects <file object>`. *input* will be read until ``input.read()`` returns an empty bytes object. :func:`encode` inserts a newline character (``b'\n'``) after every 76 bytes of the output, as well as ensuring that the output always ends with a newline, as per :rfc:`2045` (MIME). If *pad* is true, the input is padded with ``b'\0'`` so its length is a multiple of 4 bytes before encoding. If *validate* is ``False`` (the default), characters that are neither in the normal base-64 alphabet nor the alternative alphabet are discarded prior to the padding check.  If *validate* is ``True``, these non-alphabet characters in the input result in a :exc:`binascii.Error`. Module :mod:`binascii` Optional *altchars* must be a :term:`bytes-like object` of at least length 2 (additional characters are ignored) which specifies an alternative alphabet for the ``+`` and ``/`` characters.  This allows an application to e.g. generate URL or filesystem safe Base64 strings.  The default is ``None``, for which the standard Base64 alphabet is used. Optional *altchars* must be a :term:`bytes-like object` or ASCII string of at least length 2 (additional characters are ignored) which specifies the alternative alphabet used instead of the ``+`` and ``/`` characters. Optional *casefold* is a flag specifying whether a lowercase alphabet is acceptable as input.  For security purposes, the default is ``False``. Section 5.2, "Base64 Content-Transfer-Encoding," provides the definition of the base64 encoding. Support module containing ASCII-to-binary and binary-to-ASCII conversions. The :rfc:`3548` encodings are suitable for encoding binary data so that it can safely sent by email, used as parts of URLs, or included as part of an HTTP POST request.  The encoding algorithm is not the same as the :program:`uuencode` program. The legacy interface does not support decoding from strings, but it does provide functions for encoding and decoding to and from :term:`file objects <file object>`.  It only supports the Base64 standard alphabet, and it adds newlines every 76 characters as per :rfc:`2045`.  Note that if you are looking for :rfc:`2045` support you probably want to be looking at the :mod:`email` package instead. The legacy interface: The modern interface provides: There are two interfaces provided by this module.  The modern interface supports encoding :term:`bytes-like objects <bytes-like object>` to ASCII :class:`bytes`, and decoding :term:`bytes-like objects <bytes-like object>` or strings containing ASCII to :class:`bytes`.  Both base-64 alphabets defined in :rfc:`3548` (normal, and URL- and filesystem-safe) are supported. This module provides functions for encoding binary data to printable ASCII characters and decoding such encodings back to binary data. It provides encoding and decoding functions for the encodings specified in :rfc:`3548`, which defines the Base16, Base32, and Base64 algorithms, and for the de-facto standard Ascii85 and Base85 encodings. 