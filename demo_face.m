% Shark Demo
%
% Copyright (c) by Lorenzo Torresani, Stanford University
% 
% A demo of Non-Rigid Structure From Motion on artificial face sequence
%
%
% The 3D reconstruction technique is based on the following paper:
% 
%  Lorenzo Torresani, Aaron Hertzmann and Christoph Bregler, 
%     Learning Non-Rigid 3D Shape from 2D Motion, NIPS 16, 2003
%  http://cs.stanford.edu/~ltorresa/projects/learning-nr-shape/
% 
%
% Function em_sfm implements the algorithms "EM-Gaussian" and "EM-LDS" described
% in the paper
%
% I recommend that you try to compile the CMEX code for the function computeH:
% type 'mex computeH.c' in the Matlab Command Window ('mex computeH.c -l matlb' under Unix)
%

% loads the matrix P3_gt containing the ground thruth data: P3_gt([t t+T t+2*T],:) contains the 3D coordinates of the J points at time t
% (T is the number of frames, J is the number of points)

function demo_face()
disp('the reconstruction may be flipped upside down')
writeimg=false;
fn = 'data/face.mat';

use_lds = true; %true: model deformations using a linear dynamical system
max_em_iter = 20;

input_handler(fn,writeimg,use_lds,max_em_iter)

end
