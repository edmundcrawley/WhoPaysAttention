/*
 * Implements IMPC model
 */
 
 var r_real
    n_R
    n_K
    c_R
    c_K
    r_real_ann
    m_R
    m_K
    a_R
    a_K
    nu
    i
    pi_p
    i_ann
    pi_p_ann
    f_R
    f_K
    Bp
    ;
    
varexo eps_nu;

parameters rho_nu
           debt_limit
           mpc_R
           r_bar
           theta
           Bp_bar
           A_bar
           M_R_bar
           C_R_bar
           M_K_bar
           C_K_bar
            ;
%----------------------------------------------------------------
% Parametrization, p. 52
%----------------------------------------------------------------
set_param_value('rho_nu',rho_nu);
set_param_value('debt_limit',debt_limit);
set_param_value('mpc_R',mpc_R);
set_param_value('r_bar',r_bar);
set_param_value('theta',theta);
set_param_value('Bp_bar',Bp_bar);
set_param_value('C_R_bar',C_R_bar);
set_param_value('A_bar',A_bar);
set_param_value('M_R_bar',M_R_bar);
set_param_value('C_K_bar',C_K_bar);
set_param_value('M_K_bar',M_K_bar);

%----------------------------------------------------------------
% First Order Conditions
%----------------------------------------------------------------

model(linear); 

% Taylor Rule
%i = 1.5*pi_p + nu ;
r_real = nu;

% Fisher Equation
r_real=i -pi_p(+1) ;

% Price and wage Philips Curves
pi_p=0.6*pi_p(-1) + 0.4*(0.99*pi_p(+1)+0.02*n_K) ;
%pi_p = 0.0;

% IMPC for R
%c_R = mpc_R * (m_R + f_R);
c_R = c_R(+1) - 0.0*r_real;
%m_R = a_R(-1)*r_bar + n_R + debt_limit*r_real(-1);
m_R = a_R(-1) + n_R;
% IMPC for K
%c_K = mpc_K * (m_K + f_K) + 0.3*n_K + 0.0*(n_K - debt_limit*r_real(-1));
c_K = m_K;
%m_K = a_K(-1)*r_bar + n_K - debt_limit*r_real(-1);
m_K = a_K(-1) + n_K;

%Bond price
Bp_bar*Bp = r_bar*theta*Bp_bar*Bp(+1) - r_bar*r_real*(1+theta*Bp_bar);

%a_R = (m_R-c_R)/Bp + theta*a_R(-1);
%a_K = (m_K-c_K)/Bp + theta*a_K(-1);
A_bar*a_R = (M_R_bar*m_R - C_R_bar*c_R)/Bp_bar - (M_R_bar-C_R_bar)/Bp_bar*Bp + theta*A_bar*a_R(-1);
A_bar*a_K = (M_K_bar*m_K - C_K_bar*c_K)/Bp_bar - (M_K_bar-C_K_bar)/Bp_bar*Bp + theta*A_bar*a_K(-1);
a_R = -a_K;
f_R = 1/r_bar*(n_R(+1) + debt_limit*r_real + f_R(+1));
f_K = 0;%(1-mpc_K)/40000*(n_K(+1) - debt_limit*r_real + f_K(+1));

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
