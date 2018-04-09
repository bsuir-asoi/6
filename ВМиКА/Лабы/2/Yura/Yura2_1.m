a=[4 2 3;2 -3 2;-1 2 1];
b=[-16;0;-1];
n=3;
for k=1:n-1
	for i=k+1:n
		m=a(i,k)/a(k,k);
		a(i,k)=0;
		for j=k+1:n
			a(i,j)=a(i,j)-m*a(k,j);
		end
		b(i)=b(i)-m*b(k);
	end
end
x(n)=b(n)/a(n,n);
for i=n-1:-1:1
	s=0;
	for j=i+1:n
		s=s+a(i,j)*x(j);
	end
	x(i)=(b(i)-s)/a(i,i);
end
disp('Gauss Method');
x=x'
disp('MatLab solution');
x=(a^-1)*b