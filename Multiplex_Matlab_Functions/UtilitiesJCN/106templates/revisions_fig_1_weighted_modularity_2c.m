n=100;
k=4;
p=.1;
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


[cms,~]=eigs(B_ms,1);


[cd,~]=eigs(B_d,1);
cms=double(cms>0)+1;


cd=double(cd>0)+1;



[countms,propms]=prop_same_cluster(cms,n,k);

[countd_lap,propd]=prop_same_cluster(cd,n,k);

propms
propd





%[intercutms,intracutms,prop_interms,prop_intrams,interwms]=count_cut(gs,cms,n,k,1);
%[intercutd,intracutd,prop_interd,prop_intrad,interwd]=count_cut(gs,cd,n,k,1);

draw_multi_modularity