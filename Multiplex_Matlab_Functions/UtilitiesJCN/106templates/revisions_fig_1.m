n=100;
k=6;
p=.1;
clusters=2;

gs=zeros(n,n,k);
ds=zeros(n,n,k);

for i=1:k
    gs(:,:,i)=random_graph(n,p);
    ds(:,:,i)=make_lap(gs(:,:,i),n);
end

ms=matched_sum(gs,n,k);

ms_lap=make_lap(ms,n*k);



D=make_D(ds,n,k);

C=equi_C(n,k);

CD=C*D;




[vms,dms]=eigs(ms_lap,n*k-1);
[vd,dd]=eigs(CD,n-1);

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

propms
propd
propd_lap
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

propms
propd
propd_lap

end

%[intercutms,intracutms,prop_interms,prop_intrams,interwms]=count_cut(gs,cms,n,k,1);
%[intercutd,intracutd,prop_interd,prop_intrad,interwd]=count_cut(gs,cd,n,k,1);

draw_multi