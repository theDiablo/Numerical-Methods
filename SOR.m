% Gautam Dudeja
% 2014MT10589
% Assignment 6
% Implement SOR method with pre-conditioner
function y = SOR(A,b,w,x0)
% Input parameters:
% A- Input Matrix
% x0- initial guess
% b- vector of RHS values
% w-
% b- matrix 
% Output:
% y- approximate solution

tol=1E-4;   %tolerance to check convergence
maxItr=30;  %maximum Iterations is 20 
x=x0; %initial guess
r=b-A*x; %initial residue
n=1; % Varible for number of iterations
% error=(Invers of A)*(residual)
% x(next)=x+error
% x(next)=x+(Invers of A)*(residual)
% x(next)=x+(Inverse of M)*(residual) ; M is preconditioner
% x(next)=(Invers of M)(N*x+b) ;M-A=N
%M in case of Gauss-Sidel is M=E=D+Lower
% In SOR x(k+1)=w*x(k)+(1-w)*x(k-1)
% updating M as (1-w)/w *D+E
M =  w * tril(A, -1) + diag(diag(A));  
N = -w * triu(A,  1) + (1.0 - w) * diag(diag(A)); %N=M-A
b=b*w;
while(n<maxItr) %start of the loop
	x0=x;
    x=M\(N*x+b); %updating x as in SOR
	r=b-A*x; %updating residual
	fprintf('Guess after %d iteration is [',n); %printing
    fprintf('%d',x);
    fprintf(']\n');
    
    if(norm(x-x0)<=tol) %comparing maximum residual with toelrance  
		n=n+1;
		fprintf('Converged \n');
        break; %breaking the loop
    end;
	n=n+1;
end;
y=x; %updating the return variable
fprintf('Final answer is ['); %printing the final answer
fprintf('%.15f',x);
fprintf(']\n');

