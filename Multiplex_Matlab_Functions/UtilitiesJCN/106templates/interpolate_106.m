function match=interpolate_106(g1,g2) 
%g1=random_graph(100,.2);
  %  g2=random_graph(100,.2);
  %z=zeros(1,100);
  %z(1:50)=2*ones(1,50);
  %z(51:100)=ones(1,50);
  %P=[.1,.02;.02,.1];
  %g1=gen_sbm(100,z,P);
  %g2=gen_sbm(100,z,P);
  
  
  g=zeros(100,100,2);
    g(:,:,1)=g1;
    g(:,:,2)=g2;

    %cgc=gc_common_neighbors(g,100,2);
    %cgc=un_degree(g,100,2);
    %cgc=equi_C(100,2);
    D=[g1 zeros(100);zeros(100) g2];
    CD=cgc*D;
    CD=CD+CD';
    %CD(1:100,101:200)=CD(1:100,101:200)+CD(101:200,1:100);
    %CD(101:200,1:100)=CD(1:100,101:200)+CD(101:200,1:100);
    issymmetric(CD);
    lap=make_lap(CD,200);
    
    
    [V,D]=eigs(lap,199);
    
    v=V(:,199);
    v=double(v>0);
    
    match=0;
    
    for i=1:100
        if v(i)==v(i+100)
            match=match+1;
        end
    end
    
            