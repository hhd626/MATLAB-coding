function ret=phi(x,L,n_mode) % Mode function
%% Parameters for fixed-free vibration, first mode
% substrate properties
% L=55.15e-3;
b=6.2e-3;
h_s=0.1e-3;
rho_s=1290;
E_s=2.41e9;
% piezoelectric properties
h_p=0.254e-3;
rho_p=7700;
% End magnet properties;
m_a=5.3e-3;
A=1;
m=(rho_s*h_s+2*rho_p*h_p)*b;
% k=linspace(0,50,500);
% y=(A*m_a*k.^4*(sin(k.*L)-sinh(k.*L)))/m-A*k.^3*(cos(k.*L)+cosh(k.*L))-k.^4*A*m_a*(sin(k.*L)+sinh(k.*L)).*(cos(k.*L)-cosh(k.*L))/(m*(cos(k.*L)+cosh(k.*L)))-A*k.^3*(sin(k.*L)+sinh(k.*L)).*(sin(k.*L)-sinh(k.*L))/((cos(k.*L)+cosh(k.*L)));
% plot(k,y)
y=@(k)(A*m_a*k^4*(sin(k*L)-sinh(k*L)))/m-A*k^3*(cos(k*L)+cosh(k*L))-A*m_a*k^4*(sin(k*L)+sinh(k*L))*(cos(k*L)-cosh(k*L))/(m*(cos(k*L)+cosh(k*L)))-A*k^3*(sin(k*L)+sinh(k*L))*(sin(k*L)-sinh(k*L))/((cos(k*L)+cosh(k*L)));
[k,fval]=fsolve(y,50);
B=-A*(sin(k*L)+sinh(k*L))/(cos(k*L)+cosh(k*L));
l_l=L*k(n_mode);
phase=l_l*x/L;
ret = A*(sin(phase)-sinh(phase))+B*(cos(phase)-cosh(phase));
end