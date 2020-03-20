epsilon=.0001;
n=25;
k=100;

L=make_lap(matched_sum(gsdyn(:,:,1:100),n,k),n*k);



Phi=rand(n*k,1);


for t=0:epsilon:1

Phi= Phi+ epsilon*L*Phi;


imagesc(reshape(Phi, n,k));

 title(sprintf('Diffusion t = %3f', t));
   frame = getframe(1);
   im = frame2im(frame);
   [imind, cm] = rgb2ind(im, 256);
   if t == 0
      imwrite(imind, cm, 'out.gif', 'gif', 'Loopcount', inf, 'DelayTime', 0.1); 
   else
      imwrite(imind, cm, 'out.gif', 'gif', 'WriteMode', 'append', 'DelayTime', 0.1);
      colorbar;
   end
end

