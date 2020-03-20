function eq=equi_C(n,k)

%Input: n,k
%Output: mix_vec of 1/k

eq=ones(k,k,n);
eq=eq/k;
eq=make_C(eq,n,k);