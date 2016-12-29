% Gautam Dudeja
% 2014MT10589
% Assignment 3
% Solving Linear equation system using Gauss Elimination and Back Substituting
function x = gebs(A,b)
% Input parameters:
% A -Input Coffectient Matrix
% b -RHS values of system equations
% Output:
% x - solution vector

[m,n]=size(A);
%Size of matrix A
solvable=true;
%Flag to check if matrix is invertible
for k=1:n-1 %start of the loop
    %Finding Pivot
    if A(k,k)==0 %If first element if zero then finding non zero pivot
        t=k+1;
        flag=false; %Flag to find non zero pivot 
        for t=k+1:n %Loop to find the pivot
            if( A(t,k)~=0)
                flag=true; %updating flag
                break; %Breaking the loop
            end;
        end;
        if(~flag) %If No non zero element then Matrix is not invertible.
            fprintf('Matrix is not invertible \n'); %printing
            solvable=false; %updating solvable
            break; %Breaking the loop 
        end;    
        %Swapping the current row with new pivot row
        X=A(k,:); 
        Y=b(k);
        A(k,:)=A(t,:);
        b(k)=b(t); %swapping same index value in b matrix
        A(t,:)=X;
        b(t)=Y;    
    end;
    for i=k+1:n
        l=A(i,k)/A(k,k); %finding l(i,k)
        for j=k+1:n %updating values of below matrix
        A(i,j)=A(i,j)-l*A(k,j);
        end;
        b(i)=b(i)-l*b(k);
    end;    
end;
%If solvable then applying Back substitution
if(solvable)
    for k = n:-1:1
        x(k) = b(k); %saving values in x vector
        for j = k+1:n
            x(k) = x(k) - A(k,j)*x(j);
        end;
        x(k) = x(k) / A(k,k); 
    end;
    %Printing solution vector
    fprintf('Matrix is invertible \n');
    fprintf('Solution of the system is [');
    fprintf(' %.15f ', x) ;
    fprintf(']\n') ;
end;