%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 7
%Question 1

A = @(l1, l2, l3) 0.5* [l2+l3, l3-l1, l2-l1; l3-l2, l1+l3, l1-l2; l2-l3, l1-l3, l1+l2]; %A
E = @(l1, l2, l3) [exp(l2)+exp(l3)-exp(l1); exp(l1)+exp(l3)-exp(l2); exp(l1)+exp(l2)-exp(l3)]; %function handle for exact value
L = [-1, 0, 1; 0, -1, -10];

for l = 1:2 %evaluate for the each case of λ1, λ2, λ3

    a = A(L(l,1), L(l,2), L(l,3)); %computing matrix A using the given values of λ1, λ2, λ3
    exact = E(L(l,1), L(l,2), L(l,3)); %exact value computed using given parameters

    fprintf('Case %d: λ1 = %d, λ2 = %d, λ3 = %d\n\n',l, L(l,1), L(l,2), L(l,3))
    f = @(v) a*v; %function f

    for n = [10, 20, 40, 80] %evaluate for each n
        fprintf('N = %d\n',n)
        h = 1/n;
        y = zeros(3, n+1);
        y(:, 1) = [1; 1; 1];
        
        %Euler's Method
        for i = 1:n
            y(:,i+1) = y(:,i) + h * f(y(:, i));
        end
        e1 = exact - y(:,n+1); %error for Euler's Method
        fprintf('EM\t\t[%d; %d; %d]\nError(EM)\t[%d; %d; %d]\n',y(:,n+1),e1)

        %Fourth Order Runge-Kutta Method
        for i = 1:n
            k1 = f(y(:,i));
            k2 = f(y(:,i) + 0.5*h*k1);
            k3 = f(y(:,i) + 0.5*h*k2);
            k4 = f(y(:,i) + h*k3);
            y(:,i+1) = y(:,i) + (h/6) * (k1 + 2*(k2 + k3) + k4);
        end
        e2 = exact - y(:,n+1); %error for Fourth Order Runge Kutta Method
        fprintf('RK4\t\t[%d; %d; %d]\nError(RK4)\t[%d; %d; %d]\n\n',y(:,n+1),e2)
    end
    fprintf('\n')
end