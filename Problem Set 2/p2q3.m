% Finite differences for equations in the form:
% f''(x) + g(x)f'(x) = 0 , g(x) = x in this question
N = 4; % number of points to use
dx = 2/(N-1);

% setting diagonal values 
A = zeros(N,N);
for i = 2:N-1
    A(i,i-1) = 1/(dx)^2 - (i-1)/(2*dx);
    A(i,i+1) = 1/(dx)^2 + (i-1)/(2*dx);
    A(i,i) = -2/(dx)^2;
end

% setting boundary conditoins f'(1) = 1, f(3) = -1
A(1,1) = -1;
A(1,2) = 1;
A(N,N) = 1;

b = zeros(1,N)';
b(1,1) = dx;
b(N,1) = -1;

b;
f_x = A\b;
x = linspace(1,3,N)';

figure
plot(x,f_x);