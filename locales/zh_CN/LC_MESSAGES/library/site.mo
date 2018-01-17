��    &      L              |  &   }  �   �  0   9  .   j  1   �    �  9   �  �     �   �  l  v  r  �	  i  V  �  �  
      �  {   �      U   4  n  �    �           �   1  �        �    *   �  3        Q  >   h  �   �  �   J   9   !  ]   Q!  Z   �!  0   
"     ;"  �  Z"  &   $  �   8$  0   �$  .   �$  1   -%    _%  9   m'  �   �'  �   4(  l  
)  r  w+  i  �,  �  T.  
  0    2  {   73    �3  U   �4  n  5    �6     �8    �8  �   �9  �  �:    �<  �  �>  *   �@  3   �@     �@  >   �@  �   ;A  �   �A  9   �B  ]   �B  Z   CC  0   �C     �C   **Source code:** :source:`Lib/site.py` **This module is automatically imported during initialization.** The automatic import can be suppressed using the interpreter's :option:`-S` option. :mod:`site` --- Site-specific configuration hook :pep:`370` -- Per user site-packages directory A list of prefixes for site-packages directories. A path configuration file is a file whose name has the form :file:`{name}.pth` and exists in one of the four directories mentioned above; its contents are additional items (one per line) to be added to ``sys.path``.  Non-existing items are never added to ``sys.path``, and no check is made that the item refers to a directory rather than a file.  No item is added to ``sys.path`` more than once.  Blank lines and lines beginning with ``#`` are skipped.  Lines starting with ``import`` (followed by space or tab) are executed. Activation of rlcompleter and history was made automatic. Add a directory to sys.path and process its :file:`.pth` files.  Typically used in :mod:`sitecustomize` or :mod:`usercustomize` (see above). Adds all the standard site-specific directories to the module search path.  This function is called automatically when this module is imported, unless the Python interpreter was started with the :option:`-S` flag. After these path manipulations, an attempt is made to import a module named :mod:`sitecustomize`, which can perform arbitrary site-specific customizations. It is typically created by a system administrator in the site-packages directory.  If this import fails with an :exc:`ImportError` exception, it is silently ignored.  If Python is started without output streams available, as with :file:`pythonw.exe` on Windows (which is used by default to start IDLE), attempted output from :mod:`sitecustomize` is ignored. Any exception other than :exc:`ImportError` causes a silent and perhaps mysterious failure of the process. After this, an attempt is made to import a module named :mod:`usercustomize`, which can perform arbitrary user-specific customizations, if :data:`ENABLE_USER_SITE` is true.  This file is intended to be created in the user site-packages directory (see below), which is part of ``sys.path`` unless disabled by :option:`-s`.  An :exc:`ImportError` will be silently ignored. Flag showing the status of the user site-packages directory.  ``True`` means that it is enabled and was added to ``sys.path``.  ``False`` means that it was disabled by user request (with :option:`-s` or :envvar:`PYTHONNOUSERSITE`).  ``None`` means it was disabled for security reasons (mismatch between user or group id and effective id) or by an administrator. For example, suppose ``sys.prefix`` and ``sys.exec_prefix`` are set to :file:`/usr/local`.  The Python X.Y library is then installed in :file:`/usr/local/lib/python{X.Y}`.  Suppose this has a subdirectory :file:`/usr/local/lib/python{X.Y}/site-packages` with three subsubdirectories, :file:`foo`, :file:`bar` and :file:`spam`, and two path configuration files, :file:`foo.pth` and :file:`bar.pth`.  Assume :file:`foo.pth` contains the following:: If a file named "pyvenv.cfg" exists one directory above sys.executable, sys.prefix and sys.exec_prefix are set to that directory and it is also checked for site-packages (sys.base_prefix and sys.base_exec_prefix will always be the "real" prefixes of the Python installation). If "pyvenv.cfg" (a bootstrap configuration file) contains the key "include-system-site-packages" set to anything other than "false" (case-insensitive), the system-level prefixes will still also be searched for site-packages; otherwise they won't. If any option is given, the script will exit with one of these values: ``O`` if the user site-packages directory is enabled, ``1`` if it was disabled by the user, ``2`` if it is disabled for security reasons or by an administrator, and a value greater than 2 if there is an error. If both options are given, user base and user site will be printed (always in this order), separated by :data:`os.pathsep`. If it is called without arguments, it will print the contents of :data:`sys.path` on the standard output, followed by the value of :data:`USER_BASE` and whether the directory exists, then the same thing for :data:`USER_SITE`, and finally the value of :data:`ENABLE_USER_SITE`. Importing the module used to trigger paths manipulation even when using :option:`-S`. Importing this module will append site-specific paths to the module search path and add a few builtins, unless :option:`-S` was used.  In that case, this module can be safely imported with no automatic modifications to the module search path or additions to the builtins.  To explicitly trigger the usual site-specific additions, call the :func:`site.main` function. It starts by constructing up to four directories from a head and a tail part. For the head part, it uses ``sys.prefix`` and ``sys.exec_prefix``; empty heads are skipped.  For the tail part, it uses the empty string and then :file:`lib/site-packages` (on Windows) or :file:`lib/python{X.Y}/site-packages` (on Unix and Macintosh).  For each of the distinct head-tail combinations, it sees if it refers to an existing directory, and if so, adds it to ``sys.path`` and also inspects the newly added path for configuration files. Module contents Note that :file:`bletch` is omitted because it doesn't exist; the :file:`bar` directory precedes the :file:`foo` directory because :file:`bar.pth` comes alphabetically before :file:`foo.pth`; and :file:`spam` is omitted because it is not mentioned in either path configuration file. Note that for some non-Unix systems, ``sys.prefix`` and ``sys.exec_prefix`` are empty, and the path manipulations are skipped; however the import of :mod:`sitecustomize` and :mod:`usercustomize` is still attempted. On systems that support :mod:`readline`, this module will also import and configure the :mod:`rlcompleter` module, if Python is started in :ref:`interactive mode <tut-interactive>` and without the :option:`-S` option. The default behavior is enable tab-completion and to use :file:`~/.python_history` as the history save file.  To disable it, delete (or override) the :data:`sys.__interactivehook__` attribute in your :mod:`sitecustomize` or :mod:`usercustomize` module or your :envvar:`PYTHONSTARTUP` file. Path to the base directory for the user site-packages.  Can be ``None`` if :func:`getuserbase` hasn't been called yet.  Default value is :file:`~/.local` for UNIX and Mac OS X non-framework builds, :file:`~/Library/Python/{X.Y}` for Mac framework builds, and :file:`{%APPDATA%}\\Python` for Windows.  This value is used by Distutils to compute the installation directories for scripts, data files, Python modules, etc. for the :ref:`user installation scheme <inst-alt-install-user>`. See also :envvar:`PYTHONUSERBASE`. Path to the user site-packages for the running Python.  Can be ``None`` if :func:`getusersitepackages` hasn't been called yet.  Default value is :file:`~/.local/lib/python{X.Y}/site-packages` for UNIX and non-framework Mac OS X builds, :file:`~/Library/Python/{X.Y}/lib/python/site-packages` for Mac framework builds, and :file:`{%APPDATA%}\\Python\\Python{XY}\\site-packages` on Windows.  This directory is a site directory, which means that :file:`.pth` files in it will be processed. Print the path to the user base directory. Print the path to the user site-packages directory. Readline configuration Return a list containing all global site-packages directories. Return the path of the user base directory, :data:`USER_BASE`.  If it is not initialized yet, this function will also set it, respecting :envvar:`PYTHONUSERBASE`. Return the path of the user-specific site-packages directory, :data:`USER_SITE`.  If it is not initialized yet, this function will also set it, respecting :envvar:`PYTHONNOUSERSITE` and :data:`USER_BASE`. Support for the "site-python" directory has been removed. The :mod:`site` module also provides a way to get the user directories from the command line: Then the following version-specific directories are added to ``sys.path``, in this order:: This function used to be called unconditionally. and :file:`bar.pth` contains:: Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/site.py` **This module is automatically imported during initialization.** The automatic import can be suppressed using the interpreter's :option:`-S` option. :mod:`site` --- Site-specific configuration hook :pep:`370` -- Per user site-packages directory A list of prefixes for site-packages directories. A path configuration file is a file whose name has the form :file:`{name}.pth` and exists in one of the four directories mentioned above; its contents are additional items (one per line) to be added to ``sys.path``.  Non-existing items are never added to ``sys.path``, and no check is made that the item refers to a directory rather than a file.  No item is added to ``sys.path`` more than once.  Blank lines and lines beginning with ``#`` are skipped.  Lines starting with ``import`` (followed by space or tab) are executed. Activation of rlcompleter and history was made automatic. Add a directory to sys.path and process its :file:`.pth` files.  Typically used in :mod:`sitecustomize` or :mod:`usercustomize` (see above). Adds all the standard site-specific directories to the module search path.  This function is called automatically when this module is imported, unless the Python interpreter was started with the :option:`-S` flag. After these path manipulations, an attempt is made to import a module named :mod:`sitecustomize`, which can perform arbitrary site-specific customizations. It is typically created by a system administrator in the site-packages directory.  If this import fails with an :exc:`ImportError` exception, it is silently ignored.  If Python is started without output streams available, as with :file:`pythonw.exe` on Windows (which is used by default to start IDLE), attempted output from :mod:`sitecustomize` is ignored. Any exception other than :exc:`ImportError` causes a silent and perhaps mysterious failure of the process. After this, an attempt is made to import a module named :mod:`usercustomize`, which can perform arbitrary user-specific customizations, if :data:`ENABLE_USER_SITE` is true.  This file is intended to be created in the user site-packages directory (see below), which is part of ``sys.path`` unless disabled by :option:`-s`.  An :exc:`ImportError` will be silently ignored. Flag showing the status of the user site-packages directory.  ``True`` means that it is enabled and was added to ``sys.path``.  ``False`` means that it was disabled by user request (with :option:`-s` or :envvar:`PYTHONNOUSERSITE`).  ``None`` means it was disabled for security reasons (mismatch between user or group id and effective id) or by an administrator. For example, suppose ``sys.prefix`` and ``sys.exec_prefix`` are set to :file:`/usr/local`.  The Python X.Y library is then installed in :file:`/usr/local/lib/python{X.Y}`.  Suppose this has a subdirectory :file:`/usr/local/lib/python{X.Y}/site-packages` with three subsubdirectories, :file:`foo`, :file:`bar` and :file:`spam`, and two path configuration files, :file:`foo.pth` and :file:`bar.pth`.  Assume :file:`foo.pth` contains the following:: If a file named "pyvenv.cfg" exists one directory above sys.executable, sys.prefix and sys.exec_prefix are set to that directory and it is also checked for site-packages (sys.base_prefix and sys.base_exec_prefix will always be the "real" prefixes of the Python installation). If "pyvenv.cfg" (a bootstrap configuration file) contains the key "include-system-site-packages" set to anything other than "false" (case-insensitive), the system-level prefixes will still also be searched for site-packages; otherwise they won't. If any option is given, the script will exit with one of these values: ``O`` if the user site-packages directory is enabled, ``1`` if it was disabled by the user, ``2`` if it is disabled for security reasons or by an administrator, and a value greater than 2 if there is an error. If both options are given, user base and user site will be printed (always in this order), separated by :data:`os.pathsep`. If it is called without arguments, it will print the contents of :data:`sys.path` on the standard output, followed by the value of :data:`USER_BASE` and whether the directory exists, then the same thing for :data:`USER_SITE`, and finally the value of :data:`ENABLE_USER_SITE`. Importing the module used to trigger paths manipulation even when using :option:`-S`. Importing this module will append site-specific paths to the module search path and add a few builtins, unless :option:`-S` was used.  In that case, this module can be safely imported with no automatic modifications to the module search path or additions to the builtins.  To explicitly trigger the usual site-specific additions, call the :func:`site.main` function. It starts by constructing up to four directories from a head and a tail part. For the head part, it uses ``sys.prefix`` and ``sys.exec_prefix``; empty heads are skipped.  For the tail part, it uses the empty string and then :file:`lib/site-packages` (on Windows) or :file:`lib/python{X.Y}/site-packages` (on Unix and Macintosh).  For each of the distinct head-tail combinations, it sees if it refers to an existing directory, and if so, adds it to ``sys.path`` and also inspects the newly added path for configuration files. Module contents Note that :file:`bletch` is omitted because it doesn't exist; the :file:`bar` directory precedes the :file:`foo` directory because :file:`bar.pth` comes alphabetically before :file:`foo.pth`; and :file:`spam` is omitted because it is not mentioned in either path configuration file. Note that for some non-Unix systems, ``sys.prefix`` and ``sys.exec_prefix`` are empty, and the path manipulations are skipped; however the import of :mod:`sitecustomize` and :mod:`usercustomize` is still attempted. On systems that support :mod:`readline`, this module will also import and configure the :mod:`rlcompleter` module, if Python is started in :ref:`interactive mode <tut-interactive>` and without the :option:`-S` option. The default behavior is enable tab-completion and to use :file:`~/.python_history` as the history save file.  To disable it, delete (or override) the :data:`sys.__interactivehook__` attribute in your :mod:`sitecustomize` or :mod:`usercustomize` module or your :envvar:`PYTHONSTARTUP` file. Path to the base directory for the user site-packages.  Can be ``None`` if :func:`getuserbase` hasn't been called yet.  Default value is :file:`~/.local` for UNIX and Mac OS X non-framework builds, :file:`~/Library/Python/{X.Y}` for Mac framework builds, and :file:`{%APPDATA%}\\Python` for Windows.  This value is used by Distutils to compute the installation directories for scripts, data files, Python modules, etc. for the :ref:`user installation scheme <inst-alt-install-user>`. See also :envvar:`PYTHONUSERBASE`. Path to the user site-packages for the running Python.  Can be ``None`` if :func:`getusersitepackages` hasn't been called yet.  Default value is :file:`~/.local/lib/python{X.Y}/site-packages` for UNIX and non-framework Mac OS X builds, :file:`~/Library/Python/{X.Y}/lib/python/site-packages` for Mac framework builds, and :file:`{%APPDATA%}\\Python\\Python{XY}\\site-packages` on Windows.  This directory is a site directory, which means that :file:`.pth` files in it will be processed. Print the path to the user base directory. Print the path to the user site-packages directory. Readline configuration Return a list containing all global site-packages directories. Return the path of the user base directory, :data:`USER_BASE`.  If it is not initialized yet, this function will also set it, respecting :envvar:`PYTHONUSERBASE`. Return the path of the user-specific site-packages directory, :data:`USER_SITE`.  If it is not initialized yet, this function will also set it, respecting :envvar:`PYTHONNOUSERSITE` and :data:`USER_BASE`. Support for the "site-python" directory has been removed. The :mod:`site` module also provides a way to get the user directories from the command line: Then the following version-specific directories are added to ``sys.path``, in this order:: This function used to be called unconditionally. and :file:`bar.pth` contains:: 