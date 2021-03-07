% M fixeras till 100, N varierar från 100 till 2000 och vi beräknar optionens 
%värde för det 51:a aktiepriset. Detta jämförs sedan beroende på värdet på N.

[pris_maxN, ~] = BlackScholes_funk(100,1000);
fel_M_fix = zeros(1,181);
j=1;
for N=100:5:1000
    [val, ~] = BlackScholes_funk(100,N);
    fel_M_fix(j) = abs(val - pris_maxN);
    j = j+1;
end
    

% N fixeras till 1000 och M varierar mellan 50 0ch 500.(Väljer M på detta
% sätt för stabilitet). Sedan jämförs optionsvärdet för M/2 + 1 där M/2
% avrundas nedåt.

[~, pris_maxM] = BlackScholes_funk(100,1000);
fel_N_fix = zeros(1,51);
k=1;
for M=50:100
    [~, value] = BlackScholes_funk(M,1000);
    fel_N_fix(k) = abs(pris_maxM - value);
    k=k+1;
end

N=100:5:1000;
M=50:1:100;

figure
plot(N,fel_M_fix)
xlabel('N')
ylabel('Fel')
title({'Det relativa felet för ett fixt M som i detta fall väljs till'; '100 där antalet tidsinterval varierar mellan 100 och 1000'})

figure
plot(M,fel_N_fix) 
xlabel('M')
ylabel('Fel')
title({'Det relativa felet för ett fixt N som i detta fall väljs till'; '1000 där aktieprises disktretiseras i 50 bitar upp till 100 bitar'})
