lower=zeros(1,100);
upper=zeros(1,100);
f_vec=zeros(1,100);

for i=1:100
    l1=random_graph(100,i/100);
    l2=random_graph(100,i/100);
    ll1=make_lap(l1,100);
    ll2=make_lap(l2,100);
    v1_max=abs(eigs(ll1,1));
    v2_max=abs(eigs(ll2,1));
    E=eigs(ll1,99);
    v1f=abs(E(99));
    E=eigs(ll2,99);
    v2f=abs(E(99));
    
    
    lower(i)=.5*max(v1f,v2f);
    upper(i)=.5*min(v1f+v2_max,v2f+v1_max);
    
    ll=zeros(100,100,2);
    ll(:,:,1)=ll1;
    
    ll(:,:,2)=ll2;
    
    D=make_D(ll,100,2);
    
    CD=equi_C(100,2)*D;
    
    E=eigs(CD,99);
    f_vec(i)=abs(E(99));
    
end

    
plot(f_vec,'b*')
hold on
plot(upper,'r')
plot(lower,'g')
%title('Comparison of Laplacian Eigenvalue Bounds')
xlabel('Erdos-Renyi Parameter')
ylabel('Fiedler Value')
legend('Fiedler Values','Upper Bound','Lower Bound')

    
    