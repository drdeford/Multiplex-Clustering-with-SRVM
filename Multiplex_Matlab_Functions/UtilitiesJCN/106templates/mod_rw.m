g1=random_graph(100,.2);
g2=random_graph(100,.2);
m1=make_rw_l(g1,100);
m2=make_rw_l(g2,100);

deg1=g1*ones(100,1);
deg2=g2*ones(100,1);

avg=(m1+m2)/2;

s_rw=make_rw_l((g1+g2)/2,100); % :(

W=zeros(100);

for i=1:100
    for j=1:100
        W(i,j)=g1(i,j)*deg2(j)+g2(i,j)*deg1(j);
    end
end



wrw=make_rw_l(W,100);

g=zeros(100,100,2);
g(:,:,1)=make_sym_lap(g1,100);
g(:,:,2)=make_sym_lap(g2,100);

D=make_D(g,100,2);

C=simple_hier_C([.5,.5],100,2);

CD=C*D;

[VCD,e]=eigs(CD,1);


%wrw=avg :( 
