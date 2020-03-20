function C=hier_density(layer_mat,n,k)
%input 
%output


a=zeros(1,k);
for i=1:k
    a(i)=ones(1,n)*layer_mat(:,:,i)*ones(n,1);
end

a=a/sum(a);

C=simple_hier_C(a,n,k);