geom_edges
geom_adj=zeros(7343);
for i=1:11898
geom_adj(g_edges(i,1),g_edges(i,2))=g_edges(i,3);
geom_adj(g_edges(i,2),g_edges(i,1))=g_edges(i,3);
end

data=geom_adj;
data( ~any(data,2), : ) = [];
data( :, ~any(data,1) ) = [];

unw=adj2simple(data);
g_unw=giant_component(unw);
g_data=giant_component(data);


for i=1:10308
cc_adj(cc_edges(i,1),cc_edges(i,2))=cc_edges(i,3);
cc_adj(cc_edges(i,2),cc_edges(i,1))=cc_edges(i,3);
end

for i=1:226
    cc_adj(i,i)=0;
end


quiver(zeros(1,3621),zeros(1,3621),X(1,:),X(2,:))

plot3(Y(1,:),Y(2,:),Y(3,:),'B*')

sbm1=gen_multi_sbm(3621,[1:3621],X10'*X10);