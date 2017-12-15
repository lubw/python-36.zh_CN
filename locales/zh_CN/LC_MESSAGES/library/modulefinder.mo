��          �               �   .   �   5   ,  N   b  Y   �  L     &   X  �     N     8   j  >   �  4   �  �         �  (  .   �  5   	  N   D	  Y   �	  L   �	  &   :
  �   a
  N   �
  8   L  >   �  4   �  �  �     �   **Source code:** :source:`Lib/modulefinder.py` :mod:`modulefinder` --- Find modules used by a script A dictionary mapping module names to modules. See :ref:`modulefinder-example`. Allows specifying that the module named *oldname* is in fact the package named *newname*. Analyze the contents of the *pathname* file, which must contain Python code. Example usage of :class:`ModuleFinder` Print a report to standard output that lists the modules imported by the script and their paths, as well as modules that are missing or seem to be missing. Record that the package named *pkg_name* can be found in the specified *path*. Sample output (may vary depending on the architecture):: The script that is going to get analyzed later on (bacon.py):: The script that will output the report of bacon.py:: This class provides :meth:`run_script` and :meth:`report` methods to determine the set of modules imported by a script. *path* can be a list of directories to search for modules; if not specified, ``sys.path`` is used.  *debug* sets the debugging level; higher values make the class print debugging messages about what it's doing. *excludes* is a list of module names to exclude from the analysis. *replace_paths* is a list of ``(oldpath, newpath)`` tuples that will be replaced in module paths. This module provides a :class:`ModuleFinder` class that can be used to determine the set of modules imported by a script. ``modulefinder.py`` can also be run as a script, giving the filename of a Python script as its argument, after which a report of the imported modules will be printed. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/modulefinder.py` :mod:`modulefinder` --- Find modules used by a script A dictionary mapping module names to modules. See :ref:`modulefinder-example`. Allows specifying that the module named *oldname* is in fact the package named *newname*. Analyze the contents of the *pathname* file, which must contain Python code. Example usage of :class:`ModuleFinder` Print a report to standard output that lists the modules imported by the script and their paths, as well as modules that are missing or seem to be missing. Record that the package named *pkg_name* can be found in the specified *path*. Sample output (may vary depending on the architecture):: The script that is going to get analyzed later on (bacon.py):: The script that will output the report of bacon.py:: This class provides :meth:`run_script` and :meth:`report` methods to determine the set of modules imported by a script. *path* can be a list of directories to search for modules; if not specified, ``sys.path`` is used.  *debug* sets the debugging level; higher values make the class print debugging messages about what it's doing. *excludes* is a list of module names to exclude from the analysis. *replace_paths* is a list of ``(oldpath, newpath)`` tuples that will be replaced in module paths. This module provides a :class:`ModuleFinder` class that can be used to determine the set of modules imported by a script. ``modulefinder.py`` can also be run as a script, giving the filename of a Python script as its argument, after which a report of the imported modules will be printed. 