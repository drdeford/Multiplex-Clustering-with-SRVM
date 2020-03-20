function D_lap=multi_lap(layer_mat)

%Input n x n x k matrix of layers
%Output nk x nk block diagonal Laplcian matrices

sizes=size(layer_mat);
n=sizes(2);
k=sizes(3);


D_lap=zeros(n*k);

for i=1:k
    D_lap((i-1)*n+1:i*n,(i-1)*n+1:i*n)=make_lap(layer_mat(:,:,i));
    
end

