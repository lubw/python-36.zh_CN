��                          2     +   @  �  l  (   9  2   b  �  �  M  ^  ?   �  :   �  �  '	  F  �
  V   =     �     �     �  ?   �  5   1     g  �   |  N      j  �   �  I   d  �   �  �   T     N  ;   m  �   �  �   o  ;   \  �  �  2   O  +   �  �  �  (   {  2   �  �  �  M  �  ?   �  :   .   �  i   F  8"  V   %     �%     �%     &  ?   3&  5   s&     �&  �   �&  N  ]'    �(  �   �)  I   �*  �   �*  �   �+     �,  ;   �,  �   �,  �   �-  ;   �.   **Source code:** :source:`Lib/xml/sax/__init__.py` :mod:`xml.sax` --- Support for SAX2 parsers A typical SAX application uses three kinds of objects: readers, handlers and input sources.  "Reader" in this context is another term for parser, i.e. some piece of code that reads the bytes or characters from the input source, and produces a sequence of events. The events then get distributed to the handler objects, i.e. the reader invokes a method on the handler.  A SAX application must therefore obtain a reader object, create or open the input sources, create the handlers, and connect these objects all together.  As the final step of preparation, the reader is called to parse the input. During parsing, methods on the handler objects are called based on structural and syntactic events from the input data. Added support of :class:`str` instances. Convenience functions for use in SAX applications. Create a SAX parser and use it to parse a document.  The document, passed in as *filename_or_stream*, can be a filename or a file object.  The *handler* parameter needs to be a SAX :class:`~handler.ContentHandler` instance.  If *error_handler* is given, it must be a SAX :class:`~handler.ErrorHandler` instance; if omitted,  :exc:`SAXParseException` will be raised on all errors.  There is no return value; all work must be done by the *handler* passed in. Create and return a SAX :class:`~xml.sax.xmlreader.XMLReader` object.  The first parser found will be used.  If *parser_list* is provided, it must be a sequence of strings which name modules that have a function named :func:`create_parser`.  Modules listed in *parser_list* will be used before modules in the default list of parsers. Definitions of the interfaces for application-provided objects. Definitions of the interfaces for parser-provided objects. Encapsulate an XML error or warning.  This class can contain basic error or warning information from either the XML parser or the application: it can be subclassed to provide additional functionality or to add localization.  Note that although the handlers defined in the :class:`~xml.sax.handler.ErrorHandler` interface receive instances of this exception, it is not required to actually raise the exception --- it is also useful as a container for information. For these objects, only the interfaces are relevant; they are normally not instantiated by the application itself.  Since Python does not have an explicit notion of interface, they are formally introduced as classes, but applications may use implementations which do not inherit from the provided classes.  The :class:`~xml.sax.xmlreader.InputSource`, :class:`~xml.sax.xmlreader.Locator`, :class:`~xml.sax.xmlreader.Attributes`, :class:`~xml.sax.xmlreader.AttributesNS`, and :class:`~xml.sax.xmlreader.XMLReader` interfaces are defined in the module :mod:`xml.sax.xmlreader`.  The handler interfaces are defined in :mod:`xml.sax.handler`.  For convenience, :class:`~xml.sax.xmlreader.InputSource` (which is often instantiated directly) and the handler classes are also available from :mod:`xml.sax`.  These interfaces are described below. In addition to these classes, :mod:`xml.sax` provides the following exception classes. Module :mod:`xml.sax.handler` Module :mod:`xml.sax.saxutils` Module :mod:`xml.sax.xmlreader` Return a human-readable message describing the error condition. Return an encapsulated exception object, or ``None``. SAXException Objects Similar to :func:`parse`, but parses from a buffer *string* received as a parameter.  *string* must be a :class:`str` instance or a :term:`bytes-like object`. Subclass of :exc:`SAXException` raised on parse errors. Instances of this class are passed to the methods of the SAX :class:`~xml.sax.handler.ErrorHandler` interface to provide information about the parse error.  This class supports the SAX :class:`~xml.sax.xmlreader.Locator` interface as well as the :class:`SAXException` interface. Subclass of :exc:`SAXException` raised when a SAX :class:`~xml.sax.xmlreader.XMLReader` is asked to enable a feature that is not supported, or to set a property to a value that the implementation does not support.  SAX applications and extensions may use this class for similar purposes. Subclass of :exc:`SAXException` raised when a SAX :class:`~xml.sax.xmlreader.XMLReader` is confronted with an unrecognized feature or property.  SAX applications and extensions may use this class for similar purposes. The :class:`SAXException` exception class supports the following methods: The :mod:`xml.sax` module is not secure against maliciously constructed data.  If you need to parse untrusted or unauthenticated data see :ref:`xml-vulnerabilities`. The :mod:`xml.sax` package provides a number of modules which implement the Simple API for XML (SAX) interface for Python.  The package itself provides the SAX exceptions and the convenience functions which will be most used by users of the SAX API. The convenience functions are: This is the base class for the other SAX exception classes. This site is the focal point for the definition of the SAX API.  It provides a Java implementation and online documentation.  Links to implementations and historical information are also available. When instantiated, *msg* should be a human-readable description of the error. The optional *exception* parameter, if given, should be ``None`` or an exception that was caught by the parsing code and is being passed along as information. `SAX: The Simple API for XML <http://www.saxproject.org/>`_ Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/xml/sax/__init__.py` :mod:`xml.sax` --- Support for SAX2 parsers A typical SAX application uses three kinds of objects: readers, handlers and input sources.  "Reader" in this context is another term for parser, i.e. some piece of code that reads the bytes or characters from the input source, and produces a sequence of events. The events then get distributed to the handler objects, i.e. the reader invokes a method on the handler.  A SAX application must therefore obtain a reader object, create or open the input sources, create the handlers, and connect these objects all together.  As the final step of preparation, the reader is called to parse the input. During parsing, methods on the handler objects are called based on structural and syntactic events from the input data. Added support of :class:`str` instances. Convenience functions for use in SAX applications. Create a SAX parser and use it to parse a document.  The document, passed in as *filename_or_stream*, can be a filename or a file object.  The *handler* parameter needs to be a SAX :class:`~handler.ContentHandler` instance.  If *error_handler* is given, it must be a SAX :class:`~handler.ErrorHandler` instance; if omitted,  :exc:`SAXParseException` will be raised on all errors.  There is no return value; all work must be done by the *handler* passed in. Create and return a SAX :class:`~xml.sax.xmlreader.XMLReader` object.  The first parser found will be used.  If *parser_list* is provided, it must be a sequence of strings which name modules that have a function named :func:`create_parser`.  Modules listed in *parser_list* will be used before modules in the default list of parsers. Definitions of the interfaces for application-provided objects. Definitions of the interfaces for parser-provided objects. Encapsulate an XML error or warning.  This class can contain basic error or warning information from either the XML parser or the application: it can be subclassed to provide additional functionality or to add localization.  Note that although the handlers defined in the :class:`~xml.sax.handler.ErrorHandler` interface receive instances of this exception, it is not required to actually raise the exception --- it is also useful as a container for information. For these objects, only the interfaces are relevant; they are normally not instantiated by the application itself.  Since Python does not have an explicit notion of interface, they are formally introduced as classes, but applications may use implementations which do not inherit from the provided classes.  The :class:`~xml.sax.xmlreader.InputSource`, :class:`~xml.sax.xmlreader.Locator`, :class:`~xml.sax.xmlreader.Attributes`, :class:`~xml.sax.xmlreader.AttributesNS`, and :class:`~xml.sax.xmlreader.XMLReader` interfaces are defined in the module :mod:`xml.sax.xmlreader`.  The handler interfaces are defined in :mod:`xml.sax.handler`.  For convenience, :class:`~xml.sax.xmlreader.InputSource` (which is often instantiated directly) and the handler classes are also available from :mod:`xml.sax`.  These interfaces are described below. In addition to these classes, :mod:`xml.sax` provides the following exception classes. Module :mod:`xml.sax.handler` Module :mod:`xml.sax.saxutils` Module :mod:`xml.sax.xmlreader` Return a human-readable message describing the error condition. Return an encapsulated exception object, or ``None``. SAXException Objects Similar to :func:`parse`, but parses from a buffer *string* received as a parameter.  *string* must be a :class:`str` instance or a :term:`bytes-like object`. Subclass of :exc:`SAXException` raised on parse errors. Instances of this class are passed to the methods of the SAX :class:`~xml.sax.handler.ErrorHandler` interface to provide information about the parse error.  This class supports the SAX :class:`~xml.sax.xmlreader.Locator` interface as well as the :class:`SAXException` interface. Subclass of :exc:`SAXException` raised when a SAX :class:`~xml.sax.xmlreader.XMLReader` is asked to enable a feature that is not supported, or to set a property to a value that the implementation does not support.  SAX applications and extensions may use this class for similar purposes. Subclass of :exc:`SAXException` raised when a SAX :class:`~xml.sax.xmlreader.XMLReader` is confronted with an unrecognized feature or property.  SAX applications and extensions may use this class for similar purposes. The :class:`SAXException` exception class supports the following methods: The :mod:`xml.sax` module is not secure against maliciously constructed data.  If you need to parse untrusted or unauthenticated data see :ref:`xml-vulnerabilities`. The :mod:`xml.sax` package provides a number of modules which implement the Simple API for XML (SAX) interface for Python.  The package itself provides the SAX exceptions and the convenience functions which will be most used by users of the SAX API. The convenience functions are: This is the base class for the other SAX exception classes. This site is the focal point for the definition of the SAX API.  It provides a Java implementation and online documentation.  Links to implementations and historical information are also available. When instantiated, *msg* should be a human-readable description of the error. The optional *exception* parameter, if given, should be ``None`` or an exception that was caught by the parsing code and is being passed along as information. `SAX: The Simple API for XML <http://www.saxproject.org/>`_ 