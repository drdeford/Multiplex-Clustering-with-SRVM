function B=make_mod(A,n)

degs=A*ones(n,1);

B=zeros(n);

E=sum(degs);
for i=1:n
    for j=1:n
        B(i,j)=A(i,j)-degs(i)*degs(j)/E;
    end
end
