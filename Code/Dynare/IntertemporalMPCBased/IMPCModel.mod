/*
 * Implements IMPC model
 */
 
 var r_real n_R n_K c_R c_K r_real_ann m_R m_K a_R a_K nu i pi_p
    i_ann pi_p_ann f_R f_K;
    
varexo eps_nu;

parameters rho_nu debt_limit mpc_R mpc_K r_bar;

%----------------------------------------------------------------
% Parametrization
%----------------------------------------------------------------
set_param_value('rho_nu',rho_nu);
set_param_value('debt_limit',debt_limit);
set_param_value('mpc_R',mpc_R);
set_param_value('mpc_K',mpc_K);
set_param_value('r_bar',r_bar);

%----------------------------------------------------------------
% First Order Conditions
%----------------------------------------------------------------

model(linear); 

% Taylor Rule
%i = 1.5*pi_p + nu ;
% Use Real Rate shocks as an alternative to Taylor rule and Philips curve
r_real = nu;

% Philips Curve, somewhat backward looking
pi_p=0.4*pi_p(-1) + 0.6*(0.99*pi_p(+1)+0.02*n_K) ;

% Fisher Equation
r_real=i -pi_p(+1) ;

% End of period assets for each type of agent
a_R = m_R-c_R;
a_K = m_K-c_K;
a_R = -a_K;
% Value of forward deviations in income. For 'K' agents, this value is discounted (not forward looking/borrowing constrained)
f_R = 1/r_bar*(n_R(+1) + debt_limit*r_real + f_R(+1));
f_K = (1-mpc_K)/40000*(n_K(+1) - debt_limit*r_real + f_K(+1));


% IMPC for R
c_R = mpc_R * (m_R + f_R);
m_R = a_R(-1)*r_bar + n_R + debt_limit*r_real(-1);
% IMPC for K
c_K = mpc_K * (m_K + f_K) + 0.3*n_K + 0.0*(n_K - debt_limit*r_real(-1));
m_K = a_K(-1)*r_bar + n_K - debt_limit*r_real(-1);

n_R = n_K;

nu=rho_nu*nu(-1)+eps_nu(0);

r_real_ann = 4.0*r_real ;
i_ann = 4*i;
pi_p_ann = 4*pi_p;
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
stoch_simul(order = 1,irf=40,qz_criterium=0.999999)  r_real_ann c_R c_K, n_K, a_R, a_K, r_real, i_ann, i, pi_p, pi_p_ann, f_R, f_K;
