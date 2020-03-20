 %g1=random_graph(100,.2);
 %g2=random_graph(100,.2);

 z=zeros(1,100);
  z(1:50)=ones(1,50);
  z(51:100)=2*ones(1,50);
  z1=zeros(1,100);
  z1(1:50)=2*ones(1,50);
  z1(51:100)=ones(1,50);
  P=[.8,.01;.01,.8];
  g1=gen_sbm(100,z1,P);
 g2=gen_sbm(100,z,P);
  for i=1:100
      g1(i,i)=0;
      g2(i,i)=0;
  end
%    g1=random_graph(100,.2);
 %g2=random_graph(100,.2);
  %g1=edgeL2adj(preferential_attachment(100,2));
  %g2=edgeL2adj(preferential_attachment(100,2));

 
  g=zeros(100,100,2);
    g(:,:,1)=make_lap(g1,100);
    g(:,:,2)=make_lap(g2,100);
    sizess=zeros(1,101);
    match=zeros(1,101);
    v_mat=zeros(200,101);
    D=make_D(g,100,2);

    for i=1:101
        c=(i-1)/100;
        C=simple_hier_C([c,1-c],100,2);
        CD=C*D;
        [V,~]=eigs(CD,99,'lm');
        v=V(:,99);
        v=double(v>0);
        v_mat(:,i)=v;
        sizess(i)=max(sum(v),200-sum(v));
   if     mod(i-1,25)==0 
       c
           figure
    colormap(jet)
    subplot(2,1,1);
   p=plot(graph(g1),'NodeCData',v(1:100) ,'MarkerSize',10);
   x=p.XData;
   y=p.YData;
   subplot(2,1,2);
   plot(graph(g2),'NodeCData',v(101:200),'MarkerSize',10,'Xdata',x,'YData',y);
   end    
   
  % if c==.5
  %      figure
  %  colormap(jet)
  %  subplot(2,1,1);
  % p=plot(graph(g1),'NodeCData',v(1:100) ,'MarkerSize',10);
  % x=p.XData;
  % y=p.YData;
  % subplot(2,1,2);
  % plot(graph(g2),'NodeCData',v(101:200),'MarkerSize',10,'Xdata',x,'YData',y);
  % end    
   for j=1:100
            if v(j)==v(j+100)
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