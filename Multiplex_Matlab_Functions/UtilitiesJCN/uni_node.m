function un=uni_node(node_ranks,n,k)

%input: k x n node rankings
%output: C for unified node
un=zeros(k,k,n);

for i=1:n
    for j=1:k
        un(:,j,i)=node_ranks(:,i);
    end
end



un=make_C(un,n,k);

