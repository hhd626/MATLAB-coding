clc 
clear all
tspan = [0 2];
N = 500;

x_init = 0;
dxdt_init = 0;
V_init = 0;

% noise = noise_rand(tspan, N);
noise =harmonic_sin(tspan, N);
[t,y] = ode45(@(t,y) eq1(t, y, noise), noise(:,1),[x_init dxdt_init V_init]);
figure(1)
hold on
plot(t,y(:,1),'-')
xlabel('Time(s)')
ylabel('Displacement(m)')
figure(2)
hold on
plot(t,y(:,3),'--')
xlabel('Time(s)')
ylabel('Voltage(V)')
figure(3)
hold on
plot(y(:,1),y(:,2),'--')
xlabel('Displacement')
ylabel('Velocity')