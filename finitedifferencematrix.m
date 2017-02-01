% Template for setting up finite difference in MATLAB
% Below is set up to solve, f''(x)= r(x)

N=10; % number of intervals (N+1 points)
L=diag(-2*ones(1,N+1)) + diag(ones(1,N),1) + diag(ones(1,N),-1); % set diagonals with -1,2,1

% set boundary conditions
L(1,1) = -1;
L(1,2) = 1;
L(N+1,N+1) = 1;
L(N+1,N) = -1;

% add a vector b for the load function and boundary conditions
% solve using x = L\b



rref(L)