function s_hi=simple_hier_C(layer_ranks,n,k)

%input 1 x k layer rankings
%output: mix_vecs for hierarichal layer model

layer_weight=zeros(k);

for i=1:k
    layer_weight(i,:)=ones(1,k)*layer_ranks(i);
end

s_hi=hier_C(layer_weight,n,k);
