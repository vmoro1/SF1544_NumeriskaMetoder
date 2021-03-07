function [pris_fix_M, pris_fix_N] = BlackScholes_funk(M,N)
    T = 1;
    sigma = 0.2;
    K = 1.22;
    s2 = 10*K; % en storleksordning större anses vara mycket större% 100% upp sätts som max ty 2 ggr lösenpriset %% eventuellt så ska det bara vara stor enligt randvärde som är givet
    s1 = 0;   % priset noll som undre gräns
    delta_s = (s2 -s1) / M;
    
    delta_t = (T-0) / N;

    A = zeros(M-1,M-1);
    b = zeros(M-1,1); 
    b(1,1) = -K*(sigma^2)/2;
    A(M-1,M-1) = -2*(M-1)^2;

    for i=1:M-2 % Matris för diskretisering i s-led.
        A(i,i) = (i^2)*-2;
        A(i,i+1) = i^2;
        A(i+1,i) = (i+1)^2;
    end

    % f(s,T) = max(s_i-K, 0) är initialvärde i tid
    f = zeros(M-1,1);
    for i=1:M-1
        f(i) = max(K - i*delta_s, 0);
    end  

    % Löser df/dt = -0.5*sigma^2Af + b mha. bakåt Euler omskrivet: 
    % y_n = y_n+1 - h*f(t_n+1,y_n+1)

    st_mat = zeros(M-1,N+1); % rad är aktiepris s_i, kolumn är tiden t_i
    st_mat(:,N+1) = f;
    for i=N-1:-1:0  % Vi ittererar över tidssteg
        step = delta_t*(((-sigma^2)/2)*A*f + b);
        f = f - step; % Detta blir kolumn med alla olika s_i för given tid
        st_mat(:,i+1) = f;
    end   

    bv_1 = K * ones(1,N+1);
    bv_2 = zeros(1,N+1);
    st_mat = [bv_1; st_mat; bv_2]; % Lägger till randdata
    
    pris_fix_M =st_mat(51,1);
    pris_fix_N = st_mat(floor(M/2) +1,1);
end