function sbm_mat=gen_sbm(n,z,P)


sbm_mat=zeros(n);

for i = 1:n
    for j=1:n
        if rand() < P(z(i),z(j))
            sbm_mat(i,j)=1;
            sbm_mat(j,i)=1;
        end
    end
end
