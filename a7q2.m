%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 7
%Question 2

a = 0; %interval bounds
b = 0.2;

f = @(t,y) t - (1/y); %defining function f
h = 0.1; %step size
cnv = @(y) h * (1/y).^2; %using this to check for convergence


n = int16((b - a)/h); %number of iterations n
x = zeros(n+1, 1); %initialising x and y
y = zeros(n+1, 1);

x(1) = 0;
y(1) = 1; %initial condition

eps = 1e-4;
fprintf('y_n(k)\t\t\th(∂f/∂y)\n')

for i = 1:n
    x(i+1) = x(i) + h;

    yp = y(i) + h * f(x(i),y(i)); %step 1
    fprintf(      'y_%d(0) = %d\t%d\n',i,yp,cnv(yp))
    y(i+1) = y(i) + (0.5*h)*(f(x(i),y(i)) + f(x(i+1),yp)); %1st inner iteration
    c = 1;
    fprintf('y_%d(%d) = %d\t%d\n',i, c, y(i+1), cnv(y(i+1)))

    while abs(y(i+1)-yp)/abs(y(i+1)) > eps
        yp = y(i+1);
        y(i+1) = y(i) + (0.5*h)*(f(x(i),y(i)) + f(x(i+1),yp)); %kth inner iterations
        c = c+1;
        fprintf('y_%d(%d) = %d\t%d\n',i, c, y(i+1), cnv(y(i+1)))
    end
end