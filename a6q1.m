%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 6
%Question 1

f = @(t) sin(2*t + 2)/(t + 1); %defining function obtained by changing limits

val = (5/9) * f(-sqrt(0.6)) + (8/9) * f(0) + (5/9) * f(sqrt(0.6)); %approximation using Gauss Quadrature rule

fprintf('The approximation of the given integral using Gauss Quadrature Rule is \n= %d',val)