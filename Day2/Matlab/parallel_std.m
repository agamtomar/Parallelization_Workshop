%% parallel_std.m
%% Written by:   Shelley Knuth (shelley.knuth@colorado.edu)
%% Affiliation:  Research Computing, CU-Boulder
%% Date:         24 March 2014
%% Updated:      19 April 2017
%% Purpose:      The purpose of this program is to demonstrate how to take
%% normal Matlab code and convert it to run in parallel.  We will also compare the execution time for the parallel and serial loops.
 

%% Main code

    
% Create two arrays, x and y, that consist of either random values or a list of zero values.  The arrays should be the length of n
	n = 150000;
	x = randn(1,n) ;
	y = zeros(1,n);
	z = zeros(1,n);

% Tic and toc tell you how much time it takes to run the code within the two commands
	tic

% Serial code that calculates the standard deviation of x and puts it into y
    	for i = 1 : n
           y(i) = std(x(1:i));
 	   z(i)=sin(1-sqrt(2)*y(i));
    	end

% Print off how long it takes to run the serial code
    	fprintf('\n Serial code: %f secs',toc);


% Tic and toc tell you how much time it takes to run the code within the two commands
	tic

% Same code as above that calculates the standard deviation except now run in a parallel for loop
    	parfor i = 1 : n
           y(i) = std(x(1:i));
 	   z(i)=sin(1-sqrt(2)*y(i));
    	end

% Print off how long it takes to run the serial code
    	fprintf('\n Parallel Code: %f secs\n\n',toc);
