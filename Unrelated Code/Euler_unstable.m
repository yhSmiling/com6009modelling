clc
clear
figure


dt=0.1;
t=0:dt:5;

fs=18;

a=2;
x0=0.8;
colour=['r','g','b','k'];

lt=length(t)-1;
x=zeros(size(t));

x(1)=x0;



for i=1:lt %numerical solution
    x(i+1)=x(i)*(1-a*dt);
end

h=plot(t,x,'LineWidth',2,'Color','r');

xlabel('time','fontsize',fs);
ylabel('Proteine degradation','fontsize',fs);
set(gca,'fontsize',fs);

