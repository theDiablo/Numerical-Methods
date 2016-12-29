% Gautam Dudeja
% 2014MT10589
% Assignment 9
% Implement Cubic Spline Interpolation
function v = CubicSpline(x,y,u)
% Input parameters:
% x:- Column Vector (where values are known), 
% y:- Column vector (values of the unknown function at x) of same size as x
% u:- Column vector(whose min and max values lies between min and max of x).
% Output:
% v:- calculated approximated values of unknown function at u

n=length(x); %Size of Input column vector x
[x,I]=sort(x,'ascend'); %Sorting the Input vector in ascending order
temp=zeros(n); % updating y vector according to the sort 
for i=1:n
    temp(i)=y(I(i));
end;
y=temp; %Updating y

%si is the function in between ith interval
%si(x i ) = f (x i )
%si(x i+1 ) = f (x i+1 )
%si '(x i+1 ) = s i+1 '(x i+1 )
%si ''(x i+1 ) = s i+1''(x i+1)

%si is a cubic polynomial
%si (x) = a i + b i (x − x i ) + c i (x − x i )^ 2 + d i (x − x i )^ 3 
%si'(x) = b i + 2c i (x − x i ) + 3d i (x − x i )^ 2 ,
%si'' (x) = 2c i + 6d i (x − x i )

% Finding sub intervals length 
h = zeros(n-1,1);
for k = 1:n-1
 h(k) = x(k+1) - x(k); %difference between consicutive values
end;

%a i = f (x i ) : ai can directly be computed
% Using h i = x i+1 − x i
%a i + b i h i + c i (hi^2) + d i (hi^ 3)  = f (x i+1 )
%Putting value of h ai and dividing by hi
%b i + h i c i + (hi^2) d i = f [x i , x i+1 ]

%using first derivative equation
%b i + 2h i c i + 3(hi^2) d i = b i+1
%using second derivative equation
%c i + 3h i d i = c i+1
%Above equation can be written as di=(ci+1-ci)/3hi
% And bi can be written as
%b i = f [x i , x i+1 ] −h i(2c i + c i+1 )/3

%Putting the values of di and bi in above equation we have
%h i−1 c i−1 + 2(h i−1 + h i )c i + h i c i+1 = 3( f [x i , x i+1 ] − f [x i−1 , x i ])

%Which can be seen as a system of linear equation Ac=b with b as  3( f [x i , x i+1 ] − f [x i−1 , x i ])
% c as a vector of unknown ci's


% Computing A matrix
A = zeros(n,n);
 
% Natural Spline boundary conditions
A(1,1)= 1;
A(n,n) = 1;
 
for j = 2:n-1
 A(j,j-1) = h(j-1);
 A(j,j) = 2*(h(j-1)+h(j));
 A(j,j+1) = h(j);
end;
 
% Computing b vector using b i = 3( f [x i , x i+1 ] − f [x i−1 , x i ])
b = zeros(n,1);
 
for i = 2:n-1
 b(i) = (3/h(i))*(y(i+1)-y(i)) - (3/h(i-1))*(y(i)-y(i-1));
end;
 
% Computing c using in built in method for solution of linear equation
c = A\b;
 
% Computing bi's using b i = f [x i , x i+1 ] −h i(2c i + c i+1 )/3
bi = zeros(n-1,1);
for i = 1:n-1
 bi(i) = (1/h(i))*(y(i+1)-y(i)) - (1/3*h(i))*(2*c(i)+c(i+1));
end;

% Computing di's using di=(ci+1-ci)/3hi
d = zeros(n-1,1);
for i = 1:n-1
 d(i) = (1/(3*h(i))) * (c(i+1)-c(i));
end;
 
% Making a matrix having all polinomials i.e di's bi's ci's and ai's
S = zeros(n-1,4);
for i = 1:n-1
 S(i,4)=y(i);
 S(i,2) = c(i);
 S(i,3) = bi(i);
 S(i,1)=d(i);
end;

m=length(u); %Size of u vector
for i=1:m
	point=u(i); %Point where function value has to be computed
	[k,index]=histc(point,x); %finding the postion of the given point in the given data
    value=S(index,1)*(point-x(index)); %Applying Horner's rule to evaluate
    value=(point-x(index))*(S(index,2)+value);
    value=(point-x(index))*(S(index,3)+value);
    value=S(index,4)+value;
    v(i)=value; %Storing the value in v
end;


fprintf('Function value at given points is ['); 
fprintf('%.15f',v);
fprintf(']\n');