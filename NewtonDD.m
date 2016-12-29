% Gautam Dudeja
% 2014MT10589
% Assignment 8
% Implement Newton divided difference
function v = NewtonDD(x,y,u)
% Input parameters:
% x:- Column Vector (where values are known), 
% y:- Column vector (values of the unknown function at x) of same size as x
% u:- Column vector(whose min and max values lies between min and max of x).
% Output:
% v:- calculated approximated values of unknown function at u
n=length(x); %Size of Input column vector x
dd=zeros(n,n); % Matrix where divided difference would be stored
dd(1:n,1)=y; % Putting y values at first column
%dd(1,n)=F[x(n)]=f(x(n))
%F[x(i),..,x(j)]=F[x(i+1),..,x(j)]-F[x(i),..,x(j-1)]/(x(j)-x(i))
%dd(k,j)= F[x(k-l+1)....,x(k-1),x(k)]
%dd(k,j)=(dd(k,j-1)-dd(k-1,j-1))/(x(k)-x(i))
for k=2:n % Lop to calculate Divided differences 
	for j=2:k 
		i=k-j+1; %Finding last index of x in dd(k,j) 
		dd(k,j)=(dd(k,j-1)-dd(k-1,j-1))/(x(k)-x(i)); %Finding dd(k,j)
	end;
end;

%fprintf('%.15f \n',dd); 
cofe=diag(dd);
%fprintf('%.15f \n',cofe);

%pn(x)= f [x 1 ] + f [x 1 , x 2 ](x − x 1 ) + f [x 1 , x 2 , x 3 ](x − x 1 )(x − x 2 )
%+ · · · + f [ x 1 , . . . , x n ](x − x 1 ) · · · (x − x n−1 )
m=length(u); %Size of u vector
for k=1:m 
	point=u(k); %Point where function value has to be computed
	value=0; % Inital value=0
    i=n-1; 
	while(i>=1)
		value=(point-x(i))*(cofe(i+1)+value);  % Applying Horner's rule
        fprintf('%d \n',value);
        i=i-1;
	end;
	value=value+cofe(1);
	v(k)=value;
end;

fprintf('Function value at given points is [');  %printing
fprintf('%.15f',v);
fprintf(']\n');