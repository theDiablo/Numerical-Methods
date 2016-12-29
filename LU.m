% Gautam Dudeja
% 2014MT10589
% Assignment 4
% Implement LU decomposition of a matrix

function [P,L,U] = LU(A)
% Input parameters:
% A- Input Matrix
% Output:
% P-Permutaion matrix
% L- Lower Triangular Matrix
% U- Upper Triangular Matrix

[m,n]=size(A);
%Size of matrix A
P=eye(n,n); %Initializing P matrix
L=zeros(n,n); %Initializing L matrix
U=zeros(n,n); %Initializing U matrix
solvable=true; %Flag to check matrix is invertible 
for k=1:n-1 %start of loop
	[maxvalue,index] = max(abs(A(k:n,k))); %Finding maximum element to be used as pivot
	t=index+k-1; 
	if(maxvalue==0) %If maximum value is zero the matrix is not invertible
		fprintf('Matrix is not invertible \n'); %Printing
        solvable=false; %updating solvable
        break; %breaking the loop
    end; 
    X=A(k,:); %Swapping the two rows
    A(k,:)=A(t,:);
    A(t,:)=X;
    P([k,t],:)=P([t,k],:); %Updating the swap in P matrix 
    L([k,t],:)=L([t,k],:);% Updating the swap in L matrix
    for i=k+1:n
        L(i,k)=A(i,k)/A(k,k); %Finding element of L matrix
        for j=k:n % Updating matrix below it
        A(i,j)=A(i,j)-L(i,k)*A(k,j);
        end;
    end;    
end;
L=L+eye(n,n); % putting 1 in diagnol of L matrix
U=A; %Updating U as remaning values of A
if(solvable) 
    fprintf('Matrix is invertible \n');
    %Printing P,L,U
    fprintf('P matrix is [');
    %fprintf('%.15f',P);
    fprintf('%d',P);
    fprintf(']\n');
    fprintf('L matrix is [');
    %fprintf('%.15f',L);
    fprintf('%d',L);
    fprintf(']\n');
    fprintf('U matrix is [');
    %fprintf('%.15f',U);
    fprintf('%d',U);
    fprintf(']\n');
end;