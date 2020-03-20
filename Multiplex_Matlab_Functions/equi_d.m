function eq=equi_d(layer_mat)

%Input n x n x k matrix of layers
%Output nk x nk equidistributed matrix

sizes=size(layer_mat);
n=sizes(2);
k=sizes(3);

D=multi_adj(layer_mat);

id_vec=zeros(n,n*k);

for i=1:k
    id_vec(:,(i-1)*n+1:i*n)=eye(n);
    
end

C=matched_sum(make_multi(id_vec));

C=C/k;

eq=C*D;