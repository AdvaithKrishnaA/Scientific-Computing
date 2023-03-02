%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 5
%Question 2

f = @(x) x.^2 * exp(-2*x); %defining function
f_der = @(x) -2*exp(-2*x)*x*(x-1); %defining derivative
intgrl = @(x) -0.5*(exp(-2*x))*(x.^2 + x + 0.5); %defining indefinite integral
exact = intgrl(1) - intgrl(0); %value of definite integral
n = 50; %Number of Intervals
h = 1/n; %Interval width

%Composite Trapezoidal Rule
Tc = f(0) + f(1);
for j = 1:(n-1)
    Tc = Tc + 2*f(j*h);
end
Tc = (h/2) * Tc; %Approximation
Et = exact - Tc; %Error

%Corrected Trapezoidal Rule
Ct = f(0) + f(1);
for j = 1:(n-1)
    Ct = Ct + 2*f(j*h);
end
Ct = (h/2) * Ct;
Ct = Ct + ((h.^2)/12)*(f_der(0) - f_der(1)); %Approximation
Ect = exact - Ct; %Error

fprintf('Approximate Value using Composite Trapezoidal Rule = %d\n', Tc)
fprintf('Error for Composite Trapezoidal Rule = %d\n\n', Et);
fprintf('Approximate Value using Corrected Trapezoidal Rule = %d\n', Tc)
fprintf('Error for Corrected Trapezoidal Rule = %d\n', Ect);

%The error would turn out to be same in both cases, since the values of the
%first derivative at the endpoints are zero.

%A corrected trapezoidal rule that includes the first derivative of the
%integrand at the endpoints of the integration interval would be
%advantageous over the standard one if and only if the value of derivative 
%at the endpoints are not equal to each other or both are not zero. 

fprintf('\nA corrected trapezoidal rule that includes the first derivative of the integrand at the endpoints of the integration interval would be advantageous over the standard one if and only if the value of derivative at the endpoints are not equal to each other or both are not zero.')
