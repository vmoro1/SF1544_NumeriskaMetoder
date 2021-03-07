T = 1;
sigma = 0.2;
K = 1.22;

s2 = 10*K; % en storleksordning större anses vara mycket större% 100% upp sätts som max ty 2 ggr lösenpriset %% eventuellt så ska det bara vara stor enligt randvärde som är givet
s1 = 0;   % priset noll som undre gräns
M = 100;
delta_s = (s2 -s1) / M;

N = 10000;
delta_t = (T-0) / N;


% lös som VLE, dela in i delta_s och skriv om med finit diff metod och lös
% med euler för t
% BV f(s,T) = max(K-s,0) --> kan lösa med bakot euler när vi skrivit om med
% finit diff metod.

% f(0,t), f(alfa*K,t) är randvärden i s-led

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
f_K0 = st_mat(11,:)'; % Kolla så att 10*delta_s = K ifall N,M ändrat

t = 0:delta_t:1;

% Plottar lösningskurvor för givet diskretiserat aktiepris för atta tider

figure
plot(t,st_mat(3,:))
xlabel('Tid')
ylabel('Värdet på optionen')
title({'Lösningen till Black-Scholes ekvatoin för aktiepriset 0.3K då';'vi har 1000 interval i tiden från noll till ett och 100';'diskretiserade aktiepris från till 10K'})

figure
plot(t,st_mat(8,:))
xlabel('Tid')
ylabel('Värdet på optionen')
title({'Lösningen till Black-Scholes ekvatoin för aktiepriset 0.8K då';'vi har 1000 interval i tiden från noll till ett och 100';'diskretiserade aktiepris från till 10K'})

figure
plot(t,st_mat(10,:))
xlabel('Tid')
ylabel('Värdet på optionen')
title({'Lösningen till Black-Scholes ekvatoin för aktiepriset K då';'vi har 1000 interval i tiden från noll till ett och 100';'diskretiserade aktiepris från till 10K'})

figure
plot(t,st_mat(15,:))
xlabel('Tid')
ylabel('Värdet på optionen')
title({'Lösningen till Black-Scholes ekvatoin för aktiepriset 1.5K då';'vi har 1000 interval i tiden från noll till ett och 100';'diskretiserade aktiepris från till 10K'})

figure
plot(t,st_mat(50,:))
xlabel('Tid')
ylabel('Värdet på optionen')
title({'Lösningen till Black-Scholes ekvatoin för aktiepriset 5K då';'vi har 1000 interval i tiden från noll till ett och 100';'diskretiserade aktiepris från till 10K'})

figure
plot(t,st_mat(90,:))
xlabel('Tid')
ylabel('Värdet på optionen')
title({'Lösningen till Black-Scholes ekvatoin för aktiepriset 90K då';'vi har 1000 interval i tiden från noll till ett och 100';'diskretiserade aktiepris från till 10K'})