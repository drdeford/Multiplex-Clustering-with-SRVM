
Rmat=zeros(81,400);

ind=0;

for c=.1:.01:.9
    ind=ind+1;
    modularity_offset_stability;
    
    Rmat(ind,:)=vec_part_2(cont,n*k,1);
    
end


RR=zeros(81);

for i=1:81
    for j=1:81
        RR(i,j)=RandIndex(Rmat(i,:),Rmat(j,:));
    end
end

imagesc(RR)
colormap(gray)
colorbar