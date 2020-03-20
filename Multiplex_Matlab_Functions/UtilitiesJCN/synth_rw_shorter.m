%ws=full(adjacency(WattsStrogatz(100,4,.2)));
%er=random_graph(100,.3);
%ab=preferential_attachment(100,8);
%ab=edgeL2adj(ab);

multi=zeros(25,25,100);
rw_multi=zeros(25,25,100);

eq_eig_vec=zeros(1,100);
ms_eig_vec=zeros(1,100);
agg_eig_vec=zeros(1,100);
hier_eig_vec=zeros(1,100);
un_eig_vec=zeros(1,100);
gc_eig_vec=zeros(1,100);

for i =1:100
    %multi(:,:,i)=random_graph(25,.4*rand()+.3);
    %multi(:,:,i)=edgeL2adj(preferential_attachment(25,3));
    multi(:,:,i)=full(adjacency(WattsStrogatz(25,3,.2)));
    rw_multi(:,:,i)=make_rw_l(multi(:,:,i),25);
end
   

for i=1:100
ms=matched_sum(multi(:,:,1:i),25,i);
ms_rw=make_rw_l(ms,25*i);
temp=eigs(ms_rw,2);
ms_eig_vec(i)=temp(2);
end

for i=1:100
agg=aggregate(multi(:,:,1:i),25,i);
ms_agg=make_rw_l(agg,25);
temp=eigs(ms_agg,2);
agg_eig_vec(i)=temp(2);
end

for i=1:100
    D=make_D(rw_multi(:,:,1:i),25,i);
    C=equi_C(25,i);
    temp=eigs(C*D,2);
    eq_eig_vec(i)=temp(2);  
    i
end



for i=1:100
    D=make_D(rw_multi(:,:,1:i),25,i);
    C=hier_density(multi(:,:,1:i),25,i);
    temp=eigs(C*D,2);
    hier_eig_vec(i)=temp(2);  
    i
end



for i=1:100
    D=make_D(rw_multi(:,:,1:i),25,i);
    C=un_degree(multi(:,:,1:i),25,i);
    temp=eigs(C*D,2);
    un_eig_vec(i)=temp(2);  
    i
end



for i=1:100
    D=make_D(rw_multi(:,:,1:i),25,i);
    C=gc_common_neighbors(multi(:,:,1:i),25,i);
    temp=eigs(C*D,2);
    gc_eig_vec(i)=temp(2);  
    i
end

subplot(3,2,1)
plot(abs(ms_eig_vec),'*')
subplot(3,2,2)
plot(abs(agg_eig_vec),'*')
subplot(3,2,3)
plot(abs(eq_eig_vec),'*')
subplot(3,2,4)
plot(abs(hier_eig_vec),'*')
subplot(3,2,5)
plot(abs(un_eig_vec),'*')
subplot(3,2,6)
plot(abs(gc_eig_vec),'*')
%subplot(3,3,7)
%plot(separate_layers,vgcnc,'*')
%subplot(3,3,8)
%plot(separate_layers,vgcr,'*')
%subplot(3,3,9)
%plot(separate_layers,vms,'*')
%subplot(3,3,5)
%imagesc(corrcoef([transpose(separate_layers),veq,vhd,vund,vgccn,vms])) 
%colorbar

