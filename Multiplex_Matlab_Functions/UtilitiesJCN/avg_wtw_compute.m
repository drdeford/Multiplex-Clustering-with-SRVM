c_agg=rwbc(make_rw_l(t_agg,62),62,1);

c_l0=rwbc(make_rw_l(t_avg_0,62),62,1);
c_l1=rwbc(make_rw_l(t_avg_1,62),62,1);
c_l2=rwbc(make_rw_l(t_avg_2,62),62,1);
c_l3=rwbc(make_rw_l(t_avg_3,62),62,1);
c_l4=rwbc(make_rw_l(t_avg_4,62),62,1);
c_l5=rwbc(make_rw_l(t_avg_5,62),62,1);
c_l6=rwbc(make_rw_l(t_avg_6,62),62,1);
c_l7=rwbc(make_rw_l(t_avg_7,62),62,1);
c_l8=rwbc(make_rw_l(t_avg_8,62),62,1);
c_l9=rwbc(make_rw_l(t_avg_9,62),62,1);

wtw=zeros(62,62,10);
wtw(:,:,1)=t_avg_0;
wtw(:,:,2)=t_avg_1;
wtw(:,:,3)=t_avg_2;
wtw(:,:,4)=t_avg_3;
wtw(:,:,5)=t_avg_4;
wtw(:,:,6)=t_avg_5;
wtw(:,:,7)=t_avg_6;
wtw(:,:,8)=t_avg_7;
wtw(:,:,9)=t_avg_8;
wtw(:,:,10)=t_avg_9;

wtw_rw=zeros(62,62,10);

for i=1:10
    wtw_rw(:,:,i)=make_rw_l(wtw(:,:,i),62);
end




c_equi=rwbc(equi_C(62,10)*make_D(wtw_rw,62,10),62,10);

c_hd=rwbc(hier_density(wtw,62,10)*make_D(wtw_rw,62,10),62,10);

c_und=rwbc(un_degree(wtw,62,10)*make_D(wtw_rw,62,10),62,10);

[temp,sc_agg]=sort(c_agg,'descend');

[temp,sc_l0]=sort(c_l0,'descend');
[temp,sc_l1]=sort(c_l1,'descend');
[temp,sc_l2]=sort(c_l2,'descend');
[temp,sc_l3]=sort(c_l3,'descend');
[temp,sc_l4]=sort(c_l4,'descend');
[temp,sc_l5]=sort(c_l5,'descend');
[temp,sc_l6]=sort(c_l6,'descend');
[temp,sc_l7]=sort(c_l7,'descend');
[temp,sc_l8]=sort(c_l8,'descend');
[temp,sc_l9]=sort(c_l9,'descend');

[temp,sc_equi]=sort(c_equi,'descend');
msc_equi=mod(sc_equi,62);
[temp,sc_hd]=sort(c_hd,'descend');
msc_hd=mod(sc_hd,62);

[temp,sc_und]=sort(c_und,'descend');
msc_und=mod(sc_und,62);

