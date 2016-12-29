function [V] = linea (x,y,U) 
   n = length(U); 
    for i = 1:n
        for j = 1:length(x)-1
            if (x(j)==U(i))
                V(i)=y(j);
            end
            if (x(j)<U(i) && U(i)<x(j+1))
                V(i) = y(j) + (U(i)-x(j))*(y(j+1)-y(j))/(x(j+1)-x(j));li
            end
        end
    end
end
