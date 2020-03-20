function [T,num]=nope_v_part_liu(B,n,num_eigs)


[V,~]=eigs(B,num_eigs,'lr');

X=V(:,1:num_eigs);

Y=X;

labels=1:n;

imp=1;
temp=0;
val=0;
while imp==1
    
    size(Y)
     imp=0;
    
    for i=1:n
        
        Y(labels(i),:)=Y(labels(i),:)-X(i,:);
        deltavec=Y*X(i,:)';
        Y(labels(i),:)=Y(labels(i),:)+X(i,:);

        [M,ind]=max(deltavec);
        
        if M >10^(-8);
            imp=1;
           
             labels(i)=ind;%move index to proper
            Y(ind,:)=Y(ind,:)+X(i,:);
            
            
            Y(labels(i),:)=Y(labels(i),:)-X(i,:);

            if norm(Y(labels(i),:)) <10^(-8) %Y(labels(i),:)==zeros(1,num_eigs)
                Y(labels(i),:)=[]; %delete empty communities
                for j=1:n
                    if labels(j)>labels(i)
                        labels(j)=labels(j)-1;%shorten other labels
                    end
                end
            end
            
           
        end
        
        
    
            
    end
    
 
    tempval=0;
    for i =1:size(Y,1)
        tempval=tempval+ (norm(Y(i,:)))^2;
    end
    
    if abs(tempval-val)<10^(-13)
        break
    end
    
    val=tempval;
    
end

            
            
            
            
            
            
            
            T=labels;
            num=max(T);
        
        