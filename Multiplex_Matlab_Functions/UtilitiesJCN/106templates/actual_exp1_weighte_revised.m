prop_together_ms=zeros(2,2,50,100);
prop_together_d=zeros(2,2,50,100);


%j=2;


intra_cut_ms=zeros(2,2,50,100);
intra_cut_d=zeros(2,2,50,100);
inter_cut_ms=zeros(2,2,50,100);
inter_cut_d=zeros(2,2,50,100);

c_size_ms=zeros(2,2,50,100,4);
c_size_d=zeros(2,2,50,100,4);
max_c_size_ms=zeros(2,2,50,100);
max_c_size_d=zeros(2,2,50,100);



%tempp=1;
p=[.05,.3];
k=4;
layers=[2,4];
weights=.1:.1:5;
for pt=1:2
    for jt=1:2
        for wt=1:50
        for run=1:100
            [ms_inter,ms_intra,ms_prop_inter,ms_prop_intra,d_inter,d_intra,d_prop_inter,d_prop_intra,cluster_ms_sizes,cluster_dlap_sizes,max_ms_size,max_dlap_size,propms,propd_lap]=rf1w(100,4,p(pt),layers(jt),weights(wt),1);
            %was j=2 before

            
prop_together_ms(pt,jt,wt,run)=propms ;
prop_together_d(pt,jt,wt,run)= propd_lap;



intra_cut_ms(pt,jt,wt,run)= ms_intra;
intra_cut_d(pt,jt,wt,run)= d_intra;
inter_cut_ms(pt,jt,wt,run)=ms_inter ;
inter_cut_d(pt,jt,wt,run)= d_inter;

c_size_ms(pt,jt,wt,run,1:2*jt)= cluster_ms_sizes;%was just :
c_size_d(pt,jt,wt,run,1:2*jt)= cluster_dlap_sizes;%was just :
max_c_size_ms(pt,jt,wt,run)= max_ms_size;
max_c_size_d(pt,jt,wt,run)= max_dlap_size;


        end
       wt
    end
end
end


