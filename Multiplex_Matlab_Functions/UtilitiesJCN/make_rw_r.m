function rw=make_rw_r(mat,n)

%Input n x n matrix 
%Output n x n Random Walk Matrix (left)


deg=mat*ones(n,1);

rw=diag(deg);

rw=inv(rw)*mat;
