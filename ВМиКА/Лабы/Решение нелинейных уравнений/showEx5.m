clear;
clc;
a=0;
b=1;
e=0.0001;
options=optimset('TolX',0.0001);
disp('Method of dividing a segment in half');
[res,iter]=delpop('fun',a,b,e)
disp('Method of simple iteration')
[res,iter]=prostiter('fun',b,e)
disp('Newton''s method')
[res,iter]=niuton('fun','fp',b,e)
disp('Secant method')
[res,iter]=sek('fun',b,e)
disp('With help of MatLab');
fzero('fun',[a,b],options)