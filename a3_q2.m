%Advaith Krishna A
%Roll No. 200122004
%MA311M - Assignment 3

%Question 2

f = @(x) exp(x); %defining function
set = [2 4 8 16 32]; %selected set of nodes
E = zeros(5); %to store Ens

for e = 1:length(set)
    n = set(e);
    x = linspace(-1, 1, n+1); % n+1 equally spaced nodes
    y = f(x);
    M = zeros(n+1, n+1);
    M(:,1) = y;

    for j = 2:n+1
        for i = 1:1:n-j+2
            M(i,j) = M(i+1, j-1) - M(i, j-1); %finding matrix element
        end
    end

    pval = y(1);
    xi = linspace(-1, 1, 501); % 501 equally spaced nodes
    p = (xi - x(1))/(x(2)-x(1));

    for i = 1:n
        s = 1;
        for j=1:i
            s = s.*(p-j+1)/j;
        end
        pval = pval + s.*M(1,i+1);
    end

    val = pval;
    E(e) = max(abs(f(xi)-val));
    fprintf('En = %u\n',E(e)); %printing Ens
end

plot(set, En) %plot
semilogy(set, En) %semilog on y axis for better visualisation
title('Semilog Plot')