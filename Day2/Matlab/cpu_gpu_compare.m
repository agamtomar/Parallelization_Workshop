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
A=magic(10000);
f=ones(1,200)/200;

tic;
B=filter(f,1,A);
tCPU=toc;
fprintf('\n CPU code: %f secs',toc);

