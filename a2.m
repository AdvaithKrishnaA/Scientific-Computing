%Advaith Krishna A
%Roll No. 200122004
%MA311M Assignment 2

%Question 1 - Order of Convergence: Formula

p = @(eps,xi,xip1,xip2) (log10(abs((eps-xip2)/(eps-xip1))))/(log10(abs((eps-xip1)/(eps-xi))));

%Question 1 - Part 1
%Standard Newton's Formula (Newton-Raphson Method)

f = @(x) (x+1)*(x-1.1).^2; %defining the function
f_der= @(x) 3*x.^2 - 2.4*x -0.99;%derivative

tol = 1e-3; %tolerance
x0 = 1; %starting value
x1=0;
x2=0;
iter = 0; %iterations start at 0
n = 1;
o(1) = 1;

fprintf('\nIteration\tNewton-Raphson Method\n');

while true
    if f_der(x0) == 0 %condition 1
        disp('Error: Division by zero');
        break;
    end
    x1 = x0 - (f(x0)/f_der(x0)); %formula for approximation
    err = abs(x1-x0); %error
    iter = iter+1; %step counter
    x0 = x1;
    fprintf('%d\t\t%d\n', iter, x0);
    x1 = x0 - (f(x0)/f_der(x0));
    x2 = x1 - (f(x1)/f_der(x1));
    o(n) = p(1.1,x0,x1,x2);
    if err<tol %condition 2
        break
    end
    n=n+1;
end
%The Final Approximation has been stored under xi
fprintf('\nAn approximate root to ξ by using the standard Newton''s formula = %d\n',x0);

%Order of Convergence
fprintf('In this case, the Order of Convergence = %d\n',o(n-2));

%Question 1 - Part 2
%Modified Newton's Formula (Multiplicity factored in)

tol = 1e-3; %tolerance
x0 = 1; %starting value
iter = 0; %iterations start at 0
mn = 1;
or(1) = 1;
m = 2; %multiplicity
fprintf('\nIteration\tModified Newton-Raphson Method\n');

while true
    if f_der(x0) == 0 %condition 1
        disp('Error: Division by zero');
        break;
    end
    x1 = x0 - 2*(f(x0)/f_der(x0)); %formula for approximation
    err = abs(x1-x0); %error
    iter = iter+1; %step counter
    x0 = x1;
    fprintf('%d\t\t%d\n', iter, x0);
    x1 = x0 - 2*(f(x0)/f_der(x0));
    x2 = x1 - 2*(f(x1)/f_der(x1));
    or(mn) = p(1.1,x0,x1,x2);
    if err<tol %condition 2
        break
    end
    mn=mn+1;
end
%The Final Approximation has been stored under xi
fprintf('\nAn approximate root to ξ by using the standard Newton''s formula = %d\n',x0);

%Order of Convergence
fprintf('In this case, the Order of Convergence = %d\n',or(mn-2));

%Question 2: Multivariate Newton-Raphson Method

syms v1;
syms v2;
F = [sin(v1*v2) + v1 - v2; v2*cos(v1*v2) + 1]; %defining the function F
X = [v1; v2]; %vector containing x1 and x2
J = jacobian(F,X); %Jacobian Matrix

invJ = inv(J); %inverse of jacobian
h = -invJ*F; %correction vector

%Rounding off values to 5 decimal places for better understanding

X0 = [1; 2]; %starting value
X1 = [0; 0]; %initialiser
iter = 1; %reset iterations to 1
tol = 1e-3; %tolerance

fprintf('\nIteration\tx1\tx2\tf1(x1,x2)\tf2(x1,x2)\n');

while true
    hi = subs(h, X, X0);
    X1 = X0 + hi; %first approximation, repeated while the conditions are met
    Fi = subs(F, X, X1);
    fprintf('%d\t\t%.5f\t%.5f\t%.5f\t%.5f\n',iter, X1(1), X1(2), Fi(1), Fi(2));
    if (abs(hi(1))+abs(hi(2))<tol) %condition
        break
    end
    X0 = X1; 
    iter = iter+1; %step counter
end