��          �               <  �   =  p    �  �  �   9  �   �  �  �  �   J  �  �  }  �
  $   [  $  �    �     �  �  �  3   �  S   �  X   (  �  �  �   B  J  0  �  {  �     �   �  .  X  �   �  �    D  �  -   �  �  
  �   �     �   �  �   '   �"  ?   �"  E   �"   By the way, the language is named after the BBC show "Monty Python's Flying Circus" and has nothing to do with reptiles.  Making references to Monty Python skits in documentation is not only allowed, it is encouraged! If you do much work on computers, eventually you find that there's some task you'd like to automate.  For example, you may wish to perform a search-and-replace over a large number of text files, or rename and rearrange a bunch of photo files in a complicated way. Perhaps you'd like to write a small custom database, or a specialized GUI application, or a simple game. If you're a professional software developer, you may have to work with several C/C++/Java libraries but find the usual write/compile/test/re-compile cycle is too slow.  Perhaps you're writing a test suite for such a library and find writing the testing code a tedious task.  Or maybe you've written a program that could use an extension language, and you don't want to design and implement a whole new language for your application. In the next chapter, the mechanics of using the interpreter are explained.  This is rather mundane information, but essential for trying out the examples shown later. Now that you are all excited about Python, you'll want to examine it in some more detail.  Since the best way to learn a language is to use it, the tutorial invites you to play with the Python interpreter as you read. Python allows you to split your program into modules that can be reused in other Python programs.  It comes with a large collection of standard modules that you can use as the basis of your programs --- or as examples to start learning to program in Python.  Some of these modules provide things like file I/O, system calls, sockets, and even interfaces to graphical user interface toolkits like Tk. Python enables programs to be written compactly and readably.  Programs written in Python are typically much shorter than equivalent C,  C++, or Java programs, for several reasons: Python is *extensible*: if you know how to program in C it is easy to add a new built-in function or module to the interpreter, either to perform critical operations at maximum speed, or to link Python programs to libraries that may only be available in binary form (such as a vendor-specific graphics library). Once you are really hooked, you can link the Python interpreter into an application written in C and use it as an extension or command language for that application. Python is an interpreted language, which can save you considerable time during program development because no compilation and linking is necessary.  The interpreter can be used interactively, which makes it easy to experiment with features of the language, to write throw-away programs, or to test functions during bottom-up program development. It is also a handy desk calculator. Python is just the language for you. Python is simple to use, but it is a real programming language, offering much more structure and support for large programs than shell scripts or batch files can offer.  On the other hand, Python also offers much more error checking than C, and, being a *very-high-level language*, it has high-level data types built in, such as flexible arrays and dictionaries.  Because of its more general data types Python is applicable to a much larger problem domain than Awk or even Perl, yet many things are at least as easy in Python as in those languages. The rest of the tutorial introduces various features of the Python language and system through examples, beginning with simple expressions, statements and data types, through functions and modules, and finally touching upon advanced concepts like exceptions and user-defined classes. Whetting Your Appetite You could write a Unix shell script or Windows batch files for some of these tasks, but shell scripts are best at moving around files and changing text data, not well-suited for GUI applications or games. You could write a C/C++/Java program, but it can take a lot of development time to get even a first-draft program.  Python is simpler to use, available on Windows, Mac OS X, and Unix operating systems, and will help you get the job done more quickly. no variable or argument declarations are necessary. statement grouping is done by indentation instead of beginning and ending brackets; the high-level data types allow you to express complex operations in a single statement; Project-Id-Version: Python 3.6
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-01-05 15:01+0000
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: cdarlint <cdarlint@gmail.com>, 2017
Language: zh_Hans_CN
Language-Team: Chinese (China) (https://www.transifex.com/python-doc/teams/5390/zh_CN/)
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.1
 顺便提一下，这种语言的名字（Python意为“蟒蛇”）来自于BBC节目“Monty Python的飞行马戏团”，而与爬行动物没有关系。在文档中用Monty Python来开玩笑不只是可以的，还是推荐的！ 如果你经常在电脑上工作，总会有些任务会想让它自动化。比如，对一大堆文本文件进行查找替换，对很多照片文件按照比较复杂的规则重命名并放入不同的文件夹。也可能你想写一个小型的数据库应用，一个特定的界面应用，或者一个简单的游戏。 如果你是专业的软件开发人员，你可能需要编写一些C/C++/Java库，但总觉得通常的开发的流程（编写、编译、测试、再次编译等）太慢了。可能给这样的库写一组测试，就是很麻烦的工作了。或许你写了个软件，可以支持插件扩展语言，但你不想为了自己这一个应用，专门设计和实现一种新语言了。 在下一章节，会讲解使用解释器的方法。看起来相当枯燥，但是对于尝试后续的例子来说，是非常关键的。 现在你已经对Python跃跃欲试了，想要深入了解一些细节了。因为学习语言的最佳方式是使用它，本教程邀请你一边阅读，一边在Python解释器中玩耍。 Python允许你划分程序模块，在其他的Python程序中重用。它内置了很多的标准模块，你可以在此基础上开发程序——也可以作为例子，开始学习Python编程。例如，文件输入输出，系统调用，套接字，甚至图形界面接口工作包比如Tk。 Python程序的书写是紧凑而易读的。Python代码通常比同样功能的C，C++，Java代码要短很多，原因列举如下： Python是“可扩展的”：如果你知道怎么写C语言程序，就能很容易地给解释器添加新的内置函数或模块，不论是让关键的程序以最高速度运行，还是把Python程序链接到只提供预编译程序的库（比如硬件相关的图形库）。一旦你真正链接上了，就能在Python解释器中扩展或者控制C语言编写的应用了。 Python是一种解释型语言，在程序开发阶段可以为你节省大量时间，因为不需要编译和链接。解释器可以交互式使用，这样就可以方便地尝试语言特性，写一些一次性的程序，或者在自底向上的程序开发中测试功能。它也是一个顺手的桌面计算器。 那么，Python正好能满足你的需要。 Python很容易使用，但它是一种真正的编程语言，提供了很多数据结构，也支持大型程序，远超shell脚本或批处理文件的功能。Python还提供比C语言更多的错误检查，而且作为一种“超高级语言”，它有高级的内置数据类型，比如灵活的数组和字典。正因为这些更加通用的数据类型，Python能够应付更多的问题，超过Awk甚至Perl，而且很多东西在Python中至少和那些语言同样简单。 教程的其他部分将通过示例介绍Python语言和系统中的不同功能，开始是比较简单的表达式、语句和数据类型，然后是函数和模块，最终接触一些高级概念，比如异常、用户定义的类。 课前甜点 对于这些任务，你也可以写Unix脚本或者Windows批处理完成，但是shell脚本最擅长移动文件和替换文本，并不适合GUI界面或者游戏开发。你可以写一个C/C++/Java程序，但是可能第一版本的草稿都要很长的开发时间。Python的使用则更加简单，可以在Windows，Mac OS X，以及Unix操作系统上使用，而且可以帮你更快地完成工作。 不需要预先定义变量或参数。 代码块的划分是按照缩进而不是成对的花括号； 高级数据类型允许在一个表达式中表示复杂的操作； 