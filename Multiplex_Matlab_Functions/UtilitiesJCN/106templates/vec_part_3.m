function [T,num]=vec_part_3(B,n,num_eigs)

if issymmetric(B)==1
[X,~]=eigs(B,num_eigs,'la');
end

if issymmetric(B)==0
    [X,~]=eigs(B,num_eigs,'lr');
end

Y=X;

xlabels=1:n;
labels=1:n;



imp=1;
temp=0;
trips=0;
while imp==1
    %trips=trips+1
    %sort(labels)
    size(Y)
     imp=0;
    
     
     numc=size(Y,1);
     
    for i=1:numc
        
        Y(i,:)=Y(i,:)-X(i,:);
        deltavec=Y*X(i,:)';
        Y(i,:)=Y(i,:)+X(i,:);

        [M,ind]=max(deltavec);
        
        
        
        if M> 10^(-12)
            imp=1;
            
            Y(i,:)=Y(i,:)-X(i,:);
            
           %labels(i)=ind;  %this is actually way more complicated!
           
           for j=1:n
               if labels(j)==labels(i)
                   labels(j)=ind;
               end
           end
           
           
            
            Y(ind,:)=Y(ind,:)+X(i,:);
            
        end
        
    end
    
    %deletion of empties
    dels=[];
    temp=0;
    for i=1:numc
        if norm(Y(i,:))<10^(-12)%Y(i,:)==zeros(1,num_eigs);%
            temp=temp+1;
            dels(temp)=i;
        end
    end
    
    
    
    Y(dels,:)=[];
    
    
    %relabel
    
    for k=1:numc
        numdels=0;
        for x =1:length(dels)
            if labels(k)>dels(x)
                numdels=numdels+1;
                
                
            end
            
        end
        labels(k)=labels(k)-numdels;
    end
    
    
    
    
    if size(Y,1)==numc
        break
    end
    
    X=Y;
    
    
    
end


T=labels;
num=max(labels);
            
            
            
        

        
        
        %somewhere down at bottom reset with X=Y but somehow keep the
        %labels straight.