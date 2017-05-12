%% parallel_hello_world.m
%% Written by:      Shelley Knuth (shelley.knuth@colorado.edu)
%% Affiliation:     Research Computing, CU-Boulder
%% Date:            19 April 2017
%% Purpose:         To demonstrate how parallelization in Matlab works using parfor

%% Main code

% Print Hello World on each worker
	parfor i = 1 : num_workers
            fprintf('\n Hello World from worker number %i',i);
        end
