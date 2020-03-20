n=100;
k=4;
%p=.1;
num_sbm=2;
P=[.2,.05;.05,.2];
clusters=2;
weight=1/k;
circle=1;

z=zeros(1,n);
for i=1:num_sbm
    z((i-1)*n/num_sbm +1:i*n/num_sbm)=i*ones(1,n/num_sbm);
end
    %z(1:n/2)=ones(1,n/2);
%z(n/2 +1:n)=2*ones(1,n/2);


gs=zeros(n,n,k);
ds=zeros(n,n,k);
bs=zeros(n,n,k);

for i=1:k
    gs(:,:,i)=gen_sbm_new(n,z,P);
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


Tmsk=vec_part_2(ms,n*k,k);
Tdk=vec_part_2(CD,n*k,k);


[countms2,propms2]=prop_same_cluster(Tms2,n,k);

[countd_lap2,propd2]=prop_same_cluster(Td2,n,k);

[countmsk,propmsk]=prop_same_cluster(Tmsk,n,k);

[countd_lapk,propdk]=prop_same_cluster(Tdk,n,k);

cd=Tdk;

cms=Tmsk;

%propd

%propms

clusters=max(max(Tmsk),max(Tdk));




%[intercutms,intracutms,prop_interms,prop_intrams,interwms]=count_cut(gs,cms,n,k,1);
%[intercutd,intracutd,prop_interd,prop_intrad,interwd]=count_cut(gs,cd,n,k,1);

draw_multi_modularity