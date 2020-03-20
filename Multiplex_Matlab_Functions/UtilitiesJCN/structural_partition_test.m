match_ms=zeros(1,100);
match_bo=zeros(1,100);
match_wo=zeros(1,100);

s_match_ms=zeros(1,100);
s_match_bo=zeros(1,100);
s_match_wo=zeros(1,100);


size_ms=zeros(1,100);
size_bo=zeros(1,100);
size_wo=zeros(1,100);

s_size_ms=zeros(1,100);
s_size_bo=zeros(1,100);
s_size_wo=zeros(1,100);



for i=.05:.01:1 %.01 too sparse
    %g1=random_graph(100,i);
    %g2=random_graph(100,i);
      z=zeros(1,100);
 z(1:50)=2*ones(1,50);
  z(51:100)=ones(1,50);
  P=[i,.01;.01,i];
  g1=gen_sbm(100,z,P);
  g2=gen_sbm(100,z,P);
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
        size_ms(int64(100*i))=sum(v);

    for j=1:100
        if v(j)==v(j+100)
            match_ms(int64(100*i))=match_ms(int64(100*i))+1;
        end
    end
    
    
    %lms_s
    
        [V,D]=eigs(lms_s,199);
    v=V(:,199);
    v=double(v>0);
    
    for j=1:100
        if v(j)==v(j+100)
            s_match_ms(int64(100*i))=s_match_ms(int64(100*i))+1;
        end
    end
    
    s_size_ms(int64(100*i))=sum(v);
    
    %oa
    
        [V,D]=eigs(loa,199);
    v=V(:,199);
    v=double(v>0);
    
    for j=1:100
        if v(j)==v(j+100)
            match_bo(int64(100*i))=match_bo(int64(100*i))+1;
        end
    end
    
    size_bo(int64(100*i))=sum(v);
    
    %oas
    
      [V,D]=eigs(loa_s,199);
    v=V(:,199);
    v=double(v>0);
    
    for j=1:100
        if v(j)==v(j+100)
            s_match_bo(int64(100*i))=s_match_bo(int64(100*i))+1;
        end
    end
    
    s_size_bo(int64(100*i))=sum(v);
    
    
        %oaw
    
        [V,D]=eigs(low,199);
    v=V(:,199);
    v=double(v>0);
    
    for j=1:100
        if v(j)==v(j+100)
            match_wo(int64(100*i))=match_wo(int64(100*i))+1;
        end
    end
    
    size_wo(int64(100*i))=sum(v);
    
    %oaws
    
      [V,D]=eigs(low_s,199);
    v=V(:,199);
    v=double(v>0);
    
    for j=1:100
        if v(j)==v(j+100)
            s_match_wo(int64(100*i))=s_match_wo(int64(100*i))+1;
        end
    end
    
    s_size_wo(int64(100*i))=sum(v);
    
end
    