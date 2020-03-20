n=100;
k=4;
%p=.1;
num_sbm=2;
P=[.5,.05;.05,.5];
clusters=2;
weight=1;
prime_layer=1;
layer1weight=.5;

cstarts=[1,1,1,15];%[1,1,1,15];%[1,5,10,15];%,10,15];%[1,5,10,15];%[1,5];
circle=1;

t=1;



z=ones(k,n);

for i=1:k
    z(i,cstarts(i):cstarts(i)+n/2-1)=2*ones(1,n/2);
end


%z(1,1:n/2)=2*ones(1,n/2);
%for i=1:k
%    z(i,(i-1)*n/(2*k)+1:((i-1)*n/(2*k))+n/k)=2*ones(1,n/k);
%    
%end


    

gs=zeros(n,n,k);
rs=zeros(n,n,k);
for i=1:k
    gs(:,:,i)=gen_sbm_new(n,z(i,:),P);
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


c=.75;

C=simple_hier_C([(1-c)/3,(1-c)/3,(1-c)/3,c],n,k);
CD=C*D;

[pi,~]=eigs(CD,1);

disc=diag(abs(pi))*CD^t-pi*pi';

cont=diag(abs(pi))*expm(-t*(eye(n*k)-CD)) -pi*pi';
