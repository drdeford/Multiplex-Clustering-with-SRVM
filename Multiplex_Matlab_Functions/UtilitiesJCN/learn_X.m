function X=learn_X(A,n,d,epsilon)

D=zeros(n);

X=gd(A+D,d);

diff1= norm(X'*X-A-diag(diag(X'*X)), 'fro');
diff2=inf;
temp=0;
while abs(diff1 -diff2)> epsilon
    diff1= norm(X'*X-A-diag(diag(X'*X)), 'fro');
    D=diag(diag(X'*X));
    X=gd(A+D,d);
    temp=temp+1
    D=diag(diag(X'*X));
    diff2=norm(X'*X-A-D,'fro');
    
end





