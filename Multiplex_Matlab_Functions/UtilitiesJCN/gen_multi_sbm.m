function sbm_mat=gen_multi_sbm(n,z,P)


sbm_mat=zeros(n);

parfor i = 1:n
    for j=1:n
        if i<j
        temp=poissrnd( max(P(z(i),z(j)),0));
            sbm_mat(i,j)=temp;
            %sbm_mat(j,i)=temp;
        end
    end
end

sbm_mat=sbm_mat+sbm_mat';


