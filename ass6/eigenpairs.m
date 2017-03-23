% Finding original matrix from eigenpairs
evr1 = [ -1 1 -1]';
evr2 = [ 1 -1 0]';
evr3 = [0 -1 1]';
eve1 = 2;
eve2 = 3;
eve3 = 3;

% check that evr1-3 are linearly independent
S = [evr1 evr2 evr3];
rank(S) 

% eigenvalues on the diagonal
D = diag([eve1 eve2 eve3])

% find A using diagonalization
A = S*D*inv(S)

