T = 1;
sigma = 0.2;
K = 1.22;

s2 = 10*K; % en storleksordning st�rre anses vara mycket st�rre% 100% upp s�tts som max ty 2 ggr l�senpriset %% eventuellt s� ska det bara vara stor enligt randv�rde som �r givet
s1 = 0;   % priset noll som undre gr�ns
M = 100;
delta_s = (s2 -s1) / M;

N = 10000;
delta_t = (T-0) / N;


% l�s som VLE, dela in i delta_s och skriv om med finit diff metod och l�s
% med euler f�r t
% BV f(s,T) = max(K-s,0) --> kan l�sa med bakot euler n�r vi skrivit om med
% finit diff metod.

% f(0,t), f(alfa*K,t) �r randv�rden i s-led

A = zeros(M-1,M-1);
b = zeros(M-1,1); 
b(1,1) = -K*(sigma^2)/2;
A(M-1,M-1) = -2*(M-1)^2;

for i=1:M-2 % Matris f�r diskretisering i s-led.
    A(i,i) = (i^2)*-2;
    A(i,i+1) = i^2;
    A(i+1,i) = (i+1)^2;
end

% f(s,T) = max(s_i-K, 0) �r initialv�rde i tid
f = zeros(M-1,1);
for i=1:M-1
    f(i) = max(K - i*delta_s, 0);
end  

% L�ser df/dt = -0.5*sigma^2Af + b mha. bak�t Euler omskrivet: 
% y_n = y_n+1 - h*f(t_n+1,y_n+1)

st_mat = zeros(M-1,N+1); % rad �r aktiepris s_i, kolumn �r tiden t_i
st_mat(:,N+1) = f;
for i=N-1:-1:0  % Vi ittererar �ver tidssteg
    step = delta_t*(((-sigma^2)/2)*A*f + b);
    f = f - step; % Detta blir kolumn med alla olika s_i f�r given tid
    st_mat(:,i+1) = f;
end   

bv_1 = K * ones(1,N+1);
bv_2 = zeros(1,N+1);
st_mat = [bv_1; st_mat; bv_2]; % L�gger till randdata
f_K0 = st_mat(11,:)'; % Kolla s� att 10*delta_s = K ifall N,M �ndrat

t = 0:delta_t:1;

% Plottar l�sningskurvor f�r givet diskretiserat aktiepris f�r atta tider

figure
plot(t,st_mat(3,:))
xlabel('Tid')
ylabel('V�rdet p� optionen')
title({'L�sningen till Black-Scholes ekvatoin f�r aktiepriset 0.3K d�';'vi har 1000 interval i tiden fr�n noll till ett och 100';'diskretiserade aktiepris fr�n till 10K'})

figure
plot(t,st_mat(8,:))
xlabel('Tid')
ylabel('V�rdet p� optionen')
title({'L�sningen till Black-Scholes ekvatoin f�r aktiepriset 0.8K d�';'vi har 1000 interval i tiden fr�n noll till ett och 100';'diskretiserade aktiepris fr�n till 10K'})

figure
plot(t,st_mat(10,:))
xlabel('Tid')
ylabel('V�rdet p� optionen')
title({'L�sningen till Black-Scholes ekvatoin f�r aktiepriset K d�';'vi har 1000 interval i tiden fr�n noll till ett och 100';'diskretiserade aktiepris fr�n till 10K'})

figure
plot(t,st_mat(15,:))
xlabel('Tid')
ylabel('V�rdet p� optionen')
title({'L�sningen till Black-Scholes ekvatoin f�r aktiepriset 1.5K d�';'vi har 1000 interval i tiden fr�n noll till ett och 100';'diskretiserade aktiepris fr�n till 10K'})

figure
plot(t,st_mat(50,:))
xlabel('Tid')
ylabel('V�rdet p� optionen')
title({'L�sningen till Black-Scholes ekvatoin f�r aktiepriset 5K d�';'vi har 1000 interval i tiden fr�n noll till ett och 100';'diskretiserade aktiepris fr�n till 10K'})

figure
plot(t,st_mat(90,:))
xlabel('Tid')
ylabel('V�rdet p� optionen')
title({'L�sningen till Black-Scholes ekvatoin f�r aktiepriset 90K d�';'vi har 1000 interval i tiden fr�n noll till ett och 100';'diskretiserade aktiepris fr�n till 10K'})