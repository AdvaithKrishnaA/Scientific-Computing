%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 6
%Question 1

f = @(x) x.^3; %defining f(x)
x1 = 0.5857864376; %defining Gauss points x1 and x2
x2 = 3.414213562; 
w1 = 0.8535533903; %defining weights w1 and w2
w2 = 0.1464466092;

%We can check that the weights are the correct values by confirming that
%they can be used to integrate, any polynomial of degree ≤ 3 in the
%two-point Gauss quadrature rule in the given form.

%Gauss-Laguerre Approximation
G = w1 * f(x1) + w2 * f(x2);

fprintf('Approximate value of the integral = %d', G)