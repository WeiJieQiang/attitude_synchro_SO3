
% simulation file 
% Attitude Synchronization problem using axis-angle representation
% Problem 1
% Fixed topology+control protocol 1 in Thunberg 2014.

clc
clear
close all

%%%%%%%%%%%%%%%%%
% n: number of agents
% kp: controller gain
% B, L: incidence matrix, Laplacian matrix.
global n B L tspan percent percenti 
n = 3; 

percent=0;
percenti=0;

% 
B = [1 0;-1 1;0 -1];
L = B*B';


% initial rotation
scale = 0.83; % to scale the initial condition
r = 1.2*pi;      % the radius of initial geodesic ball
for i=1:n   
    initial_angle = -r;% + 2*r*rand(1); %(-r,r)
    initial_axis = -1+2*rand(3,1);
    if norm(initial_axis)~=0
        initial_axis = initial_axis/norm(initial_axis);
    end
    initial_x(3*i-2:3*i,1) = initial_angle * initial_axis;
end
initial_x = scale* initial_x;

%Use ode45/ode23s to calculate the state
tspan = 8;
options = odeset('RelTol',1e-4,'AbsTol',1e-4);
[time,X] = ode45(@closedloop_sys,[0 tspan],initial_x, options);

figure,
plot(time, X)


figure,
for j=1:n 
    temp1=((j-1)*3)+1;
    temp2=((j-1)*3)+2;
    temp3=(j*3);
plot3( X(1:size(time),temp1),X(1:size(time),temp2),X(1:size(time),temp3))
hold on;
end 
% hold on;
% [x,y,z] = sphere;
% surf(x*pi, y*pi, z*pi);
% axis square;



