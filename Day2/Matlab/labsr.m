%% labsr.m
%% Written by:      Shelley Knuth (shelley.knuth@colorado.edu)
%% Affiliation:     Research Computing, CU-Boulder
%% Date:            11 May 2017
%% Purpose:         To demonstrate communication between workers using spmd

%% Main code

%% Calculate time with tic/toc
	tic;
% Open the parallel block
	spmd

% Use the magic function to create a unique value of mydata on each worker
		mydata=magic(labindex);

% Define the workers on each side
% rci:  the worker where the data is received from
% sci:  the worker where the data is sent to

		if labindex==1
			rci=numlabs
			sci=labindex+1
		end

		if labindex>1 & labindex<numlabs
			rci=labindex-1
			sci=labindex+1
		end

		if labindex==numlabs
			rci=labindex-1
			sci=1
		end

% Transfer the data, sending each worker's mydata into the next worker's otherdata variable
		otherdata=labSendReceive(sci,rci,mydata);

	end

% Print off end time
	toc
