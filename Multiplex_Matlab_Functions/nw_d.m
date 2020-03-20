function nw=nw_d(layer_mat)

%Input n x n x k matrix of layers
%Output nk x nk node weight distributed matrix

sizes=size(layer_mat);
n=sizes(2);
k=sizes(3);

