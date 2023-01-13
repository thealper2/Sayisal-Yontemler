%Inputs
clc % Ekran temizlenir.
fprintf('      a . f(b) - b . f(a) \n')  % Kullaniciya False Position
fprintf('xn = ---------------------\n'); % formulu gosterilir.
fprintf('         f(b) - f(a)\n\n');     % 
syms f(x); % Sembolik f(x) fonksiyonu tanimlanir.
f(x) = input('Fonksiyonu girin: '); % Fonksiyon
a = input('Root sol: '); % [a, b] araliginin baslangic sayisi
b = input('Root sag: '); % [a, b] araliginin bitis sayisi
n = input('Iterasyon sayisini girin:  '); % Iterasyon sayisi
e = input('Hata payini girin: '); % Hata Payi
clc % Ekran temizlenir.
fprintf(['Soru: False-Point Metodunu kullanarak %s \n' ...
    'denkleminin [%d,%d] araliginda %f hatadan daha az\n' ...
    'olacak bicimde yaklasik bir kokunu bulunuz. \n' ...
    '\n'], char(f), a, b, e);
% Kullanicinin girdigi degerler toplanarak bir soru haline getirilir.
%Variables
err = zeros(1); % -> Error Array
x1 = zeros(1); % -> xn+1 Array
fprintf('Iterasyon   x1        err(i)\n'); % Tablo sutun adlari
%False-Position Method
if f(a) * f(b) < 0 && a < b % [a, b] araliginda bir kok varsa ve a < b ise
    for i=1:n % Girilen iterasyon sayisi kadar islem yapilir.
        x1(i) = (a * f(b) - b * f(a)) / (f(b) - f(a)); % False-Position Formul
        if(i == 1)
            err(i) = 100; % Hata hesaplanir
        else
            err(i) = abs((x1(i) - x1(i-1)) / x1(i)) * 100;
        end
        fprintf('%5d %10.4f %10.2f%%\n', [i x1(i) err(i)]); % Tablo satiri yazilir.
        if abs(err(i)) < e % hata < Hata Payi
            fprintf('\nYaklasik kok: %.4f\n', x1(i)); % Son iterasyon yaklasik koktur
            break;
        end
        % Bu islemler ile koke yaklasilir.
        if f(a) * f(x1(i)) < 0 
            b = x1(i); % Yeni aralik [a, x1(i)]
        elseif f(b) * f(x1(i)) < 0
            a = x1(i); % Yeni aralik [x1(i), b]
        end
    end
    pause; % Grafikleri gormek icin bir tusa basmasi istenir.
    %Graphics
    subplot(1,3,1); % 1 satir 3 sutunluk bir grafik tablosunun 1. grafigi
    fplot(f); % Symbolic - Plot
    grid on; % Kareleri goste
    title('Girdi Denklem Grafigi'); % Grafik adi
    xlabel('x degeri'); % x sutunu adi
    ylabel('y degeri'); % y sutunu adi
    subplot(1,3,2); % 1 satir 3 sutunluk bir grafik tablosunun 2. grafigi
    plot(x1, '-ks', 'LineWidth', 3, 'MarkerSize', 10, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'b');
    grid on; % Kareleri goster
    title('Tahmini Kok Grafigi'); % Grafik adi
    xlabel('iterasyon sayisi'); % x sutun adi
    ylabel('tahmini kok'); % y sutun adi
    subplot(1,3,3); % 1 satir 3 sutunluk bir grafik tablosunun 3. grafigi
    plot(err, ':ko', 'LineWidth', 3, 'MarkerSize', 5, 'MarkerEdgeColor', 'g', 'MarkerFaceColor', 'w');
    grid on; % Kareleri goster
    title('Hata Tablosu'); % Grafik Adi
    xlabel('iterasyon sayisi'); % x sutun adi
    ylabel('hata olcumu'); % y sutun adi
    set(gcf, 'Position', get(0, 'Screensize')); % Grafikleri tam ekranda goster.
end
clear % Bellekteki degiskenleri temizle