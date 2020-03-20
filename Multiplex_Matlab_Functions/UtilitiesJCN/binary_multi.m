function oa=binary_multi(layers,n,k,w)

oa=zeros(n*k);


for i=1:k
    for j=1:k
        if i~=j
            oa((i-1)*n+1:i*n,(j-1)*n+1:j*n)=layers(:,:,i)+layers(:,:,j);
        end
        if i==j
            oa((i-1)*n+1:i*n,(j-1)*n+1:j*n)=layers(:,:,i);
        end
        
    end
end

oa=double((oa>0));

for i=1:k
    for j=1:k
        oa((i-1)*n+1:i*n,(j-1)*n+1:j*n)=w(i,j)*oa((i-1)*n+1:i*n,(j-1)*n+1:j*n);
    end
end



