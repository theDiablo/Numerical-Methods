% Gautam Dudeja
% 2014MT10589
% Assignment 1
% Newtons Method to find root of a given function
function y = newton( x0,f, df )
% Input parameters:
% f- given Funtion
% df - derivative of the Function
% x0 - Initial Guess
% Output:
% y - approximate root
%f=inline(f);
%df=inline(df);
x(1) = x0;  %variable x where guess after every iteration will be stored
tol=1E-6;   %tolerance to check convergence
maxItr=30;  %maximum Iterations is 20 
n=1;  %counter for number of iterations
fc(1)=f(x0); %finding function value at initial guess 
%Variable fc where function value after every iteration will be stored
fprintf('Initial guess is %.15f \n',x(1)); %printing initial guess
fprintf('Function value at initial guess %.15f \n',fc(1)); 
%printing function value at initial guess
while (n<maxItr) 
    dfc=df(x(n)); %finding derivative at current guess
    if(fc(n)==0) 
        fprintf('Root Found'); 
    end;
    
    x(n+1)=x(n)-fc(n)/dfc; %finding next guess by newtons method
    fprintf('Guess after %d iteration is %.15f \n',n,x(n+1));
    %printing the new guess
    fc(n+1)=f(x(n+1)); %finding function value at new guess
    fprintf('Function value at this guess is %.15f \n',fc(n+1));
    %printing function value at new guess
    if(abs(x(n+1)-x(n))<tol) 
        %If the difference between the two guess is less than tolerance then
        %function has converged.
        fprintf('Converged \n');
        n=n+1;
        break; %breaking the loop.
    elseif(n>=3) %Checking if the last three iterations are bad 
        %i.e the function value has increased, then it is not converging.
        if(fc(n+1)>=fc(n) && fc(n)>=fc(n-1) && fc(n-1)>=fc(n-2))
            fprintf('Not Converging \n');
            break;
        end;
    end;
    
    n=n+1;
end %end of the loop
y=x(n); %storing final answer in output variable.
fprintf('Final answer is %.15f \n',x(n)); %printing final answer
figure('Color','White');
plot(fc); 
%Ploting the Function value vs Iteration count
title('Newtons Method');
xlabel('Iteration','FontSize',16);
ylabel('Function Value','FontSize',16);