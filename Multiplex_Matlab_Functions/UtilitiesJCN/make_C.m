function C=make_C(mix_vecs,n,k)

%mix_vecs is a k x k x n matrix where the 3rd dimension is indexed by nodes and
%the first two indices are indexed by layers

%output: C

C=zeros(n*k);

for i=1:k
    for j=1:k

        temp_vec=zeros(1,n);
        
        for l=1:n
            temp_vec(l)=mix_vecs(i,j,l);
        end
        
        C((i-1)*n+1:i*n,(j-1)*n+1:j*n)=diag(temp_vec);
    end
end

