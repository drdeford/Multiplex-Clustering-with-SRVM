a=[0 1 1 0;1 0 1 1;1 1 0 1;0 1 1 0];

b=[ 0 1 1 1;1 0 1 0;1 1 0 0;1 0 0 0];

c=[0 0 1 1;0 0 1 1;1 1 0 0 ; 1 1 0 0];

M=zeros(4,4,3);

M(:,:,1)=a;
M(:,:,2)=b;
M(:,:,3)=c;
[V1,D1]=eigs(a,1);
[V2,D2]=eigs(b,1);
[V3,D3]=eigs(c,1);

V1=-V1;
V2=-V2;
V3=-V3;

C=equi_C(4,3);
D=make_D(M,4,3);

E=C*D;
[V,D]=eigs(E,1);
V=-V;
