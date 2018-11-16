
% input: 't': time; 'X': the rotations of all agents at time t
% output: 'dXdt': time derivative of the X

function dXdt = closedloop_sys(t,X)

    global n percent percenti tspan
    
%%%%%%%%%%%%%%%%%%% EXECUTION PERCENTAGE %%%%%%%%%%%%%%%%%%
    percenti=percenti+1;
if (floor(t/tspan*100))>percent
    percent = floor(t/tspan*100)
end
        
    W = angular_controller(t,X);
    dXdt = zeros(3*n,1);
    for i=1:n
        dXdt(3*i-2:3*i) = lx(X(3*i-2:3*i))*W(3*i-2:3*i);
    end
    
end

