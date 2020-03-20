n=100;
k=4;
p=.1*ones(1,10);%[.1,.2,.3,.4];%.1*ones(1,k);
clusters=2;
weight=10;%1/k %tostart
circle=1;

gs=zeros(n,n,k);
ds=zeros(n,n,k);

bs=zeros(n,n,k);
for i=1:k
    gs(:,:,i)=random_graph(n,p(i));
    bs(:,:,i)=make_mod(gs(:,:,i),n);
end


ranks=zeros(1,k);

for i=1:k
    ranks(i)=sum(sum(gs(:,:,i)));
end

ranks=ranks/sum(ranks);

ms=matched_sum_w(bs,n,k,weight*ones(k,k));

D=make_D(bs,n,k);

C=simple_hier_C(ranks,n,k);

CD=C*D;


cd=zeros(1,n);

cms=zeros(1,n);





Tms2=vec_part_2(ms,n*k,1);
Td2=vec_part_2(CD,n*k,1);


Tmsk=vec_part_2(ms,n*k,k-1);
Tdk=vec_part_2(CD,n*k,k-1);


[countms2,propms2]=prop_same_cluster(Tms2,n,k);

[countd_lap2,propd2]=prop_same_cluster(Td2,n,k);

[countmsk,propmsk]=prop_same_cluster(Tmsk,n,k);

[countd_lapk,propdk]=prop_same_cluster(Tdk,n,k);

cd=Td2;

cms=Tms2;

%propd

%propms

clusters=max(max(Tmsk),max(Tdk));




%[intercutms,intracutms,prop_interms,prop_intrams,interwms]=count_cut(gs,cms,n,k,1);
%[intercutd,intracutd,prop_interd,prop_intrad,interwd]=count_cut(gs,cd,n,k,1);

draw_multi_modularity