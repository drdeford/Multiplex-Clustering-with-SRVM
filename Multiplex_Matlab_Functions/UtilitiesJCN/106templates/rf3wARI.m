function [rmatms,rmatd]=rf3wARI(n,k,P,clusters,weights,prime_layer,cs,cstarts)

%n=100;
%k=2;
%num_sbm=2;
%P=[.5,.01;0.01,.5];
%clusters=4;
%weight=10;
%layer1weight=.5;
%cstarts=[1,26];

num_weights=size(weights);
num_weights=num_weights(2);
num_cs=size(cs);
num_cs=num_cs(2);


z=ones(k,n);

for i=1:k
    z(i,cstarts(i):cstarts(i)+n/2-1)=2*ones(1,n/2);
end


%z(1,1:n/2)=2*ones(1,n/2);
%for i=1:k
%    z(i,(i-1)*n/(2*k)+1:((i-1)*n/(2*k))+n/k)=2*ones(1,n/k);
%    
%end


    

gs=zeros(n,n,k);
ds=zeros(n,n,k);
for i=1:k
    gs(:,:,i)=gen_sbm_new(n,z(i,:),P);
    ds(:,:,i)=make_lap(gs(:,:,i),n);
end

%D=make_D(ds,n,k);
D=make_D(gs,n,k);

cd=zeros(num_cs,n*k);
cms=zeros(num_weights,n*k);


for y=1:num_cs
    layer1weight=cs(y);

cvec=zeros(1,k);
cvec(prime_layer)=layer1weight;

for i=1:k
    if i~=prime_layer
        cvec(i)=(1-layer1weight)/(k-1);
    end
end

C=simple_hier_C(cvec,n,k);
CD=C*D;
CD=.5*(CD+CD');
%[vms,dms]=eigs(ms_lap,n*k-1,'lm');



[vd,dd]=eigs(CD,n*k-1,'lm');

if ~issorted(diag(dd))
    %%[V,D] = eig(A);
    [dd,I] = sort(diag(dd),'descend');
    vd = vd(:, I);
end

%if ~issorted(diag(dms))
    %%[V,D] = eig(A);
%    [dms,I] = sort(diag(dms),'descend');
%    vms = vms(:, I);
%end

if clusters >2
%Xms=vms(:, n*k-clusters:n*k-1);
Xd=vd(:,n*k-clusters:n*k-1);


%cms=kmeans(Xms,clusters);
cd(y,:)=kmeans(Xd,clusters);

%[countms,propms]=prop_same_cluster(cms,n,k);
%[countd,propd]=prop_same_cluster(cd,n,k);

%propms
%propd

end

if clusters==2

    
%Xms=vms(:,n*k-1);
Xd=vd(:,n*k-1);


%cms=1+double(Xms>0);
cd(y,:)=1+double(Xd>0);

%cms=kmeans(Xms,clusters);
%cd=kmeans(Xd,clusters);

%[countms,propms]=prop_same_cluster(cms,n,k);
%[countd,propd]=prop_same_cluster(cd,n,k);

%propms
%propd

end
end


for y=1:num_weights

 ms=matched_sum_w(gs,n,k,weights(y)*ones(k,k));

ms_lap=make_lap(ms,n*k);



[vms,dms]=eigs(ms_lap,n*k-1,'lm');



[vd,dd]=eigs(CD,n-1,'lm');

if ~issorted(diag(dd))
    %%[V,D] = eig(A);
    [dd,I] = sort(diag(dd),'descend');
    vd = vd(:, I);
end

if ~issorted(diag(dms))
    %%[V,D] = eig(A);
    [dms,I] = sort(diag(dms),'descend');
    vms = vms(:, I);
end

if clusters >2
Xms=vms(:, n*k-clusters:n*k-1);
Xd=vd(:,n-clusters:n-1);


cms(y,:)=kmeans(Xms,clusters);
%cd(i,:)=kmeans(Xd,clusters);

%[countms,propms]=prop_same_cluster(cms,n,k);
%[countd,propd]=prop_same_cluster(cd,n,k);

%propms
%propd

end

if clusters==2

    
Xms=vms(:,n*k-1);
%Xd=vd(:,n-1);


cms(y,:)=1+double(Xms>0);
%cd(i,:)=1+double(Xd>0);

%cms=kmeans(Xms,clusters);
%cd=kmeans(Xd,clusters);

%[countms,propms]=prop_same_cluster(cms,n,k);
%[countd,propd]=prop_same_cluster(cd,n,k);

%propms
%propd

end
end
%[intercutms,intracutms,prop_interms,prop_intrams,interwms]=count_cut(gs,cms,n,k,weight);
%[intercutd,intracutd,prop_interd,prop_intrad,interwd]=count_cut(gs,cd,n,k,weight);

%draw_multi_f(n,k,gs,cd,cms,circle) 

rmatms=zeros(num_weights);
rmatd=zeros(num_cs);

for i=1:num_weights
    for j=1:num_weights
        rmatms(i,j)=RandIndex(cms(i,:),cms(j,:));
    end
end


for i=1:num_cs
    for j=1:num_cs
        rmatd(i,j)=RandIndex(cd(i,:),cd(j,:));
    end
end
