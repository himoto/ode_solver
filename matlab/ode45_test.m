clear all;
close all;

% Initial condition
y0 = zeros(2,1);

y0(1) = 10.0;
y0(2) = 5.0;

% Simulation
options = odeset('RelTol',1e-9,'AbsTol',1e-9);
[T,Y] = ode45(@diffeq,[0.0 15.0],y0,options);

% Visualization
hold on;
plot(T,Y(:,1),'-','LineWidth',2);
plot(T,Y(:,2),'-','LineWidth',2);
xlabel('Time');
ylabel('Population');
legend('Rabbits','Foxes');
hold off;
box on;