avgs2=zeros(1,100);
min2=zeros(1,100);
max2=zeros(1,100);
for i=2:100
    i
    tempvec=zeros(1,1000);
    for j=1:1000
        start=randi([1,25]);
        exit=0;
        layer=1;
        steps=0;
        while exit==0
            attempt=randi([1,(i-1)+sum(gsdyn(start,:,layer))]);
            if attempt < (i+1)
                if attempt ~= layer
                    steps=steps+1;
                end
                
                layer=attempt;
            end
            
            if attempt >i
                steps=steps+1;
                exit=1;
            end
            
        end
        tempvec(j)=steps;
    end
    avgs2(i)=mean(tempvec);
    min2(i)=min(tempvec);
    max2(i)=max(tempvec);
end
                
            