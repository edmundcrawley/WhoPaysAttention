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
plot([-1:max_T],[0,0,IRFs.y_gap_eps_nu(1:max_T)]);
hold;
plot([-1:max_T],[0,0,IRFs_attn.y_gap_eps_nu(1:max_T)]);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Output Gap")
title("Output Gap")
saveas(gcf,"./Figures/OutputGap.pdf")

figure;
max_T = 20;
plot([-1:max_T],[0,0,IRFs.i_ann_eps_nu(1:max_T)]);
hold;
plot([-1:max_T],[0,0,IRFs_attn.i_ann_eps_nu(1:max_T)]);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Annualized Nominal Interest Rate")
title("Nominal Interest Rate")
saveas(gcf,"./Figures/NominalRate.pdf")

figure;
max_T = 20;
plot([-1:max_T],[0,0,IRFs.nu_eps_nu(1:max_T)]);
hold;
plot([-1:max_T],[0,0,IRFs_attn.nu_eps_nu(1:max_T)]);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Taylor Rule Shock")
title("Taylor Rule Shock")
saveas(gcf,"./Figures/TayloreRuleShock.pdf")

figure;
max_T = 20;
plot([-1:max_T],[0,0,IRFs.r_real_ann_eps_nu(1:max_T)]);
hold;
plot([-1:max_T],[0,0,IRFs_attn.r_real_ann_eps_nu(1:max_T)]);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Annualized Real Interest Rate")
title("Real Interest Rate")
saveas(gcf,"./Figures/RealRate.pdf")

figure;
max_T = 20;
plot([-1:max_T],[0,0,IRFs.pi_p_ann_eps_nu(1:max_T)]);
hold;
plot([-1:max_T],[0,0,IRFs_attn.pi_p_ann_eps_nu(1:max_T)]);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Annualized Inflation Rate")
title("Inflation Rate")
saveas(gcf,"./Figures/Inflation.pdf")


figure;
max_T = 20;
plot([-1:max_T],[0,0,IRFs.c_R_eps_nu(1:max_T)]);
hold;
plot([-1:max_T],[0,0,IRFs_attn.c_R_eps_nu(1:max_T)]);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Unconstrained Consumption")
title("Unconstrained Consumption")
saveas(gcf,"./Figures/UnconstrainedConsumption.pdf")

figure;
max_T = 20;
plot([-1:max_T],[0,0,IRFs.c_K_eps_nu(1:max_T)]);
hold;
plot([-1:max_T],[0,0,IRFs_attn.c_K_eps_nu(1:max_T)]);
legend("Inattention","Attention")
xlabel("Quarter")
ylabel("Constrained Consumption")
title("Constrained Consumption")
saveas(gcf,"./Figures/ConstrainedConsumption.pdf")


