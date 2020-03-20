function ms=matched_sum(layer_mat)

%Input n x n x k matrix of layers
%Output nk x nk block adjacency matrix of matched sum

sizes=size(layer_mat);

n=sizes(1);
k=sizes(3);

ms=multi_adj(layer_mat);

for i=1:k
    for j=1:k
        if i~=j
            ms((i-1)*n+1:i*n,(j-1)*n+1:j*n)=eye(n);
        end
    end
end


