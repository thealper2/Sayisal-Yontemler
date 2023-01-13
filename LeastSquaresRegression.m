clc;
clear;
close all;

x = [ 1 , 2 , 3 , 4 , 5 , 6 , 7 ];
y = [ 0.5, 2.5 , 2,4 , 3.5 , 6, 5.5 ];

elementNumber = numel(x);
sumOfx = sum(x);
sqrtx = sum(x.^2);
averageOfx = sumOfx / elementNumber;
sumOfy = sum(y);
averageOfy = sumOfy / elementNumber;

productOfxy = x.*y;
sumProductOfxy = sum(productOfxy);

a1 = (elementNumber * sumProductOfxy - sumOfx * sumOfy)/(elementNumber * sqrtx - (sumOfx)^2);
a0 = averageOfy - a1 * averageOfx;
y1 = a0 + a1 * x;

fprintf("Values: ");
disp(y1);

Sr = sum((y-y1).^2);
disp("Sr: " + Sr);
St = sum((y-averageOfy).^2);
disp("St: " + St);
r = sqrt((St-Sr)/St);
disp("r: " +r);