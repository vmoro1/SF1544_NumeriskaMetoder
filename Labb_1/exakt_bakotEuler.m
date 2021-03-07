d = 75;
v_max = 25;
M = 10;
g_x = 5;
x_0 = [];
t0 = 0;
t1 = 40;
N = 400;
h = (t1-t0)/N;

x = zeros(1,M);
for i=1:M
    x(i) = d*i;
end

for n=1:N-1
    x(10) = x(10) + h*5;    
    for i=M-1:-1:1
        x(i) = (3*x(i) + h*x(i+1)) / (3+h);
    end   
end

x1_exakt = x(1);
difference = zeros(1,100);
J = zeros(1,100);
for j=1:20
    x_BE = bakotEuler_funktion(j);
    x_BE_1 = x_BE(1);
    difference(j) = abs(x1_exakt - x_BE_1);
    J(j) = j;
end

semilogy(J,difference)