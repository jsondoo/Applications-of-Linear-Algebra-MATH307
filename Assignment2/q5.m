clear all
% treating a finite differences problem as an eigenvalue problem;
% Au=lambda*u
% 300 unknowns but we are given u_0 = 0, and u_300 = 0 -> 298 unknowns
N=297;   % N = number of intervals; in this case 298 unknowns -> 297 intervals
k=1;   
h=1/299; % delta x

%   (1/h^2)u_j+1            (-2/h^2)u_j               (1/h^2)u_j-1
L=diag(ones(1,N)/h^2,1) + diag(-2*ones(1,N+1)/(h^2)) +  diag(ones(1,N)/h^2,-1); 

% for loop for adding ke^x_j to u_j terms (the diagonal), x_j = (j-1)/299
for i = 1:N+1
    L(i,i)=L(i,i)+ k*exp(i/299);
end



x = linspace(0,1,300);
[V,D]=eigs(L,3,'la');
% eigenvectors V represent discrete points of f(x)
% add on the initial conditions u_0 = 0, u_300 = 0
u_1 = [ 0; V(:,1); 0];
u_2 = [ 0; V(:,2); 0];
u_3 = [ 0; V(:,3); 0];
D
% we will plot 3 eigenvectors with the largest eigenvalues against x
% plot x vs f(x)
figure('Name','k=0','NumberTitle','off')
plot(x,u_1,'-r',x,u_2,'-g',x,u_3,'-b');

legend('\lambda=-8.2','\lambda=-37.8','\lambda=-87.1','Location','northwest');
title('Solving differential equations as an eigenvalue problem')
xlabel('x')
ylabel('u (eigenvector)') 