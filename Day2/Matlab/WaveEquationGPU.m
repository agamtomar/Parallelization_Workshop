%Written by Dan Doherty, MathWorks

function u = WaveEquationGPU(u, u_l, operator, r2, b)
    
    % Move the data to the GPU
    u=gpuArray(u);
    u_l=gpuArray(u_l);
    operator=gpuArray(operator);
    
    % Do 1000 iterations of the wave equation
    for i=1:1000
        % Compute the spatial differential with a convolution
        uDel=conv2(u, operator, 'same');
        
        % Integrate over time to get the next time-step
        u_n=2*u - u_l +r2*uDel - b*(u-u_l);
        
        % Swap the pointers
        u_l=u;
        u=u_n;
        
        % Set the edges to zero
        u_n([1 end], :) = 0;
        u_n(:, [1 end]) = 0;
    end
    u=gather(u);
end
