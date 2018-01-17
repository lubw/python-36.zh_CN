��    .      �              �  �   �  9  �  �   �  ,   �  �   �  �   h  6     �   S  �   Q  /  O	  �   
  �   A  -     �   1  �       �  �     *  �  �     �     {   �  �     a     4   v  �   �  H   9  9   �  J   �  I     5   Q  D   �  �   �  �   �  }   3  -  �  "  �  �     9   �  9     a   T  D   �  X   �  2   T  L   �  �  �  �  �   �   "  9  #  �   >$  ,   -%  �   Z%  �   �%  6   �&  �   �&  �   �'  /  �(  �   *  �   �*  -   �+  �   �+  �   �,    v-  �   �/  *  ^0  �   �1  �   �2  {   %3  �   �3  a   �4  4   �4  �   -5  H   �5  9   6  J   >6  I   �6  5   �6  D   	7  �   N7  �   '8  }   �8  -  39  "  a:  �   �;  9   b<  9   �<  a   �<  D   8=  X   }=  2   �=  L   	>  �  V>   "Byteswap" all samples in a fragment and returns the modified fragment. Converts big-endian samples to little-endian and vice versa. *state* is a tuple containing the state of the coder.  The coder returns a tuple ``(adpcmfrag, newstate)``, and the *newstate* should be passed to the next call of :func:`lin2adpcm`.  In the initial call, ``None`` can be passed as the state. *adpcmfrag* is the ADPCM coded fragment packed 2 4-bit values per byte. *state* is a tuple containing the state of the converter.  The converter returns a tuple ``(newfragment, newstate)``, and *newstate* should be passed to the next call of :func:`ratecv`.  The initial call should pass ``None`` as the state. :mod:`audioop` --- Manipulate raw audio data A few of the more complicated operations only take 16-bit samples, otherwise the sample size (in bytes) is always a parameter of the operation. Convert a stereo fragment to a mono fragment.  The left channel is multiplied by *lfactor* and the right channel by *rfactor* before adding the two channels to give a mono signal. Convert samples between 1-, 2-, 3- and 4-byte formats. Convert samples in the audio fragment to a-LAW encoding and return this as a bytes object.  a-LAW is an audio encoding format whereby you get a dynamic range of about 13 bits using only 8 bit samples.  It is used by the Sun audio hardware, among others. Convert samples in the audio fragment to u-LAW encoding and return this as a bytes object.  u-LAW is an audio encoding format whereby you get a dynamic range of about 14 bits using only 8 bit samples.  It is used by the Sun audio hardware, among others. Convert samples to 4 bit Intel/DVI ADPCM encoding.  ADPCM coding is an adaptive coding scheme, whereby each 4 bit number is the difference between one sample and the next, divided by a (varying) step.  The Intel/DVI ADPCM algorithm has been selected for use by the IMA, so it may well become a standard. Convert sound fragments in a-LAW encoding to linearly encoded sound fragments. a-LAW encoding always uses 8 bits samples, so *width* refers only to the sample width of the output fragment here. Convert sound fragments in u-LAW encoding to linearly encoded sound fragments. u-LAW encoding always uses 8 bits samples, so *width* refers only to the sample width of the output fragment here. Convert the frame rate of the input fragment. Decode an Intel/DVI ADPCM coded fragment to a linear fragment.  See the description of :func:`lin2adpcm` for details on ADPCM coding. Return a tuple ``(sample, newstate)`` where the sample has the width specified in *width*. Generate a stereo fragment from a mono fragment.  Each pair of samples in the stereo fragment are computed from the mono sample, whereby left channel samples are multiplied by *lfactor* and right channel samples by *rfactor*. If you use the ADPCM coder to build network packets and you want your protocol to be stateless (i.e. to be able to tolerate packet loss) you should not only transmit the data but also the state.  Note that you should send the *initial* state (the one you passed to :func:`lin2adpcm`) along to the decoder, not the final state (as returned by the coder).  If you want to use :class:`struct.Struct` to store the state in binary you can code the first element (the predicted value) in 16 bits and the second (the delta index) in 8. In some audio formats, such as .WAV files, 16, 24 and 32 bit samples are signed, but 8 bit samples are unsigned.  So when converting to 8 bit wide samples for these formats, you need to also add 128 to the result:: Note that operations such as :func:`.mul` or :func:`.max` make no distinction between mono and stereo fragments, i.e. all samples are treated equal.  If this is a problem the stereo fragment should be split into two mono fragments first and recombined later.  Here is an example of how to do that:: Return a factor *F* such that ``rms(add(fragment, mul(reference, -F)))`` is minimal, i.e., return the factor with which you should multiply *reference* to make it match as well as possible to *fragment*.  The fragments should both contain 2-byte samples. Return a fragment that has all samples in the original fragment multiplied by the floating-point value *factor*.  Samples are truncated in case of overflow. Return a fragment that is the original fragment with a bias added to each sample.  Samples wrap around in case of overflow. Return a fragment which is the addition of the two samples passed as parameters. *width* is the sample width in bytes, either ``1``, ``2``, ``3`` or ``4``.  Both fragments should have the same length.  Samples are truncated in case of overflow. Return a tuple consisting of the minimum and maximum values of all samples in the sound fragment. Return the average over all samples in the fragment. Return the average peak-peak value over all samples in the fragment. No filtering is done, so the usefulness of this routine is questionable. Return the maximum of the *absolute value* of all samples in a fragment. Return the maximum peak-peak value in the sound fragment. Return the number of zero crossings in the fragment passed as an argument. Return the root-mean-square of the fragment, i.e. ``sqrt(sum(S_i^2)/n)``. Return the value of sample *index* from the fragment. Reverse the samples in a fragment and returns the modified fragment. Search *fragment* for a slice of length *length* samples (not bytes!) with maximum energy, i.e., return *i* for which ``rms(fragment[i*2:(i+length)*2])`` is maximal.  The fragments should both contain 2-byte samples. Support for 24-bit samples was added. All functions now accept any :term:`bytes-like object`. String input now results in an immediate error. The *weightA* and *weightB* arguments are parameters for a simple digital filter and default to ``1`` and ``0`` respectively. The :func:`find\*` routines might look a bit funny at first sight. They are primarily meant to do echo cancellation.  A reasonably fast way to do this is to pick the most energetic piece of the output sample, locate that in the input sample and subtract the whole output sample from the input sample:: The :mod:`audioop` module contains some useful operations on sound fragments. It operates on sound fragments consisting of signed integer samples 8, 16, 24 or 32 bits wide, stored in :term:`bytes-like objects <bytes-like object>`.  All scalar items are integers, unless specified otherwise. The ADPCM coders have never been tried against other ADPCM coders, only against themselves.  It could well be that I misinterpreted the standards in which case they will not be interoperable with the respective standards. The module defines the following variables and functions: The routine takes time proportional to ``len(fragment)``. The same, in reverse, has to be applied when converting from 8 to 16, 24 or 32 bit width samples. The time taken by this routine is proportional to ``len(fragment)``. This exception is raised on all errors, such as unknown number of bytes per sample, etc. This is a measure of the power in an audio signal. This module provides support for a-LAW, u-LAW and Intel/DVI ADPCM encodings. Try to match *reference* as well as possible to a portion of *fragment* (which should be the longer fragment).  This is (conceptually) done by taking slices out of *fragment*, using :func:`findfactor` to compute the best match, and minimizing the result.  The fragments should both contain 2-byte samples. Return a tuple ``(offset, factor)`` where *offset* is the (integer) offset into *fragment* where the optimal match started and *factor* is the (floating-point) factor as per :func:`findfactor`. Project-Id-Version: Python 3.6
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
 "Byteswap" all samples in a fragment and returns the modified fragment. Converts big-endian samples to little-endian and vice versa. *state* is a tuple containing the state of the coder.  The coder returns a tuple ``(adpcmfrag, newstate)``, and the *newstate* should be passed to the next call of :func:`lin2adpcm`.  In the initial call, ``None`` can be passed as the state. *adpcmfrag* is the ADPCM coded fragment packed 2 4-bit values per byte. *state* is a tuple containing the state of the converter.  The converter returns a tuple ``(newfragment, newstate)``, and *newstate* should be passed to the next call of :func:`ratecv`.  The initial call should pass ``None`` as the state. :mod:`audioop` --- Manipulate raw audio data A few of the more complicated operations only take 16-bit samples, otherwise the sample size (in bytes) is always a parameter of the operation. Convert a stereo fragment to a mono fragment.  The left channel is multiplied by *lfactor* and the right channel by *rfactor* before adding the two channels to give a mono signal. Convert samples between 1-, 2-, 3- and 4-byte formats. Convert samples in the audio fragment to a-LAW encoding and return this as a bytes object.  a-LAW is an audio encoding format whereby you get a dynamic range of about 13 bits using only 8 bit samples.  It is used by the Sun audio hardware, among others. Convert samples in the audio fragment to u-LAW encoding and return this as a bytes object.  u-LAW is an audio encoding format whereby you get a dynamic range of about 14 bits using only 8 bit samples.  It is used by the Sun audio hardware, among others. Convert samples to 4 bit Intel/DVI ADPCM encoding.  ADPCM coding is an adaptive coding scheme, whereby each 4 bit number is the difference between one sample and the next, divided by a (varying) step.  The Intel/DVI ADPCM algorithm has been selected for use by the IMA, so it may well become a standard. Convert sound fragments in a-LAW encoding to linearly encoded sound fragments. a-LAW encoding always uses 8 bits samples, so *width* refers only to the sample width of the output fragment here. Convert sound fragments in u-LAW encoding to linearly encoded sound fragments. u-LAW encoding always uses 8 bits samples, so *width* refers only to the sample width of the output fragment here. Convert the frame rate of the input fragment. Decode an Intel/DVI ADPCM coded fragment to a linear fragment.  See the description of :func:`lin2adpcm` for details on ADPCM coding. Return a tuple ``(sample, newstate)`` where the sample has the width specified in *width*. Generate a stereo fragment from a mono fragment.  Each pair of samples in the stereo fragment are computed from the mono sample, whereby left channel samples are multiplied by *lfactor* and right channel samples by *rfactor*. If you use the ADPCM coder to build network packets and you want your protocol to be stateless (i.e. to be able to tolerate packet loss) you should not only transmit the data but also the state.  Note that you should send the *initial* state (the one you passed to :func:`lin2adpcm`) along to the decoder, not the final state (as returned by the coder).  If you want to use :class:`struct.Struct` to store the state in binary you can code the first element (the predicted value) in 16 bits and the second (the delta index) in 8. In some audio formats, such as .WAV files, 16, 24 and 32 bit samples are signed, but 8 bit samples are unsigned.  So when converting to 8 bit wide samples for these formats, you need to also add 128 to the result:: Note that operations such as :func:`.mul` or :func:`.max` make no distinction between mono and stereo fragments, i.e. all samples are treated equal.  If this is a problem the stereo fragment should be split into two mono fragments first and recombined later.  Here is an example of how to do that:: Return a factor *F* such that ``rms(add(fragment, mul(reference, -F)))`` is minimal, i.e., return the factor with which you should multiply *reference* to make it match as well as possible to *fragment*.  The fragments should both contain 2-byte samples. Return a fragment that has all samples in the original fragment multiplied by the floating-point value *factor*.  Samples are truncated in case of overflow. Return a fragment that is the original fragment with a bias added to each sample.  Samples wrap around in case of overflow. Return a fragment which is the addition of the two samples passed as parameters. *width* is the sample width in bytes, either ``1``, ``2``, ``3`` or ``4``.  Both fragments should have the same length.  Samples are truncated in case of overflow. Return a tuple consisting of the minimum and maximum values of all samples in the sound fragment. Return the average over all samples in the fragment. Return the average peak-peak value over all samples in the fragment. No filtering is done, so the usefulness of this routine is questionable. Return the maximum of the *absolute value* of all samples in a fragment. Return the maximum peak-peak value in the sound fragment. Return the number of zero crossings in the fragment passed as an argument. Return the root-mean-square of the fragment, i.e. ``sqrt(sum(S_i^2)/n)``. Return the value of sample *index* from the fragment. Reverse the samples in a fragment and returns the modified fragment. Search *fragment* for a slice of length *length* samples (not bytes!) with maximum energy, i.e., return *i* for which ``rms(fragment[i*2:(i+length)*2])`` is maximal.  The fragments should both contain 2-byte samples. Support for 24-bit samples was added. All functions now accept any :term:`bytes-like object`. String input now results in an immediate error. The *weightA* and *weightB* arguments are parameters for a simple digital filter and default to ``1`` and ``0`` respectively. The :func:`find\*` routines might look a bit funny at first sight. They are primarily meant to do echo cancellation.  A reasonably fast way to do this is to pick the most energetic piece of the output sample, locate that in the input sample and subtract the whole output sample from the input sample:: The :mod:`audioop` module contains some useful operations on sound fragments. It operates on sound fragments consisting of signed integer samples 8, 16, 24 or 32 bits wide, stored in :term:`bytes-like objects <bytes-like object>`.  All scalar items are integers, unless specified otherwise. The ADPCM coders have never been tried against other ADPCM coders, only against themselves.  It could well be that I misinterpreted the standards in which case they will not be interoperable with the respective standards. The module defines the following variables and functions: The routine takes time proportional to ``len(fragment)``. The same, in reverse, has to be applied when converting from 8 to 16, 24 or 32 bit width samples. The time taken by this routine is proportional to ``len(fragment)``. This exception is raised on all errors, such as unknown number of bytes per sample, etc. This is a measure of the power in an audio signal. This module provides support for a-LAW, u-LAW and Intel/DVI ADPCM encodings. Try to match *reference* as well as possible to a portion of *fragment* (which should be the longer fragment).  This is (conceptually) done by taking slices out of *fragment*, using :func:`findfactor` to compute the best match, and minimizing the result.  The fragments should both contain 2-byte samples. Return a tuple ``(offset, factor)`` where *offset* is the (integer) offset into *fragment* where the optimal match started and *factor* is the (floating-point) factor as per :func:`findfactor`. 