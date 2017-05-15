%% simple_loop.m
% Written by:   Shelley Knuth (shelley.knuth@colorado.edu)
% Affiliation:  Research Computing, CU-Boulder
% Date:         8 May 2017
% Purpose:      The purpose of this program is to demonstrate how to use 
% the profiler to determine where code is taking longest to run
 
%% Turn on the profiler

	profile clear;
	profile on;

%% Main code

% Delete all existing variables
	clear;

% Create an array that consists of random values the length of n
% Note - we are purposely not pre-declaring arrays for demonstrating
% bottlenecks

	n = 1500;
	x = randn(1,n) ;

% Code that calculates the standard deviation of x and puts it into y
    for i = 1 : n
		y(i) = std(x(1:i));
	end

% Code that calculates the variance of x and puts it into z
    	for i = 1 : n
       		z(i) = var(x(1:i));
    	end

% Code that calculates the max value of y;
    	t=max(y);
    
% Code that calculates a magic square
    	m=magic(n);
        
% Turn off profiler and view results
    	profile viewer;
