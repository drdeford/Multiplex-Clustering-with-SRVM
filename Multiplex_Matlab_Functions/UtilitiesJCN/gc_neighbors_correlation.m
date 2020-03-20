function C=gc_neighbors_correlation(layer_mat,n,k)
%input n x n x k layer matrix
%output C weighted by neighbor correlation
mix_vec=zeros(k,k,n);

for i=1:n
    for j=1:k
        for l=1:k
            a=corrcoef(layer_mat(i,:,j),layer_mat(i,:,l));
            mix_vec(j,l,i)=a(1,2);
        end
    end
end

for i=1:n
    for j=1:k
        mix_vec(:,j,i)=mix_vec(:,j,i)/sum(mix_vec(:,j,i));
    end
end

C=make_C(mix_vec,n,k);
