
D5=zeros(641,641,12);
D6=zeros(572,572,12);
[g,gc_nodes5]=giant_component(IND_5_all);
[g,gc_nodes61]=giant_component(IND_61_all);

for i=1:12
    D5(:,:,i)=make_lap(subgraph(Multi_IND_5(:,:,i),gc_nodes5),641);
    D6(:,:,i)=make_lap(subgraph(Multi_IND_61(:,:,i),gc_nodes61),572);
end

D5=make_D(D5,641,12);

D6=make_D(D6,572,12);


%CD5=simple_hier_C([.01,.01,.01,.01,.01,.01,.89,.01,.01,.01,.01,.01],641,12)'*D5;

%CD6=simple_hier_C([.01,.01,.01,.01,.01,.01,.89,.01,.01,.01,.01,.01],572,12)'*D6;

%CD5=simple_hier_C([.001,.001,.001,.001,.001,.001,.989,.001,.001,.001,.001,.001],641,12)'*D5;

%CD6=simple_hier_C([.001,.001,.001,.001,.001,.001,.989,.001,.001,.001,.001,.001],572,12)'*D6;


w_vec5a=zeros(1,21);
w_vec61a=zeros(1,21);

for i=1:21
    w=(1/12)+(i-1)*(11/240);
    nm=(1-w)/11;
    
   CD5=simple_hier_C([nm,nm,nm,nm,nm,nm,w,nm,nm,nm,nm,nm],641,12)'*D5;

   CD6=simple_hier_C([nm,nm,nm,nm,nm,nm,w,nm,nm,nm,nm,nm],572,12)'*D6;
    


    temp5=eigs(CD5,640);

    w_vec5a(i)=temp5(640);

    temp6=eigs(CD6,571);

    w_vec61a(i)=temp6(571);
end


temp5=eigs(equi_C(641,12)*D5,640);

temp6=eigs(equi_C(572,12)*D6,571);

ef5=temp5(640);

ef6=temp6(571);

temp5=eigs(make_lap(giant_component(IND_5_all),641),640);

af5=temp5(640);

temp6=eigs(make_lap(giant_component(IND_61_all),572),571);

af6=temp6(571);

