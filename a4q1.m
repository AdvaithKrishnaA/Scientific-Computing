%Advaith Krishna A
%Roll No 200122004
%MA311M - Assignment 4
%Question 1

n = 9; %number of points
t = zeros(n, 1);
y = zeros(n, 1);
z = zeros(n, 1);

%defining the interpolation points (ti,yi)
for i = 1:n
    t(i) = -5 + 1.25*(i-1); %ti
end

for i= 1:n
    y(i) = 1/(1+(t(i)).^2); %corresponding yi
end

u = zeros(n, 1); %intermediate (working) arrays
v = zeros(n, 1);

h = t(2:n) - t(1:n-1);
b = (y(2:n) - y(1:n-1))./h;

%Gaussian Elimination

%u and v are modified as follows
u(2) = 2*(h(1) + h(2));
v(2) = 6*(b(2) - b(1));

for i = 3:n-1
    u(i) = 2*(h(i) + h(i-1)) - h(i-1)*h(i-1)/u(i-1);
    v(i) = 6*(b(i) - b(i-1)) - h(i-1)*v(i-1)/u(i-1);
end

for i = n-1:-1:2
    z(i) = (v(i) - h(i)*z(i+1))/u(i);
    %zi is equivalent to S"(ti)
end

w = 1.25; %spacing

%the natural cubic spline is evaluated and plotted for each [ti, t{i+1}] as given belows
for i = 1:n-1
    syms x
    S = z(i+1)/(6*w)*(x-t(i))^3-z(i)/(6*w)*(x-t(i+1))^3+(y(i+1)/w-z(i+1)*w/6)*(x-t(i))-(y(i)/w-z(i)*w/6)*(x-t(i+1));
    dom = linspace(t(i), t(i+1), 500);
    spl = subs(S, x, dom);
    plot(dom, spl, 'r')
    if i==1
        hold on
    end
end

X = linspace(-5,5,4000);
F = 1./(1+X.^2);
plot(X, F, 'b') %plotting spline function against exact function
scatter(t, y, 'k')
legend('P(x)','','','','','','','', 'F(x)','Nodes')
hold off