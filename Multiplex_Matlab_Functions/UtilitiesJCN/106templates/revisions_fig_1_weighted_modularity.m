n=100;
k=2;
p=.15;
clusters=2;
weight=1;
circle=1;

gs=zeros(n,n,k);
ds=zeros(n,n,k);
for i=1:k
    gs(:,:,i)=random_graph(n,p);
end

ms=matched_sum_w(gs,n,k,weight*ones(k,k));


D=make_D(gs,n,k);
C=equi_C(n,k);

CD=C*D;

D_adj=make_D(gs,n,k);
CD_adj=C*D_adj;

A_dyn=double(.5*(CD_adj+CD_adj')>0);

cd=zeros(1,n);

cms=zeros(1,n);

mods_d=newman_eigenvector_method(A_dyn);

mods_ms=newman_eigenvector_method(ms);

for j=1:length(mods_d)
for el=mods_d{j}
cd(el)=j;
end
end

for j=1:length(mods_ms)
for el=mods_ms{j}
cms(el)=j;
end
end


clusters_ms=length(mods_ms);
clusters_d=length(mods_d);

clusters=max(clusters_ms,clusters_d);

[countms,propms]=prop_same_cluster(cms,n,k);

[countd_lap,propd]=prop_same_cluster(cd,n,k);

propms
propd





%[intercutms,intracutms,prop_interms,prop_intrams,interwms]=count_cut(gs,cms,n,k,1);
%[intercutd,intracutd,prop_interd,prop_intrad,interwd]=count_cut(gs,cd,n,k,1);

draw_multi_modularity