%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 8
%Question 1

%Part (i)

h1 = 0.1;
X1 = 0:h1:0.5; %mesh in space
m1 = length(X1);

k1 = 0.0025;
T1 = 0:k1:1; %mesh in time
n1 = length(T1);

r1 = k1/(h1^2);

u1 = zeros(m1,n1); %initialising matrix

u1(:,1) = 0; %initial condition

for j = 1: n1-1
    u1(1,j+1) = u1(1,j) + r1*(u1(2,j)-2*u1(1,j)+u1(2,j));
    for i = 2:m1-1
        %numerical approximation using classical explicit method
        u1(i,j+1) = u1(i,j) + r1*(u1(i+1,j)-2*u1(i,j)+u1(i-1,j));
    end
    u1(m1,j+1) = u1(m1,j) + r1*(u1(m1-1,j)-2*u1(m1,j)+u1(m1-1,j)+(2*h1));
end

%Part (ii)
h2 = 0.1;
X2 = 0:h2:0.5; %mesh in space
m2 = length(X2);

k2 = 0.01;
T2 = 0:k2:1; %mesh in time
n2 = length(T2);

r2 = k2/(h2^2);

u2 = zeros(m2,n2); %initialising matrix

u2(:,1) = 0; %initial condition

% (j+1) terms
al(1:m2-1)= -r2; %sub diagonal below
bl(1:m2)=2*(1+r2); %main diagonal
cl(1:m2-1)= -r2; %sub diagonal above
L = diag(bl, 0) + diag(al, -1) + diag(cl,1); %LHS tridiagonal matrix
L(1,2) = L(1,2) - r2;
L(m2,m2-1) = L(m2,m2-1) - r2;

%j terms
ar(1:m2-1)= r2; %sub diagonal below
br(1:m2)=2*(1-r2); %main diagonal 
cr(1:m2-1)= r2; %sub diagonal above
R1 = diag(br, 0) + diag(ar, -1) + diag(cr,1); %RHS tridiagonal matrix
R1(1,2) = R1(1,2) + r2;
R1(m2,m2-1) = R1(m2,m2-1) + r2;

R2 = zeros(m2,1);
R2(m2,1) = 2*h2;
R3 = zeros(m2,1);
R3(m2,1) = 2*h2;

for i = 1:n2-1
    u2(:,i+1) = L\R1*u2(:,i) + L\R2 + L\R3; %Crank Nicolson Method
end

tiledlayout(2,1)
[T1, X1] = meshgrid(T1, X1);
[T2, X2] = meshgrid(T2, X2);

nexttile
mesh(X1,T1,u1) %plot 1
title('Numerical Solution using Classical Explicit Scheme')
xlabel('x')
ylabel('t')

nexttile
mesh(X2,T2,u2) %plot 2
title('Numerical Solution using Crank-Nicolson Scheme')
xlabel('x')
ylabel('t')

exact = @(x,t) (2*t) + 0.5*(((12*x^2 - 1)/6) + (2/(pi^2))*exp(-4*(pi^2)*t)*cos(2*pi*x));

fprintf('x\tt\tExact Value\t\tSchmidt\t\t\tCrank-Nicolson\n')
for x = [0, 0.1, 0.2, 0.3, 0.4, 0.5]
    for t = [0.01, 0.05, 0.5, 1]
        fprintf('%.1f\t%.2f\t%.6f\t\t%.6f\t\t%.6f\t\n', x, t, exact(x,t), u1(int16(x/h1) + 1, int16(t/k1) + 1), u2(int16(x/h2) + 1, int16(t/k2) + 1))
    end
end
