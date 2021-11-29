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
M_.fname = 'InattentionModel';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('InattentionModel.log');
options_.nograph = 1;
M_.exo_names = 'eps_nu';
M_.exo_names_tex = 'eps\_nu';
M_.exo_names_long = 'eps_nu';
M_.endo_names = 'nu';
M_.endo_names_tex = 'nu';
M_.endo_names_long = 'nu';
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
M_.endo_names = char(M_.endo_names, 'c_R');
M_.endo_names_tex = char(M_.endo_names_tex, 'c\_R');
M_.endo_names_long = char(M_.endo_names_long, 'c_R');
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
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 6;
M_.param_nbr = 23;
M_.orig_endo_nbr = 6;
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
erase_compiled_function('InattentionModel_static');
erase_compiled_function('InattentionModel_dynamic');
M_.orig_eq_nbr = 6;
M_.eq_nbr = 6;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 2 0;
 0 3 0;
 0 4 8;
 0 5 0;
 0 6 0;
 0 7 9;]';
M_.nstatic = 3;
M_.nfwrd   = 2;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 1;
M_.ndynamic   = 3;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(6, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(23, 1);
M_.NNZDerivatives = [16; -1; -1];
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
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 0.01;
resid(1);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 40;
options_.order = 1;
options_.qz_criterium = 0.999999;
var_list_ = char('y_gap','r_real','nu','c_R');
info = stoch_simul(var_list_);
save('InattentionModel_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('InattentionModel_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('InattentionModel_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('InattentionModel_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('InattentionModel_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('InattentionModel_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('InattentionModel_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
