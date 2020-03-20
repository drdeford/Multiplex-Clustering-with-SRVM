function layer_mat=sbm_layers(n,z,P)

layer_mat=zeros(n,n,2);
layer_mat(:,:,1)=gen_sbm(n,z,P);
layer_mat(:,:,2)=gen_sbm(n,z,P);