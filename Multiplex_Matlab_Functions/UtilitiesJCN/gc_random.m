function C=gc_random(layer_mat,n,k)
%input n x n x k layer matrix
%output C weighted by neighbor correlation
mix_vec=rand(k,k,n);

for i=1:n
    for j=1:k
        mix_vec(:,j,i)=mix_vec(:,j,i)/sum(mix_vec(:,j,i));
    end
end

C=make_C(mix_vec,n,k);
