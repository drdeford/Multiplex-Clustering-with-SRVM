%n=100;
%k=2;
%circle=1;


figure;
colormap(jet)
caxis([1,clusters])

for i=1:k
    subplot(k,1,i)
    caxis([1,max(T)])

    plot(graph(gs(:,:,i)),'MarkerSize',8,'NodeCData',T(1+(i-1)*n:i*n),'Layout','Circle')
        caxis([1,max(T)])

   

end

    
