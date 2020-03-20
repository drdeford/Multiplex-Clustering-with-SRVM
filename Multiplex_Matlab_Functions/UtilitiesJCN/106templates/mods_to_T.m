function T=mods_to_T(mods,n,k)

T=zeros(1,n*k);

for i=1:length(mods)
    for el =mods{i}
        T(el)=i;
    end
end

