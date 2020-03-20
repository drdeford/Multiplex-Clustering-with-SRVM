g1=random_graph(100,.2);
g2=random_graph(100,.2);
%g1=edgeL2adj(preferential_attachment(100,2));
 %g2=edgeL2adj(preferential_attachment(100,2));


   
%  y=zeros(1,100);
%  y(1:50)=2*ones(1,50);
%  y(51:100)=ones(1,50);
%  P=[.1,.01;.01,.1];
%%  g1=gen_sbm(100,y,P);
%  g2=gen_sbm(100,y,P);
  
  for i=1:100
      g1(i,i)=0;
     g2(i,i)=0;
  end
  
  
  
m1=make_rw_l(g1,100);
m2=make_rw_l(g2,100);
g=zeros(100,100,2);
g(:,:,1)=m1;
g(:,:,2)=m2;
D=make_D(g,100,2);

match=zeros(1,101);
v_mat=zeros(200,101);
for i=1:101
    c=(i-1)/100;
    
    C=simple_hier_C([1-c,c],100,2);
    CD=C*D;
    
    [pi,~]=eigs(CD,1);
    
    M=CD*diag(abs(pi))-abs(pi*pi');
    
    [v,~]=eigs(M,1,'LR');
    
    v=double(v>0);
    v_mat(:,i)=v;
    for j=1:100
        if v(j)==v(j+100)
            match(i)=match(i)+1;
        end
    end
    
    if mod(i,20)==0
        
  figure
    colormap(jet)
    subplot(2,1,1);
   p=plot(graph(g1),'NodeCData',v(1:100) ,'MarkerSize',10);
   x=p.XData;
   y=p.YData;
   subplot(2,1,2);
   plot(graph(g2),'NodeCData',v(101:200),'MarkerSize',10,'Xdata',x,'YData',y);
   
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

    
    
    