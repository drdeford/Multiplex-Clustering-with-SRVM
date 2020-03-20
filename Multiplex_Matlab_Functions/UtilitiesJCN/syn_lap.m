%ws=full(adjacency(WattsStrogatz(100,4,.2)));
%er=full(adjacency(WattsStrogatz(100,4,.2)));
%ws=preferential_attachment(100,10);
%ws=edgeL2adj(ws);
%er=preferential_attachment(100,10);
%er=edgeL2adj(er);
ws=random_graph(100,.2);
er=random_graph(100,.5);%.4

%heterogenous vs. homogenous
p_vec=0:.01:1;

L_ws=make_lap(ws,100);
L_er=make_lap(er,100);
eig_ws=eig(L_ws);
sort(eig_ws);
ws_max=eig_ws(100);
eig_ws=eig_ws(2);%was 2
eig_er=eig(L_er);
sort(eig_er);
er_max=eig_er(100);
eig_er=eig_er(2);%was 2 




temp=zeros(100,100,2);
temp(:,:,1)=L_ws;
temp(:,:,2)=L_er;
D=make_D(temp ,100,2);

eig_vec=zeros(1,100);
for i=1:100
    C=simple_hier_C([p_vec(i),1-p_vec(i)],100,2);
    CD=C*D;
    %eig_CD=eig(CD);
    %sort(eig_CD);
    eig_CD=eigs(CD,99);
    eig_vec(i)=eig_CD(99);    %should this one be 2 too?  
end

plot([0:.01:.99],eig_vec,'*')


temp=zeros(100,100,2);
temp(:,:,1)=ws;
temp(:,:,2)=er;

ms=matched_sum(temp,100,2);
L_ms=make_lap(ms,200);
eig_ms=eig(L_ms);
sort(eig_ms);
eig_ms(2);
