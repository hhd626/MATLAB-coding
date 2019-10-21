function  rst1 = harmonic_cos(tspan,N)
          T = linspace(tspan(1), tspan(2), N)';
          global f omega
          y=f*cos(omega*T); 
          rst1=[T,y];

end
