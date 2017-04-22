%% parallel_std.m
%% Written by:   Shelley Knuth (shelley.knuth@colorado.edu)
%% Affiliation:  Research Computing, CU-Boulder
%% Date:         24 March 2014
%% Updated:      19 April 2017
%% Purpose:      The purpose of this program is to demonstrate how to take
%% normal Matlab code and convert it to run in parallel.  We will also compare the execution time for the parallel and serial loops.
 
%% Formally matlab_parallel_tutorial and then matlab_parallel_tutorial_new

% This line is used to avoid a bunch of Summit messages
t.TimeZone='America/Denver';


%% Main code
tic;
n = 3000; % matrix size
a = rand(n); % n x n random matrix
A = gpuArray(a) % copy a to the GPU
B = gpuArray.rand(n) % create random array directly on GPU
C = A * B; % matrix multiply on GPU
c = gather(C); % bring data back to base workspace
fprintf('\n GPU code: %f secs',toc);
