%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code for TANK model in Dynare
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
addpath '/apps/dynare/4.5.6/lib/dynare/matlab' ;
clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run 'IMPCParameters.m';
% Saver spender model with and without attention
dynare SaverSpenderModel.mod noclearall nograph;
SS_IRFs = oo_.irfs;
attention = 1.0;
dynare SaverSpenderModel.mod noclearall nograph;
SS_IRFs_attn = oo_.irfs;
% IMPC model 
dynare IMPCModel.mod noclearall nograph;
IMPC_IRFs = oo_.irfs;
dynare LTDebtModel.mod noclearall nograph;
LT_debt_IRFs = oo_.irfs;
attention = 0.0;
dynare BUModel.mod noclearall nograph;
BU_IRFs = oo_.irfs;
attention = 1.0;
dynare BUModel.mod noclearall nograph;
BU_IRFs_attn = oo_.irfs;

max_T = 15;
Model = "BU";
if Model=="SS"
    IRFs = SS_IRFs;
    Model_Name = "Saver Spender";
elseif Model=="IMPC"
    IRFs = IMPC_IRFs;
    Model_Name = "IMPC";
elseif Model=="LT_debt"
    IRFs = LT_debt_IRFs;
    Model_Name = "Long Term Debt";
elseif Model=="BU"
    IRFs = BU_IRFs;
    Model_Name = "Bonds in Utility";
end

figure;
plot([-1:max_T],[0,0,IRFs.pi_p_ann_eps_nu(1:max_T)],'Linewidth',2, 'color','blue','linestyle','-');
if Model=="SS"
    hold;
    plot([-1:max_T],[0,0,SS_IRFs_attn.pi_p_ann_eps_nu(1:max_T)],'Linewidth',2, 'color','blue','linestyle','--');
    legend("Inattention","Attention")
elseif Model=="BU"
    hold;
    plot([-1:max_T],[0,0,BU_IRFs_attn.pi_p_ann_eps_nu(1:max_T)],'Linewidth',2, 'color','blue','linestyle','--');
    legend("Inattention","Attention")
end
xlabel("Quarter")
ylabel("Inflation")
title(Model_Name +" Model, Inflation")
saveas(gcf,"../Figures/Inflation" + Model + ".jpg")

figure;
plot([-1:max_T],[0,0,IRFs.c_R_eps_nu(1:max_T)],'Linewidth',2, 'color','blue','linestyle','-');
hold;
plot([-1:max_T],[0,0,IRFs.c_K_eps_nu(1:max_T)],'Linewidth',2, 'color','red','linestyle','-');
if Model=="SS"
    plot([-1:max_T],[0,0,SS_IRFs_attn.c_R_eps_nu(1:max_T)],'Linewidth',2, 'color','blue','linestyle','--');
    plot([-1:max_T],[0,0,SS_IRFs_attn.c_K_eps_nu(1:max_T)],'Linewidth',2, 'color','red','linestyle','--');
    legend("Saver", "Spender", "Saver-Attention","Spender-Attention");
elseif Model=="BU"
    plot([-1:max_T],[0,0,BU_IRFs_attn.c_R_eps_nu(1:max_T)],'Linewidth',2, 'color','blue','linestyle','--');
    plot([-1:max_T],[0,0,BU_IRFs_attn.c_K_eps_nu(1:max_T)],'Linewidth',2, 'color','red','linestyle','--');
    legend("Saver", "Spender", "Saver-Attention","Spender-Attention");
else
    legend("Saver", "Spender");
end
xlabel("Quarter")
ylabel("Consumption")
title(Model_Name +" Model, Consumption")
saveas(gcf,"../Figures/Consumption" + Model + ".jpg")

figure;
plot([-1:max_T],[0,0,IRFs.r_real_ann_eps_nu(1:max_T)],'Linewidth',2, 'color','blue','linestyle','-');
if Model=="SS"
    hold;
    plot([-1:max_T],[0,0,SS_IRFs_attn.r_real_ann_eps_nu(1:max_T)],'Linewidth',2, 'color','blue','linestyle','--');
    legend("Inattention","Attention")
elseif Model=="BU"
    hold;
    plot([-1:max_T],[0,0,BU_IRFs_attn.r_real_ann_eps_nu(1:max_T)],'Linewidth',2, 'color','blue','linestyle','--');
    legend("Inattention","Attention")
end
xlabel("Quarter")
ylabel("Real Interest Rate")
title(Model_Name +" Model, Real Interest Rate")
saveas(gcf,"../Figures/RealRate" + Model + ".jpg")

figure;
plot([-1:max_T],[0,0,IRFs.i_ann_eps_nu(1:max_T)],'Linewidth',2, 'color','blue','linestyle','-');
if Model=="SS"
    hold;
    plot([-1:max_T],[0,0,SS_IRFs_attn.i_ann_eps_nu(1:max_T)],'Linewidth',2, 'color','blue','linestyle','--');
    legend("Inattention","Attention")
elseif Model=="BU"
    hold;
    plot([-1:max_T],[0,0,BU_IRFs_attn.i_ann_eps_nu(1:max_T)],'Linewidth',2, 'color','blue','linestyle','--');
    legend("Inattention","Attention")
end
xlabel("Quarter")
ylabel("Nominal Interest Rate")
title(Model_Name +" Model, Nominal Interest Rate")
saveas(gcf,"../Figures/NominalRate" + Model + ".jpg")


% 
% % silly thought experiment: infinitely lived agent, $100,000/year beta =
% % 1/R
% % what if rates go up for 1 year, then return
% beta = 0.98
% R = 1/beta
% Rdelta = 1.01
% R1 = R*Rdelta
% rho = 2 % CRRA
% y=100000
% c1 = y*(1+ 1/(R1*(1-beta)))/(1/(beta*R1)^(1/rho)+ 1/(R1*(1-beta)))
% c0 = c1*1/(beta*R1)^(1/rho)
% 
% utility = c0^(1-rho)/(1-rho) + beta/(1-beta)*c1^(1-rho)/(1-rho)
% c_equiv = (utility*(1-beta)*(1-rho))^(1/(1-rho))
% diff = c_equiv-y
% PV = diff/(1-beta)
% c_decrease = y-c0
% PV/c_decrease
% 
% figure;
% plot([y,y,y, y, y, y, y, y, y, y],'Linewidth',2)
% hold;
% plot([y,y,y,c0,c1,c1,c1,c1,c1,c1],'Linewidth',2)
% %legend("Inattention","Attention")
% xlabel("Year")
% ylabel("Consumption")
% %title("Consumption")
% set(gcf,'position',[0,0,800,300])
% ax = gca;
% ax.YAxis.Exponent = 0;
% ax.YAxis.TickLabelFormat = '%,d'
% saveas(gcf,"./Figures/MotivatingExample.jpg")
