function expected_val = pris_regnbagsoption(N, dim)
%     N = 100;
    sigma = 0.2;
    T = 1;
    K = 1.22;
    s = K;
%     dim = 5;
    olika_S = zeros(1,dim);

    S = @(W) (exp(((-(sigma^2)*T)/2)+sigma*W))*s;
    expected_val = 0;

    for i=1:N
        sv = normrnd(0,T,1,dim);
        for j=1:dim
            olika_S(j) = S(sv(j));
        end
        S_max = max(olika_S);      
        expected_val = expected_val + max(S_max-K,0);
    end

    expected_val = expected_val / N;
end