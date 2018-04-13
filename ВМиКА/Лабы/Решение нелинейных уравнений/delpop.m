function [res,iter]=delpop(f,a,b,e);
% Method of dividing the segment in half;
f=fcnchk(f);
iter=0;
while (abs(a-b)/abs(b))>e
    iter=iter+1;
    x=(a+b)/2;
    if f(a)*f(x)<0
        b=x;
    else
        a=x;
    end
end
res=(a+b)/2;
return