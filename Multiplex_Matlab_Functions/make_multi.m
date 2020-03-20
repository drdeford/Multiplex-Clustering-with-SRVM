function plex=make_multi(layer_mat)

%Input k n x n layer matrices [a b c d e ... ]
%Output n x n x k multiarray

sizes=size(layer_mat);
n=sizes(1);
k=sizes(2)/n;

plex=zeros(n,n,k);

for i=1:k
    plex(:,:,i)=layer_mat(:,(i-1)*n+1:i*n);
    
end


