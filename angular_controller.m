
% input : the rotation of all agents at time t
% ouput: the anguler velocity of each agent at time t

function W = angular_controller(t,X)

    global n L B

    
    W = zeros(3*n,1);

% With Laplacian matrix and fixed topology. 
    %W = -sign(kron(L,eye(3))*X);
    W = -kron(B, eye(3))*sign(kron(B',eye(3))*X);
%     W(1:n) = -kron(L(1,:),eye(3))*X;
%     W(n+1:2*n) = -(kron(L(2,:),eye(3))*X)/norm(kron(L(2,:),eye(3))*X);
%     W(2*n+1:3*n) = -(kron(L(3,:),eye(3))*X)/norm(kron(L(3,:),eye(3))*X);
end