clc;
clear;
A = [ 1, 2, 3; 4, 5, 6; 7, 8, 9; ];
B = [ 3; 2; 1 ];
x = [A,B];

[satir , sutun] = size(A);

for str = 1:satir-1
    x(str, :) = x(str, :) / x(str, str);
    for str2 = str+1:satir
        x(str2, :) = x(str2, :) - x(str, :) * x(str2, str);
    end
end

z = zeros(1,satir);

for str = satir:-1:1
    total = 0;
    idx = sutun;
    while(idx > str)
        total = total + x(str , idx) *z(idx);
        idx = idx-1;
    end
    if(str == satir)
        z(str) = x(str, end) / x(str, end-1);
    else
        z(str) = x(str, end) - total;
    end
end

disp(A);
disp(x);
disp(z);