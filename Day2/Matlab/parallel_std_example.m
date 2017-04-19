%% matlab_parallel_tutorial.m
% Written by:   Shelley Knuth (shelley.knuth@colorado.edu)
% Affiliation:  Research Computing, CU-Boulder
% Date:         24 March 2014
% Updated:      19 April 2017
% Purpose:      The purpose of this program is to demonstrate how to take
% normal Matlab code and convert it to run in parallel.
 
%% We already executed simple code to run a simple mathematical function (matlab_serial_tutorial.m).  
%  We tested how long it takes to run the code serially.
 
%% Let's now adjust the above script to run in parallel.  We will also
% want to compare our time when running serially to the time below when
% running in parallel.
% We will run on 4 cores on one node on Janus (and then later on 12 cores).  We can run
% parallel processes by opening a pool with a specific number of
% workers (which would match up to how many cores you have available to
% you), or by using the default.
    
% To specify the number of workers in our pool, we use matlabpool
% (which is disabled in R2014a)
% Note: You cannot specify a larger number of workers in your pool than
% what you have available. 

delete(gcp('nocreate'))

n = 50000;
x = randn(1,n) ;
y = zeros(1,n);
pool=parpool(num_workers);
    tic
    for i = 1 : n
        y(i) = std(x(1:i));
    end
    fprintf('\n Normal for: %f secs',toc);
    tic
    parfor i = 1 : n
        y(i) = std(x(1:i));
    end
    fprintf('\n     parFor: %f secs\n\n',toc);
delete(pool);

