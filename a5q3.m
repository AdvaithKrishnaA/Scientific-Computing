%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 5
%Question 3

P = @(x) (exp(-0.5*(x.^2)))/sqrt(2*pi); %defining function

fprintf('<strong>Using Simpson''s Rule (Standard, Single Interval)</strong>\n')
for m = [1 2]
    a = -m;
    b = m;
    Sc = ((b-a)/6) * (P(a) + 4*P(0.5*(a+b)) + P(b)); %Approximation
    fprintf('For m = %d, P(-mσ ≤ x ≤ mσ) = %d\n',m, Sc);
end

fprintf('\n<strong>Using Composite Simpson''s Rule with N = 100</strong>\n')
for m = [1 2]
    a = -m;
    b = m;
    n = 100;
    h = (2*m)/n;
    Sc = P(a) + P(b);
    for j = 1:2:(n-1)
        Sc = Sc + 4*P(a + (j*h));
    end
    for j = 2:2:(n-2)
        Sc = Sc + 2*P(a + (j*h));
    end
    Sc = (h/3) * Sc; %Approximation
    fprintf('For m = %d, P(-mσ ≤ x ≤ mσ) = %d\n', m, Sc)
end

