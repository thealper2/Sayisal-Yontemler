%Inputs
clc % -> Ekran temizlenir
fprintf('               f(xn)\n');    % Kullaniciya Newton - Rahpson
fprintf('x(n+1) = xn - -------\n');   % formulu gosterilir.
fprintf('               f''(xn)\n\n') % 

syms f(x); % Sembolik f(x) fonksiyonu tanimlanir.
f(x) = input('Fonksiyonu girin: '); % Fonksiyon
ft = diff(f, x); % diff() fonksiyonu ile Sembolik Fonksiyonun turevi alinir.
e = input('Hata payini girin: '); % Hata Payi
x0 = input('Baslangic noktasini girin: '); % Baslangic Noktasi
n = input('Iterasyon sayisini girin: '); % Iterasyon Sayisi

%Variables
x = zeros(1);  % -> xn Array
x1 = zeros(1); % -> xn+1 Array
err = zeros(1); % -> Error Array
clc % Ekran temizlenir.
fprintf(['Soru: Newton-Raphson Metodunu \n' ...
    'kullanarak %s denkleminin \n' ...
    '%f hatadan daha az olacak bicimde yaklasik bir \n' ...
    'kokunu bulunuz. Baslangic noktasi olarak x0 = %.2f \n' ...
    'kullaniniz. \n\n'], char(f), e, x0);
% Kullanicinin girdigi degerler toplanarak bir soru haline getirilir.
fprintf('Iterasyon   xn        err(i)\n'); % Tablo sutun adlari

%Newton-Raphson Method
x(1) = x0; % Baslangic degeri xn dizisinin ilk elemenanina atilir.
if ft(x0) ~= 0 % Taban 0 oldugu zaman tanimsiz olacagi icin, kontrol edilir.
    for i=1:n % Girilen iterasyon sayisi kadar islem yapilir.
       x1(i) = x(i) - f(x(i)) / ft(x(i)); % Newton Raphson Formulu
       err(i) = abs((x1(i) - x(i)) / x1(i)) * 100; % Hata Hesaplanir
       fprintf('%5d %10.4f %10.2f%% \n', [i x1(i) err(i)]); % Tablo satiri yazilir.
       if abs(x1(i) - x(i)) < e % Elde edilen hata ile girilen hata payi karsilastirilir.
           fprintf('\nYaklasik kok: %.4f\n', x1(i)); % Son iterasyon bizim yaklasik kokumuzdur.
           break
       end

       if ft(x1(i)) == 0 % 30. satirdaki kontrolu donguye girdikten sonra tekrar kontrol ederiz.
           break;
       end
       x(i+1) = x1(i); % xn <- xn+1
    end
    pause; % Grafikleri gormek icin bir tusa basmasi istenir.
    %Graphics
    subplot(1,3,1); % 1 satir 3 sutunluk bir grafik tablosunun 1. grafigi
    fplot(f); % Symbolic - Plot
    grid on; % Kareleri goster
    title('Girdi Denklem Grafigi'); % Grafik adi
    xlabel('x degeri'); % x sutunu adi
    ylabel('y degeri'); % y sutunu adi
    subplot(1,3,2); % 1 satir 3 sutunluk bir grafik tablosunun 2. grafigi
    plot(x1, '-ks', 'LineWidth', 3, 'MarkerSize', 10, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'b');
    grid on; % Kareleri goster
    title('Tahmini Kok Tablosu'); % Grafik adi
    xlabel('iterasyon sayisi'); % x sutunu adi
    ylabel('tahmini kok'); % y sutunu adi
    subplot(1,3,3); % 1 satir 3 sutunluk bir grafik tablosunun 3. grafigi
    plot(err, ':ko', 'LineWidth', 3, 'MarkerSize', 5, 'MarkerEdgeColor', 'g', 'MarkerFaceColor', 'w');
    grid on; % Kareleri goster
    title('Hata Tablosu'); % Grafik adi
    xlabel('iterasyon sayisi'); % x sutunu adi
    ylabel('hata olcumu'); % y sutunu adi
    set(gcf, 'Position', get(0, 'Screensize')); % Grafik goruntusunu tam ekran yap.
end
clear % Bellekteki degiskenleri temizle