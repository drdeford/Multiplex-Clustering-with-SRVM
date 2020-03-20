%n=100;
%k=2;
%circle=1;


figure;
colormap(jet)
caxis([1,clusters])

if circle==0
for i=1:k
    subplot(k+2,2,2*i-1)
    caxis([1,clusters])

    plot(graph(gs(:,:,i)),'MarkerSize',8,'NodeCData',cd_lap(1+(i-1)*n:i*n))
        caxis([1,clusters])

    subplot(k+2,2,2*i)
    caxis([1,clusters])

    plot(graph(gs(:,:,i)),'MarkerSize',8,'NodeCData',cms(1+(i-1)*n:i*n))
    caxis([1,clusters])

end
end


if circle==1
for i=1:k
    subplot(k+2,2,2*i-1)
    caxis([1,clusters])

    plot(graph(gs(:,:,i)),'MarkerSize',8,'NodeCData',cd(1+(i-1)*n:i*n),'Layout','Circle')
        caxis([1,clusters])

    subplot(k+2,2,2*i)
    caxis([1,clusters])

    plot(graph(gs(:,:,i)),'MarkerSize',8,'NodeCData',cms(1+(i-1)*n:i*n),'Layout','Circle')
    caxis([1,clusters])

end
end
    

    subplot(k+2,2,2*(i+1)-1)
    plot(cd_lap,'b*')

        subplot(k+2,2,2*(i+1))
        plot(cms,'b*')
        
        subplot(k+2,2,2*(i+1)+1)
    plot(dd,'b*')

        subplot(k+2,2,2*(i+1)+2)
        plot(dms,'b*')    