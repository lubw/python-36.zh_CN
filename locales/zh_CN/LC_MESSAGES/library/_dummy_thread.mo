��          L               |   /   }   J   �   �   �      �  �   �  �  e  /     J   L  �   �     L  �   a   **Source code:** :source:`Lib/_dummy_thread.py` :mod:`_dummy_thread` --- Drop-in replacement for the :mod:`_thread` module Be careful to not use this module where deadlock might occur from a thread being created that blocks waiting for another thread to be created.  This often occurs with blocking I/O. Suggested usage is:: This module provides a duplicate interface to the :mod:`_thread` module.  It is meant to be imported when the :mod:`_thread` module is not provided on a platform. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/_dummy_thread.py` :mod:`_dummy_thread` --- Drop-in replacement for the :mod:`_thread` module Be careful to not use this module where deadlock might occur from a thread being created that blocks waiting for another thread to be created.  This often occurs with blocking I/O. Suggested usage is:: This module provides a duplicate interface to the :mod:`_thread` module.  It is meant to be imported when the :mod:`_thread` module is not provided on a platform. 