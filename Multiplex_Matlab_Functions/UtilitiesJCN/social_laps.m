
D4=zeros(957,957,12);
D6=zeros(572,572,12);
for i=1:12
    D4(:,:,i)=make_lap(subgraph(Multi_IND_4(:,:,i),gc_nodes4),957);
    D6(:,:,i)=make_lap(subgraph(Multi_IND_61(:,:,i),gc_nodes61),572);
end

D4=make_D(D4,957,12);

D6=make_D(D6,572,12);


CD4=simple_hier_C([.01,.01,.01,.01,.01,.01,.89,.01,.01,.01,.01,.01],957,12)*D4;

CD6=simple_hier_C([.01,.01,.01,.01,.01,.01,.89,.01,.01,.01,.01,.01],572,12)*D6;

temp4=eigs(CD4,956);

f4=temp4(956);

temp6=eigs(CD6,571);

f6=temp6(571);

temp4=eigs(equi_C(957,12)*D4,956);

temp6=eigs(equi_C(572,12)*D6,571);

ef4=temp4(956);

ef6=temp6(571);

temp4=eigs(make_lap(giant_component(IND_4_all),957),956);

af4=temp4(956);

temp6=eigs(make_lap(giant_component(IND_61_all),572),571);

af6=temp6(571);

