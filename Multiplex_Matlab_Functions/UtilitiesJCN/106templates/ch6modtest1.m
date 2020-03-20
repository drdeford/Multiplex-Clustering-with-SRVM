
its=5;

prop2ms=zeros(5,50,its);
prop2d=zeros(5,50,its);
propkms=zeros(5,50,its);
propkd=zeros(5,50,its);

mod2ms=zeros(5,50,its);
mod2d=zeros(5,50,its);
modkms=zeros(5,50,its);
modkd=zeros(5,50,its);


n=100;
%k=6;
%p=.1;
%clusters=2;
weight=1;
circle=1;

for y=1:its
    y
tempi=0;
for k=2:6
    tempi=tempi+1;
    tempj=0;

    for p=.01:.01:.5
    tempj=tempj+1;
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


%this is the part where you compute the T's

B_ms=ms-B_ms;
B_d=A_dyn-B_d;

%Tms2=double(eigs(B_ms,1)>0)+1; other should work fine
%Td2=double(eigs(B_d,1)>0)+1;


Tms2=vec_part_2(B_ms,n*k,1);
Td2=vec_part_2(B_d,n*k,1);


Tmsk=vec_part_2(B_ms,n*k,k-1);
Tdk=vec_part_2(B_d,n*k,k-1);



[countms2,propms2]=prop_same_cluster(Tms2,n,k);

[countd_lap2,propd2]=prop_same_cluster(Td2,n,k);


[countmsk,propmsk]=prop_same_cluster(Tmsk,n,k);

[countd_lapk,propdk]=prop_same_cluster(Tdk,n,k);


prop2ms(tempi,tempj,y)=propms2;
prop2d(tempi,tempj,y)=propd2;
propkms(tempi,tempj,y)=propmsk;
propkd(tempi,tempj,y)=propdk;

mod2ms(tempi,tempj,y)=modularity_metric(T_to_mods(Tms2),ms);
mod2d(tempi,tempj,y)=modularity_metric(T_to_mods(Td2),A_dyn);
modkms(tempi,tempj,y)=modularity_metric(T_to_mods(Tmsk),ms);
modkd(tempi,tempj,y)=modularity_metric(T_to_mods(Tdk),A_dyn);


end
end
end

