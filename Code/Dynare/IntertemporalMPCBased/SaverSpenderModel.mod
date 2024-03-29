/*
 * Implements Saver Spender model
 */
 
 var r_real n_R n_K c_R c_K r_real_ann nu i pi_p
    i_ann pi_p_ann ;
    
varexo eps_nu;

parameters rho_nu debt_limit r_bar sigma attention;

%----------------------------------------------------------------
% Parametrization
%----------------------------------------------------------------
set_param_value('rho_nu',rho_nu);
set_param_value('debt_limit',debt_limit);
set_param_value('r_bar',r_bar);
set_param_value('sigma',sigma);
set_param_value('attention',attention);

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

% Euler for R
c_R = c_R(+1) - attention*1/sigma*(i - pi_p(+1)) ;
% Budget constraint for K
(1-debt_limit*(r_bar-1))*c_K = n_K  - r_bar*debt_limit*r_real(-1) ;

n_R = n_K;

%n_K is equal to the output gap
n_K = 0.5*(1+debt_limit*(1-1/r_bar))*c_R + 0.5*(1-debt_limit*(1-1/r_bar))*c_K;

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
stoch_simul(order = 1,irf=40,qz_criterium=0.999999)  r_real_ann c_R c_K, n_K, r_real, i_ann, i, pi_p, pi_p_ann;
