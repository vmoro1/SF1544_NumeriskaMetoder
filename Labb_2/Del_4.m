N = 100; % Indelning av tidsintervallet
x_0 = 1;
X = zeros(1, N+1);  %Lagrar tapital vid tidpunkterna 0,delta_t,....,N*delta_t med given strartgissning
X(:) = x_0; % Startgissning
X_iter = zeros(1, N+1);  %Kapitalvektor som förändras under iterationen för samtliga t
lambda = zeros(1, N);  % Lagrangemultiplikatorn vid tiden delta_t,....,N*delta_t
X_iter(:) = x_0;
delta_t = 1/N; % Ty tiden är T=1

g_prim = @(x) 1/sqrt(x);
f = @(x) x;
f_prim = @(x) 1;
% f = @(x) x + (x^2)/10;
% f_prim = @(x) 1 + x/5;
% f = @(x) 1.0709*x + 0.0618*(x^2);
% f_prim = @(x) 1.0709 + 0.1236*x;

while true
    for n=N:-1:1
        if n==N
            lambda(n) = g_prim(X_iter(N+1));
        else
            lambda(n) = lambda(n+1) + delta_t*f_prim(X_iter(n))*lambda(n+1);
        end
    end
    for n=1:N
        if n==1
            X_iter(n+1) = x_0 + delta_t*(f(x_0)-lambda(2)^(-3/5));
        else
            X_iter(n+1) = X_iter(n) + delta_t*(f(X_iter(n)) - lambda(n)^(-3/5));
        end
    end
    difference = norm(X - X_iter);
    X = X_iter;
    if difference < 0.01 % Vid mindre differennser ändras ej kapitalvektorn nämnvärt
        break
    end
end

hold on
title('f(X) = X')
tid = 0:delta_t:1-delta_t;
plot(tid, X(1:N))

alfa = lambda.^(-3/5);
plot(tid_alfa, alfa)
hold off
        
