function [value] = MonteCarloro_ratt(N)
    f = @(x) (1+x)^(-1/2);
    sv = rand(1,N);
    value = 0;
    for i=1:N
        value = value + f(sv(i));
    end
    
    value = value/N;
end