clear all;
close all;

global rabbit;
global fox;

% name2idx
rabbit = 1;
fox = 2;

% Initial condition
y0 = zeros(2,1);

y0(rabbit) = 10.0;
y0(fox) = 5.0;

% Simulation
options = odeset('RelTol',1e-9,'AbsTol',1e-9);
[T,Y] = ode45(@diffeq,[0.0 15.0],y0,options);

% Visualization
hold on;
plot(T,Y(:,rabbit),'-','LineWidth',2);
plot(T,Y(:,fox),'-','LineWidth',2);
xlabel('Time');
ylabel('Population');
legend('Rabbits','Foxes');
hold off;
box on;