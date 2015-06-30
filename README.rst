======
em-sfm
======
`Lorenzo Torresani's <http://www.cs.dartmouth.edu/~lorenzo/software.html>`_ Structure from Motion Matlab code

I have cleaned up the C-code so that is is GCC compilable for Matlab and GNU Octave.

Tested in Matlab R2015a and Octave 4.0 on Linux

Examples
========
See ``randomshapes_demo.m`` and ``shark_demo.m`` for more information.

Installation
============
 git clone --depth 1 https://github.com/scienceopen/em-sfm.git
 
from Matlab/Octave Command Window, type:
 
 mex computeH.c
