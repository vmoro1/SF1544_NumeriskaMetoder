function  expected_val = pris_option(N)   
%     N = 100;
    sigma = 0.2;
    T = 1;
    K = 1.22;
    s = K;

    S = @(W) (exp(((-(sigma^2)*T)/2)+sigma*W))*s;
    sv = normrnd(0,1,1,N);
    expected_val = 0;

    for i=1:N
        expected_val = expected_val + max(S(sv(i))-K,0);
    end

    expected_val = expected_val / N;
end