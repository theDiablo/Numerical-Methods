% Gautam Dudeja
% 2014MT10589
% Assignment 2
% Secant Method to find root of a given function
function y = secant(a,b,f)
% Input parameters:
% f- given Funtion
% a,b-First two guess
% Output:
% y - approximate root
%f=inline(f);
x(1)=a;
x(2)=b; %variable x where guess after every iteration will be stored
tol=1E-6;   %tolerance to check convergence
maxItr=30;  %maximum Iterations is 20 
n=2; %variable to store number of iterations
fc(1)=f(x(1)); 
fc(2)=f(x(2));
%finding function value at initial guess 
%Variable fc where function value after every iteration will be stored
fprintf('Initial two guess are %.15f and %.15f \n',x(1),x(2)); %printing initial guess
fprintf('Function value at initial guess %.15f and %.15f \n',fc(1),fc(2)); 
%printing function value at initial guess
while (n<maxItr) %start of the loop
    diff=x(n)-x(n-1); %difference of last two guess
    fdiff =fc(n)-fc(n-1); %function difference of last two guess
    x(n+1)=x(n)-(fc(n)*(diff))/fdiff; %finding next guess by secants method
    fprintf('Guess after %d iteration is %.15f \n',n-1,x(n+1));
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
title('Secant Method');
xlabel('Iteration','FontSize',16);
ylabel('Function Value','FontSize',16);
