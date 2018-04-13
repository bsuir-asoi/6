function [res,iter]=sek(f,a,e);
% Secant method ;
f=fcnchk(f);
x0=a;
x1=a-e;
iter=0;
for i=1:200
    iter=iter+1;
    x2=x1-(f(x1)*(x1-x0))/(f(x1)-f(x0));
    if abs(x2-x1)/abs(x2)<e
        break
    else 
        x0=x1;
        x1=x2;
    end
end
res=x2;
return