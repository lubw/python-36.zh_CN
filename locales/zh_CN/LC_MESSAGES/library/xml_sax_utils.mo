��          �               �   2   �   )   0  9   Z  !  �  %   �  �   �  p  �  a  �  r   `  ~  �  E   R
  %  �
  $  �  �  �  2   �  )   �  9   �  !  1  %   S  �   y  p  *  a  �  r   �  ~  p  E   �  %  5  $  [   **Source code:** :source:`Lib/xml/sax/saxutils.py` :mod:`xml.sax.saxutils` --- SAX Utilities Escape ``'&'``, ``'<'``, and ``'>'`` in a string of data. Similar to :func:`escape`, but also prepares *data* to be used as an attribute value.  The return value is a quoted version of *data* with any additional required replacements. :func:`quoteattr` will select a quote character based on the content of *data*, attempting to avoid encoding any quote characters in the string.  If both single- and double-quote characters are already in *data*, the double-quote characters will be encoded and *data* will be wrapped in double-quotes.  The resulting string can be used directly as an attribute value:: The *short_empty_elements* parameter. The module :mod:`xml.sax.saxutils` contains a number of classes and functions that are commonly useful when creating SAX applications, either in direct use, or as base classes. This class implements the :class:`~xml.sax.handler.ContentHandler` interface by writing SAX events back into an XML document. In other words, using an :class:`XMLGenerator` as the content handler will reproduce the original document being parsed. *out* should be a file-like object which will default to *sys.stdout*. *encoding* is the encoding of the output stream which defaults to ``'iso-8859-1'``. *short_empty_elements* controls the formatting of elements that contain no content:  if ``False`` (the default) they are emitted as a pair of start/end tags, if set to ``True`` they are emitted as a single self-closed tag. This class is designed to sit between an :class:`~xml.sax.xmlreader.XMLReader` and the client application's event handlers.  By default, it does nothing but pass requests up to the reader and events on to the handlers unmodified, but subclasses can override specific methods to modify the event stream or the configuration requests as they pass through. This function is useful when generating attribute values for HTML or any SGML using the reference concrete syntax. This function takes an input source and an optional base URL and returns a fully resolved :class:`~xml.sax.xmlreader.InputSource` object ready for reading.  The input source can be given as a string, a file-like object, or an :class:`~xml.sax.xmlreader.InputSource` object; parsers will use this function to implement the polymorphic *source* argument to their :meth:`parse` method. Unescape ``'&amp;'``, ``'&lt;'``, and ``'&gt;'`` in a string of data. You can escape other strings of data by passing a dictionary as the optional *entities* parameter.  The keys and values must all be strings; each key will be replaced with its corresponding value.  The characters ``'&'``, ``'<'`` and ``'>'`` are always escaped, even if *entities* is provided. You can unescape other strings of data by passing a dictionary as the optional *entities* parameter.  The keys and values must all be strings; each key will be replaced with its corresponding value.  ``'&amp'``, ``'&lt;'``, and ``'&gt;'`` are always unescaped, even if *entities* is provided. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/xml/sax/saxutils.py` :mod:`xml.sax.saxutils` --- SAX Utilities Escape ``'&'``, ``'<'``, and ``'>'`` in a string of data. Similar to :func:`escape`, but also prepares *data* to be used as an attribute value.  The return value is a quoted version of *data* with any additional required replacements. :func:`quoteattr` will select a quote character based on the content of *data*, attempting to avoid encoding any quote characters in the string.  If both single- and double-quote characters are already in *data*, the double-quote characters will be encoded and *data* will be wrapped in double-quotes.  The resulting string can be used directly as an attribute value:: The *short_empty_elements* parameter. The module :mod:`xml.sax.saxutils` contains a number of classes and functions that are commonly useful when creating SAX applications, either in direct use, or as base classes. This class implements the :class:`~xml.sax.handler.ContentHandler` interface by writing SAX events back into an XML document. In other words, using an :class:`XMLGenerator` as the content handler will reproduce the original document being parsed. *out* should be a file-like object which will default to *sys.stdout*. *encoding* is the encoding of the output stream which defaults to ``'iso-8859-1'``. *short_empty_elements* controls the formatting of elements that contain no content:  if ``False`` (the default) they are emitted as a pair of start/end tags, if set to ``True`` they are emitted as a single self-closed tag. This class is designed to sit between an :class:`~xml.sax.xmlreader.XMLReader` and the client application's event handlers.  By default, it does nothing but pass requests up to the reader and events on to the handlers unmodified, but subclasses can override specific methods to modify the event stream or the configuration requests as they pass through. This function is useful when generating attribute values for HTML or any SGML using the reference concrete syntax. This function takes an input source and an optional base URL and returns a fully resolved :class:`~xml.sax.xmlreader.InputSource` object ready for reading.  The input source can be given as a string, a file-like object, or an :class:`~xml.sax.xmlreader.InputSource` object; parsers will use this function to implement the polymorphic *source* argument to their :meth:`parse` method. Unescape ``'&amp;'``, ``'&lt;'``, and ``'&gt;'`` in a string of data. You can escape other strings of data by passing a dictionary as the optional *entities* parameter.  The keys and values must all be strings; each key will be replaced with its corresponding value.  The characters ``'&'``, ``'<'`` and ``'>'`` are always escaped, even if *entities* is provided. You can unescape other strings of data by passing a dictionary as the optional *entities* parameter.  The keys and values must all be strings; each key will be replaced with its corresponding value.  ``'&amp'``, ``'&lt;'``, and ``'&gt;'`` are always unescaped, even if *entities* is provided. 