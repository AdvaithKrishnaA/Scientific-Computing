%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 8
%Question 1

h = 0.1;
X = 0:h:1; %mesh in space
m = length(X);

k = 0.005;
T = 0:k:0.1; %mesh in time
n = length(T);

r = k/(h^2); %defining the ratio r
exact = @(x,t) exp(-t * (pi.^2)) * sin(pi * x); %exact solution

u = zeros(m,n); %initialising matrix
Z = zeros(m,n);

for j = 1:n
    for i = 1:m
        Z(i,j) = exact(X(i),T(j)); %exact solution in mesh grid
    end
end

u(1,:) = 0; %boundary condition
u(m,:) = 0; %boundary condition
u(:,1) = sin(pi*X); %initial condition

for j = 1: n-1
    for i = 2:m-1
        %numerical approximation using classical explicit method
        u(i,j+1) = u(i,j) + r*(u(i+1,j)-2*u(i,j)+u(i-1,j));
    end
end

%To check for convergence when r>0.5 (using r=2 here)
v(1,:) = 0;
v(m,:) = 0;
v(:,1) = sin(pi*X);

for j = 1: n-1
    for i = 2:m-1
        v(i,j+1) = v(i,j) + 2*(v(i+1,j)-2*v(i,j)+v(i-1,j));
    end
end

%solution is unstable for r > 0.5

tiledlayout(3,1)
[Y,X] = meshgrid(0:0.005:0.1, 0:0.1:1); %meshgrid

nexttile
mesh(X,Y,Z) %plot 1
title('Exact Solution')
xlabel('x')
ylabel('t')

nexttile
mesh(X,Y,u) %plot 2
title('Numerical Solution using Classical Explicit Scheme')
xlabel('x')
ylabel('t')

error = Z-u; %error

nexttile
mesh(X,Y,v) %plot 3
title('Numerical Solution with r = 2')
xlabel('x')
ylabel('t')