

n=100;
k=4;
%p=.1;
num_sbm=2;
P=[.2,.05;.05,.2];
clusters=2;
weight=1/k;
circle=1;



t=.5;

z=zeros(1,n);
for i=1:num_sbm
    z((i-1)*n/num_sbm +1:i*n/num_sbm)=i*ones(1,n/num_sbm);
end
    %z(1:n/2)=ones(1,n/2);
%z(n/2 +1:n)=2*ones(1,n/2);


gs=zeros(n,n,k);
ds=zeros(n,n,k);
rs=zeros(n,n,k);

for i=1:k
    gs(:,:,i)=gen_sbm_new(n,z,P);
    rs(:,:,i)=make_rw_l(gs(:,:,i),n);
end


ranks=zeros(1,k);

for i=1:k
    ranks(i)=sum(sum(gs(:,:,i)));
end

ranks=ranks/sum(ranks);

%ms=matched_sum_w(bs,n,k,weight*ones(k,k));

D=make_D(rs,n,k);

C=simple_hier_C(ranks,n,k);

CD=C*D;

[pi,~]=eigs(CD,1,'lr');

disc=diag(abs(pi))*CD^t-pi*pi';

cont=diag(abs(pi))*expm(-t*(eye(n*k)-CD)) -pi*pi';

