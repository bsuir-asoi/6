function [res,iter]=prostiter(f,a,e);
% Simple iteration method;
f=fcnchk(f);
x1=a;
y=2;
iter=0;
for i=1:200
    iter=iter+1;
    x2=x1-y*f(x1);
    if abs(x2-x1)/abs(x2)<e
        break
    else x1=x2;
    end
end
res=x2;
return