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
error = [];
for n=1:N-1
    x(10) = x(10) + h*g_x;
    for i=M-1:-1:1
        current_x = x;
        for j=1:10         
            x_est = x(i) + h*funktion(current_x(i+1)-current_x(i));
%             format long
%             error = [error abs(current_x(i) - x_est)];
            current_x(i) = x_est;           
        end
        x(i) = x_est;
    end
    X(n+1,:) = x;
end

tid = t0:h:t1-h;
plot(tid, X)