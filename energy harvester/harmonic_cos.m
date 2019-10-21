function  rst1 = harmonic_cos(tspan,N)
          T = linspace(tspan(1), tspan(2), N)';
        
        fc=67.5;
        g=9.81;
        A=0.4*g;
        y=A*cos(2*pi*fc*T); % harmonic input frequency=67.5HZ
        rst1=[T,y];

end
