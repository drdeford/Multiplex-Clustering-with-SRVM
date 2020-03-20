function B=aggregate(layer_mat,n,k)

%Input n x n x k matrix of dynamical operators
%Output n x n aggregate matrix

A=zeros(n);
for i=1:k
    A=A+layer_mat(:,:,i);
end

B=A>0;
B=double(B);



