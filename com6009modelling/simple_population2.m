%EV COM3001
clear; % clears the variables 
close all;
clc;




%-------------------------------------------------------
%numerical solution

tmin=0;
tmax=5;
fs=18;

a=2;
dt=0.5; %try 0.1 for better accuracy


t1=tmin:dt:tmax;
lt=length(t1)-1;
y=zeros(size(t1));

xinit=[0 0.1 1 1.1];
lx=length(xinit);

colour=['r','g','b','k'];

figure

ms=12;

 for i=1:lx
        
        
        y(1)=xinit(i);
        for j=1:lt %numerical solution
            y(j+1)=y(j)*(1+a*dt)-a*dt*y(j).^2;
            hold on
        end
        
        
        hold on
        
        plot(t1,y,'+','Color',colour(i),'MarkerSize',ms,'LineWidth',2)
        
end




xlabel('time','fontsize',fs);
ylabel('Population size','fontsize',fs);
title('Numerical Solution','fontsize',fs);
set(gca,'fontsize',fs);
legend('x(0)=0','x(0)=0.5','x(0)=1','x(0)=1.1','Location','best')




%-------------------------
%comparison of different step sizes

figure
tmin=0;
tmax=5;

a=2;
xinit=0.1;

dt=[0.8 0.5 0.1 0.05]; %try 0.1 for better accuracy
ldt=length(dt);


colour='b';
symbol=['+','*','x','-'];
ms=12;


for i=1:ldt
    t1=tmin:dt(i):tmax;
    lt=length(t1)-1;
    y=zeros(size(t1));
    y(1)=xinit;
    
    for j=1:lt %numerical solution
        y(j+1)=y(j)*(1+a*dt(i))-a*dt(i)*y(j).^2;
    end
    plot(t1,y,symbol(i),'Color',colour,'MarkerSize',ms,'LineWidth',2);
    hold on
end


xlabel('time','fontsize',fs);
ylabel('Population size','fontsize',fs);
set(gca,'fontsize',fs);
legend('\Deltat=0.8','\Deltat=0.5','\Deltat=0.1','\Deltat=0.05','Location','best')


%---------------
%stability analysis steady state


adt=0.3; %I define 1 parameter for alpha*dt

dx=1E-3;

x=0:dx:1.2;

y=x+adt*x-adt*x.^2;

figure
plot(x,y,'LineWidth',2); 
hold on
plot(x,x,'LineWidth',2,'Color','r')
axis tight
xlabel('Population size at t_n','fontsize',fs);
ylabel('Population size at t_{n+1}','fontsize',fs);
set(gca,'fontsize',fs);

