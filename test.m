clear;
close all
clc;
%% Basic malab code
% dt =1;
% x = 1:dt:10;
% y = 2*x;
% 
% plot(x,y)
% xlabel('xaix');
% ylabel('yaix');
% title('figure-title')
%% Basic malab subplot
dt = 0.1*pi;
x = 0:0.1*pi:2*pi;
syms x1
y1 = sin(x);
y2 = cos(x);
y3 = x1^2;
y4 = 2*x;
figure
subplot(2,2,1);
plot(x,y1);
title('sine wave');
xlabel('x-variabel');
ylabel('value');

subplot(2,2,2);
plot(x,y2);
title('cos wave');
xlabel('x-variable');
ylabel('value');
axis([0,2*pi,-1.5,1.5]);
axis equal
set(gca,'xtick')
grid on




