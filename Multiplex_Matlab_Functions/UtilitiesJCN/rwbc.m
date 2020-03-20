function rank_vec=rwbc(CD,n,k)
%function [H rank_vec]=rwbc(CD,n,k)

Q=zeros(n*k-1,n*k-1,n*k);
N=zeros(n*k-1,n*k-1,n*k);
H=zeros(n*k-1,n*k-1,n*k);


for i=1:n*k
    temp=CD;
    temp(:,i)=[];
    temp(i,:)=[];
    Q(:,:,i)=temp';
    N(:,:,i)=inv(eye(n*k-1)-Q(:,:,i));
    H(:,:,i)=(N(:,:,i)-eye(n*k-1))*inv(diag(N(:,:,i)*ones(n*k-1,1)));
end

rank_vec=zeros(1,n*k);
for i=1:n*k
    temp=0;
    for j=1:n*k
        for l=1:n*k
         %   if j~=l
         %       if i~=j
         %           if i~=k
                        if j<l
                            if i<l
                                temp=temp+H(j,i,l);
                            end
                        end
                        if j<l
                            if i>l
                                temp=temp+H(j,i-1,l);
                            end
                        end
                        if j>l
                            if i<l
                                temp=temp+H(j-1,i,l);
                            end
                        end
                        if j>l
                            if i>l
                                temp=temp+H(j-1,i-1,l);
                            end
                        end
                        
                    end
            %    end
           % end
       % end
    end
    rank_vec(i)=temp;
end
