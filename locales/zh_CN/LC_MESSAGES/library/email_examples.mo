��          �               �      �   �     	   �  �   �  �   ,  z   ,  ]   �  `     W   f  h   �  I   '  /   q  �  �     i  �   �       �     �   �  z   �	  ]    
  `   ~
  W   �
  h   7  I   �  /   �   :mod:`email`: Examples First, let's see how to create and send a simple text message (both the text content and the addresses may contain unicode characters): Footnotes Here are a few examples of how to use the :mod:`email` package to read, write, and send simple email messages, as well as more complex MIME messages. Here's an example of how to create an HTML message with an alternative plain text version.  To make things a bit more interesting, we include a related image in the html part, and we save a copy of what we are going to send to disk, as well as sending it. Here's an example of how to send a MIME message containing a bunch of family pictures that may be residing in a directory: Here's an example of how to send the entire contents of a directory as an email message: [1]_ Here's an example of how to unpack a MIME message like the one above, into a directory of files: If we were sent the message from the last example, here is one way we could process it: Parsing RFC822 headers can easily be done by the using the classes from the :mod:`~email.parser` module: Thanks to Matthew Dixon Cowles for the original inspiration and examples. Up to the prompt, the output from the above is: Project-Id-Version: Python 3.6
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2017-12-12 17:30+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Jerry Chen <jerrychen9657@gmail.com>, 2017
Language: zh_Hans_CN
Language-Team: Chinese (China) (https://www.transifex.com/python-doc/teams/5390/zh_CN/)
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.0
 :mod:`email`: Examples First, let's see how to create and send a simple text message (both the text content and the addresses may contain unicode characters): 脚注 Here are a few examples of how to use the :mod:`email` package to read, write, and send simple email messages, as well as more complex MIME messages. Here's an example of how to create an HTML message with an alternative plain text version.  To make things a bit more interesting, we include a related image in the html part, and we save a copy of what we are going to send to disk, as well as sending it. Here's an example of how to send a MIME message containing a bunch of family pictures that may be residing in a directory: Here's an example of how to send the entire contents of a directory as an email message: [1]_ Here's an example of how to unpack a MIME message like the one above, into a directory of files: If we were sent the message from the last example, here is one way we could process it: Parsing RFC822 headers can easily be done by the using the classes from the :mod:`~email.parser` module: Thanks to Matthew Dixon Cowles for the original inspiration and examples. Up to the prompt, the output from the above is: 