N = 100;
dim_max = 100;
val_2d = pris_regnbagsoption(N,2);
vals_higher_d = zeros(1,N);

for dim=1:dim_max
    vals_higher_d(dim) = pris_regnbagsoption(N, dim);
end

beraknings_fel = abs(vals_higher_d - val_2d);
dim = 1:dim_max;

figure
plot(dim,beraknings_fel)
xlabel('Dimension')
ylabel('Beräkningsfel')
title('Beräkningsfel för priset på regnbågsoptioner i en given dimension')

