function x_final = bakotEuler_funktion(J)
    d = 75;
    v_max = 25;
    M = 10;
    g_x = 5;
    t0 = 0;
    t1 = 40;
    N = 400;
    h = (t1-t0)/N;

    x = zeros(1,M);
    for i=1:M
        x(i) = d*i;
    end

    for n=1:N-1
        x(10) = x(10) + h*g_x;
        for i=M-1:-1:1
            current_x = x;
            for j=1:J         
                x_est = x(i) + h*funktion(current_x(i+1)-current_x(i));
                current_x(i) = x_est;           
            end
            x(i) = x_est;
        end
    end
    x_final = x;
end