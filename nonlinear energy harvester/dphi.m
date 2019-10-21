function ret=dphi(x,L,n_mode) % Mode function
%% Parameters for fixed-free vibration, first mode
% substrate properties
% syms x
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
% y=@(kL)(A*m_a*k^4*(sin(kL)-sinh(kL)))/m-A*k^3*(cos(kL)+cosh(kL))-A*m_a*k^4*(sin(kL)+sinh(kL))*(cos(kL)-cosh(kL))/(m*(cos(kL)+cosh(kL)))-A*k^3*(sin(kL)+sinh(kL))*(sin(kL)-sinh(kL))/((cos(kL)+cosh(kL)));
% [kL,fval]=fsolve(y,50);
% B=-A*(sin(kL)+sinh(kL))/(cos(kL)+cosh(kL));
% l_l=kL(n_mode);
y=@(k)(A*m_a*k^4*(sin(k*L)-sinh(k*L)))/m-A*k^3*(cos(k*L)+cosh(k*L))-A*m_a*k^4*(sin(k*L)+sinh(k*L))*(cos(k*L)-cosh(k*L))/(m*(cos(k*L)+cosh(k*L)))-A*k^3*(sin(k*L)+sinh(k*L))*(sin(k*L)-sinh(k*L))/((cos(k*L)+cosh(k*L)));
[k,fval]=fsolve(y,50);
B=-A*(sin(k*L)+sinh(k*L))/(cos(k*L)+cosh(k*L));
l_l=L*k(n_mode);
phase=l_l*x/L;
% ret1=A*(sin(phase)-sinh(phase))+B*(cos(phase)-cosh(phase));
% ret = diff(ret1,x,1);
ret=(1601605815862200625*cos((1601605815862200625*x)/77616724827963392))/77616724827963392 - (1601605815862200625*cosh((1601605815862200625*x)/77616724827963392))/77616724827963392 - (7779073339220512653513257146809375*sin((1601605815862200625*x)/77616724827963392))/349554653012934257462715908882432 - (7779073339220512653513257146809375*sinh((1601605815862200625*x)/77616724827963392))/349554653012934257462715908882432;
end