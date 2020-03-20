n=100;
k=10;
%p=.1;
num_sbm=2;
P=[.1,.05;.05,.1];
clusters=2;
weight=1;
circle=1;

z=zeros(1,n);
for i=1:num_sbm
    z((i-1)*n/num_sbm +1:i*n/num_sbm)=i*ones(1,n/num_sbm);
end
    %z(1:n/2)=ones(1,n/2);
%z(n/2 +1:n)=2*ones(1,n/2);


gs=zeros(n,n,k);
ds=zeros(n,n,k);
for i=1:k
    gs(:,:,i)=gen_sbm_new(n,z,P);
    %ds(:,:,i)=make_lap(gs(:,:,i),n);
end


ms=matched_sum_w(gs,n,k,weight*ones(k,k));


D=make_D(gs,n,k);
C=equi_C(n,k);

CD=C*D;

D_adj=make_D(gs,n,k);
CD_adj=C*D_adj;

A_dyn=.5*(CD_adj+CD_adj');

cd=zeros(1,n);

cms=zeros(1,n);


B_ms=zeros(n*k);
degs_ms=ms*ones(n*k,1);


B_d=zeros(n*k);
degs_d=A_dyn*ones(n*k,1);


sum_d=sum(degs_d);
sum_ms=sum(degs_ms);

for i=1:n*k
    for j=1:n*k
        B_ms(i,j)=degs_ms(i)*degs_ms(j)/(sum_ms);
        B_d(i,j)=degs_d(i)*degs_d(j)/(sum_d);
    end
end

B_ms=ms-B_ms;
B_d=A_dyn-B_d;



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


%propd

%propms





%[intercutms,intracutms,prop_interms,prop_intrams,interwms]=count_cut(gs,cms,n,k,1);
%[intercutd,intracutd,prop_interd,prop_intrad,interwd]=count_cut(gs,cd,n,k,1);

draw_multi_modularity