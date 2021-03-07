clear all, close all
x = [0,0.5,1,1.5,2,2.99,3];
y = [0,0.52,1.09,1.75,2.45,3.5,4];
t = 0:0.01:3;
hold on
plot(x,y,'*')

% Minstakvadrat
z = x;
w = x.^2;
A = [z' w'];
b = A\y';

% Alternativ MK-lösning
% A = zeros(7,2);
% for row=1:size(A, 1)
%     A(row, 1) = x(row);
%     A(row, 2) = x(row)^2;
% end
% b = A \ y';  % Mk lösningen koefficienter
 
plot(t,t*b(1) + t.^2*b(2))
 
%Linjär interpolation
plot(t,interp1(x,y,t))
 
%Polynom interpolation
X = zeros(7,7);
X(:,1) = ones(7,1); % Vandermonede-matrisen
for i=1:7
    for j=2:7
        X(i,j) = x(i)^(j-1);
    end
end

a = X \ y'; % koefficienter till interpolation
plot(t, a(1) + t*a(2) + t.^2*a(3) + t.^3*a(4) + t.^4*a(5) + t.^5*a(6) + t.^6*a(7))
 
hold off