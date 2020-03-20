e_c_d=zeros(46,5);
e_c_ms=zeros(46,5);
a_c_d=zeros(46,5);
a_c_ms=zeros(46,5);
together_ms=zeros(46,5);
together_d=zeros(46,5);
max_c_d=zeros(46,5);
max_c_ms=zeros(46,5);
for i =1:45
for j=1:5
for k=1:100
e_c_d(i,j)=e_c_d(i,j)+inter_cut_d(i,j,k);
e_c_ms(i,j)=e_c_ms(i,j)+inter_cut_ms(i,j,k);
a_c_d(i,j)=a_c_d(i,j)+intra_cut_d(i,j,k);
a_c_ms(i,j)=a_c_ms(i,j)+intra_cut_ms(i,j,k);
together_d(i,j)=together_d(i,j)+prop_together_d(i,j,k);
together_ms(i,j)=together_ms(i,j)+prop_together_ms(i,j,k);
max_c_d(i,j)=max_c_d(i,j)+max_c_size_d(i,j,k);
max_c_ms(i,j)=max_c_ms(i,j)+max_c_size_ms(i,j,k);

end
end
end
e_c_d=e_c_d/100;
e_c_ms=e_c_ms/100;
a_c_d=a_c_d/100;
a_c_ms=a_c_ms/100;
together_d=together_d/100;
together_ms=together_ms/100;
max_c_d=max_c_d/100;
max_c_ms=max_c_ms/100;