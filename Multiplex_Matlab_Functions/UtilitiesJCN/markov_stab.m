%g1=random_graph(8,.5);
%g2=random_graph(8,.5);
g1=edgeL2adj(preferential_attachment(8,3));
 g2=edgeL2adj(preferential_attachment(8,2));


   
 % y=zeros(1,16);
 % y(1:8)=2*ones(1,8);
 % y(9:16)=ones(1,8);
 % P=[p,.01;.01,p];
 % g1=gen_sbm(16,y,P);
 % g2=gen_sbm(16,y,P);
 % 
 % for i=1:16
 %     g1(i,i)=0;
 %     g2(i,i)=0;
 % end
  
  
  
m1=make_rw_l(g1,8);
m2=make_rw_l(g2,8);
g=zeros(8,8,2);
g(:,:,1)=m1;
g(:,:,2)=m2;
D=make_D(g,8,2);

max_r=zeros(1,11);
max_i=zeros(1,11);
for i=1:11
    c=(i-1)/10;
    C=simple_hier_C([c,1-c],8,2);
    CD=C*D;
    [pi,~]=eigs(CD,1);
    
    x=dec2bin(1:2^(16));
    
    h=zeros(16,2);
    xd=zeros(16,1);
    
    r=zeros(1,2^(16));
    
    for j=1:2^(16)
        for l=1:16
            h(l,1)=str2double(x(j,l));
        end
        h(:,2)=ones(16,1)-h(:,1);
        R=h'*(CD*diag(pi)-pi*pi')*h;
        r(j)=trace(R);
        [max_r(i),max_i(i)]=max(r);
    end
    
    if mod(i,3)==0
        i
    end
end

        
        
        
        
        
%        figure
%    colormap(jet)
%    subplot(2,1,1);
%   p=plot(graph(g1),'NodeCData',v(1:8) ,'MarkerSize',10);
%   x=p.XData;
%%   y=p.YData;
%   subplot(2,1,2);
%   plot(graph(g2),'NodeCData',v(1:8),'MarkerSize',10,'Xdata',x,'YData',y);
        
        
        
    
    
    
    
    
    