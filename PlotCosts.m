function PlotCosts(pop)
%% Plot Parameters
width = 8;     % Width in inches
height = 4;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz =20 ;      % Fontsize
lw = 1;      % LineWidth
msz = 8;       % MarkerSize
    Costs=[pop.Cost];
    
    plot(Costs(1,:),-Costs(2,:),'r*','linewidth',2,'markersize',10);
    title('NSGA II Algorithm Pareto Front','fontsize',fsz-5,'FontName','Times New Roman')
    xlabel('Risk','fontsize',fsz-5,'FontName','Times New Roman');
    ylabel('Return','fontsize',fsz-5,'FontName','Times New Roman');
    grid minor;
    h=legend('Particle','location','southeast');
    set(h,'fontsize',fsz-8,'FontName','Times New Roman')
end