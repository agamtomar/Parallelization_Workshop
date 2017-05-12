%% Initialize variables
r2=0.7^2;           % Wave coeficient
b=0.002;            % Dampening parameter
u=zeros(3000);      % Wave amplitude - current time step
u_l=zeros(3000);    % Wave amplitude - previous time step

% Introduce initial disturbances
u(100,100)=10;
u(200,400)=10;
u=imfilter(u, fspecial('gaussian', 100, 20));

% Convolution operator
operator=([0 1 0; 1 -4 1; 0 1 0]);

%% Solve equation on the CPU
tic;
uCPU=WaveEquationCPU(u, u_l, operator, r2, b);
toc
