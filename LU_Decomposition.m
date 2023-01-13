clc;
clear;
A = [7, 8, 8 ; 6, 7 ,8 ; 6, 6 ,7;];
L = zeros(length(A));
U = zeros(length(A));

for j=1:length(A) 
    for i=1:length(A)
        toplam = 0;
        p = j - 1;
        
        for k=1:p
            toplam = toplam + (L(i,k) * U(k,j));
        end

        if(i == j)
            U(i, j) = 1;
        end
        
        if i >= j
            L(i, j) = A(i, j) - toplam;
        else
            U(i, j) = (1 / L(i, i)) * (A(i, j) - toplam);
        end
    end
end

disp(A);
disp(L);
disp(U);
disp(L*U);