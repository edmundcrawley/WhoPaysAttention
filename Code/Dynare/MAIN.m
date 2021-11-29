%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code for TANK model in Dynare
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
addpath '/apps/dynare/4.5.6/lib/dynare/matlab' ;
clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run 'InattentionParameters.m';
%dynare InattentionModel.mod noclearall;
%dynare InattentionARM.mod noclearall nograph;

dynare InattentionModel.mod noclearall nograph;
IRFs = oo_.irfs;
attention = 1.0;
dynare InattentionModel.mod noclearall nograph;
IRFs_attn = oo_.irfs;

figure
max_T = 20;
plot([-1:max_T],[0,0,IRFs.y_gap_eps_nu(1:max_T)],'Linewidth',2);
hold;
plot([-1:max_T],[0,0,IRFs_attn.y_gap_eps_nu(1:max_T)],'Linewidth',2);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Output Gap")
title("Output Gap")
saveas(gcf,"./Figures/OutputGap.jpg")

figure;
%max_T = 20;
plot([-1:max_T],[0,0,IRFs.i_ann_eps_nu(1:max_T)],'Linewidth',2);
hold;
plot([-1:max_T],[0,0,IRFs_attn.i_ann_eps_nu(1:max_T)],'Linewidth',2);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Annualized Nominal Interest Rate")
title("Nominal Interest Rate")
saveas(gcf,"./Figures/NominalRate.jpg")

figure;
%max_T = 20;
plot([-1:max_T],[0,0,IRFs.nu_eps_nu(1:max_T)],'Linewidth',2);
hold;
plot([-1:max_T],[0,0,IRFs_attn.nu_eps_nu(1:max_T)],'Linewidth',2);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Taylor Rule Shock")
title("Taylor Rule Shock")
saveas(gcf,"./Figures/TayloreRuleShock.jpg")

figure;
%max_T = 20;
plot([-1:max_T],[0,0,IRFs.r_real_ann_eps_nu(1:max_T)],'Linewidth',2);
hold;
plot([-1:max_T],[0,0,IRFs_attn.r_real_ann_eps_nu(1:max_T)],'Linewidth',2);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Annualized Real Interest Rate")
title("Real Interest Rate")
saveas(gcf,"./Figures/RealRate.jpg")

figure;
%max_T = 20;
plot([-1:max_T],[0,0,IRFs.pi_p_ann_eps_nu(1:max_T)],'Linewidth',2);
hold;
plot([-1:max_T],[0,0,IRFs_attn.pi_p_ann_eps_nu(1:max_T)],'Linewidth',2);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Annualized Inflation Rate")
title("Inflation Rate")
saveas(gcf,"./Figures/Inflation.jpg")


figure;
%max_T = 20;
plot([-1:max_T],[0,0,IRFs.c_R_eps_nu(1:max_T)],'Linewidth',2);
hold;
plot([-1:max_T],[0,0,IRFs_attn.c_R_eps_nu(1:max_T)],'Linewidth',2);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Unconstrained Consumption")
title("Unconstrained Consumption")
saveas(gcf,"./Figures/UnconstrainedConsumption.jpg")

figure;
%max_T = 20;
plot([-1:max_T],[0,0,IRFs.c_K_eps_nu(1:max_T)],'Linewidth',2);
hold;
plot([-1:max_T],[0,0,IRFs_attn.c_K_eps_nu(1:max_T)],'Linewidth',2);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Constrained Consumption")
title("Constrained Consumption")
saveas(gcf,"./Figures/ConstrainedConsumption.jpg")

% silly thought experiment: infinitely lived agent, $100,000/year beta =
% 1/R
% what if rates go up for 1 year, then return
beta = 0.98
R = 1/beta
Rdelta = 1.01
R1 = R*Rdelta
rho = 2 % CRRA
y=100000
c1 = y*(1+ 1/(R1*(1-beta)))/(1/(beta*R1)^(1/rho)+ 1/(R1*(1-beta)))
c0 = c1*1/(beta*R1)^(1/rho)

utility = c0^(1-rho)/(1-rho) + beta/(1-beta)*c1^(1-rho)/(1-rho)
c_equiv = (utility*(1-beta)*(1-rho))^(1/(1-rho))
diff = c_equiv-y
PV = diff/(1-beta)
c_decrease = y-c0
PV/c_decrease

figure;
plot([y,y,y, y, y, y, y, y, y, y],'Linewidth',2)
hold;
plot([y,y,y,c0,c1,c1,c1,c1,c1,c1],'Linewidth',2)
%legend("Inattention","Attention")
xlabel("Year")
ylabel("Consumption")
%title("Consumption")
set(gcf,'position',[0,0,800,300])
ax = gca;
ax.YAxis.Exponent = 0;
ax.YAxis.TickLabelFormat = '%,d'
saveas(gcf,"./Figures/MotivatingExample.jpg")
