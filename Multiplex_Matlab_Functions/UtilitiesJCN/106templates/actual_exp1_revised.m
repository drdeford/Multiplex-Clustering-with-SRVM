prop_together_ms=zeros(46,5,100);
prop_together_d=zeros(46,5,100);


%j=2;


intra_cut_ms=zeros(46,5,100);
intra_cut_d=zeros(46,5,100);
inter_cut_ms=zeros(46,5,100);
inter_cut_d=zeros(46,5,100);

c_size_ms=zeros(46,5,100,5);
c_size_d=zeros(46,5,100,5);
max_c_size_ms=zeros(46,5,100);
max_c_size_d=zeros(46,5,100);



tempp=1;
for p=.05:.01:.5
    for k=2:6
        for run=1:100
            [ms_inter,ms_intra,ms_prop_inter,ms_prop_intra,d_inter,d_intra,d_prop_inter,d_prop_intra,cluster_ms_sizes,cluster_dlap_sizes,max_ms_size,max_dlap_size,propms,propd_lap]=rf1w(100,k,p,k,1,1);
            %was j=2 before

            
prop_together_ms(tempp,k-1,run)=propms ;
prop_together_d(tempp,k-1,run)= propd_lap;



intra_cut_ms(tempp,k-1,run)= ms_intra;
intra_cut_d(tempp,k-1,run)= d_intra;
inter_cut_ms(tempp,k-1,run)=ms_inter ;
inter_cut_d(tempp,k-1,run)= d_inter;

c_size_ms(tempp,k-1,run,1:k)= cluster_ms_sizes;%was just :
c_size_d(tempp,k-1,run,1:k)= cluster_dlap_sizes;%was just :
max_c_size_ms(tempp,k-1,run)= max_ms_size;
max_c_size_d(tempp,k-1,run)= max_dlap_size;


        end
       k
    end
    tempp=tempp+1;
    tempp
end

