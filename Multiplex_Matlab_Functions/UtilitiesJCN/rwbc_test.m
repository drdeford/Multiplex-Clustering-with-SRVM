g=random_graph(500,.5);
g=make_rw_l(g,500);
%[a1,a2]=rwbc(g,100,1)
rwbc(g,500,1)