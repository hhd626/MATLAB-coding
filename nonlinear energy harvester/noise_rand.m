function rst = noise_rand(tspan, N)
    T = linspace(tspan(1), tspan(2), N)';
    y = randn(1,length(T))'; %random noise
    y = y - mean(y);
    y = y / std(y);
    a = 0;
    b = 0.1128;  % mean is 0, standard deviation is 0.1128
    y = a + b * y;  % random noise 
    rst = [T, y];
end