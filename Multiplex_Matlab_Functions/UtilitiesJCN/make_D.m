function D=make_D(layer_mat,n,k)

%Input n x n x k matrix of dynamical operators
%Output nk x nk block diagonal operator

D=zeros(n*k);

for i=1:k
    D((i-1)*n+1:i*n,(i-1)*n+1:i*n)=layer_mat(:,:,i);
    
end

