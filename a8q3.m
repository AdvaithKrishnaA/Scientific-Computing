%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 8
%Question 3


h = 0.1;
X = 0:h:1;
m = length(X);

k = 0.01;
T = 0:k:0.1;
n = length(T);

r = k/(h^2);

u = zeros(m,n);

Z = zeros(m,n);

for j = 1:n
    for i = 1:m
        for k = 1:10000
            Z(i,j) = Z(i,j) + (((8*sin(0.5*k*pi)/(k*pi)^2)-(2*cos(0.5*k*pi)/(k*pi)))*(sin(k*pi*X(i))*exp(-T(j)*(n*pi)^2)));
        end
    end
end

u(1,:) = 0;
u(m,:) = 0;
u(1:6,1) = 2*X(1:6);
u(7:11,1) = 2*(1-X(7:11));

al(1:m-3)= -r;
bl(1:m-2)=2.+2.*r;
cl(1:m-3)= -r;
L = diag(bl, 0) + diag(al, -1) + diag(cl,1);

ar(1:m-3)= r;
br(1:m-2)=2.-2.*r;
cr(1:m-3)= r;
R = diag(br, 0) + diag(ar, -1) + diag(cr,1);

for i = 1:n-1
    u(2:m-1,i+1) = L\R*u(2:m-1,i);
end

tiledlayout(1,1)
[T,X] = meshgrid(0:0.01:0.1, 0:0.1:1);

nexttile
mesh(X,T,u)
title('Numerical Solution')
xlabel('x')
ylabel('t')