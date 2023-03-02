%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 4
%Question 2

f = @(x) x*log(1+x^2); %function
f_der = @(x) log(1 + x.^2) + (2*x^2/(1+x.^2)); %derivative
eps = f_der(1); %exact value of f_der at x=1

error = zeros(3,1); %array to store error values
H = [0.1, 0.01, 0.001]; %array to store step-size

fprintf('Forward Difference Scheme\n\nh\t\tError\n')

for i = 1:3
    h = H(i);
    approx = (f(1+h) - f(1))/h;
    error(i) = eps - approx; %error formula
    fprintf('%5f\t%d\n', h, error(i));
end

%Computational error vs Step-size Plot
plot(H, error,'b')
hold on
scatter(H, error, "o","filled",'b')

fprintf('\nBackward Difference Scheme\n\nh\t\tError\n')

for i = 1:3
    h = H(i);
    approx = (f(1) - f(1-h))/h;
    error(i) = eps - approx;
    fprintf('%5f\t%d\n', h, error(i));
end

plot(H, error,'r')
scatter(H, error, "diamond",'r')

fprintf('\nCentral Difference Scheme\n\nh\t\tError\n')

for i = 1:3
    h = H(i);
    approx = (f(1+h) - f(1-h))/(2*h);
    error(i) = eps - approx;
    fprintf('%5f\t%d\n', h, error(i));
end

plot(H, error,'m')
scatter(H, error, "hexagram",'m')
hold off

%labels and legend
xlabel('Step-size')
ylabel('Error')
legend('Forward Difference Scheme', '', 'Backward Difference Scheme', '', 'Central Difference Scheme')