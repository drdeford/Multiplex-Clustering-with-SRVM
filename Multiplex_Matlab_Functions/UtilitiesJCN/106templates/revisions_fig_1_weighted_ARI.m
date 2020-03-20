n=100;
k=5;
p=.05;
clusters=2;
weight=.1:.1:5;
num_weights=size(weight);
num_weights=num_weights(2);



gs=zeros(n,n,k);
%ds=zeros(n,n,k);
for i=1:k
    gs(:,:,i)=random_graph(n,p);
    %ds(:,:,i)=make_lap(gs(:,:,i),n);
end

mss=zeros(n*k,n*k,num_weights);
mss_laps=zeros(n*k,n*k,num_weights);

cms=zeros(num_weights,n*k);
for i=1:num_weights

mss(:,:,i)=matched_sum_w(gs,n,k,weight(i)*ones(k,k));
mss_laps(:,:,i)=make_lap(mss(:,:,i),n*k);
[vms,dms]=eigs(mss_laps(:,:,i),n*k-1);
 


if ~issorted(diag(dms))
    %%[V,D] = eig(A);
    [dms,I] = sort(diag(dms),'descend');
    vms = vms(:, I);
end


Xms=vms(:, n*k-clusters:n*k-1);

cms(i,:)=kmeans(Xms,clusters);

end

rvec=zeros(1,num_weights-1);

for i=1:num_weights-1;
rvec(i)=RandIndex(cms(i,:),cms(i+1,:));
end

rmat=zeros(num_weights);

for i=1:num_weights
    for j=1:num_weights
        rmat(i,j)=RandIndex(cms(i,:),cms(j,:));
    end
end


