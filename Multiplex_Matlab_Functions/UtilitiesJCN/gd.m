function X=gd(A,d)

[V,D]=eigs(A,d);

for i=1:d
    D(i,i)=sqrt(max(D(i,i),0));
end

X=D*V';

