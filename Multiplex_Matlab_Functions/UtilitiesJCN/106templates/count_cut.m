function [inter,intra,prop_inter,prop_intra,interw]=count_cut(layer_mat,v,n,k,w)



intra=0;

for i=1:k
    for j=1:n
        for ell=1:n
            if layer_mat(j,ell,i)==1
                if v(j+(i-1)*n)~=v(ell+(i-1)*n)
                    intra=intra+1;
                end
            end
        end
    end
end

prop_intra=intra/(sum(sum(sum(layer_mat))));
[count,prop]=prop_same_cluster(v,n,k);
inter=n*nchoosek(k,2)-count;
prop_inter=1-prop;
interw=inter*w;