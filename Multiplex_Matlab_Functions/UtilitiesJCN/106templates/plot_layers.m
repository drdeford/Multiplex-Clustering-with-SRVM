z=zeros(1,100);
z(1:50)=2*ones(1,50);
z(51:100)=ones(1,50);
P=[.2,.01;.01,.2];
g1=gen_sbm(100,z,P);
g2=gen_sbm(100,z,P);


colormap(jet)
    subplot(2,1,1);
   p=plot(graph(g1),'MarkerSize',10);
   x=p.XData;
   y=p.YData;
   subplot(2,1,2);
   plot(graph(g2),'MarkerSize',10,'Xdata',x,'YData',y);