n=100;
k=6;
p=.2*ones(1,k);%*(1:10);%[.1,.2,.3,.4];%.1*ones(1,k);
clusters=2;
%weight=10;%1/k %tostart
circle=1;

t=1;

gs=zeros(n,n,k);
ds=zeros(n,n,k);

rs=zeros(n,n,k);
for i=1:k
    gs(:,:,i)=random_graph(n,p(i));
    rs(:,:,i)=make_rw_l(gs(:,:,i),n);
end


ranks=zeros(1,k);

for i=1:k
    %ranks(i)=sum(sum(gs(:,:,i)));
    ranks(i)=rand;
end

ranks=ranks/sum(ranks);

%ms=matched_sum_w(bs,n,k,weight*ones(k,k));

D=make_D(rs,n,k);

C=simple_hier_C(ranks,n,k);

CD=C*D;

[pi,~]=eigs(CD,1);

disc=diag(abs(pi))*CD^t-pi*pi';

cont=diag(abs(pi))*expm(-t*(eye(n*k)-CD)) -pi*pi';
