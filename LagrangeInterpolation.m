clc;
clear;

f = @(x)log(x);
x = [1, 4];
x_ = 2;
toplam = 0;
n = 2;

for i=1:1:2
    p = f(x(i));
    for j=1:1:2
        if (i ~= j)
            p = p * (x_ - x(j)) / (x(i) - x(j));
        end
    end
    toplam = toplam + p;
end

sonuc = toplam;
disp("Sonuc: " + sonuc);
Error = abs((f(x_)-sonuc) / f(x_)) * 100;
disp("Hata: " + Error);
