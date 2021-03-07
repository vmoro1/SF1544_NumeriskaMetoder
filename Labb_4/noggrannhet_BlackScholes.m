% M fixeras till 100, N varierar fr�n 100 till 2000 och vi ber�knar optionens 
%v�rde f�r det 51:a aktiepriset. Detta j�mf�rs sedan beroende p� v�rdet p� N.

[pris_maxN, ~] = BlackScholes_funk(100,1000);
fel_M_fix = zeros(1,181);
j=1;
for N=100:5:1000
    [val, ~] = BlackScholes_funk(100,N);
    fel_M_fix(j) = abs(val - pris_maxN);
    j = j+1;
end
    

% N fixeras till 1000 och M varierar mellan 50 0ch 500.(V�ljer M p� detta
% s�tt f�r stabilitet). Sedan j�mf�rs optionsv�rdet f�r M/2 + 1 d�r M/2
% avrundas ned�t.

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
title({'Det relativa felet f�r ett fixt M som i detta fall v�ljs till'; '100 d�r antalet tidsinterval varierar mellan 100 och 1000'})

figure
plot(M,fel_N_fix) 
xlabel('M')
ylabel('Fel')
title({'Det relativa felet f�r ett fixt N som i detta fall v�ljs till'; '1000 d�r aktieprises disktretiseras i 50 bitar upp till 100 bitar'})
