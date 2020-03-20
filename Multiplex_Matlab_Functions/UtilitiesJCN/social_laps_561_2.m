
D5=zeros(191,191,12);
D6=zeros(550,550,12);
[g,gc_nodes5]=giant_component(IND_5_medic);
[g,gc_nodes61]=giant_component(IND_61_medic);

for i=1:12
    D5(:,:,i)=make_lap(subgraph(Multi_IND_5(:,:,i),gc_nodes5),191);
    D6(:,:,i)=make_lap(subgraph(Multi_IND_61(:,:,i),gc_nodes61),550);
end

D5=make_D(D5,191,12);

D6=make_D(D6,550,12);


%CD5=simple_hier_C([.01,.01,.01,.01,.01,.01,.89,.01,.01,.01,.01,.01],641,12)'*D5;

%CD6=simple_hier_C([.01,.01,.01,.01,.01,.01,.89,.01,.01,.01,.01,.01],572,12)'*D6;

%CD5=simple_hier_C([.001,.001,.001,.001,.001,.001,.989,.001,.001,.001,.001,.001],641,12)'*D5;

%CD6=simple_hier_C([.001,.001,.001,.001,.001,.001,.989,.001,.001,.001,.001,.001],572,12)'*D6;


w_vec5=zeros(1,21);
w_vec61=zeros(1,21);

for i=1:21
    w=(1/12)+(i-1)*(11/240);
    nm=(1-w)/11;
    
   CD5=simple_hier_C([nm,nm,nm,nm,nm,nm,w,nm,nm,nm,nm,nm],191,12)'*D5;

   CD6=simple_hier_C([nm,nm,nm,nm,nm,nm,w,nm,nm,nm,nm,nm],550,12)'*D6;
    


    temp5=eigs(CD5,190);

    w_vec5(i)=temp5(190);

    temp6=eigs(CD6,549);

    w_vec61(i)=temp6(549);
end


temp5=eigs(equi_C(191,12)*D5,190);

temp6=eigs(equi_C(550,12)*D6,549);

ef5=temp5(190);

ef6=temp6(549);

temp5=eigs(make_lap(giant_component(IND_5_all),191),190);

af5=temp5(190);

temp6=eigs(make_lap(giant_component(IND_61_all),550),549);

af6=temp6(549);

