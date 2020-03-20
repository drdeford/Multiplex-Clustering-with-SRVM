function rw=make_rw_l(mat,n)

%Input n x n matrix 
%Output n x n Random Walk Matrix (left)


%deg=mat*ones(n,1);
deg=ones(1,n)*mat;

rw=diag(deg);

irw=zeros(n);

for i=1:n
    if rw(i,i)==0
        irw(i,i)=0;
    else 
        irw(i,i)=1/rw(i,i);
    end
end


rw=mat*irw;
