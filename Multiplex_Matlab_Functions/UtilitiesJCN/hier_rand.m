function C=hier_rand(layer_mat,n,k)
%input 
%output

a=rand(1,k);
a=a/sum(a);


C=simple_hier_C(a,n,k);