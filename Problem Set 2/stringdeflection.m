% Modelling the deflection of a string using Gaussian Distribution
% String held at x=0,1; y=0
% Pulled up with center = XI, variance = SIGMA

N = 500; % number of points
x = linspace(0,1,N)';
h = x(2)-x(1);

D = ones(1,N)*-2/h^2; 
A = diag(D); % set diagonal to -2/h^2
A(1,1)=1;
A(N,N)=1;
b_minus = 1/h^2;
b_plus = 1/h^2;

for i = 2:1:N-1
    A(i,i-1) = b_minus;
end

for i = 2:1:N-1
    A(i,i+1) = b_plus;
end

f_x = ones(1,N)';
% boundary condition
f_x(1) = 0;
f_x(N) = 0;

figure

for i = 2:N-1
    f_x(i) = load1(x(i),1,0.7); % sigma = 1
end
p = A\f_x;
plot(x,p);
hold on

for i = 2:N-1
    f_x(i) = load1(x(i),0.1,0.7); % sigma = 0.1
end
p = A\f_x;
plot(x,p); 

for i = 2:N-1
    f_x(i) = load1(x(i),0.01,0.7); % sigma = 0.01
end
p = A\f_x;
plot(x,p);

title('String Deflection with center at x=0.7');
legend('\sigma=1','\sigma=0.1','\sigma=0.01','Location','southwest');

% part b
figure('Name','Q3 - part b','NumberTitle','off')
for i = 2:N-1
    f_x(i) = load1(x(i),0.01,0.2); % xi = 0.2
end
p = A\f_x;
plot(x,p);
hold on

for i = 2:N-1
    f_x(i) = load1(x(i),0.01,0.3); % xi = 0.3
end
p = A\f_x;
plot(x,p); 

for i = 2:N-1
    f_x(i) = load1(x(i),0.01,0.4); % xi = 0.4
end
p = A\f_x;
plot(x,p); 

for i = 2:N-1
    f_x(i) = load1(x(i),0.01,0.5); % xi = 0.5
end
p = A\f_x;
plot(x,p); 

for i = 2:N-1
    f_x(i) = load1(x(i),0.01,0.6); % xi = 0.6
end
p = A\f_x;
plot(x,p); 

for i = 2:N-1
    f_x(i) = load1(x(i),0.01,0.7); % xi = 0.7
end
p = A\f_x;
plot(x,p);

for i = 2:N-1
    f_x(i) = load1(x(i),0.01,0.8); % xi = 0.8
end
p = A\f_x;
plot(x,p); 

title('String Deflection with various centers');
legend({'\xi=0.2','\xi=0.3','\xi=0.4','\xi=0.5','\xi=0.6','\xi=0.7','\xi=0.8'},'FontSize',6, 'Location','southeast');

% Remark
determinant= det(A);
% really big number, non-zero answers to previous parts are unique solutions

% difference in slope on opposing sides of XI is always 1
% slope was calculated by sampling two points on each side of XI

% part e
% instead of using a gaussian distribution as the string being pulled
% we replace it with f(x)=1-x^2 and see how it looks
figure
for i = 2:N-1;
    f_x(i) = load2(x(i)); % xi = 0.7
end
p=A\f_x;
plot(x,p);
title('String Deflection from f(x)=1-x^2');

% FUNCTIONS
% Gaussian distribution
function f = load1(x,SIGMA,XI);
f = exp(-(x-XI)^2 /(2*SIGMA^2))/sqrt(2*pi*SIGMA^2);
end

% 1-x^2
function f = load2(x);
f = 1-x^2;
end

% From part 1 q3