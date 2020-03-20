alayerf=zeros(1,12);
blayerf=zeros(1,12);
clayerf=zeros(1,12);

for i=1:12
    leiga=eigs(Da(1+501*(i-1):501*i,1+501*(i-1):501*i),500);
    alayerf(i)=leiga(500);
    leigb=eigs(Db(1+501*(i-1):501*i,1+501*(i-1):501*i),500);
    blayerf(i)=leigb(500);
    leigc=eigs(Dc(1+501*(i-1):501*i,1+501*(i-1):501*i),500);
    clayerf(i)=leigc(500);
end
