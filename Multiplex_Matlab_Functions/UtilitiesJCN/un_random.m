function C=un_random(layer_mat,n,k)
%input 
%output

node_ranks=zeros(k,n);

for i=1:n
    a=rand(k,1);
    node_ranks(:,i)=a/sum(a);
end


C=uni_node(node_ranks,n,k);