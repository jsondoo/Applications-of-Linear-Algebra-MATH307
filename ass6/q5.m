load('matrixforq5.mat')

x_i = rand(298,1); % generate random vector

for i = 1:30
    y_j = A\x_i;
    x_i = y_j/norm(y_j);
end

e_i = x_i'*A*x_i % e_i = -1




