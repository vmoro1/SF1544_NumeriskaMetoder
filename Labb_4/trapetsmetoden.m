function [value] = trapetsmetoden(N) 

    f = @(x) (1+x)^(-1/2);
    h = 1/N;
    value = 0;
    
    for i=1:N
        y_left = f((i-1)*h);
        y_right = f(i*h);
        value = value + h*(y_left + y_right)/2;
    end
end
