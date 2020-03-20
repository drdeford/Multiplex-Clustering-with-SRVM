Tmatc=zeros(200,400);
Tmatd=zeros(200,400);

gapc=zeros(1,200);
gapd=zeros(1,200);

samec=zeros(1,200);
samed=zeros(1,200);

ind=0;

for t=.01:.01:3
    ind=ind+1;
    
    modularity_sbm_stability;
    
    
    [vc,~]=sort(real(eig(cont)));
    
        [vd,~]=sort(real(eig(disc)));
        
    gapc(ind)=vc(400)-vc(399);
        gapd(ind)=vd(400)-vd(399);

    

    Tc=vec_part_2(cont,n*k,1);
    Td=vec_part_2(disc,n*k,1);
    
    Tmatc(ind,:)=Tc;
    
    Tmatd(ind,:)=Td;

   
    
    
[countms,propc]=prop_same_cluster(Tc,n,k);

[countd_lap,propd]=prop_same_cluster(Td,n,k);
samec(ind)=propc;
samed(ind)=propd;
end


