%% parallel_hello_world.m
%% Written by:      Shelley Knuth (shelley.knuth@colorado.edu)
%% Affiliation:     Research Computing, CU-Boulder
%% Date:            19 April 2017
%% Purpose:         To demonstrate how parallelization in Matlab works using Hello World

%% Main code

% Delete any existing parallel pools
    delete(gcp('nocreate'))
    
% Open up a pool of Matlab workers based on our inputs from the batch file
    parpool('local');

% Determine the number of workers in the pool
    poolobj = gcp('nocreate'); % This returns the current pool number without creating a new parallel pool
    if isempty(poolobj)
        poolsize = 0;
    else
        poolsize = poolobj.NumWorkers;
    end


% Print Hello World on each worker
        parfor i = 1 : poolsize
            fprintf('\n Hello World from worker number %i',i);
        end
        
% Delete the current parallel pool
    delete(gcp())
