%La Grange
function res=interLaGrange(x,y,xc)
sum=0;
pro=1;
st=numel(x)-1; %numel like size()
for i=0:st
    for j=0:st
        if i~=j
            pro=pro*((xc-x(j+1))/(x(i+1)-x(j+1)));
        end
    end
    sum=sum+y(i+1)*pro;
    pro=1;
end
res=sum;
return
            
