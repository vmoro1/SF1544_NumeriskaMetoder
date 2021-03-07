N=100;
correct_val = 2*(sqrt(2)-1);
trapets = zeros(1,N);
MC = zeros(1,N);

for i=1:N
    trapets(i) = trapetsmetoden(i);
    MC(i) = MonteCarloro_ratt(i);
end

fel_trapets = abs(trapets - correct_val);
fel_MC = abs(MC-correct_val);
% y = 1:N;
% plot(fel_trapets, y)

ber_trapets = ones(1,N)./(fel_trapets.^0.5);
ber_MC = ones(1,N)./(fel_trapets.^2);


figure
plot(fel_trapets, ber_trapets)
ylabel('Beräkningsarbete')
xlabel('Fel')
title('Beräkningsarbete för ett givet fel vid integration med trapetsmetoden')

figure
plot(fel_MC, ber_MC)
ylabel('Beräkningsarbete')
xlabel('Fel')
title('Beräkningsarbete för ett givet fel vid integration med Monte Carlo-metoden')