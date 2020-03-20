function C=un_degree(layer_mat,n,k)
%input 
%output C unified node weighted by degree

node_ranks=zeros(k,n);

for i=1:n
    a=zeros(k,1);
    for j=1:k
        temp=layer_mat(:,:,j)*ones(n,1);
        a(j)=temp(i);
    end
        
    node_ranks(:,i)=a/sum(a);
end


C=uni_node(node_ranks,n,k);

