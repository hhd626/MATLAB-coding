clc 
clear all
tspan = [0 2];
N=4000;

x_init = 0;
dxdt_init = 0;


noise = harmonic_cos(tspan,N);
[t,z] = ode45(@(t,z) eq1(t, z, noise), noise(:,1),[x_init dxdt_init]);
subplot(2,2,1)
plot(noise(:,1),noise(:,2))
xlabel('Time(s)')
ylabel('Input signal(m)')
axis([0 0.1 -5 5]);
title('(a).Input force')
subplot(2,2,2)
hold on
plot(t,z(:,1),'-')
xlabel('Time(s)')
ylabel('Displacement(m)')
title('(b).Displacement output')
subplot(2,2,3)
hold on
plot(t,z(:,2),'--')
xlabel('Time(s)')
ylabel('Velocity(m/s)')
title('(c).Velocity output')
fs=(N-1)/2;  % sampling frequency
df=fs/(N-1); % resolution
f=(0:N-1)*df; % each frequancy for all sampling 
Y=fft(z(:,1));
% Y=fft(noise(:,2),N);
% Y=fftshift(Y);
mag=abs(Y);
% f=(0:length(Y)-1)'*fs/length(Y);
subplot(2,2,4)
hold on
plot(f(1:N/2),mag(1:N/2)/N*2);
xlabel('Frequency(Hz)')
ylabel('FFT module magnitude')
title('(c).Frequency spectrum')
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
