%% Sets parameters for the paper
beta = 0.99;

rho_nu = 0.8;
debt_limit = 3.0;
mpc_R = 1-beta;
mpc_K = 0.15;
r_bar = 1/beta;

sigma = 2;
attention = 0;

% For LTDebt
theta = 0.95;
Bp_bar = 1.0/(r_bar - theta);
A_bar = debt_limit/((1-theta)*Bp_bar);
M_K_bar = -A_bar + 1;
C_K_bar = M_K_bar + debt_limit;
M_R_bar = A_bar + 1;
C_R_bar = M_R_bar - debt_limit;
