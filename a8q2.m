%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 8
%Question 2

h = 0.1;
X = 0:h:1; %mesh in space
m = length(X);

k = 0.05;
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

% (j+1) terms
al(1:m-3)= -r; %sub diagonal below
bl(1:m-2)=2*(1+r); %main diagonal
cl(1:m-3)= -r; %sub diagonal above
L = diag(bl, 0) + diag(al, -1) + diag(cl,1); %LHS tridiagonal matrix

%j terms
ar(1:m-3)= r; %sub diagonal below
br(1:m-2)=2*(1-r); %main diagonal 
cr(1:m-3)= r; %sub diagonal above
R = diag(br, 0) + diag(ar, -1) + diag(cr,1); %RHS tridiagonal matrix

for i = 1:n-1
    u(2:m-1,i+1) = L\R*u(2:m-1,i); %Crank Nicolson Method
end

tiledlayout(2,1)
[Y,X] = meshgrid(0:0.05:0.1, 0:0.1:1); %meshgrid

nexttile
mesh(X,Y,u) %plot 1
title('Numerical Solution using Crank-Nicolson Scheme')
xlabel('x')
ylabel('t')

nexttile
mesh(X,Y,Z) %plot 2
title('Exact Solution')
xlabel('x')
ylabel('t')

error = Z-u; %error