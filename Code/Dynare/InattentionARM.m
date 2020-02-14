%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'InattentionARM';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('InattentionARM.log');
M_.exo_names = 'eps_nu';
M_.exo_names_tex = 'eps\_nu';
M_.exo_names_long = 'eps_nu';
M_.endo_names = 'nu';
M_.endo_names_tex = 'nu';
M_.endo_names_long = 'nu';
M_.endo_names = char(M_.endo_names, 'Epi_p');
M_.endo_names_tex = char(M_.endo_names_tex, 'Epi\_p');
M_.endo_names_long = char(M_.endo_names_long, 'Epi_p');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'pi_p');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi\_p');
M_.endo_names_long = char(M_.endo_names_long, 'pi_p');
M_.endo_names = char(M_.endo_names, 'y_gap');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_gap');
M_.endo_names_long = char(M_.endo_names_long, 'y_gap');
M_.endo_names = char(M_.endo_names, 'r_real');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_real');
M_.endo_names_long = char(M_.endo_names_long, 'r_real');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'n_R');
M_.endo_names_tex = char(M_.endo_names_tex, 'n\_R');
M_.endo_names_long = char(M_.endo_names_long, 'n_R');
M_.endo_names = char(M_.endo_names, 'n_K');
M_.endo_names_tex = char(M_.endo_names_tex, 'n\_K');
M_.endo_names_long = char(M_.endo_names_long, 'n_K');
M_.endo_names = char(M_.endo_names, 'c_R');
M_.endo_names_tex = char(M_.endo_names_tex, 'c\_R');
M_.endo_names_long = char(M_.endo_names_long, 'c_R');
M_.endo_names = char(M_.endo_names, 'c_K');
M_.endo_names_tex = char(M_.endo_names_tex, 'c\_K');
M_.endo_names_long = char(M_.endo_names_long, 'c_K');
M_.endo_names = char(M_.endo_names, 'w_gap');
M_.endo_names_tex = char(M_.endo_names_tex, 'w\_gap');
M_.endo_names_long = char(M_.endo_names_long, 'w_gap');
M_.endo_names = char(M_.endo_names, 'pi_w');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi\_w');
M_.endo_names_long = char(M_.endo_names_long, 'pi_w');
M_.endo_names = char(M_.endo_names, 'real_debt');
M_.endo_names_tex = char(M_.endo_names_tex, 'real\_debt');
M_.endo_names_long = char(M_.endo_names_long, 'real_debt');
M_.endo_names = char(M_.endo_names, 'max_real_debt');
M_.endo_names_tex = char(M_.endo_names_tex, 'max\_real\_debt');
M_.endo_names_long = char(M_.endo_names_long, 'max_real_debt');
M_.endo_partitions = struct();
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'rho_nu');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_nu');
M_.param_names_long = char(M_.param_names_long, 'rho_nu');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'phi_pi_p');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi\_p');
M_.param_names_long = char(M_.param_names_long, 'phi_pi_p');
M_.param_names = char(M_.param_names, 'phi_pi_w');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi\_w');
M_.param_names_long = char(M_.param_names_long, 'phi_pi_w');
M_.param_names = char(M_.param_names, 'phi_y');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y');
M_.param_names_long = char(M_.param_names_long, 'phi_y');
M_.param_names = char(M_.param_names, 'epsilon_p');
M_.param_names_tex = char(M_.param_names_tex, 'epsilon\_p');
M_.param_names_long = char(M_.param_names_long, 'epsilon_p');
M_.param_names = char(M_.param_names, 'epsilon_w');
M_.param_names_tex = char(M_.param_names_tex, 'epsilon\_w');
M_.param_names_long = char(M_.param_names_long, 'epsilon_w');
M_.param_names = char(M_.param_names, 'theta_p');
M_.param_names_tex = char(M_.param_names_tex, 'theta\_p');
M_.param_names_long = char(M_.param_names_long, 'theta_p');
M_.param_names = char(M_.param_names, 'theta_w');
M_.param_names_tex = char(M_.param_names_tex, 'theta\_w');
M_.param_names_long = char(M_.param_names_long, 'theta_w');
M_.param_names = char(M_.param_names, 'lambda_p');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_p');
M_.param_names_long = char(M_.param_names_long, 'lambda_p');
M_.param_names = char(M_.param_names, 'kappa_p');
M_.param_names_tex = char(M_.param_names_tex, 'kappa\_p');
M_.param_names_long = char(M_.param_names_long, 'kappa_p');
M_.param_names = char(M_.param_names, 'lambda_w');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_w');
M_.param_names_long = char(M_.param_names_long, 'lambda_w');
M_.param_names = char(M_.param_names, 'kappa_w');
M_.param_names_tex = char(M_.param_names_tex, 'kappa\_w');
M_.param_names_long = char(M_.param_names_long, 'kappa_w');
M_.param_names = char(M_.param_names, 'pop_share_K');
M_.param_names_tex = char(M_.param_names_tex, 'pop\_share\_K');
M_.param_names_long = char(M_.param_names_long, 'pop_share_K');
M_.param_names = char(M_.param_names, 'debt_limit');
M_.param_names_tex = char(M_.param_names_tex, 'debt\_limit');
M_.param_names_long = char(M_.param_names_long, 'debt_limit');
M_.param_names = char(M_.param_names, 'cons_share_K');
M_.param_names_tex = char(M_.param_names_tex, 'cons\_share\_K');
M_.param_names_long = char(M_.param_names_long, 'cons_share_K');
M_.param_names = char(M_.param_names, 'cons_share_R');
M_.param_names_tex = char(M_.param_names_tex, 'cons\_share\_R');
M_.param_names_long = char(M_.param_names_long, 'cons_share_R');
M_.param_names = char(M_.param_names, 'labor_share_K');
M_.param_names_tex = char(M_.param_names_tex, 'labor\_share\_K');
M_.param_names_long = char(M_.param_names_long, 'labor_share_K');
M_.param_names = char(M_.param_names, 'labor_share_R');
M_.param_names_tex = char(M_.param_names_tex, 'labor\_share\_R');
M_.param_names_long = char(M_.param_names_long, 'labor_share_R');
M_.param_names = char(M_.param_names, 'attention');
M_.param_names_tex = char(M_.param_names_tex, 'attention');
M_.param_names_long = char(M_.param_names_long, 'attention');
M_.param_names = char(M_.param_names, 'prin_pay');
M_.param_names_tex = char(M_.param_names_tex, 'prin\_pay');
M_.param_names_long = char(M_.param_names_long, 'prin_pay');
M_.param_names = char(M_.param_names, 'inflation_inertia');
M_.param_names_tex = char(M_.param_names_tex, 'inflation\_inertia');
M_.param_names_long = char(M_.param_names_long, 'inflation_inertia');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 15;
M_.param_nbr = 25;
M_.orig_endo_nbr = 15;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('InattentionARM_static');
erase_compiled_function('InattentionARM_dynamic');
M_.orig_eq_nbr = 15;
M_.eq_nbr = 15;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 7 0;
 0 8 0;
 2 9 0;
 0 10 22;
 0 11 0;
 3 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 4 18 0;
 5 19 23;
 6 20 0;
 0 21 0;]';
M_.nstatic = 8;
M_.nfwrd   = 1;
M_.npred   = 5;
M_.nboth   = 1;
M_.nsfwrd   = 2;
M_.nspred   = 6;
M_.ndynamic   = 7;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(15, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(25, 1);
M_.NNZDerivatives = [50; -1; -1];
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
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 0.01;
resid(1);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 20;
options_.order = 1;
var_list_ = char('y_gap','pi_p','i','r_real','nu','c_R','c_K','max_real_debt','real_debt');
info = stoch_simul(var_list_);
save('InattentionARM_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('InattentionARM_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('InattentionARM_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('InattentionARM_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('InattentionARM_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('InattentionARM_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('InattentionARM_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
