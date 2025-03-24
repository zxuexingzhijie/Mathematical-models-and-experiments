function A=asteroid(X,Y)
f=@(x,y)[x^2,2*x*y,y^2,2*x,2*y];
C=zeros(5,5);
for i=1:5
    C(i,:)=f(X(i),Y(i));
end
B=-ones(1,5);
A=B/C.';
end