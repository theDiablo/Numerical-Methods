% Gautam Dudeja
% 2014MT10589
% Assignment 9
% Implement piecewise linear interpolation
function v = PLI(x,y,u)
% Input parameters:
% x:- Column Vector (where values are known), 
% y:- Column vector (values of the unknown function at x) of same size as x
% u:- Column vector(whose min and max values lies between min and max of x).
% Output:
% v:- calculated approximated values of unknown function at u
n=length(x); %Size of Input column vector x
[B,I]=sort(x,'ascend'); %Sorting the Input vector in ascending order
m=length(u); %Size of u vector
for i=1:m
	point=u(i); %Point where function value has to be computed
	[k,index]=histc(point,B);  %finding the postion of the given point in the given data 
    % point list between B(index) and B(index+1) 
	a=B(index); %finding lower bound
	b=B(index+1); %finding ypper bound
	avalue=y(I(index)); %finding function value at lower bound
	bvalue=y(I(index+1)); %finding function value at upper bound
	t = (point - a)/(b - a); %Applying Linera interpolation in between
	yu = (1-t)*avalue + t*bvalue;
	v(i)=yu; 
end;


fprintf('Function value at given points is [');  %printing
fprintf('%.15f',v);
fprintf(']\n');