function [ranks,H]=hearingmat(A,q,T)

n=size(A,1);

H=zeros(n);

for i=1:T
    H=H+(q*A)^i;
end


ranks=H*ones(n,1);

