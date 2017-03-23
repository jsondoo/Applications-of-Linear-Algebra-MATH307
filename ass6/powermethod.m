A = [ -2 -6 -5 -6 -10 ;
      -6 -2 -5 -5  3  ;
      -5 -5  2  -9 -2 ;
      -6 -5 -9 -4 -14 ;
      -10 3 -2 -14 -4 ];
x_i = rand(5,1); % random 5x1 vector

iter = zeros(20,1);
eve = zeros(20,1); % store eigenvalues here
for i = 1:20
    x_i = A*x_i / norm(A*x_i); % calculate x_i
    e_i = x_i'*A*x_i;          % calculate corresponding eigenvalue
    
    iter(i) = i;
    eve(i) = e_i
end

figure
xlabel('hi','FontSize',14); %label the x-axis x; set interpreter to Latex (hence the $ signs)
ylabel('$y$','FontSize',14,'Interpreter','Latex');
plot(iter,eve,'-ko');


