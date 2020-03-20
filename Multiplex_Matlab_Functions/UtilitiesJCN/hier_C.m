function hi=hier_C(layer_weight,n,k)

%input: k x k vector of layer weights
%output: mix_vecs for hierarichal layer model

hi=zeros(k,k,n);

for i=1:n
    hi(:,:,i)=layer_weight;
end

hi=make_C(hi,n,k);
    
        
        
        