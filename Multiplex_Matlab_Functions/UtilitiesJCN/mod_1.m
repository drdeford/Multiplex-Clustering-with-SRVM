
match_ms=zeros(1,100);
match_oa=zeros(1,100);
for z=1:100
    p=z/100;
g1=random_graph(100,p);
   g2=random_graph(100,p);
%  y=zeros(1,100);
%  y(1:50)=2*ones(1,50);
%  y(51:100)=ones(1,50);
%  P=[p,.01;.01,p];
%  g1=gen_sbm(100,y,P);
%  g2=gen_sbm(100,y,P);
 
  for i=1:100
      g1(i,i)=0;
      g2(i,i)=0;
  end
  
      
%g1=edgeL2adj(preferential_attachment(100,2));
 % g2=edgeL2adj(preferential_attachment(100,2));

  
  
  g=zeros(100,100,2);
    g(:,:,1)=g1;
    g(:,:,2)=g2;
    ms=matched_sum_w(g,100,2,[1 1;1 1]);
    oab=binary_multi(g,100,2,[1 1;1 1]);
    oaw=weighted_multi(g,100,2,[1 1;1 1]);
    
    %ms
    deg_ms=ms*ones(200,1);
    e_ms=ones(1,200)*deg_ms;
    B_ms=zeros(200);
    
    for i=1:200
        for j=1:200
            B_ms(i,j)=(deg_ms(i)*deg_ms(j))/e_ms;
        end
    end
    
    B_ms=ms-B_ms;
    
    [v,d]=eigs(B_ms,1,'la');
    
    v=double(v>0);
    
    
    for i=1:100
        if v(i)==v(i+100)
            match_ms(z)=match_ms(z)+1;
        end
    end
    % oa
    
     deg_oa=oab*ones(200,1);
    e_oa=ones(1,200)*deg_oa;
    B_oa=zeros(200);
    
    for i=1:200
        for j=1:200
            B_oa(i,j)=(deg_oa(i)*deg_oa(j))/e_oa;
        end
    end
    
    B_oa=oab-B_oa;
    
    [v1,d1]=eigs(B_oa,1,'la');
    
    v1=double(v1>0);
    
    
    for i=1:100
        if v1(i)==v1(i+100)
            match_oa(z)=match_oa(z)+1;
        end
    end
    
    
    if mod(z-1,20)==0
        
        
  figure
    colormap(jet)
    subplot(2,2,2);
   p=plot(graph(g1),'NodeCData',v(1:100) ,'MarkerSize',10);
   x=p.XData;
   y=p.YData;
   subplot(2,2,4);
   plot(graph(g2),'NodeCData',v(101:200),'MarkerSize',10,'Xdata',x,'YData',y);
   subplot(2,2,1);
   plot(graph(g1),'NodeCData',v1(1:100),'MarkerSize',10,'Xdata',x,'YData',y);
   subplot(2,2,3);
   plot(graph(g2),'NodeCData',v1(101:200),'MarkerSize',10,'Xdata',x,'YData',y);

    end
    
end
    
    
%  figure
%    colormap(jet)
%    subplot(2,2,2);
%   p=plot(graph(g1),'NodeCData',v(1:100) ,'MarkerSize',10);
%   x=p.XData;
%   y=p.YData;
%   subplot(2,2,4);
%   plot(graph(g2),'NodeCData',v(101:200),'MarkerSize',10,'Xdata',x,'YData',y);
%   subplot(2,2,1);
%   plot(graph(g1),'NodeCData',v1(1:100),'MarkerSize',10,'Xdata',x,'YData',y);
%   subplot(2,2,3);
%   plot(graph(g2),'NodeCData',v1(101:200),'MarkerSize',10,'Xdata',x,'YData',y);
   