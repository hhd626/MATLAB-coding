function dzdt = eq1(t, z,input)
   global k d kapa lamga 
    dzdt = zeros(3, 1);
    dzdt(1) = z(2);
    dzdt(2) = -2*k*z(2)+z(1)*(1-z(1)^2)/2+d*z(3)+interp1(input(:,1), input(:,2), t,'nearest');
    dzdt(3) = -lamga*z(3)-kapa*z(2);
end