time_step=.05;
final_t=10;
n=25;
k=100;
p=.1;
gsdyn=zeros(n,n,k);


for i =1:k
    gsdyn(:,:,i)=random_graph(n,p);
end

    

%pretty good with k=20 t=7
L=make_lap(matched_sum(gsdyn(:,:,1:k),n,k),n*k);

[V,D]=eig(L);

D=diag(D);

C=rand(n*k,1);

CV=V'*C;

intervec=zeros(1,500);
intravec=zeros(1,500);

intermap=zeros(n,500);
intramap=zeros(k,500);

layer_means=zeros(k,500);

supernode_means=zeros(n,500);

temp=1;

for t=0:time_step:final_t

Phi= CV.*exp(-D*t);

Phi=V*Phi;

%[intra,inter,intrap,interp]=lap_diffs(gsdyn,Phi,n,k);

%intervec(temp)=interp;

%intravec(temp)=intrap;

%intermap(:,temp)=inter;

%intramap(:,temp)=intra;



Phi2=reshape(Phi, n,k);

for i=1:n
    supernode_means(i,temp)=mean(Phi2(i,:));
end

for i=1:k
    layer_means(i,temp)=mean(Phi2(:,i));
end



temp=temp+1;

imagesc(Phi2);



 title(sprintf('Diffusion t = %3f', t));
 %colorbar;
 %caxis('manual')
 %caxis([0,1])
   frame = getframe(1);
   im = frame2im(frame);
   [imind, cm] = rgb2ind(im, 256);
   if t == 0
      imwrite(imind, cm, 'out.gif', 'gif', 'Loopcount', inf, 'DelayTime', 0.1); 
   else
      imwrite(imind, cm, 'out.gif', 'gif', 'WriteMode', 'append', 'DelayTime', 0.1);
   end
end

