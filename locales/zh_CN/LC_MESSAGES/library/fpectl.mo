��          �               ,  �  -  2   �  �     I  �     7  {  ?  $   �  �   �  4   �  �   	  U  �	  [   1  �   �  ,   b  e   �  T   �  �  J  �    2   �  �   �  I  �       {    $   �  �   �  4   �  �   �  U  �  [     �   a  ,   6  e   c  T   �   (The example above will work on many platforms. DEC Alpha may be one exception.) "Inf" is a special, non-numeric value in IEEE-754 that stands for "infinity", and "nan" means "not a number." Note that, other than the non-numeric results, nothing special happened when you asked Python to carry out those calculations. That is in fact the default behaviour prescribed in the IEEE-754 standard, and if it works for you, stop reading now. :mod:`fpectl` --- Floating point exception control After :func:`turnon_sigfpe` has been executed, a floating point operation that raises one of the IEEE-754 exceptions Division by Zero, Overflow, or Invalid operation will in turn raise this standard Python exception. Conversion of an IEEE-754 exception to a Python exception requires that the wrapper macros ``PyFPE_START_PROTECT`` and ``PyFPE_END_PROTECT`` be inserted into your code in an appropriate fashion.  Python itself has been modified to support the :mod:`fpectl` module, but many other codes of interest to numerical analysts have not. Example In some circumstances, it would be better to raise an exception and stop processing at the point where the faulty operation was attempted. The :mod:`fpectl` module is for use in that situation. It provides control over floating point units from several hardware manufacturers, allowing the user to turn on the generation of :const:`SIGFPE` whenever any of the IEEE-754 exceptions Division by Zero, Overflow, or Invalid Operation occurs. In tandem with a pair of wrapper macros that are inserted into the C code comprising your python system, :const:`SIGFPE` is trapped and converted into the Python :exc:`FloatingPointError` exception. Limitations and other considerations Most computers carry out floating point operations in conformance with the so-called IEEE-754 standard. On any real computer, some floating point operations produce results that cannot be expressed as a normal floating point value. For example, try :: Reset default handling of floating point exceptions. Setting up a given processor to trap IEEE-754 floating point errors currently requires custom code on a per-architecture basis. You may have to modify :mod:`fpectl` to control your particular hardware. Some files in the source distribution may be interesting in learning more about how this module operates. The include file :file:`Include/pyfpe.h` discusses the implementation of this module at some length. :file:`Modules/fpetestmodule.c` gives several examples of use. Many additional examples can be found in :file:`Objects/floatobject.c`. The :mod:`fpectl` module defines the following functions and may raise the given exception: The :mod:`fpectl` module is not built by default, and its usage is discouraged and may be dangerous except in the hands of experts.  See also the section :ref:`fpectl-limitations` on limitations for more details. The :mod:`fpectl` module is not thread-safe. The following example demonstrates how to start up and test operation of the :mod:`fpectl` module. :: Turn on the generation of :const:`SIGFPE`, and set up an appropriate signal handler. Project-Id-Version: Python 3.6
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
 (The example above will work on many platforms. DEC Alpha may be one exception.) "Inf" is a special, non-numeric value in IEEE-754 that stands for "infinity", and "nan" means "not a number." Note that, other than the non-numeric results, nothing special happened when you asked Python to carry out those calculations. That is in fact the default behaviour prescribed in the IEEE-754 standard, and if it works for you, stop reading now. :mod:`fpectl` --- Floating point exception control After :func:`turnon_sigfpe` has been executed, a floating point operation that raises one of the IEEE-754 exceptions Division by Zero, Overflow, or Invalid operation will in turn raise this standard Python exception. Conversion of an IEEE-754 exception to a Python exception requires that the wrapper macros ``PyFPE_START_PROTECT`` and ``PyFPE_END_PROTECT`` be inserted into your code in an appropriate fashion.  Python itself has been modified to support the :mod:`fpectl` module, but many other codes of interest to numerical analysts have not. Example In some circumstances, it would be better to raise an exception and stop processing at the point where the faulty operation was attempted. The :mod:`fpectl` module is for use in that situation. It provides control over floating point units from several hardware manufacturers, allowing the user to turn on the generation of :const:`SIGFPE` whenever any of the IEEE-754 exceptions Division by Zero, Overflow, or Invalid Operation occurs. In tandem with a pair of wrapper macros that are inserted into the C code comprising your python system, :const:`SIGFPE` is trapped and converted into the Python :exc:`FloatingPointError` exception. Limitations and other considerations Most computers carry out floating point operations in conformance with the so-called IEEE-754 standard. On any real computer, some floating point operations produce results that cannot be expressed as a normal floating point value. For example, try :: Reset default handling of floating point exceptions. Setting up a given processor to trap IEEE-754 floating point errors currently requires custom code on a per-architecture basis. You may have to modify :mod:`fpectl` to control your particular hardware. Some files in the source distribution may be interesting in learning more about how this module operates. The include file :file:`Include/pyfpe.h` discusses the implementation of this module at some length. :file:`Modules/fpetestmodule.c` gives several examples of use. Many additional examples can be found in :file:`Objects/floatobject.c`. The :mod:`fpectl` module defines the following functions and may raise the given exception: The :mod:`fpectl` module is not built by default, and its usage is discouraged and may be dangerous except in the hands of experts.  See also the section :ref:`fpectl-limitations` on limitations for more details. The :mod:`fpectl` module is not thread-safe. The following example demonstrates how to start up and test operation of the :mod:`fpectl` module. :: Turn on the generation of :const:`SIGFPE`, and set up an appropriate signal handler. 