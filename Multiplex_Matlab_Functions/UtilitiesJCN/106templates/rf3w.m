function [propms,propd_lap]=rf3w(n,k,num_sbm,P,clusters,weight,prime_layer,layer1weight,cstarts,circle)

%n=100;
%k=2;
%num_sbm=2;
%P=[.5,.01;0.01,.5];
%clusters=4;
%weight=10;
%layer1weight=.5;
%cstarts=[1,26];





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

ms=matched_sum_w(gs,n,k,weight*ones(k,k));

ms_lap=make_lap(ms,n*k);

D=make_D(ds,n,k);

cvec=zeros(1,k);
cvec(prime_layer)=layer1weight;

for i=1:k
    if i~=prime_layer
        cvec(i)=(1-layer1weight)/(k-1);
    end
end

C=simple_hier_C(cvec,n,k);
CD=C*D;

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

D_adj=make_D(gs,n,k);
CD_adj=C*D_adj;
D_lap=make_lap(.5*(CD_adj+CD_adj'),n*k);
[vd_lap,dd_lap]=eigs(D_lap,n*k-1);

if ~issorted(diag(dd_lap))
    %%[V,D] = eig(A);
    [dd_lap,I] = sort(diag(dd_lap),'descend');
    vd_lap = vd_lap(:, I);
end

if clusters >2
Xms=vms(:, n*k-clusters:n*k-1);
Xd=vd(:,n-clusters:n-1);
Xd_lap=vd_lap(:,n*k-clusters:n*k-1);

cms=kmeans(Xms,clusters);
cd=kmeans(Xd,clusters);
cd_lap=kmeans(Xd_lap,clusters);


[countms,propms]=prop_same_cluster(cms,n,k);
[countd,propd]=prop_same_cluster(cd,n,k);
[countd_lap,propd_lap]=prop_same_cluster(cd_lap,n,k);

%propms
%propd
%propd_lap
end

if clusters==2

    
Xms=vms(:,n*k-1);
Xd=vd(:,n-1);
Xd_lap=vd_lap(:,n*k-1);

cms=1+double(Xms>0);
cd=1+double(Xd>0);
cd_lap=1+double(Xd_lap>0);
%cms=kmeans(Xms,clusters);
%cd=kmeans(Xd,clusters);

[countms,propms]=prop_same_cluster(cms,n,k);
[countd,propd]=prop_same_cluster(cd,n,k);
[countd_lap,propd_lap]=prop_same_cluster(cd_lap,n,k);

%propms
%propd
%propd_lap

end
%draw_multi_f(n,k,gs,cd,cms,circle) 