clc
clear
close all
%% Plot Parameters
width = 8;     % Width in inches
height = 4;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz =20 ;      % Fontsize
lw = 1;      % LineWidth
msz = 8;       % MarkerSize
%% Load from Workspace  Structure  
MAD=load('MAD_NSGAII.mat');
CVaR=load('CVaR_NSGAII.mat');
MSV=load('MSV_NSGAII.mat');
for i=1:100
wMAD(i,1:6)=MAD.Rep(1).pop(i).Out.w;
Cost1MAD(i)=MAD.Rep(1).pop(i).Cost(1);
Cost2MAD(i)=MAD.Rep(1).pop(i).Cost(2);
%
wCVaR(i,1:6)=CVaR.Rep(1).pop(i).Out.w;
Cost1CVaR(i)=CVaR.Rep(1).pop(i).Cost(1);
Cost2CVaR(i)=CVaR.Rep(1).pop(i).Cost(2);
%
wMSV(i,1:6)=MSV.Rep(1).pop(i).Out.w;
Cost1MSV(i)=MSV.Rep(1).pop(i).Cost(1);
Cost2MSV(i)=MSV.Rep(1).pop(i).Cost(2);
end;
time=1:100;
%% Figure 1
figure
plot(Cost1MAD,Cost2MAD,'ob','linewidth',2)
hold on
plot(Cost1MSV,Cost2MSV,'*r','linewidth',2)
hold on
plot(Cost1CVaR,Cost2CVaR,'sk','linewidth',2)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('Risk','fontsize',fsz-5,'FontName','Times New Roman')
title('Pareto Front','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MAD','CVaR','MSV');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 2
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*70]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(time,Cost1MAD,'b','linewidth',2)
grid minor
xlabel('Time','fontsize',fsz-2,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('Risk','fontsize',fsz-2,'FontName','Times New Roman')
title('Optimal Risk Models','fontsize',fsz-2,'FontName','Times New Roman')
h=legend('MAD');
set(h,'fontsize',fsz-5,'FontName','Times New Roman')
%% Figure 3
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*70]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(time,Cost1MSV,'r','linewidth',2)
grid minor
xlabel('Time','fontsize',fsz-2,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('Risk','fontsize',fsz-2,'FontName','Times New Roman')
h=legend('CVaR');
set(h,'fontsize',fsz-5,'FontName','Times New Roman')
%% Figure 4
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*70]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(time,Cost1CVaR,'k','linewidth',2)
grid minor
xlabel('Time','fontsize',fsz-2,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('Risk','fontsize',fsz-2,'FontName','Times New Roman')
h=legend('MSV');
set(h,'fontsize',fsz-5,'FontName','Times New Roman')
%% Figure 5
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*70]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(time,Cost2MAD,'b','linewidth',2)
grid minor
xlabel('Time','fontsize',fsz-2,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('Return','fontsize',fsz-2,'FontName','Times New Roman')
title('Optimal Return Models','fontsize',fsz-2,'FontName','Times New Roman')
h=legend('MAD');
set(h,'fontsize',fsz-5,'FontName','Times New Roman')
%% Figure 6
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*70]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(time,Cost2MSV,'r','linewidth',2)
grid minor
xlabel('Time','fontsize',fsz-2,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('Return','fontsize',fsz-2,'FontName','Times New Roman')
h=legend('CVaR');
set(h,'fontsize',fsz-5,'FontName','Times New Roman')
%% Figure 7
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(time,Cost2CVaR,'k','linewidth',2)
grid minor
xlabel('Time','fontsize',fsz-2,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('Return','fontsize',fsz-2,'FontName','Times New Roman')
h=legend('MSV');
set(h,'fontsize',fsz-5,'FontName','Times New Roman')
%% Figure 8
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wMAD(:,1),'-ob','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_1','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MAD');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 9
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wMSV(:,1),'-vr','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_1','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('CVaR');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 10
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wCVaR(:,1),'-sk','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_1','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MSV');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 11
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wMAD(:,2),'-ob','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_2','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MAD');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 12
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wMSV(:,2),'-vr','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_2','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('CVaR');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 13
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wCVaR(:,2),'-sk','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_2','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MSV');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 14
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wMAD(:,3),'-ob','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_3','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MAD');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 15
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wMSV(:,3),'-vr','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_3','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('CVaR');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 16
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wCVaR(:,3),'-sk','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_3','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MSV');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 17
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wMAD(:,4),'-ob','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_4','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MAD');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 18
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wMSV(:,4),'-vr','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_4','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('CVaR');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 19
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wCVaR(:,4),'-sk','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_4','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MSV');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 20
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wMAD(:,5),'-ob','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_5','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MAD');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 21
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wMSV(:,5),'-vr','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_5','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('CVaR');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 22
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wCVaR(:,5),'-sk','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_5','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MSV');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 23
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wMAD(:,6),'-ob','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_6','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MAD');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 24
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

plot(time,wMSV(:,6),'-vr','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_6','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('CVaR');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')
%% Figure 25
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*80]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(time,wCVaR(:,6),'-sk','linewidth',2.5)
grid minor
xlabel('Time','fontsize',fsz-5,'FontName','Times New Roman') ;% 96*15=24*60 min
ylabel('w_6','fontsize',fsz-5,'FontName','Times New Roman')
title('Weighted Coeffiecent','fontsize',fsz-5,'FontName','Times New Roman')
h=legend('MSV');
set(h,'fontsize',fsz-9,'FontName','Times New Roman')