%% parallel_hello_world.m
%% Written by:      Shelley Knuth (shelley.knuth@colorado.edu)
%% Affiliation:     Research Computing, CU-Boulder
%% Date:            19 April 2017
%% Purpose:         To demonstrate how parallelization in Matlab works using Hello World

% This line is used to avoid a bunch of Summit messages
%t.TimeZone='America/Denver'

%% Main code

% Delete any existing parallel pools
	delete(gcp('nocreate'))
    
% Open up a pool of Matlab workers based on our inputs from the batch file
    	parpool('local',24);

% Determine the size of the pool
	poolsize=parcluster('local');

% Print Hello World on each worker
        parfor i = 1 : poolsize.NumWorkers
            fprintf('\n Hello World from worker number %i',i);
        end
        
% Delete the current parallel pool
	delete(gcp())
