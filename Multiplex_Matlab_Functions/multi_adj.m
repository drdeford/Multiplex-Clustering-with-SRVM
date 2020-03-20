function D_adj=multi_adj(layer_mat)

%Input n x n x k matrix of layers
%Output nk x nk block diagonal adjacency matrix

sizes=size(layer_mat);
n=sizes(2);
k=sizes(3);


D_adj=zeros(n*k);

for i=1:k
    D_adj((i-1)*n+1:i*n,(i-1)*n+1:i*n)=layer_mat(:,:,i);
    
end

