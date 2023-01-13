clc;
clear;
close all;

f = @(x)log(x);
x = [1,4];
myx = 2;
sum = 0;
n = 2;

for i=1:1:2
    product = f(x(i));
    for j=1:1:2
        if (i~=j)
            product = product*(myx-x(j))/(x(i)-x(j));
        end
    end
    sum = sum + product;
end

result = sum;
disp("result: " + result);

Error = abs((f(myx)-result)/f(myx))*100;
disp("Error: " + Error);