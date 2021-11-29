/*
 * Implements a basic Inattention model
 */
 
 var nu
    %Epi_p
    i
    pi_p
    y_gap
    r_real
    %n
    %n_R
    %n_K
    c_R
    %c_K
    %w_gap
    %pi_w
    %i_ann
    %pi_p_ann
    %r_real_ann
    %pi_w_ann
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

%----------------------------------------------------------------
% First Order Conditions
%----------------------------------------------------------------

model(linear); 

% Taylor Rule
%i = 1.5*pi_p + nu ;
r_real = nu;
%r_real = 0;

% Fisher Equation
r_real=i -pi_p(+1) ;

% Price and wage Philips Curves
pi_p=beta*pi_p(+1)+0.2*y_gap ;
%pi_p = 0.0;

% Euler equation for unconstrained
c_R = c_R(+1) - 1/sigma*r_real ;
%c_R=0;

y_gap = c_R;
nu=rho_nu*nu(-1)+eps_nu(0);

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
stoch_simul(order = 1,irf=40, qz_criterium=0.999999) y_gap   r_real nu c_R ;
