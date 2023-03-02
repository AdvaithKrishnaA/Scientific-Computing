%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 6
%Question 3

H = [0.1, 0.01]; %step size
X = [1.2, 1.4, 1.6, 1.8, 2]; %points where the value is approximated

v = @(t) t*(0.5 + log(t)).^(-1); %for exaact value
f = @(t,y) (t*y - y.^2)/(t.^2); %y' defined as f

for h = H
    fprintf('With h = %.2f\n', h)
    fprintf('\nx\tEM\t\tError(EM)\tRK2\t\tError(RK2)\tRK4\t\tError(RK4)\n')

    for b = X
        n = int16((b - 1)/h);
        x = zeros((n)+1);
        y = zeros((n)+1);
        fprintf('%.1f\t', b)

        %Euler's Method
        x(1) = 1;
        y(1) = 2;
        for i = 1:n
            x(i+1) = x(i) + h;
            y(i+1) = y(i) + h * f(x(i),y(i));
        end
        exact = v(b);
        error = exact - y(n+1); %error
        fprintf('%d\t%d\t', y(n+1), error)

        %Second Order Runge-Kutta Method
        for i = 1:n
            k1 = f(x(i), y(i));
            k2 = f(x(i+1), y(i) + h*k1);
            y(i+1) = y(i) + (h/2) * (k1 + k2);
        end

        error = exact - y(n+1); %error
        fprintf('%d\t%d\t', y(n+1), error)

        %Fourth Order Runge-Kutta Method
        for i = 1:n
            k1 = f(x(i), y(i));
            k2 = f(x(i) + 0.5*h, y(i) + 0.5*h*k1);
            k3 = f(x(i) + 0.5*h, y(i) + 0.5*h*k2);
            k4 = f(x(i+1), y(i) + h*k3);
            y(i+1) = y(i) + (h/6) * (k1 + 2*(k2 + k3) + k4);
        end

        error = exact - y(n+1); %error
        fprintf('%d\t%d\n', y(n+1), error)

    end
    fprintf('\n')
end