function [residual, g1, g2, g3] = InattentionARM_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(15, 1);
T60 = params(24)+1/params(1)-1;
lhs =y(9);
rhs =params(6)*y(10)+params(7)*y(19)+params(8)*y(11)+y(7);
residual(1)= lhs-rhs;
lhs =y(12);
rhs =y(9)-y(22);
residual(2)= lhs-rhs;
lhs =y(10);
rhs =y(19);
residual(3)= lhs-rhs;
lhs =y(19);
rhs =params(25)*y(5)+(1-params(25))*(params(1)*y(23)+y(11)*params(16)-params(15)*y(18));
residual(4)= lhs-rhs;
residual(5) = y(16);
lhs =y(20);
rhs =(1-params(24))*(y(6)-y(10))+params(24)*y(21);
residual(6)= lhs-rhs;
lhs =y(21);
rhs =y(22)-y(9)/T60;
residual(7)= lhs-rhs;
lhs =(1-params(18)*(1-params(1)))*y(17);
rhs =y(18)+y(15)-params(18)*((y(6)-y(10))*T60+y(2)/params(1))+y(21)*params(24)*params(18);
residual(8)= lhs-rhs;
lhs =y(18);
rhs =y(19)+y(4)-y(10);
residual(9)= lhs-rhs;
lhs =y(14);
rhs =y(15);
residual(10)= lhs-rhs;
lhs =y(11);
rhs =y(16)*params(20)+y(17)*params(19);
residual(11)= lhs-rhs;
lhs =y(13);
rhs =y(14)*params(22)+y(15)*params(21);
residual(12)= lhs-rhs;
lhs =y(11);
rhs =y(13)*(1-params(2));
residual(13)= lhs-rhs;
lhs =y(8);
rhs =y(2)-y(3);
residual(14)= lhs-rhs;
lhs =y(7);
rhs =params(3)*y(1)+x(it_, 1);
residual(15)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(15, 24);

  %
  % Jacobian matrix
  %

  g1(1,7)=(-1);
  g1(1,9)=1;
  g1(1,10)=(-params(6));
  g1(1,11)=(-params(8));
  g1(1,19)=(-params(7));
  g1(2,9)=(-1);
  g1(2,22)=1;
  g1(2,12)=1;
  g1(3,10)=1;
  g1(3,19)=(-1);
  g1(4,11)=(-((1-params(25))*params(16)));
  g1(4,18)=(-((1-params(25))*(-params(15))));
  g1(4,5)=(-params(25));
  g1(4,19)=1;
  g1(4,23)=(-((1-params(25))*params(1)));
  g1(5,16)=1;
  g1(6,10)=1-params(24);
  g1(6,6)=(-(1-params(24)));
  g1(6,20)=1;
  g1(6,21)=(-params(24));
  g1(7,9)=1/T60;
  g1(7,22)=(-1);
  g1(7,21)=1;
  g1(8,2)=1/params(1)*params(18);
  g1(8,10)=params(18)*(-T60);
  g1(8,15)=(-1);
  g1(8,17)=1-params(18)*(1-params(1));
  g1(8,18)=(-1);
  g1(8,6)=T60*params(18);
  g1(8,21)=(-(params(24)*params(18)));
  g1(9,10)=1;
  g1(9,4)=(-1);
  g1(9,18)=1;
  g1(9,19)=(-1);
  g1(10,14)=1;
  g1(10,15)=(-1);
  g1(11,11)=1;
  g1(11,16)=(-params(20));
  g1(11,17)=(-params(19));
  g1(12,13)=1;
  g1(12,14)=(-params(22));
  g1(12,15)=(-params(21));
  g1(13,11)=1;
  g1(13,13)=(-(1-params(2)));
  g1(14,8)=1;
  g1(14,2)=(-1);
  g1(14,3)=1;
  g1(15,1)=(-params(3));
  g1(15,7)=1;
  g1(15,24)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],15,576);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],15,13824);
end
end
end
end
