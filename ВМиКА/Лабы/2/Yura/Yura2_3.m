a=[4 2 3;-1 2 1;2 -3 2];
b=[-16;-1;0];
e=0.00001;
n=3;
miter=100;
for i=1:n
x(i)=0;
end
for iter=1:miter
	big=0;
	for i=1:n
		sum=0;
		if i==1
			for j=i+1:n
				sum=sum+a(i,j)*x(j);
			end	
		elseif i==n
			for j=1:n-1
				sum=sum+a(i,j)*x(j);
			end
		else 
			for j=1:i-1
				sum=sum+a(i,j)*x(j);
			end
		for j=i+1:n
			sum=sum+a(i,j)*x(j);
		end

	end
temp=(b(i)-sum)/a(i,i);
	if abs(temp-x(i))>big
		big=abs(temp-x(i));
	end
x(i)=temp;
end
	if big < e 
		miter=iter;
	break;
	end
end
disp('Gauss-seidel method');
x=x'
disp('MatLab Solution');
x1=a\b
miter