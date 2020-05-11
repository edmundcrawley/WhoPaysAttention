function [residual, g1, g2, g3] = InattentionModel_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(17, 1);
lhs =y(7);
rhs =params(6)*y(8)+params(7)*y(17)+params(8)*y(9)+y(5);
residual(1)= lhs-rhs;
lhs =y(10);
rhs =y(7)-y(22);
residual(2)= lhs-rhs;
lhs =y(8);
rhs =y(22)*params(1)+y(9)*params(14)+params(13)*y(16);
residual(3)= lhs-rhs;
lhs =y(17);
rhs =params(1)*y(24)+y(9)*params(16)-y(16)*params(15);
residual(4)= lhs-rhs;
lhs =y(14);
rhs =y(23)-(y(7)-y(22))*params(23)/params(4);
residual(5)= lhs-rhs;
lhs =(1-params(18)*(1-params(1)))*y(15);
rhs =y(16)+y(13)-y(10)*params(1)*params(18)-params(18)*(y(6)-y(8));
residual(6)= lhs-rhs;
lhs =y(16);
rhs =y(17)+y(4)-y(8);
residual(7)= lhs-rhs;
lhs =y(12);
rhs =y(13);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =y(14)*params(20)+y(15)*params(19);
residual(9)= lhs-rhs;
lhs =y(11);
rhs =y(12)*params(22)+y(13)*params(21);
residual(10)= lhs-rhs;
lhs =y(9);
rhs =y(11)*(1-params(2));
residual(11)= lhs-rhs;
lhs =y(6);
rhs =y(2)-y(3);
residual(12)= lhs-rhs;
lhs =y(5);
rhs =params(3)*y(1)+x(it_, 1);
residual(13)= lhs-rhs;
lhs =y(18);
rhs =y(7)*4.0;
residual(14)= lhs-rhs;
lhs =y(19);
rhs =y(8)*4.0;
residual(15)= lhs-rhs;
lhs =y(20);
rhs =y(10)*4.0;
residual(16)= lhs-rhs;
lhs =y(21);
rhs =y(17)*4.0;
residual(17)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(17, 25);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-1);
  g1(1,7)=1;
  g1(1,8)=(-params(6));
  g1(1,9)=(-params(8));
  g1(1,17)=(-params(7));
  g1(2,7)=(-1);
  g1(2,22)=1;
  g1(2,10)=1;
  g1(3,8)=1;
  g1(3,22)=(-params(1));
  g1(3,9)=(-params(14));
  g1(3,16)=(-params(13));
  g1(4,9)=(-params(16));
  g1(4,16)=params(15);
  g1(4,17)=1;
  g1(4,24)=(-params(1));
  g1(5,7)=params(23)/params(4);
  g1(5,22)=(-(params(23)/params(4)));
  g1(5,14)=1;
  g1(5,23)=(-1);
  g1(6,6)=params(18);
  g1(6,8)=(-params(18));
  g1(6,10)=params(1)*params(18);
  g1(6,13)=(-1);
  g1(6,15)=1-params(18)*(1-params(1));
  g1(6,16)=(-1);
  g1(7,8)=1;
  g1(7,4)=(-1);
  g1(7,16)=1;
  g1(7,17)=(-1);
  g1(8,12)=1;
  g1(8,13)=(-1);
  g1(9,9)=1;
  g1(9,14)=(-params(20));
  g1(9,15)=(-params(19));
  g1(10,11)=1;
  g1(10,12)=(-params(22));
  g1(10,13)=(-params(21));
  g1(11,9)=1;
  g1(11,11)=(-(1-params(2)));
  g1(12,6)=1;
  g1(12,2)=(-1);
  g1(12,3)=1;
  g1(13,1)=(-params(3));
  g1(13,5)=1;
  g1(13,25)=(-1);
  g1(14,7)=(-4.0);
  g1(14,18)=1;
  g1(15,8)=(-4.0);
  g1(15,19)=1;
  g1(16,10)=(-4.0);
  g1(16,20)=1;
  g1(17,17)=(-4.0);
  g1(17,21)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],17,625);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],17,15625);
end
end
end
end
