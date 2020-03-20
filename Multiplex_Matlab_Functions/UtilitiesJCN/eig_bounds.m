function [upper,lower]=eig_bounds(v1f,v1max,v2f,v2max,eig_vec,n)


p_vec=0:.01:1;
upper=zeros(1,n);
lower=zeros(1,n);
upper1=zeros(1,n);
lower1=zeros(1,n);
for i=1:n %%OLD
    c=p_vec(i);
    lower(i)=max(c*v1f,(1-c)*v2f);
    upper(i)=min(c*v1f+(1-c)*v2max,(1-c)*v2f+c*v1max);%was outside max dumb
    
end



  %  for i=1:n %dumb
  %      c=p_vec(i);
  %      %lower(i)=min(max(v1f,((1-c)/c)*v2f),max((c/(1-c))*v1f,v2f));
  %%      
   % end
    
    
    
    