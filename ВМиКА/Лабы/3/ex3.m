%need correct like in exercise
clc; %cleen screen
clear;%remove item from workspace
fig1=figure;%create figure window
fig2=figure;
a=0;
b=10;% for axis x
notr=4;%segments count
h=(b-a)/notr; %step
h1=h/5; %little step
x=a:h:b; %set nodes inter
xc=1;    %checkpoint
y=fun3(x); %counter value in inter nodes
disp('value inter pol in checkpoint')
interLaGrange(x,y,xc)
disp('value inter fun in checkpoint')
fun3(xc)
disp('do with matlab engine')
a1=polyfit(x,y,notr);
polyval(a1,xc)

%build graphics
xf=a:h1:b;
figure(fig1);
grid on;
hold on;
%build graphics inter pol
n=length(xf)-1;
for k=0:n
    yp(k+1)=interLaGrange(x,y,xf(k+1));
end
plot(xf,yp,'k-o');


%build with MatLab engine
for k=0:n
    yp(k+1)=polyval(a1,xf(k+1));
end
plot(xf,yp,'b-*');

%with nodes selected
for k=0:notr
    xv(k+1)=(b-a)/2*cos(((2*k+1)*pi)/(2*notr+2))+(b+a)/2; %best nodes
end
yv=fun3(xv);
disp('value get by selective intel pol nodes')
interLaGrange(xv,yv,xc)
for k=0:notr
    xf(n+k+2)=xv(k+1);
end

% Sorting
m=numel(xf);
for k=1:m-1
    for i=k+1:m
        if (xf(k)>xf(i)) 
            p=xf(k);
            xf(k)=xf(i);
            xf(i)=p;
        end
    end
end


for k=1:n+2+notr
    yf(k)=interLaGrange(xv,yv,xf(k));
end
figure(fig2);
hold on;
grid on;
plot(xf,yf,'b-*'); %Graph with best choise
yf=fun3(xf);
figure(fig1);
plot(xf,yf,'r.-'); %build graph of func in fig1
plot(x,0,'g-.') %build nodes equable grid
legend('Approximated','MatLab','Function','Nodes',2)
figure(fig2);
plot(xf,yf,'r-.'); %build graph of func in fig2
plot(xv,0,'g-.'); %nodes(best Choise)
legend('Best','Function','Nodes',2);




