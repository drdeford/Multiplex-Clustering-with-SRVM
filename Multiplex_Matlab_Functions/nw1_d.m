function nw1=nw1_d(layer_mat)

%Input n x n x k matrix of layers
%Output nk x nk node weight distributed matrix

sizes=size(layer_mat);
n=sizes(2);
k=sizes(3);

D=multi_adj(layer_mat);


n_vec=zeros(1,n*k);

for i=1:k
    n_vec((i-1)*n+1:i*n)=layer_mat(i)*ones(n,1);
end

n_mat=zeros(n,k);

for i=1:k
    for j=1:n
        n_mat(i,j)=n_vec((i-1)*n+j);
    end
end

for i=1:n
    n_mat(i,:)=n_mat(i,:)/sum(n_mat(i,:));
end

pre_c=zeros(n,n*k);

for i=1:k
    pre_c(:,(i-1)*n+1:i*n)=diag(n_mat(:,i));
end

C=zeros(n*k,n*k);

for i=1:k
    C((i-1)*n+1:i*n,:)=pre_c;
end


nw1=C*D;