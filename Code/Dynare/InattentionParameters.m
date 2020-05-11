%% Sets parameters for the paper
beta = 0.99;
alpha = 0.0;
rho_nu = 0.92;
sigma =1.0;
phi = 1.0;
phi_pi_p = 1.5;
phi_pi_w = 0.0;
phi_y = 0.0;
epsilon_p = 1000000.0;
epsilon_w = 6.0;
theta_p = 0.0001;
theta_w = 0.75; %2.0/3.0;
lambda_p = (1-theta_p)*(1-beta*theta_p)/theta_p;
kappa_p = lambda_p*alpha/(1-alpha) ;
lambda_w = (1-theta_w)*(1-beta*theta_w)/(theta_w*(1+epsilon_w*phi)) ;
kappa_w = lambda_w*(sigma + phi/(1-alpha)) ;
pop_share_K = 0.5;
debt_limit = 3.0;
cons_share_K = (1.0-debt_limit*(1-beta))*pop_share_K*(1.0-alpha)*(epsilon_p-1.0)/epsilon_p;
cons_share_R = 1.0-cons_share_K;
labor_share_K = pop_share_K;
labor_share_R = 1- pop_share_K;
attention = 0.0001;

%extra params for ARM model
prin_pay = 0.025 ;     % percentage of principal paid each quarter
inflation_inertia = 0.0;

