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

X = zeros(N,M);
X(1,:) = x;
for n=1:N-1
    for i=1:M-1
        x(i) = x(i) + h*funktion(x(i+1)-x(i));
    end   
    x(10) = x(10) + h*5;
    X(n+1,:) = x;
end

for n=1:N
    plot(X(n,:),zeros(1,M),'r*');
    axis([0 1000 -1 1])
    drawnow
    pause(h)
end

tid = t0:h:t1-h;
plot(tid, X)