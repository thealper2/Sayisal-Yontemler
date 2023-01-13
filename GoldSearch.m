clc;
clear;
f = @(x) x.^2 - 6*x + 15;
x = 0:5;
y = f(x);
R = 0.61803; % (sqrt(5) - 1) / 2

plot(x, y); % Fonksiyon Grafigi
title('Fonksiyon Grafigi');
xlabel('X Degeri');
ylabel('Y Degeri');
grid on; 
pause;

xL  = input("xL degeri : ");
xU  = input("xU degeri : ");
itr = input("Iterasyon sayisi : ");
clc;
fprintf('Tur Iterasyon Tahmin    Hata\n');
%Maximum Konum
d = R * (xU - xL);
x1 = xL + d;
x2 = xU - d;
for i=1:itr
    if(f(x1) > f(x2))
        xL = x2;
        d = R * (xU - xL);
        x2 = x1;
        x1 = xL + d;
        xr = x1;
    else
        xU = x1;
        x1 = x2;
        d = R * (xU - xL);
        x2 = xU - d; 
        xr = x2;
    end
    hata = abs(((xr - xL) / xr)) * 100;  
    fprintf('max    %d      %.4f   %.4f\n', [i xr hata]);
end

plot(x, y, xr, f(xr), 'ok', 'LineWidth, 2');
title('Max Grafik');
xlabel('X Degeri');
ylabel('Y Degeri');
grid on ;
pause;

%Minimum Konum
d = R * (xU - xL);
x1 = xL + d;
x2 = xU - d;

for i=1:itr
    if(f(x1) < f(x2))
        xL = x2;
        x2 = x1;
        d = R * (xU - xL);
        x1 = xL + d;
        xr = x1;
    else
        xU = x1;
        x1 = x2;
        d = R * (xU - xL);
        x2 = xU - d; 
        xr = x2;
    end
    hata = abs(((xr - xL) / xr))*100;
    
    fprintf('min    %d      %.4f   %.4f\n', [i xr hata]);
end

plot(x, y, xr, f(xr), 'ok', 'LineWidth', 2);
title('Min Grafik');
xlabel('X Degeri');
ylabel('Y Degeri');
grid on; 