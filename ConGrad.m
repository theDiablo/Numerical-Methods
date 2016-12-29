function [x] = ConGrad(A,b,M,x0)
    maxit = 89;
    tol  =  1e-4;
    r =  b  -  A*x0;
    x = x0;
    z = inv(M)*r;
    t = transpose(z)*r;
    gh = t;
    po = t;
    y = z;
    for i  =  0:maxit
        s  =  A*y;
        a  =  t/(transpose(y)*s);
        x  =  x+a*y;
        r  =  r-a*s;
        z  =  inv(M)*r;
        po =  t;
        t  =  transpose(z)*r;
        if (abs(t) < tol*tol*abs(gh))
            fprintf('no. of iterations = %d',i);
            break;            
        end
        b = t/po;
        y = z + b*y;
        i = i+1;
    end
end