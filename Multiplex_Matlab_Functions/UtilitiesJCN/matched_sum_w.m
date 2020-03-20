function ms=matched_sum_w(layers,n,k,w)



ms=make_D(layers,n,k);

for i=1:k
    for j=1:k
        if i~=j
            ms((i-1)*n+1:i*n,(j-1)*n+1:j*n)=w(i,j)*eye(n);
        end
    end
end
