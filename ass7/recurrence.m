% Recurrence Relation
% G_(k+2) = 0.5*[G_(k+1)+ G_(k)]
A = [ 0.5 0.5 ; 1 0 ]

% diagonalization
D = [ -0.5 0 ; 0 1 ];
P = [ -0.5 1 ; 1 1 ];
P_i = inv(P);
P * D * P_i

% A^n = P * D^n * P_i

