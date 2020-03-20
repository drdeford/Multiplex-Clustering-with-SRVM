function lap=make_sym_lap(mat,n)

%Input n x n matrix 
%Output n x n Laplacian


deg=mat*ones(n,1);
deg=diag(deg);
lap=eye(n)-deg^(-1/2)*mat*deg^(-1/2);

