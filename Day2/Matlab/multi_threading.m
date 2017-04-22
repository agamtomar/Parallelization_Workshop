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
n = 300; % matrix size
A = rand(n,n); % n x n random matrix
B = rand(n,n); % n x n random matrix
C = A * B; % element multiplication
fprintf('\n Multi-threading code complete in: %f secs',toc);
