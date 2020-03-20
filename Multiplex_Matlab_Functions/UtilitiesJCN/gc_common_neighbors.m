function C=gc_common_neighbors(layer_mat,n,k)
%input n x n x k layer matrix
%output C weighted by #common neighbors
mix_vec=zeros(k,k,n);

for i=1:n
    for j=1:k
        for l=1:k
            mix_vec(j,l,i)=dot(layer_mat(i,:,j),layer_mat(i,:,l));
        end
    end
end

for i=1:n
    for j=1:k
        mix_vec(:,j,i)=mix_vec(:,j,i)/sum(mix_vec(:,j,i));
    end
end

C=make_C(mix_vec,n,k);
