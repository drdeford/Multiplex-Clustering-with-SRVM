
all6ms=zeros(1,50);
all6d=zeros(1,50);
split6d=zeros(1,50);
split6ms=zeros(1,50);
unb6ms=zeros(1,50);
unb6d=zeros(1,50);
bal6d=zeros(1,50);
bal6ms=zeros(1,50);
temp=0;
for p=.01:.01:.5
temp=temp+1;
modularity_er_struct;
all6ms(temp)=modularity_metric({1:100,101:200,201:300,301:400,401:500,501:600},ms);
all6d(temp)=modularity_metric({1:100,101:200,201:300,301:400,401:500,501:600},A_dyn);
split6d(temp)=modularity_metric({1:300,301:600},A_dyn);
split6ms(temp)=modularity_metric({1:300,301:600},ms);
bal6ms(temp)=modularity_metric({1:200,201:400,401:600},ms);
bal6d(temp)=modularity_metric({1:200,201:400,401:600},A_dyn);
unb6d(temp)=modularity_metric({1:100,101:600},A_dyn);
unb6ms(temp)=modularity_metric({1:100,101:600},ms);

end