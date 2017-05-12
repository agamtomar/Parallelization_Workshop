%% multi_threading.m
%% Written by:   Shelley Knuth (shelley.knuth@colorado.edu)
%% Affiliation:  Research Computing, CU-Boulder
%% Date:         19 April 2017
%% Purpose:      This program does a matrix multiplication.  It is intended that the number of ntasks will be varied in multi_threading.sh to show how fast/slow the code runs when there are more/less cores being utilized.
 
% This line is used to avoid a bunch of Summit messages
%t.TimeZone='America/Denver';


%% Main code
tic;
n = 9000; % matrix size
A = rand(n,n); % n x n random matrix
B = rand(n,n); % n x n random matrix
C = A * B; % matrix multiplication
fprintf('\n Multi-threading code complete in: %f secs',toc);
