 %g1=random_graph(10,.3);
 %g2=random_graph(10,.3);
 g1=edgeL2adj(preferential_attachment(10,2));
  g2=edgeL2adj(preferential_attachment(10,2));

 
  %z=zeros(1,100);
  %z(1:50)=2*ones(1,50);
  %z(51:100)=ones(1,50);
  %P=[.2,.01;.01,.2];
  %g1=gen_sbm(100,z,P);
  %g2=gen_sbm(100,z,P);
  
  
  g=zeros(10,10,2);
    g(:,:,1)=make_lap(g1,10);
    g(:,:,2)=make_lap(g2,10);
    
    match=zeros(1,101);
    v_mat=zeros(20,101);
    for i=1:101
        c=(i-1)/100;
        D=make_D(g,10,2);
        C=[c*eye(10) c*eye(10);(1-c)*eye(10) (1-c)*eye(10)];
        CD=C*D;
        [V,D]=eig(CD);
        v=real(V(:,19));
        v=double(v>0);
        v_mat(:,i)=v;
   if     mod(i-1,20)==0 
       c;
           figure
    colormap(jet)
    subplot(2,1,1);
   p=plot(graph(g1),'NodeCData',v(1:10) ,'MarkerSize',10);
   x=p.XData;
   y=p.YData;
   subplot(2,1,2);
   plot(graph(g2),'NodeCData',v(11:20),'MarkerSize',10,'Xdata',x,'YData',y);
   end    
   
   for j=1:10
            if v(j)==v(j+10)
                match(i)=match(i)+1;
            end
        end
    end
    
 ris=zeros(101);
 for i=1:101
     for j=1:101
         ris(i,j)=RandIndex(1+v_mat(:,i),1+v_mat(:,j));
     end
 end
 figure 
 imagesc(ris-eye(101))
 colorbar