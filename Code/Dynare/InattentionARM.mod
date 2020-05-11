/*
 * Implements a basic Inattention model
 */
 
 var nu
    Epi_p
    i
    pi_p
    y_gap
    r_real
    n
    n_R
    n_K
    c_R
    c_K
    w_gap
    pi_w

    real_debt
    max_real_debt

    i_ann
    pi_p_ann
    r_real_ann
    pi_w_ann
    ;
    
varexo eps_nu;

parameters beta
           alpha
           rho_nu
           sigma
           phi
           phi_pi_p
           phi_pi_w
           phi_y
           epsilon_p
           epsilon_w
           theta_p
           theta_w
           lambda_p
           kappa_p
           lambda_w
           kappa_w
           pop_share_K
           debt_limit
           cons_share_K
           cons_share_R
           labor_share_K
           labor_share_R
           attention
           prin_pay
           inflation_inertia
            ;
%----------------------------------------------------------------
% Parametrization, p. 52
%----------------------------------------------------------------
set_param_value('beta',beta);
set_param_value('alpha',alpha);
set_param_value('rho_nu',rho_nu);
set_param_value('sigma',sigma);
set_param_value('phi',phi);
set_param_value('phi_pi_p',phi_pi_p);
set_param_value('phi_pi_w',phi_pi_w);
set_param_value('phi_y',phi_y);
set_param_value('epsilon_p',epsilon_p);
set_param_value('epsilon_w',epsilon_w);
set_param_value('theta_p',theta_p);
set_param_value('theta_w',theta_w);
set_param_value('lambda_p',lambda_p);
set_param_value('kappa_p',kappa_p);
set_param_value('lambda_w',lambda_w);
set_param_value('kappa_w',kappa_w);
set_param_value('pop_share_K',pop_share_K);
set_param_value('debt_limit',debt_limit);
set_param_value('cons_share_K',cons_share_K);
set_param_value('cons_share_R',cons_share_R);
set_param_value('labor_share_K',labor_share_K);
set_param_value('labor_share_R',labor_share_R);
set_param_value('attention',attention);

set_param_value('prin_pay',prin_pay);
set_param_value('inflation_inertia',inflation_inertia);

%----------------------------------------------------------------
% First Order Conditions
%----------------------------------------------------------------

model(linear); 
i = phi_pi_p*pi_p + phi_pi_w*pi_w + phi_y*y_gap + nu ;
r_real=i-pi_p(+1)   ;
pi_p=pi_w; %inflation_inertia*pi_p(-1) + (1-inflation_inertia)*(beta*pi_p(+1)+kappa_p*y_gap + lambda_p*w_gap);
pi_w=inflation_inertia*pi_w(-1) + (1-inflation_inertia)*(beta*pi_w(+1)+kappa_w*y_gap - lambda_w*w_gap);

c_R = c_R(+1) - attention*1/sigma*(i - pi_p(+1)) ;
%c_R=0.0;

real_debt = (1-prin_pay)*(real_debt(-1) - pi_p) + prin_pay*max_real_debt;
max_real_debt = pi_p(+1) - i/(prin_pay + 1/beta - 1); 
(1-debt_limit*(1-beta))*c_K = w_gap + n_K  - debt_limit*((real_debt(-1)- pi_p)*(prin_pay+1/beta-1) +i(-1)/beta ) + debt_limit*prin_pay*max_real_debt;

%(1-debt_limit*(1-beta))*c_K = w_gap + n_K  - beta*debt_limit*r_real - debt_limit*(Epi_p-pi_p);


w_gap = w_gap(-1) + pi_w - pi_p;
n_R = n_K;
y_gap = cons_share_R*c_R + cons_share_K*c_K;
n = labor_share_R*n_R + labor_share_K*n_K;
y_gap=(1-alpha)*n;
Epi_p = i(-1)-r_real(-1);
nu=rho_nu*nu(-1)+eps_nu;

i_ann = 4.0*i ;
pi_p_ann = 4.0*pi_p ;
r_real_ann = 4.0*r_real ;
pi_w_ann = 4.0*pi_w ;
end;


%----------------------------------------------------------------
%  define shock variances
%---------------------------------------------------------------


shocks;
    var eps_nu = 0.1^2; //1 standard deviation shock of 10 basis points
end;

%----------------------------------------------------------------
%  steady states: all 0 due to linear model
%---------------------------------------------------------------
resid(1);
steady;
check;

%----------------------------------------------------------------
% generate IRFs
%----------------------------------------------------------------
stoch_simul(order = 1,irf=200) y_gap pi_p_ann i_ann r_real_ann nu c_R c_K, max_real_debt, real_debt, w_gap, n_K;
