%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 4
%Question 3

syms x, syms n
%taking ln(x) as the desired function
f_der = (log(x + 10.^(-n)) - log(x))/(10.^(-n)); %given formula
fprintf('\nn\tApproximation with High Precision\n');
for i = 1:20
    val = subs(f_der, {x, n}, {1, i});
    fprintf('%d\t%.10f\n', i, val); %printing approximations
end

fprintf('\nAs the value of n increases, the outputs becomes closer to the exact value of the derivative.\n');
%% Conclusion
%As the value of n increases the outputs becomes closer to the exact value
%of the derivative. I could observe that the value is dependent on the
%precision used in MATLAB. If Symbolic Toolbox is not used, the final
%values will become zero due to cancellation error (shown below).

fprintf('\nn\tApproximation with Low Precision\n');

f_der2 = @(v,h) (log(v + 10.^(-h)) - log(v))/(10.^(-h)); %given formula
for i = 1:20
    fprintf('%d\t%.10f\n', i, f_der2(1, i)); %printing approximations
end

fprintf('\nThe final approximations are zero due to cancellation error.\n');