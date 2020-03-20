function [intra,inter,intrap,interp]=lap_diffs(gs,Phi,n,k)


Phi2=reshape(Phi,n,k);

intra=zeros(1,k);
intran=zeros(1,k);
inter=zeros(1,n);
intern=zeros(1,n);
for i=1:k
    for j=1:n
        for l=1:n
            if gs(j,l,i)==1
                intran(i)=intran(i)+1;
                intra(i)=intra(i)+abs(Phi2(j,i)-Phi2(l,i));
            end
        end
    end
end

                


for i=1:n
    for j=1:k
        for l=1:k
            if j~=k
                intern(i)=intern(i)+1;
                inter(i)=inter(i)+abs(Phi2(i,j)-Phi2(i,l));
            end
        end
    end
end

interp=sum(inter)/sum(intern);
intrap=sum(intra)/sum(intran);
                


