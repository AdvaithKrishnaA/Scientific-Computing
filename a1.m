%Advaith Krishna A
%Roll No. 200122004
%Question 1 - Part 1
%Bisection Method

f = @(x) exp(-x)-sin(x); %defining a function
fplot(f); %plotting function
title('Graph of e^{-x} - sin(x)');
a = 0; %lower limit
b = 1; %upper limit
tol = 0.00001; %tolerance
c = (a+b)/2; %initial midpoint
iter = 0; %step counter

fprintf('\nIteration\tBisection Method\n');

while abs(b-a)>tol
    if (f(a)*f(c))<0
        b = c;
    else
        a = c;
    end
    iter = iter+1; %counting iterations
    c = (a+b)/2;
    fprintf('%d\t\t%d\n', iter, c);
end

%Question 1 - Part 2
%Newton-Raphson Method

f = @(x) exp(-x) - sin(x); %defining function
f_der = @(x) -exp(-x) - cos(x); %derivative

tol = 0.00001; %tolerance
xi = 0; %first approximation
iter = 0; %reset iterations to 0

fprintf('\nIteration\tNewton-Raphson Method\n');

while true
    if f_der(xi) == 0
        disp('Error: Division by zero');
        break;
    end
    xip1 = xi - (f(xi)/f_der(xi));
    err = abs(xip1-xi);
    iter = iter+1;
    fprintf('%d\t\t%d\n', iter, xip1);
    if err<tol
        break
    end
    xi = xip1;
end

%Question 2title('Graph of e^x - sin(x)');
%Fixed Point Iteration Method

f = @(x) x.^2-x-2; %defining function
g = @(x) (x+2).^0.5; %defining iteration function

x0 = 0; %starting point
tol = 0.001; %tolerance
iter = 1; %iterations

fprintf('\nx_n\t\t\tf(x_n)\t\tError\n');

while true
    xi = g(x0);
    fprintf('x_%d=%d\t%d\t%d\n', iter, xi, f(xi), abs(xi-2))
    if abs((xi - x0)/xi)<tol %condition 1
        break
    end
    if abs(f(xi))<tol %condition 2
        break
    end
    x0 = xi;
    iter = iter+1;
end