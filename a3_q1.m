%Advaith Krishna A
%Roll No. 200122004
%MA311M - Assignment 3

%Question 1
format long
x = [0 0.5 1.0]; %nodes
y = [erf(0) erf(0.5) erf(1.0)];

syms v
poly = 0;

for i = 1:length(x) %lagrange interpolation
    l = 1;
    for j = 1:length(x)
        if i ~= j
            l = l * ((v-x(j))/(x(i)-x(j)));
        end
    end
    poly = poly + l*y(i); %formula for quadratic interpolating polynomial
end

X = linspace(0,1,11); %given data
F = erf(X); %error function
P = subs(poly, v, X);

plot(X,F, 'b', X, P, 'r', x, y, 'ko','LineWidth',1) %plotting the polynomial
legend('F(x)', 'P(x)','Nodes')

%From the plot, it was observed that the interpolating polynomial has a
%satisfiable accuracy

