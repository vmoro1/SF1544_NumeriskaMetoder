d=75;
x_values = zeros(1,1+(d+20)/0.1);
y_values = zeros(1,1+(d+20)/0.1);

x=-10;
i=1;
while x<=d+10
  x_values(i)=x; 
  y_values(i)=funktion(x);
  x = x + 0.1;
  i = i + 1;
end

plot(x_values,y_values)