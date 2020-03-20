function lap=make_lap(mat,n)

%Input n x n matrix 
%Output n x n Laplacian


deg=mat*ones(n,1);

lap=diag(deg);

lap=lap-mat;

