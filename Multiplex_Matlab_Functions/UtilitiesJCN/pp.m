function P=pp(p,q,k)
P=q*ones(k);
P=P+(p-q)*eye(k);
