function lw1=lw1_d(layer_mat)

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




