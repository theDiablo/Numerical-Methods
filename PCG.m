% Gautam Dudeja
% 2014MT10589
% Assignment 7
% Implement Conjugate gradient method with pre-conditioner
function y = PCG(A,b,M,x0)
% Input parameters:
% A- Input Matrix
% x0- initial guess
% b- vector of RHS values
% M- pre conditioner
% b- matrix 
% Output:
% y- approximate solution
tol=1E-3;   %tolerance to check convergence
maxItr=30;  %maximum Iterations is 20 
%x k+1 = x k + α k p k
% and α k =(p Tk) r k/(pT k Ap k)
% ak=rho/(pT *sk)
%rho=(pT k) and sk=(A*pk)
% rho is numerator in updation of ak
x=x0; %initial guess
r=b-A*x; %initial residual
z=M\r; % finding pre conditioned residue
rho=(z')*r; %Numerator in updation of ak 
p0=z;
p=p0;
n=1; % variable for number of loops
while(n<maxItr)
    x0=x;
	s=A*p; %updating sk
	a=rho/((p')*s); %updation ak
	x=x+a*p; %finally finding new guess
	r=r-a*s; %updating residue using new guess
	z=M\r; %slope with pre-conditioner
	rho2=(z')*r; 
    fprintf('Guess after %d iteration is [',n); %printing
    fprintf('%d',x);
    fprintf(']\n');
    if(norm(x-x0)<tol)
        fprintf('Converged');
        break;
    end;
    if(rho2<tol*p0) %test for convergence
        fprintf('Converged');
        break;
 	end;
	b=rho2/rho;
	p=z+b*p;
	rho=rho2; %updating rho
    n=n+1;
end;
	
y=x; %updating the return variable
fprintf('Final answer is ['); %printing the final answer
fprintf('%.15f',x);
fprintf(']\n');
