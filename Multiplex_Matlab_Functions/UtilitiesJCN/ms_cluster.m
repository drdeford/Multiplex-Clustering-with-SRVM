function [V,D,match,stress,AR,RI,MI,HI]=ms_cluster(layer_mat,n,num_vec,num_k,p)


layer_mat=zeros(n,n,2);
layer_mat(:,:,1)=random_graph(n,p);
layer_mat(:,:,2)=layer_mat(:,:,1);
layer_mat(:,:,2)=random_graph(n,p);
%layer_mat=zeros(100,100,2);
%layer_mat(:,:,1)=edgeL2adj(preferential_attachment(100,10*p));
%layer_mat(:,:,2)=edgeL2adj(preferential_attachment(100,10*p));
ms=matched_sum(layer_mat,n,2);

%lap_ms=make_lap(ms,2*n);
lap_ms=make_sym_lap(ms,2*n);

[V,D]=eigs(lap_ms,2*n-1);

cl_mat=zeros(2*n,num_vec);

for i=1:num_vec
    cl_mat(:,i)=V(:,2*n-i);
end

idx=kmeans(cl_mat,num_k);
cmap=hsv;
figure;
temp=2;
if num_vec==2
for i =1:num_k
    plot(cl_mat(idx==i,1),cl_mat(idx==i,2),'*','Color',cmap(temp,:),'Markersize',12)
    hold on
    temp=(temp+10) ;
end
end
if num_vec>2
    for i =1:num_k
    plot3(cl_mat(idx==i,1),cl_mat(idx==i,2),cl_mat(idx==i,3),'*','Color',cmap(temp,:),'Markersize',12)
    hold on
    temp=(temp+10) ;
end
end
    
    match=0;
    stress=0;
for i=1:n 
    if idx(i)==idx(i+n);
        match=match+1;
    end
    stress=stress+norm(cl_mat(i,:)-cl_mat(n+i,:));
end


    

[AR,RI,MI,HI]=RandIndex(idx(1:n),idx(n+1:2*n));
