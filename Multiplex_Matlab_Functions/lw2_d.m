function lw2=lw2_d(layer_mat)

%Input n x n x k matrix of layers
%Output nk x nk layer weight distributed matrix

sizes=size(layer_mat);
n=sizes(2);
k=sizes(3);

D=multi_adj(layer_mat);

lay_vec=zeros(1,k);

for i=1:k
    lay_vec(i)=ones(1,n)*layer_mat(:,:,i)*ones(n,1);
    
end

lay_vec=lay_vec/sum(lay_vec);

id_vec=zeros(n,n*k);

for i=1:k
    id_vec(:,(i-1)*n+1:i*n)=lay_vec(i)*eye(n);
    
end

C=zeros(n*k,n*k);

for i=1:k
    C(:,(i-1)*n+1:i*n)=id_vec';
end

lw2=C*D;


