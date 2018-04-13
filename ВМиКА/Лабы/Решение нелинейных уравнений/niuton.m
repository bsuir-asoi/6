function [res,iter]=niuton(f,fp,a,e);
% Newton's method;
f=fcnchk(f);
fp=fcnchk(fp);
x1=a;
iter=0;
for i=1:200
    iter=iter+1;
    x2=x1-f(x1)/fp(x1);
    if abs(x2-x1)/abs(x2)<e
        break
    else x1=x2;
    end
end
res=x2;
return