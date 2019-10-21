clc 
clear all
tspan = [0 5000];
N=40000;
global k d kapa lamga f omega
k=0.01;
d=0.05;
kapa=0.5;
lamga=0.05;
f=0.083;
omega=0.8;
x_init = 1;
dxdt_init = 0;
V_init = 0;

input = harmonic_cos(tspan,N);
[t1,z1] = ode45(@(t,z) eq1(t, z, input), input(:,1),[x_init dxdt_init V_init]);
[t2,z2] = ode45(@(t,z) eq2(t, z,input), input(:,1),[x_init dxdt_init V_init]);
figure(1)
plot(input(:,1),input(:,2))
xlabel('Time(s)')
ylabel('Input signal(m)')
figure(2)
hold on
plot(t1,z1(:,1),'-')
xlabel('Time(s)')
ylabel('Displacement(m)')
figure(3)
plot(t1,z2(:,1),'-')
xlabel('Time(s)')
ylabel('Displacement(m)')
xlim([0,400])
figure(4)
plot(z1(:,1),z1(:,2),'b-') %plot projection of the phas space orbit to z1-z2 plane
xlabel('displacement(m)')
ylabel('Velocity(m/s)')
hold on
 plot(z2(:,1),z2(:,2),'g--')
figure(5)
plot(t1,z1(:,3),'b-')
hold on
% figure(6)
plot(t2,z2(:,3),'g--')
xlabel('Time(s)')
ylabel('Voltage(V)')
legend('piezomagnetoelastic','piezoelastic')
% xlim([0,400]);
ylim([-2,2]);
sqrt(sum(z1(:,3).^2)/length(z1(:,3))) % get the RMS for voltage
sqrt(sum(z2(:,3).^2)/length(z2(:,3))) % get the RMS for voltage
% Multiples of 2*pi take you to the Poincare section.

% [t,z]=ode45(@(t,z) eq1(t, z, input),[0:(2/omega)*pi:(80000/omega)*pi],[x_init dxdt_init V_init]);
 [t3,z3]=ode45(@(t,z) eq1(t, z, input),[0:(2/omega)*pi:(80000/omega)*pi],[x_init dxdt_init V_init]);
% Plot the chaotic attractor.
figure(7)
plot(z3(:,1),z3(:,2),'b.')
xlabel('displacement(m)')
ylabel('Velocity(m/s)')
% fsize=15;
% axis([-2 2 -2 2])
% xlabel('x','FontSize',fsize)
% ylabel('y','FontSize',fsize)
title('Poincare Section of the Duffing System')
figure(8)
plot3(input(:,1),z1(:,2),z1(:,3),'b-')
hold on
plot3(input(:,1),z2(:,2),z2(:,3),'g--')
xlabel('Time')
xlim([0,400]);
ylabel('Velocity')
zlabel('Voltage')
legend('piezomagnetoelastic','piezoelastic')
% % fs=(N-1)/tspan(2);  % sampling frequency
% % df=fs/(N-1); % resolution
% % f1=(0:N-1)*df; % each frequancy for all sampling 
% % Y=fft(z(:,1));
% % % Y=fft(noise(:,2),N);
% % % Y=fftshift(Y);
% % mag=abs(Y);
% % % f=(0:length(Y)-1)'*fs/length(Y);
% % figure(5)
% % hold on
% % plot(f1(1:N/2),mag(1:N/2)/N*2);
% % xlabel('Frequency(Hz)')
% % ylabel('FFT module magnitude')
grid on

% n=length(z(:,1));
% Y=fft(z(:,1),n);
% Y1=fftshift(Y);
% figure(4)
% hold on
% plot(abs(Y1));
% xlabel('Frequency(Hz)')
% ylabel('FFT module magnitude')
% grid on
