N = 100 % NxN matrix

% construct stochastic matrix
v = 0.5*ones(N-1,1);
A = diag(v,1);
for i = 2:N
    A(i,i-1)=0.5;
end
A(2,1)=0;
A(N-1,N)=0;


% set initial state
u_t = zeros(N,1);
u_t(50,1) = 1000;
u_t(51,1) = 1000;

% plot random walk
plot(u_t)              % t = 0
hold on
for i = 1:3000
    u_t = A*u_t;
    
    if i == 10         % t = 10
        plot(u_t) 
    elseif i == 50     % t = 50
        plot(u_t)
    elseif i == 2000   % t = 2000
        plot(u_t)
    end
    
end



u_t

