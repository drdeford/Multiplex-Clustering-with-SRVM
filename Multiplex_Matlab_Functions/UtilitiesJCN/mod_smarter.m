
match_ms=zeros(1,100);
match_oa=zeros(1,100);
for z=1:100
    p=z/100;
g1=random_graph(100,p);
g2=random_graph(100,p);

   
%  y=zeros(1,100);
 % y(1:50)=2*ones(1,50);
 % y(51:100)=ones(1,50);
 % P=[p,.01;.01,p];
 % g1=gen_sbm(100,y,P);
 % g2=gen_sbm(100,y,P);
  
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
   % oab=weighted_multi(g,100,2,[1 1;1 1]);%used to be oaw
    
    %ms
    deg_ms1=ms(1:100,1:100)*ones(100,1);
    e_ms1=ones(1,100)*deg_ms1;
    
    deg_ms2=ms(101:200,101:200)*ones(100,1);
    e_ms2=ones(1,100)*deg_ms2;
    
    B_ms=zeros(200);
    
    for i=1:100
        for j=1:100
            B_ms(i,j)=(deg_ms1(i)*deg_ms1(j))/e_ms1;
        end
    end
    
     for i=101:200
        for j=101:200
            B_ms(i,j)=(deg_ms2(i-100)*deg_ms2(j-100))/e_ms2;
        end
     end
    
   % B_ms(1:100,101:200)=eye(100); $intra layer connections or not for
   % these two lines
   % B_ms(101:200,1:100)=eye(100);
    
    B_ms=ms-B_ms;
    
    [v,d]=eigs(B_ms,1,'la');
    
    v=double(v>0);
    
    
    for i=1:100
        if v(i)==v(i+100)
            match_ms(z)=match_ms(z)+1;
        end
    end
    
    
    % oa
    
     deg_oa1=oab(1:100,1:100)*ones(100,1);
    e_oa1=ones(1,100)*deg_oa1;
    
    deg_oa2=oab(101:200,101:200)*ones(100,1);
    e_oa2=ones(1,100)*deg_oa2;
    
    B_oa=zeros(200);
    
     for i=1:100
        for j=1:100
            B_oa(i,j)=(deg_oa1(i)*deg_oa1(j))/e_oa1;
        end
    end
    
     for i=101:200
        for j=101:200
            B_oa(i,j)=(deg_oa2(i-100)*deg_oa2(j-100))/e_oa2;
        end
     end
     
      B_oa(1:100,101:200)=B_oa(1:100,1:100)+B_oa(101:200,101:200);
    B_oa(101:200,1:100)=B_oa(1:100,1:100)+B_oa(101:200,101:200);
    
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
   