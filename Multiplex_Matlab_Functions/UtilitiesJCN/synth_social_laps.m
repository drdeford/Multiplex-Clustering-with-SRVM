a=zeros(501,501,12);
b=zeros(501,501,12);
c=zeros(501,501,12);


for i=1:11
    a(:,:,i)=random_graph(501,.011);%was.01 
    b(:,:,i)=random_graph(501,.013);%was.013
    c(:,:,i)=random_graph(501,.015);%was.013
end

a(:,:,12)=full(adjacency(WattsStrogatz(501,3,.2)));
for i=1:500
    b(i,i+1,12)=1;
    b(i+1,i,12)=1;
end

for i=1:3:499
    c(i,i+1,12)=1;
    c(i,i+2,12)=1;
    c(i+1,i,12)=1;
    c(i+2,i,12)=1;
    c(i+1,i+2,12)=1;
    c(i+2,i+1,12)=1;
end

Da=zeros(501,501,12);
Db=zeros(501,501,12);
Dc=zeros(501,501,12);


for i=1:12
    Da(:,:,i)=make_lap(a(:,:,i),501);
    Db(:,:,i)=make_lap(b(:,:,i),501);
    Dc(:,:,i)=make_lap(c(:,:,i),501);
end

    Da=make_D(Da,501,12);
    Db=make_D(Db,501,12);
    Dc=make_D(Dc,501,12);
    
    a_vec=zeros(1,21);
    b_vec=zeros(1,21);
    c_vec=zeros(1,21);

for i=1:21
    w=(1/12)+(i-1)*(11/240);
    nm=(1-w)/11;
    
    CDa=simple_hier_C([nm,nm,nm,nm,nm,nm,nm,nm,nm,nm,nm,w],501,12)'*Da;
    CDb=simple_hier_C([nm,nm,nm,nm,nm,nm,nm,nm,nm,nm,nm,w],501,12)'*Db;
    CDc=simple_hier_C([nm,nm,nm,nm,nm,nm,nm,nm,nm,nm,nm,w],501,12)'*Dc;
    
    tempa=eigs(CDa,500);
    tempb=eigs(CDb,500);
    tempc=eigs(CDc,500);
    
    a_vec(i)=tempa(500);
     b_vec(i)=tempb(500);
      c_vec(i)=tempc(500);
end

    
    
