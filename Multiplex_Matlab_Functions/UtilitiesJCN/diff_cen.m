function rank_vec=diff_cen(CD,n,k,q,T)

temp_mat=zeros(n*k);

for i=1:T
    temp_mat=temp_mat+ (q*CD)^i;
end

rank_vec=temp_mat*ones(n*k,1);




