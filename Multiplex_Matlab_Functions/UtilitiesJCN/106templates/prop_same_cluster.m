function [count, prop]=prop_same_cluster(v,n,k)

%determine the proportion of node copies placed in the same cluster

count=0;
denom=n*nchoosek(k,2);
for i =1:n
    for j=1:k
        for ell=1:k
            if j <ell
                if v(i+(j-1)*n)==v(i+(ell-1)*n)
                    count=count+1;
                end
            end
        end
    end
end

prop=count/denom;