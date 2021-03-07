function [value] = MonteCarlo_metoden(N)
    f = @(x) (1+x)^(-1/2);
    sv = rand(2,N);
    counter = 0;
    
    for i=1:N
        if sv(2,i) <= f(sv(1,i))
            counter = counter + 1;
        end
    end

    value = counter / N;
end