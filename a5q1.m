%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 5
%Question 1

N = [50, 100, 200]; %Matrix with N values
exact = 0.74682413; %exact value of the integral
f = @(x) exp(-x.^2); %defining function

fprintf('<strong>N\tRc\t\tTc\t\tSc\t\tEc\t\tEt\t\tEs</strong>\n')

for i = 1:length(N)
    n = N(i); %Number of Intervals
    h = 1/n; %Interval Width

    %Composite Rectangle Rule
    Rc = f(0);
    for j = 1:(n-1)
        Rc = Rc + f(j*h);
    end
    Rc = h*Rc; %Approximate Value for Composite Rectangle Rule
    Er = exact - Rc; %Error for Composite Rectangle Rule

    %Composite Trapezoidal Rule
    Tc = f(0) + f(1);
    for j = 1:(n-1)
        Tc = Tc + 2*f(j*h);
    end
    Tc = (h/2) * Tc; %Approximate Value for Composite Trapezoidal Rule
    Et = exact - Tc; %Error for Composite Trapezoidal Rule
    
    %Composite Simpson's Rule
    Sc = f(0) + f(1);
    for j = 1:2:(n-1)
        Sc = Sc + 4*f(j*h);
    end
    for j = 2:2:n-2
        Sc = Sc + 2*f(j*h);
    end
    Sc = (h/3) * Sc; %Approximate Value for Composite Simpson's Rule
    Es = exact - Sc; %Error for Composite Simpson's Rule

    fprintf('%d\t%.8f\t%.8f\t%.8f\t%.8f\t%.8f\t%.8f\n', n, Rc, Tc, Sc, Er, Et, Es)
end