 %g1=random_graph(100,.1);
  %  g2=random_graph(100,.1);
  z=zeros(1,100);
  z(1:50)=2*ones(1,50);
  z(51:100)=ones(1,50);
  P=[.2,.01;.01,.2];
  g1=gen_sbm(100,z,P);
  g2=gen_sbm(100,z,P);
  
 
 %g1=random_graph(100,.1);
 %g2=random_graph(100,.1);
  
  g=zeros(100,100,2);
    g(:,:,1)=g1;
    g(:,:,2)=g2;
    ms=matched_sum_w(g,100,2,[1 1;1 1]);
    oab=binary_multi(g,100,2,[1 1;1 1]);
    oaw=weighted_multi(g,100,2,[1 1;1 1]);
    
    lms=make_lap(ms,200);
    lms_s=make_sym_lap(ms,200);
    
    loa=make_lap(oab,200);
    loa_s=make_sym_lap(oab,200);
    
    
    low=make_lap(oaw,200);
    low_s=make_sym_lap(oaw,200);
    
    %lms
    
    [V,D]=eigs(lms,199);
    v=V(:,199);
    v=double(v>0);
    
    [V1,D]=eigs(loa,199);
    v1=V1(:,199);
    
    v1=double(v1>0);
    figure
    colormap(jet)
    subplot(2,2,1);
   plot(graph(g1),'NodeCData',v1(1:100),'Layout','circle','MarkerSize',10)
   subplot(2,2,3);
   plot(graph(g2),'NodeCData',v1(101:200),'Layout','circle','MarkerSize',10);
    subplot(2,2,2);
   plot(graph(g1),'NodeCData',v(1:100),'Layout','circle','MarkerSize',10)
   subplot(2,2,4);
   plot(graph(g2),'NodeCData',v(101:200),'Layout','circle','MarkerSize',10);