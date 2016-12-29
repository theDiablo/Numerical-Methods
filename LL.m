% Gautam Dudeja
% 2014MT10589
% Assignment 5
% Implement Cholesky decomposition of a symmetric positive matrix
function [L] = LL(A)
% Input parameters:
% A- Input Matrix
% Output:
% L- Lower Triangular Matrix
[m,n]=size(A);
%size of A matrix

solvable=true; %Flag to check matrix is invertible
for k = 1 : n - 1 %start of loop
	if(A(k,k)<=0) %if diagonal element is neggative then not symmetric poitive definite
		fprintf('Matrix is not symmetric positive definite \n'); %printing
        solvable=false; %updating solvable
        break; %breaking the loop
    end; 
    
	A(k,k)=sqrt(A(k,k)); %Finding square root
	
	for i = k + 1 : n
	A(i,k)=A(i,k)/A(k,k); %Updating A(i,k)
	end;
	for j = k + 1 : n
		for i = j : n
			A(i,j)=A(i,j) -A(i,k)*A(j,k);
		end;
	end;
end;
A(n,n)=sqrt(A(n,n)); %updating A(n,n)
if(solvable)
	fprintf('Matrix is symmetric positive definite \n'); %printing
	for i=1:n %loop to put all values in L matrix
        for j=1:i
            L(i,j)=A(i,j);
        end;
    end;  
    %PRinting the L Matrix
    fprintf('L matrix is [');
    %fprintf('%.15f',L);
    fprintf('%d',L);
    fprintf(']\n');
    
end;