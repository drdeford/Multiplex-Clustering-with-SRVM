function ms=matched_sum(layer_mat,n,k)

%Input n x n x k matrix of layers
%Output nk x nk block adjacency matrix of matched sum



ms=make_D(layer_mat,n,k);

for i=1:k
    for j=1:k
        if i~=j
            ms((i-1)*n+1:i*n,(j-1)*n+1:j*n)=eye(n);
        end
    end
end
