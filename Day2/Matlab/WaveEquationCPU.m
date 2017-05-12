%Written by Dan Doherty, MathWorks

function u=WaveEquationCPU(u, u_l, operator, r2, b)
    
    % Do 1000 iterations of the wave equation
    for i=1:1000
        % Compute the spatial differential with a convolution
        uDel=conv2(u, operator, 'same');
        
        % Integrate over time to get the next time-step
        u_n=2*u - u_l +r2*uDel - b*(u-u_l);
        
        % Set the edges to zero
        u_n([1 end], :) = 0;
        u_n(:, [1 end]) = 0;
        
        % Adjust u variable for next time step
        u_l=u;
        u=u_n;
    end
end
