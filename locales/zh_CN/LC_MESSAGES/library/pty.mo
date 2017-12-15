��          �               �   %   �   X     (   l  �   �     P  W  X  �   �  �   �  �   E  6     �   <  �   �  �  �  %   @	  X   f	  (   �	  �   �	     �
  W  �
  �     �   �  �   �  6   X  �   �  �   9   **Source code:** :source:`Lib/pty.py` :func:`spawn` now returns the status value from :func:`os.waitpid` on the child process. :mod:`pty` --- Pseudo-terminal utilities Because pseudo-terminal handling is highly platform dependent, there is code to do it only for Linux. (The Linux code is supposed to work on other platforms, but hasn't been tested yet.) Example Fork. Connect the child's controlling terminal to a pseudo-terminal. Return value is ``(pid, fd)``. Note that the child  gets *pid* 0, and the *fd* is *invalid*. The parent's return value is the *pid* of the child, and *fd* is a file descriptor connected to the child's controlling terminal (and also to the child's standard input and output). Open a new pseudo-terminal pair, using :func:`os.openpty` if possible, or emulation code for generic Unix systems. Return a pair of file descriptors ``(master, slave)``, for the master and the slave end, respectively. Spawn a process, and connect its controlling terminal with the current process's standard io. This is often used to baffle programs which insist on reading from the controlling terminal. The :mod:`pty` module defines operations for handling the pseudo-terminal concept: starting another process and being able to write to and read from its controlling terminal programmatically. The :mod:`pty` module defines the following functions: The following program acts like the Unix command :manpage:`script(1)`, using a pseudo-terminal to record all input and output of a terminal session in a "typescript". :: The functions *master_read* and *stdin_read* should be functions which read from a file descriptor. The defaults try to read 1024 bytes each time they are called. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/pty.py` :func:`spawn` now returns the status value from :func:`os.waitpid` on the child process. :mod:`pty` --- Pseudo-terminal utilities Because pseudo-terminal handling is highly platform dependent, there is code to do it only for Linux. (The Linux code is supposed to work on other platforms, but hasn't been tested yet.) Example Fork. Connect the child's controlling terminal to a pseudo-terminal. Return value is ``(pid, fd)``. Note that the child  gets *pid* 0, and the *fd* is *invalid*. The parent's return value is the *pid* of the child, and *fd* is a file descriptor connected to the child's controlling terminal (and also to the child's standard input and output). Open a new pseudo-terminal pair, using :func:`os.openpty` if possible, or emulation code for generic Unix systems. Return a pair of file descriptors ``(master, slave)``, for the master and the slave end, respectively. Spawn a process, and connect its controlling terminal with the current process's standard io. This is often used to baffle programs which insist on reading from the controlling terminal. The :mod:`pty` module defines operations for handling the pseudo-terminal concept: starting another process and being able to write to and read from its controlling terminal programmatically. The :mod:`pty` module defines the following functions: The following program acts like the Unix command :manpage:`script(1)`, using a pseudo-terminal to record all input and output of a terminal session in a "typescript". :: The functions *master_read* and *stdin_read* should be functions which read from a file descriptor. The defaults try to read 1024 bytes each time they are called. 