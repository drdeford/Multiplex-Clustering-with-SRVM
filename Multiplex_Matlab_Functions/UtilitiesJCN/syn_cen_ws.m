ws=full(adjacency(WattsStrogatz(100,4,.2)));
er=full(adjacency(WattsStrogatz(100,6,.4)));
ab=full(adjacency(WattsStrogatz(100,8,.6)));
%ab=edgeL2adj(ab);
%er=edgeL2adj(er);
%ws=edgeL2adj(ws);
%4,6,8 and 2,4,6
[vws,d]=eigs(ws,1);
vws=-vws;
[ver,d]=eigs(er,1);
ver=-ver;
[vab,d]=eigs(ab,1);
vab=-vab;


multi=zeros(100,100,3);

multi(:,:,1)=ws;
multi(:,:,2)=er;
multi(:,:,3)=ab;

D=make_D(multi,100,3);

ms=matched_sum(multi,100,3);

agg=aggregate(multi,100,3);

[vms,d]=eigs(ms,1);
vms=-vms;

[vagg,d]=eigs(agg,1);
vagg=-vagg;

eq=equi_C(100,3)*D;

[veq,d]=eigs(eq,1);
veq=-veq;

hd=hier_density(multi,100,3)*D;
hr=hier_rand(multi,100,3)*D;

[vhd,d]=eigs(hd,1);
vhd=-vhd;

[vhr,d]=eigs(hr,1);
vhr=-vhr;

und=un_degree(multi,100,3)*D;
unr=un_random(multi,100,3)*D;

[vund,d]=eigs(und,1);
vund=-vund;

[vunr,d]=eigs(unr,1);
vunr=-vunr;

gccn=gc_common_neighbors(multi,100,3)*D;
gcnc=gc_neighbors_correlation(multi,100,3)*D;
gcr=gc_random(multi,100,3)*D;

[vgccn,d]=eigs(gccn,1);
vgccn=-vgccn;
[vgcnc,d]=eigs(gcnc,1);
vgcnc=-vgcnc;
[vgcr,d]=eigs(gcr,1);
vgcr=-vgcr;






separate_layers=zeros(1,300);
separate_layers(1:100)=vws;
separate_layers(101:200)=ver;
separate_layers(201:300)=vab;

%separate_layers=separate_layers/sum(separate_layers);

subplot(3,3,1)
plot(separate_layers,veq,'*')
subplot(3,3,2)
plot(separate_layers,vhd,'*')
%subplot(3,3,3)
%plot(separate_layers,vhr,'*')
subplot(3,3,4)
plot(separate_layers,vund,'*')
%subplot(3,3,5)
%plot(separate_layers,vunr,'*')
subplot(3,3,6)
plot(separate_layers,vgccn,'*')
%subplot(3,3,7)
%plot(separate_layers,vgcnc,'*')
%subplot(3,3,8)
%plot(separate_layers,vgcr,'*')
subplot(3,3,9)
plot(separate_layers,vms,'*')
subplot(3,3,5)
colormap(jet)
colorbar
imagesc(corrcoef([transpose(separate_layers),veq,vhd,vund,vgccn,vms]))



