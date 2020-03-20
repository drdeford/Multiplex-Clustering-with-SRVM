function z=reg_z(n,k)

z=ones(1,n);

for i=1:(n/k)
    for j=1:k
        z((i-1)*k+j)=j;
    end
end
