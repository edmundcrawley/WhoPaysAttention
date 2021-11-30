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
M_.fname = 'SaverSpenderModel';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('SaverSpenderModel.log');
options_.nograph = 1;
M_.exo_names = 'eps_nu';
M_.exo_names_tex = 'eps\_nu';
M_.exo_names_long = 'eps_nu';
M_.endo_names = 'r_real';
M_.endo_names_tex = 'r\_real';
M_.endo_names_long = 'r_real';
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
M_.endo_names = char(M_.endo_names, 'r_real_ann');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_real\_ann');
M_.endo_names_long = char(M_.endo_names_long, 'r_real_ann');
M_.endo_names = char(M_.endo_names, 'nu');
M_.endo_names_tex = char(M_.endo_names_tex, 'nu');
M_.endo_names_long = char(M_.endo_names_long, 'nu');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'pi_p');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi\_p');
M_.endo_names_long = char(M_.endo_names_long, 'pi_p');
M_.endo_names = char(M_.endo_names, 'i_ann');
M_.endo_names_tex = char(M_.endo_names_tex, 'i\_ann');
M_.endo_names_long = char(M_.endo_names_long, 'i_ann');
M_.endo_names = char(M_.endo_names, 'pi_p_ann');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi\_p\_ann');
M_.endo_names_long = char(M_.endo_names_long, 'pi_p_ann');
M_.endo_partitions = struct();
M_.param_names = 'rho_nu';
M_.param_names_tex = 'rho\_nu';
M_.param_names_long = 'rho_nu';
M_.param_names = char(M_.param_names, 'debt_limit');
M_.param_names_tex = char(M_.param_names_tex, 'debt\_limit');
M_.param_names_long = char(M_.param_names_long, 'debt_limit');
M_.param_names = char(M_.param_names, 'r_bar');
M_.param_names_tex = char(M_.param_names_tex, 'r\_bar');
M_.param_names_long = char(M_.param_names_long, 'r_bar');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'attention');
M_.param_names_tex = char(M_.param_names_tex, 'attention');
M_.param_names_long = char(M_.param_names_long, 'attention');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 11;
M_.param_nbr = 5;
M_.orig_endo_nbr = 11;
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
erase_compiled_function('SaverSpenderModel_static');
erase_compiled_function('SaverSpenderModel_dynamic');
M_.orig_eq_nbr = 11;
M_.eq_nbr = 11;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 4 0;
 0 5 0;
 0 6 0;
 0 7 15;
 0 8 0;
 0 9 0;
 2 10 0;
 0 11 0;
 3 12 16;
 0 13 0;
 0 14 0;]';
M_.nstatic = 7;
M_.nfwrd   = 1;
M_.npred   = 2;
M_.nboth   = 1;
M_.nsfwrd   = 2;
M_.nspred   = 3;
M_.ndynamic   = 4;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(11, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(5, 1);
M_.NNZDerivatives = [30; -1; -1];
set_param_value('rho_nu',rho_nu);
set_param_value('debt_limit',debt_limit);
set_param_value('r_bar',r_bar);
set_param_value('sigma',sigma);
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
var_list_ = char('r_real_ann','c_R','c_K','n_K','r_real','i_ann','i','pi_p','pi_p_ann');
info = stoch_simul(var_list_);
save('SaverSpenderModel_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('SaverSpenderModel_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('SaverSpenderModel_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('SaverSpenderModel_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('SaverSpenderModel_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('SaverSpenderModel_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('SaverSpenderModel_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
