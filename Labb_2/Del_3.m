clear all, close all
x = [150,200,300,500,1000,2000];
y = [2,3,4,5,6,7];
t = 150:1:2000;
% Modellfunktion (6)
hold on
plot(x,y,'*')

% Minstakvadrat
z = [8,8,8,8,8,8];
w = [1,1,1,1,1,1];
A = [w' log(x)'];
b = A\log(z-y)';

plot(t, 8-exp(b(1))*t.^b(2), 'r')

% Gauss-Newton
alpha_tilde = [150 200 300 500 1000 2000 inf];
U = [2 3 4 5 6 7 8];
 
syms a b
 
f = sym(zeros(7, 1));
for i=1:7
	f(i,1) = 8 - a*(alpha_tilde(i)^b) - U(i);
end
 
J = jacobian(f', [a, b]);
 
x_0 = [150, -0.6]; % Vi gissar på MK-skattningen då den bör ligga nära
steps = 100;
current_x = x_0;
k = [];
 
for i=1:steps
    J_current_x = subs(J, [a, b], current_x);
	f_current = subs(f, [a, b], current_x);
	h = eval(J_current_x) \ eval(f_current);
	k = current_x' - h;
	current_x = k';	
end

plot(t, 8-k(1)*t.^k(2), 'b')

% Modellfunktion (5)
B = (1./x)';
a = B\(1./y - 1./z)';
plot(t, 1./(1/8 + a./t), 'g')

hold off