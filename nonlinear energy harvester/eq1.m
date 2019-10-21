function dy = eq1(t, y, noise) %y(2)=dy1 
  % Material properties
% substrate properties
L=55.15e-3;
b=6.2e-3;
h_s=0.1e-3;
rho_s=1290;
E_s=2.41e9;
% piezoelectric properties
h_p=0.254e-3;
rho_p=7700;
E_p=63e9;
d_31=-285e-12;
e_31=d_31*E_p;
eps_0=8.854e-12;
eps_33=3200*eps_0;
% End magnet properties;
m_a=5.3e-3;
% damping ratio
Zeta_m=0.01;
%load resistancs
RL = 100e6;
% mass per length
rho_l=[rho_s rho_p];
h_l=[h_s 2*h_p];
m=rho_l*h_l'*b;
% moment of inertia
I_s=1/12*b*h_s^3;
I_p=1/12*(4*h_p^2+6*h_p*h_s+3*h_s^2);
I_l=[I_s I_p];
%EI
EI_s=E_s*I_s;
EI_p=2*E_p*I_p;
EI_l=[EI_s EI_p];
%mass matrix no tip mass
xstep=L/500;
x=0:xstep:L;
MM=zeros(1);
p1=phi(x,L,1);
mm=p1*p1';
MM(1,1)=b*xstep*h_l*rho_l'*mm;
% stiffness matrix no tip mass
KK=zeros(1);
ddp1=ddphi(x,L,1);
kk=ddp1*ddp1';
KK(1,1)=EI_l*I_l'*kk*xstep;
% apply mode expansion method to get actual mode shape
[V,D]=eig(inv(MM)*KK);
[om_n,i_om]=sort(sqrt(diag(D)));
%mode shape coefficient
C(1)=V(1,i_om(1));
% actual mode shape
Tsi=C(1)*p1;
ddTsi=C(1)*ddp1;
p2=phi(L,L,1);
Tsi2=C(1)*p2;
dp2=dphi(L,L,1);
dTsi2=C(1)*dp2;
% re-calculate using the mode found with the mode expansion method
%mass matrix with tip mass
M=b*xstep*h_l*rho_l'*Tsi*Tsi'+m_a*Tsi2*Tsi2';
%stiffness matrix with tip mass
K=EI_l*I_l'*ddTsi*ddTsi'*xstep;
% coulping coefficient
Theta=1/2*e_31*b*(h_s+h_p)*dTsi2;
%capacitance 
Cp=eps_33*b*L/h_p;
% base excitation coefficient
Tau=m*sum(Tsi)*xstep+m_a*Tsi2;
%natural frequency
om_1=sqrt(K/M);
%damping coefficient
Zeta=2*Zeta_m*om_1*Tsi*Tsi'*xstep;
% set the equation of motion 
dy = zeros(3, 1);
dy(1) = y(2);
dy(2) = (-dU_dx(y(1)) -K*y(1)- Zeta*y(2) + Theta*y(3) + Tau*interp1(noise(:,1), noise(:,2), t,'nearest'))/M;
dy(3) = -2*Theta/Cp*y(2) +2*y(3)/RL*Cp;
end