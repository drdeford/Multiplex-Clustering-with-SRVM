function anw=arbitrary_nw_d(layer_mat,n_mat)

%Input n x n x k matrix of layers and n x k matrix of node weights
%Output nk x nk node weight distributed matrix

sizes=size(layer_mat);
n=sizes(2);
k=sizes(3);

D=multi_adj(layer_mat);



pre_c=zeros(n,n*k);

for i=1:k
    pre_c(:,(i-1)*n+1:i*n)=diag(n_mat(:,i));
end

C=zeros(n*k,n*k);

for i=1:k
    C((i-1)*n+1:i*n,:)=pre_c;
end


anw=C*D;