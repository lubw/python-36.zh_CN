��          �               �  '   �  -  �  �    1   �  j   �     X  �   �  C   �  Q   �  P   )  �   z     8     A     Q     c  �   t  �   g	  q   
  �   t
  8   5  m   n  �   �  f   �  a  ?  i   �  �    '   �  -  �  �    1   �  j   �     ]  �   �  C   �  Q   �  P   .  �        =     F     V     h  �   y  �   l  q     �   y  8   :  m   s  �   �  f   �  a  D  i   �   **Source code:** :source:`Lib/crypt.py` *salt* (either a random 2 or 16 character string, possibly prefixed with ``$digit$`` to indicate the method) which will be used to perturb the encryption algorithm.  The characters in *salt* must be in the set ``[./a-zA-Z0-9]``, with the exception of Modular Crypt Format which prefixes a ``$digit$``. *word* will usually be a user's password as typed at a prompt or  in a graphical interface.  The optional *salt* is either a string as returned from :func:`mksalt`, one of the ``crypt.METHOD_*`` values (though not all may be available on all platforms), or a full encrypted password including salt, as returned by this function.  If *salt* is not provided, the strongest method will be used (as returned by :func:`methods`. :mod:`crypt` --- Function to check Unix passwords A Modular Crypt Format method with 16 character salt and 86 character hash.  This is the strongest method. A list of available password hashing algorithms, as ``crypt.METHOD_*`` objects.  This list is sorted from strongest to weakest. A simple example illustrating typical use (a constant-time comparison operation is needed to limit exposure to timing attacks. :func:`hmac.compare_digest` is suitable for this purpose):: Accept ``crypt.METHOD_*`` values in addition to strings for *salt*. Another Modular Crypt Format method with 16 character salt and 43 character hash. Another Modular Crypt Format method with 8 character salt and 22 character hash. Checking a password is usually done by passing the plain-text password as *word* and the full results of a previous :func:`crypt` call, which should be the same as the results of this call. Examples Hashing Methods Module Attributes Module Functions Notice that the behavior of this module depends on the actual implementation  of the :manpage:`crypt(3)` routine in the running system.  Therefore, any extensions available on the current implementation will also  be available on this module. Return a randomly generated salt of the specified method.  If no *method* is given, the strongest method available as returned by :func:`methods` is used. Returns the hashed password as a string, which will be composed of characters from the same alphabet as the salt. Since a few :manpage:`crypt(3)` extensions allow different values, with different sizes in the *salt*, it is recommended to use  the full crypted password as salt when checking for a password. The :mod:`crypt` module defines the following functions: The :mod:`crypt` module defines the list of hashing methods (not all methods are available on all platforms): The return value is a string either of 2 characters in length for ``crypt.METHOD_CRYPT``, or 19 characters starting with ``$digit$`` and 16 random characters from the set ``[./a-zA-Z0-9]``, suitable for passing as the *salt* argument to :func:`crypt`. The traditional method with a 2 character salt and 13 characters of hash.  This is the weakest method. This module implements an interface to the :manpage:`crypt(3)` routine, which is a one-way hash function based upon a modified DES algorithm; see the Unix man page for further details.  Possible uses include storing hashed passwords so you can check passwords without storing the actual password, or attempting to crack Unix passwords with a dictionary. To generate a hash of a password using the strongest available method and check it against the original:: Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/crypt.py` *salt* (either a random 2 or 16 character string, possibly prefixed with ``$digit$`` to indicate the method) which will be used to perturb the encryption algorithm.  The characters in *salt* must be in the set ``[./a-zA-Z0-9]``, with the exception of Modular Crypt Format which prefixes a ``$digit$``. *word* will usually be a user's password as typed at a prompt or  in a graphical interface.  The optional *salt* is either a string as returned from :func:`mksalt`, one of the ``crypt.METHOD_*`` values (though not all may be available on all platforms), or a full encrypted password including salt, as returned by this function.  If *salt* is not provided, the strongest method will be used (as returned by :func:`methods`. :mod:`crypt` --- Function to check Unix passwords A Modular Crypt Format method with 16 character salt and 86 character hash.  This is the strongest method. A list of available password hashing algorithms, as ``crypt.METHOD_*`` objects.  This list is sorted from strongest to weakest. A simple example illustrating typical use (a constant-time comparison operation is needed to limit exposure to timing attacks. :func:`hmac.compare_digest` is suitable for this purpose):: Accept ``crypt.METHOD_*`` values in addition to strings for *salt*. Another Modular Crypt Format method with 16 character salt and 43 character hash. Another Modular Crypt Format method with 8 character salt and 22 character hash. Checking a password is usually done by passing the plain-text password as *word* and the full results of a previous :func:`crypt` call, which should be the same as the results of this call. Examples Hashing Methods Module Attributes Module Functions Notice that the behavior of this module depends on the actual implementation  of the :manpage:`crypt(3)` routine in the running system.  Therefore, any extensions available on the current implementation will also  be available on this module. Return a randomly generated salt of the specified method.  If no *method* is given, the strongest method available as returned by :func:`methods` is used. Returns the hashed password as a string, which will be composed of characters from the same alphabet as the salt. Since a few :manpage:`crypt(3)` extensions allow different values, with different sizes in the *salt*, it is recommended to use  the full crypted password as salt when checking for a password. The :mod:`crypt` module defines the following functions: The :mod:`crypt` module defines the list of hashing methods (not all methods are available on all platforms): The return value is a string either of 2 characters in length for ``crypt.METHOD_CRYPT``, or 19 characters starting with ``$digit$`` and 16 random characters from the set ``[./a-zA-Z0-9]``, suitable for passing as the *salt* argument to :func:`crypt`. The traditional method with a 2 character salt and 13 characters of hash.  This is the weakest method. This module implements an interface to the :manpage:`crypt(3)` routine, which is a one-way hash function based upon a modified DES algorithm; see the Unix man page for further details.  Possible uses include storing hashed passwords so you can check passwords without storing the actual password, or attempting to crack Unix passwords with a dictionary. To generate a hash of a password using the strongest available method and check it against the original:: 