%Advaith Krishna A
%Roll No. 200122004
%MA311M - Assignment 3

%Question 3

format long

%given data <---
x = zeros(1, 9);
y = zeros(1, 9);
for i = 1:9
    x(1, i) = -5 + 1.25*(i-1);
end
for i= 1:9
    y(1, i) = 1/(1+(x(1, i)).^2);
end %-->

syms v
poly = 0;

for i = 1:length(x) %lagrange interpolation
    l = 1;
    for j = 1:length(x)
        if i ~= j
            l = l * ((v-x(j))/(x(i)-x(j)));
        end
    end
    poly = poly + l*y(i); 
end

X = linspace(-5,5,1000);
P = subs(poly, v, X);
F = 1./(1+X.^2);

plot(X,F, 'b', X, P, 'r', x, y, 'ko','LineWidth',1) %plotting the polynomial
legend('F(x)', 'P(x)','Nodes')