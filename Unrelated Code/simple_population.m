%EV - COM3001
%setenv ("GNUTERM", "x11") 

close all
clear
clc



%--------------------------------------------------------


figure


dt=0.1;
t=0:dt:10;

fs=18;

a=0.5;
x0=0.5;
colour=['r','g','b','k'];

lt=length(t)-1;
y=zeros(1,lt);

y(1)=x0;



for i=1:lt %numerical solution
    y(i+1)=y(i)*(1+a*dt);
    hold on
end

h=plot(t,y,'LineWidth',2,'Color','r');

xlabel('time','fontsize',fs);
ylabel('Population size','fontsize',fs);
set(gca,'fontsize',fs);

hold on

k=x0;

y2=k*exp(a*t); % analytical solution

h=plot(t,y2,'LineWidth',2,'Color','k');

legend('numerical solution','actual solution','Location','best')
