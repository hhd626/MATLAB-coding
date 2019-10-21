function dzdt = eq1(t, z, noise)
    gamma=0.016;
    m=0.0155;
    
    dzdt = zeros(2, 1);
    dzdt(1) = z(2);
    dzdt(2) = (-dU_dx(z(1)) - gamma*z(2)+interp1(noise(:,1), noise(:,2), t,'nearest'))/m;
   
end