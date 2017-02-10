% Cubic spline interpolation through the points (0,7),(1,10),(3,3),(6,0)
% 4 points, 3 intervals -> 12 unknowns (a1,b1,c1,d2,a2,b2,...,c3,d3)
% set up equations such that trivially d_1 = 7, d_2 = 10, d_3 = 3 

x = [ 0 1  3 6 ];
y = [ 7 10 3 0 ];

% 9 by 9 system 
A =  [1,1,1,0,0,0,0,0,0 ; 3,2,1,0,0,-1,0,0, 0; 6,2,0,0,-2,0,0,0,0;
      0,0,0,8,4,2,0,0,0 ; 0,0,0,12,4,1,0,0,-1; 0,0,0,12,2,0,0,-2,0;
      0,0,0,0,0,0,27,9,3; 0,2,0,0,0,0,0, 0, 0; 0,0,0,0,0,0,18,2,0];
b =  [3;0;0;-7;0;0;-3;0;0];

% get coefficients of cubic polynomials
p = A\b;
a_1 = p(1);
b_1 = p(2);
c_1 = p(3);
d_1 = 7;

a_2 = p(4);
b_2 = p(5);
c_2 = p(6);
d_2 = 10;

a_3 = p(7);
b_3 = p(8);
c_3 = p(9);
d_3 = 3;

x1 = linspace(0,1,500);
x2 = linspace(1,3,1000);
x3 = linspace(3,6,1500);

f_1 = a_1*x1.^3 + b_1*x1.^2 + c_1*x1 + d_1;
f_2 = a_2*(x2-1).^3 + b_2*(x2-1).^2 + c_2*(x2-1) + d_2;
f_3 = a_3*(x3-3).^3 + b_3*(x3-3).^2 + c_3*(x3-3) + d_3;

figure('Name','Cubic Interpolation','NumberTitle','off')
p0 = plot(x,y,'.k','Markersize', 20); % plot the 4 points
hold on
% red line is splines with natural conditions
p1=plot(x1,f_1,'-r', x2, f_2,'-r', x3, f_3,'-r','linewidth',1); 

% now replace natural conditions with MATLAB's conditions
% natural conditions = double derivative at end points equal to zero
% MATLAB conditions = triple derivative continuous at 2nd point and 2nd to last point
B = [ A(1:7,:) ; 6 0 0 -6 0 0 0 0 0 ; 0 0 0 6 0 0 -6 0 0 ]; % change last two rows

q = B\b
a_1 = q(1);
b_1 = q(2);
c_1 = q(3);
a_2 = q(4);
b_2 = q(5);
c_2 = q(6);
a_3 = q(7);
b_3 = q(8);
c_3 = q(9);

f_1 = a_1*x1.^3 + b_1*x1.^2 + c_1*x1 + 7;
f_2 = a_2*(x2-1).^3 + b_2*(x2-1).^2 + c_2*(x2-1) + 10;
f_3 = a_3*(x3-3).^3 + b_3*(x3-3).^2 + c_3*(x3-3) + 3;

p2=plot(x1, f_1, '-g', x2, f_2,'-g', x3, f_3,'-g','linewidth',1);

legend([p0,p1(1),p2(1)],'data points', 'cubic spline', 'MATLABs cubic spline');

% From part 1 q1