��    K      t              �  (   �    �  �     �   �  0   �  A  �     �	     
  {    
     �
  �  �
  �  R  �   �     �     �  2  �  �        �       r   (  �   �  &   <  �   c  
  L  T   W    �  U   �  '     �   0  �     �   �  �   �  J   (  N   s  l  �     /  �   H  5   &     \  �   v  �   �  g   �  u   �    e   X   {!  �   �!  �   �"  E   #    U#  E  o$  "   �%  M   �%     &&  �   4&  �   '  �   �'  �   �(  
  =)  �   H*  �   (+  �   �+  �   F,  *   �,  �   -  Q   �-  �   �-  e   �.  X   -/  �   �/  �   70  .  �0  �   2  L  �2    4  �  <5  (   �6    7  �   ,8  �   �8  0   �9  A  �9     <     5<  {   F<     �<  �  �<  �  x>  �   �?     �@     �A  2  �A  �   1C     D     6D  r   ND  �   �D  &   bE  �   �E  
  rF  T   }H    �H  U   �I  '   .J  �   VJ  �   9K  �   L  �   �L  J   NM  N   �M  l  �M     UO  �   nO  5   LP     �P  �   �P  �   "Q  g   �Q  u   R    �R  X   �S  �   �S  �   �T  E   5U    {U  E  �V  "   �W  M   �W     LX  �   ZX  �   CY  �   Z  �   �Z  
  c[  �   n\  �   N]  �   �]  �   l^  *   _  �   2_  Q   �_  �   `  e   �`  X   Sa  �   �a  �   ]b  .  �b  �   'd  L  �d    Cf   **Source code:** :source:`Lib/random.py` *mu* is the mean angle, expressed in radians between 0 and 2\*\ *pi*, and *kappa* is the concentration parameter, which must be greater than or equal to zero.  If *kappa* is equal to zero, this distribution reduces to a uniform random angle over the range 0 to 2\*\ *pi*. *state* should have been obtained from a previous call to :func:`getstate`, and :func:`setstate` restores the internal state of the generator to what it was at the time :func:`getstate` was called. :meth:`randrange` is more sophisticated about producing equally distributed values.  Formerly it used a style like ``int(random()*n)`` which could produce slightly uneven distributions. :mod:`random` --- Generate pseudo-random numbers Almost all module functions depend on the basic function :func:`.random`, which generates a random float uniformly in the semi-open range [0.0, 1.0).  Python uses the Mersenne Twister as the core generator.  It produces 53-bit precision floats and has a period of 2\*\*19937-1.  The underlying implementation in C is both fast and threadsafe.  The Mersenne Twister is one of the most extensively tested random number generators in existence.  However, being completely deterministic, it is not suitable for all purposes, and is completely unsuitable for cryptographic purposes. Alternative Generator Basic examples:: Beta distribution.  Conditions on the parameters are ``alpha > 0`` and ``beta > 0``. Returned values range between 0 and 1. Bookkeeping functions Class :class:`Random` can also be subclassed if you want to use a different basic generator of your own devising: in that case, override the :meth:`~Random.random`, :meth:`~Random.seed`, :meth:`~Random.getstate`, and :meth:`~Random.setstate` methods. Optionally, a new generator can supply a :meth:`~Random.getrandbits` method --- this allows :meth:`randrange` to produce selections over an arbitrarily large range. Class that uses the :func:`os.urandom` function for generating random numbers from sources provided by the operating system. Not available on all systems. Does not rely on software state, and sequences are not reproducible. Accordingly, the :meth:`seed` method has no effect and is ignored. The :meth:`getstate` and :meth:`setstate` methods raise :exc:`NotImplementedError` if called. Example of `statistical bootstrapping <https://en.wikipedia.org/wiki/Bootstrapping_(statistics)>`_ using resampling with replacement to estimate a confidence interval for the mean of a sample of size five:: Example of a `resampling permutation test <https://en.wikipedia.org/wiki/Resampling_(statistics)#Permutation_tests>`_ to determine the statistical significance or `p-value <https://en.wikipedia.org/wiki/P-value>`_ of an observed difference between the effects of a drug versus a placebo:: Examples and Recipes Exponential distribution.  *lambd* is 1.0 divided by the desired mean.  It should be nonzero.  (The parameter would be called "lambda", but that is a reserved word in Python.)  Returned values range from 0 to positive infinity if *lambd* is positive, and from negative infinity to 0 if *lambd* is negative. For integers, there is uniform selection from a range. For sequences, there is uniform selection of a random element, a function to generate a random permutation of a list in-place, and a function for random sampling without replacement. Functions for integers Functions for sequences Gamma distribution.  (*Not* the gamma function!)  Conditions on the parameters are ``alpha > 0`` and ``beta > 0``. Gaussian distribution.  *mu* is the mean, and *sigma* is the standard deviation.  This is slightly faster than the :func:`normalvariate` function defined below. If *a* is an int, it is used directly. If *a* is omitted or ``None``, the current system time is used.  If randomness sources are provided by the operating system, they are used instead of the system time (see the :func:`os.urandom` function for details on availability). If a *weights* sequence is specified, selections are made according to the relative weights.  Alternatively, if a *cum_weights* sequence is given, the selections are made according to the cumulative weights (perhaps computed using :func:`itertools.accumulate`).  For example, the relative weights ``[10, 5, 30, 5]`` are equivalent to the cumulative weights ``[10, 15, 45, 50]``.  Internally, the relative weights are converted to cumulative weights before making selections, so supplying the cumulative weights saves work. If a new seeding method is added, then a backward compatible seeder will be offered. If neither *weights* nor *cum_weights* are specified, selections are made with equal probability.  If a weights sequence is supplied, it must be the same length as the *population* sequence.  It is a :exc:`TypeError` to specify both *weights* and *cum_weights*. If the sample size is larger than the population size, a :exc:`ValueError` is raised. Initialize the random number generator. Log normal distribution.  If you take the natural logarithm of this distribution, you'll get a normal distribution with mean *mu* and standard deviation *sigma*.  *mu* can have any value, and *sigma* must be greater than zero. M. Matsumoto and T. Nishimura, "Mersenne Twister: A 623-dimensionally equidistributed uniform pseudorandom number generator", ACM Transactions on Modeling and Computer Simulation Vol. 8, No. 1, January pp.3--30 1998. Members of the population need not be :term:`hashable` or unique.  If the population contains repeats, then each occurrence is a possible selection in the sample. Most of the random module's algorithms and seeding functions are subject to change across Python versions, but two aspects are guaranteed not to change: Moved to the version 2 scheme which uses all of the bits in a string seed. Normal distribution.  *mu* is the mean, and *sigma* is the standard deviation. Note that even for small ``len(x)``, the total number of permutations of *x* can quickly grow larger than the period of most random number generators. This implies that most permutations of a long sequence can never be generated.  For example, a sequence of length 2080 is the largest that can fit within the period of the Mersenne Twister random number generator. Notes on Reproducibility On the real line, there are functions to compute uniform, normal (Gaussian), lognormal, negative exponential, gamma, and beta distributions. For generating distributions of angles, the von Mises distribution is available. Pareto distribution.  *alpha* is the shape parameter. Real-valued distributions Return a *k* length list of unique elements chosen from the population sequence or set. Used for random sampling without replacement. Return a *k* sized list of elements chosen from the *population* with replacement. If the *population* is empty, raises :exc:`IndexError`. Return a random element from the non-empty sequence *seq*. If *seq* is empty, raises :exc:`IndexError`. Return a random floating point number *N* such that ``a <= N <= b`` for ``a <= b`` and ``b <= N <= a`` for ``b < a``. Return a random floating point number *N* such that ``low <= N <= high`` and with the specified *mode* between those bounds.  The *low* and *high* bounds default to zero and one.  The *mode* argument defaults to the midpoint between the bounds, giving a symmetric distribution. Return a random integer *N* such that ``a <= N <= b``.  Alias for ``randrange(a, b+1)``. Return a randomly selected element from ``range(start, stop, step)``.  This is equivalent to ``choice(range(start, stop, step))``, but doesn't actually build a range object. Return an object capturing the current internal state of the generator.  This object can be passed to :func:`setstate` to restore the state. Return the next random floating point number in the range [0.0, 1.0). Returns a Python integer with *k* random bits. This method is supplied with the MersenneTwister generator and some other generators may also provide it as an optional part of the API. When available, :meth:`getrandbits` enables :meth:`randrange` to handle arbitrarily large ranges. Returns a new list containing elements from the population while leaving the original population unchanged.  The resulting list is in selection order so that all sub-slices will also be valid random samples.  This allows raffle winners (the sample) to be partitioned into grand prize and second place winners (the subslices). Shuffle the sequence *x* in place. Simulation of arrival times and service deliveries in a single server queue:: Simulations:: Sometimes it is useful to be able to reproduce the sequences given by a pseudo random number generator.  By re-using a seed value, the same sequence should be reproducible from run to run as long as multiple threads are not running. The *weights* or *cum_weights* can use any numeric type that interoperates with the :class:`float` values returned by :func:`random` (that includes integers, floats, and fractions but excludes decimals). The :mod:`random` module also provides the :class:`SystemRandom` class which uses the system function :func:`os.urandom` to generate random numbers from sources provided by the operating system. The end-point value ``b`` may or may not be included in the range depending on floating-point rounding in the equation ``a + (b-a) * random()``. The following functions generate specific real-valued distributions. Function parameters are named after the corresponding variables in the distribution's equation, as used in common mathematical practice; most of these equations can be found in any statistics text. The functions supplied by this module are actually bound methods of a hidden instance of the :class:`random.Random` class.  You can instantiate your own instances of :class:`Random` to get generators that don't share state. The generator's :meth:`~Random.random` method will continue to produce the same sequence when the compatible seeder is given the same seed. The optional argument *random* is a 0-argument function returning a random float in [0.0, 1.0); by default, this is the function :func:`.random`. The positional argument pattern matches that of :func:`range`.  Keyword arguments should not be used because the function may use them in unexpected ways. The probability distribution function is:: The pseudo-random generators of this module should not be used for security purposes.  For security or cryptographic uses, see the :mod:`secrets` module. This module implements pseudo-random number generators for various distributions. To choose a sample from a range of integers, use a :func:`range` object as an argument.  This is especially fast and space efficient for sampling from a large population:  ``sample(range(10000000), k=60)``. To shuffle an immutable sequence and return a new shuffled list, use ``sample(x, k=len(x))`` instead. Weibull distribution.  *alpha* is the scale parameter and *beta* is the shape parameter. With version 1 (provided for reproducing random sequences from older versions of Python), the algorithm for :class:`str` and :class:`bytes` generates a narrower range of seeds. With version 2 (the default), a :class:`str`, :class:`bytes`, or :class:`bytearray` object gets converted to an :class:`int` and all of its bits are used. `A Concrete Introduction to Probability (using Python) <http://nbviewer.jupyter.org/url/norvig.com/ipython/Probability.ipynb>`_ a tutorial by `Peter Norvig <http://norvig.com/bio.html>`_ covering the basics of probability theory, how to write simulations, and how to perform data analysis using Python. `Complementary-Multiply-with-Carry recipe <https://code.activestate.com/recipes/576707/>`_ for a compatible alternative random number generator with a long period and comparatively simple update operations. `Economics Simulation <http://nbviewer.jupyter.org/url/norvig.com/ipython/Economics.ipynb>`_ a simulation of a marketplace by `Peter Norvig <http://norvig.com/bio.html>`_ that shows effective use of many of the tools and distributions provided by this module (gauss, uniform, sample, betavariate, choice, triangular, and randrange). `Statistics for Hackers <https://www.youtube.com/watch?v=Iq9DzN6mvYA>`_ a video tutorial by `Jake Vanderplas <https://us.pycon.org/2016/speaker/profile/295/>`_ on statistical analysis using just a few fundamental concepts including simulation, sampling, shuffling, and cross-validation. Project-Id-Version: Python 3.6
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
 **Source code:** :source:`Lib/random.py` *mu* is the mean angle, expressed in radians between 0 and 2\*\ *pi*, and *kappa* is the concentration parameter, which must be greater than or equal to zero.  If *kappa* is equal to zero, this distribution reduces to a uniform random angle over the range 0 to 2\*\ *pi*. *state* should have been obtained from a previous call to :func:`getstate`, and :func:`setstate` restores the internal state of the generator to what it was at the time :func:`getstate` was called. :meth:`randrange` is more sophisticated about producing equally distributed values.  Formerly it used a style like ``int(random()*n)`` which could produce slightly uneven distributions. :mod:`random` --- Generate pseudo-random numbers Almost all module functions depend on the basic function :func:`.random`, which generates a random float uniformly in the semi-open range [0.0, 1.0).  Python uses the Mersenne Twister as the core generator.  It produces 53-bit precision floats and has a period of 2\*\*19937-1.  The underlying implementation in C is both fast and threadsafe.  The Mersenne Twister is one of the most extensively tested random number generators in existence.  However, being completely deterministic, it is not suitable for all purposes, and is completely unsuitable for cryptographic purposes. Alternative Generator Basic examples:: Beta distribution.  Conditions on the parameters are ``alpha > 0`` and ``beta > 0``. Returned values range between 0 and 1. Bookkeeping functions Class :class:`Random` can also be subclassed if you want to use a different basic generator of your own devising: in that case, override the :meth:`~Random.random`, :meth:`~Random.seed`, :meth:`~Random.getstate`, and :meth:`~Random.setstate` methods. Optionally, a new generator can supply a :meth:`~Random.getrandbits` method --- this allows :meth:`randrange` to produce selections over an arbitrarily large range. Class that uses the :func:`os.urandom` function for generating random numbers from sources provided by the operating system. Not available on all systems. Does not rely on software state, and sequences are not reproducible. Accordingly, the :meth:`seed` method has no effect and is ignored. The :meth:`getstate` and :meth:`setstate` methods raise :exc:`NotImplementedError` if called. Example of `statistical bootstrapping <https://en.wikipedia.org/wiki/Bootstrapping_(statistics)>`_ using resampling with replacement to estimate a confidence interval for the mean of a sample of size five:: Example of a `resampling permutation test <https://en.wikipedia.org/wiki/Resampling_(statistics)#Permutation_tests>`_ to determine the statistical significance or `p-value <https://en.wikipedia.org/wiki/P-value>`_ of an observed difference between the effects of a drug versus a placebo:: Examples and Recipes Exponential distribution.  *lambd* is 1.0 divided by the desired mean.  It should be nonzero.  (The parameter would be called "lambda", but that is a reserved word in Python.)  Returned values range from 0 to positive infinity if *lambd* is positive, and from negative infinity to 0 if *lambd* is negative. For integers, there is uniform selection from a range. For sequences, there is uniform selection of a random element, a function to generate a random permutation of a list in-place, and a function for random sampling without replacement. Functions for integers Functions for sequences Gamma distribution.  (*Not* the gamma function!)  Conditions on the parameters are ``alpha > 0`` and ``beta > 0``. Gaussian distribution.  *mu* is the mean, and *sigma* is the standard deviation.  This is slightly faster than the :func:`normalvariate` function defined below. If *a* is an int, it is used directly. If *a* is omitted or ``None``, the current system time is used.  If randomness sources are provided by the operating system, they are used instead of the system time (see the :func:`os.urandom` function for details on availability). If a *weights* sequence is specified, selections are made according to the relative weights.  Alternatively, if a *cum_weights* sequence is given, the selections are made according to the cumulative weights (perhaps computed using :func:`itertools.accumulate`).  For example, the relative weights ``[10, 5, 30, 5]`` are equivalent to the cumulative weights ``[10, 15, 45, 50]``.  Internally, the relative weights are converted to cumulative weights before making selections, so supplying the cumulative weights saves work. If a new seeding method is added, then a backward compatible seeder will be offered. If neither *weights* nor *cum_weights* are specified, selections are made with equal probability.  If a weights sequence is supplied, it must be the same length as the *population* sequence.  It is a :exc:`TypeError` to specify both *weights* and *cum_weights*. If the sample size is larger than the population size, a :exc:`ValueError` is raised. Initialize the random number generator. Log normal distribution.  If you take the natural logarithm of this distribution, you'll get a normal distribution with mean *mu* and standard deviation *sigma*.  *mu* can have any value, and *sigma* must be greater than zero. M. Matsumoto and T. Nishimura, "Mersenne Twister: A 623-dimensionally equidistributed uniform pseudorandom number generator", ACM Transactions on Modeling and Computer Simulation Vol. 8, No. 1, January pp.3--30 1998. Members of the population need not be :term:`hashable` or unique.  If the population contains repeats, then each occurrence is a possible selection in the sample. Most of the random module's algorithms and seeding functions are subject to change across Python versions, but two aspects are guaranteed not to change: Moved to the version 2 scheme which uses all of the bits in a string seed. Normal distribution.  *mu* is the mean, and *sigma* is the standard deviation. Note that even for small ``len(x)``, the total number of permutations of *x* can quickly grow larger than the period of most random number generators. This implies that most permutations of a long sequence can never be generated.  For example, a sequence of length 2080 is the largest that can fit within the period of the Mersenne Twister random number generator. Notes on Reproducibility On the real line, there are functions to compute uniform, normal (Gaussian), lognormal, negative exponential, gamma, and beta distributions. For generating distributions of angles, the von Mises distribution is available. Pareto distribution.  *alpha* is the shape parameter. Real-valued distributions Return a *k* length list of unique elements chosen from the population sequence or set. Used for random sampling without replacement. Return a *k* sized list of elements chosen from the *population* with replacement. If the *population* is empty, raises :exc:`IndexError`. Return a random element from the non-empty sequence *seq*. If *seq* is empty, raises :exc:`IndexError`. Return a random floating point number *N* such that ``a <= N <= b`` for ``a <= b`` and ``b <= N <= a`` for ``b < a``. Return a random floating point number *N* such that ``low <= N <= high`` and with the specified *mode* between those bounds.  The *low* and *high* bounds default to zero and one.  The *mode* argument defaults to the midpoint between the bounds, giving a symmetric distribution. Return a random integer *N* such that ``a <= N <= b``.  Alias for ``randrange(a, b+1)``. Return a randomly selected element from ``range(start, stop, step)``.  This is equivalent to ``choice(range(start, stop, step))``, but doesn't actually build a range object. Return an object capturing the current internal state of the generator.  This object can be passed to :func:`setstate` to restore the state. Return the next random floating point number in the range [0.0, 1.0). Returns a Python integer with *k* random bits. This method is supplied with the MersenneTwister generator and some other generators may also provide it as an optional part of the API. When available, :meth:`getrandbits` enables :meth:`randrange` to handle arbitrarily large ranges. Returns a new list containing elements from the population while leaving the original population unchanged.  The resulting list is in selection order so that all sub-slices will also be valid random samples.  This allows raffle winners (the sample) to be partitioned into grand prize and second place winners (the subslices). Shuffle the sequence *x* in place. Simulation of arrival times and service deliveries in a single server queue:: Simulations:: Sometimes it is useful to be able to reproduce the sequences given by a pseudo random number generator.  By re-using a seed value, the same sequence should be reproducible from run to run as long as multiple threads are not running. The *weights* or *cum_weights* can use any numeric type that interoperates with the :class:`float` values returned by :func:`random` (that includes integers, floats, and fractions but excludes decimals). The :mod:`random` module also provides the :class:`SystemRandom` class which uses the system function :func:`os.urandom` to generate random numbers from sources provided by the operating system. The end-point value ``b`` may or may not be included in the range depending on floating-point rounding in the equation ``a + (b-a) * random()``. The following functions generate specific real-valued distributions. Function parameters are named after the corresponding variables in the distribution's equation, as used in common mathematical practice; most of these equations can be found in any statistics text. The functions supplied by this module are actually bound methods of a hidden instance of the :class:`random.Random` class.  You can instantiate your own instances of :class:`Random` to get generators that don't share state. The generator's :meth:`~Random.random` method will continue to produce the same sequence when the compatible seeder is given the same seed. The optional argument *random* is a 0-argument function returning a random float in [0.0, 1.0); by default, this is the function :func:`.random`. The positional argument pattern matches that of :func:`range`.  Keyword arguments should not be used because the function may use them in unexpected ways. The probability distribution function is:: The pseudo-random generators of this module should not be used for security purposes.  For security or cryptographic uses, see the :mod:`secrets` module. This module implements pseudo-random number generators for various distributions. To choose a sample from a range of integers, use a :func:`range` object as an argument.  This is especially fast and space efficient for sampling from a large population:  ``sample(range(10000000), k=60)``. To shuffle an immutable sequence and return a new shuffled list, use ``sample(x, k=len(x))`` instead. Weibull distribution.  *alpha* is the scale parameter and *beta* is the shape parameter. With version 1 (provided for reproducing random sequences from older versions of Python), the algorithm for :class:`str` and :class:`bytes` generates a narrower range of seeds. With version 2 (the default), a :class:`str`, :class:`bytes`, or :class:`bytearray` object gets converted to an :class:`int` and all of its bits are used. `A Concrete Introduction to Probability (using Python) <http://nbviewer.jupyter.org/url/norvig.com/ipython/Probability.ipynb>`_ a tutorial by `Peter Norvig <http://norvig.com/bio.html>`_ covering the basics of probability theory, how to write simulations, and how to perform data analysis using Python. `Complementary-Multiply-with-Carry recipe <https://code.activestate.com/recipes/576707/>`_ for a compatible alternative random number generator with a long period and comparatively simple update operations. `Economics Simulation <http://nbviewer.jupyter.org/url/norvig.com/ipython/Economics.ipynb>`_ a simulation of a marketplace by `Peter Norvig <http://norvig.com/bio.html>`_ that shows effective use of many of the tools and distributions provided by this module (gauss, uniform, sample, betavariate, choice, triangular, and randrange). `Statistics for Hackers <https://www.youtube.com/watch?v=Iq9DzN6mvYA>`_ a video tutorial by `Jake Vanderplas <https://us.pycon.org/2016/speaker/profile/295/>`_ on statistical analysis using just a few fundamental concepts including simulation, sampling, shuffling, and cross-validation. 