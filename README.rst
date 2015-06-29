======
em-sfm
======
`Lorenzo Torresani's <http://www.cs.dartmouth.edu/~lorenzo/software.html>`_ Structure from Motion Matlab code

Examples
========
See randomshapes_demo.m and shark_demo.m for more information.

Installation
============
 git clone --depth 1 https://github.com/scienceopen/em-sfm.git

for better performance, open Matlab and type in the Matlab Command Window

 mex computeH.c

if using Linux/Mac, you may need to type 
 mex computeH.c -l matlb
