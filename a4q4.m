%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 4
%Question 4

f_der1 = @(x, h) (sinh(x+h) - sinh(x-h))./(2*h); %method 1
f_der2 = @(x, h) (-sinh(x+2*h) + 8*sinh(x+h) - 8*sinh(x-h) + sinh(x-2*h))./(12*h);%method 2

fprintf('\nf''(0.400) using formula 1 = %d\n', f_der1(0.400,0.001));
fprintf('f''(0.400) using formula 2 = %d\n\n', f_der2(0.400,0.001));

%The second approximation is more accurate in this case.
fprintf('The value obtained using the second formula is more accurate in this case.');