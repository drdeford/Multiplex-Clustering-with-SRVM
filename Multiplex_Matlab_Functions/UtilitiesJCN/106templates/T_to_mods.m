function mods=T_to_mods(T)

tmp_mod=[];

mods={};
n=length(T);
for i=1:max(T)
    temp=0;
    for j=1:n
        if T(j)==i
            temp=temp+1;
            tmp_mod(temp)=j;
        end
    end
    mods(i)={tmp_mod};
    tmp_mod=[];

end

    
        
        