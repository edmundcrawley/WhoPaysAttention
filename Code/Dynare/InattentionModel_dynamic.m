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
lhs =y(9);
rhs =params(6)*y(10)+params(7)*y(19)+params(8)*y(11)+y(7);
residual(1)= lhs-rhs;
lhs =y(12);
rhs =y(9)-y(24);
residual(2)= lhs-rhs;
lhs =y(10);
rhs =0.0*y(3)+1.0*(y(24)*params(1)+y(11)*params(14)+params(13)*y(18));
residual(3)= lhs-rhs;
lhs =y(19);
rhs =0.0*y(6)+1.0*(params(1)*y(26)+y(11)*params(16)-y(18)*params(15));
residual(4)= lhs-rhs;
lhs =y(16);
rhs =y(25)-(y(9)-y(24))*params(23)/params(4);
residual(5)= lhs-rhs;
lhs =(1-params(18)*(1-params(1)))*y(17);
rhs =y(18)+y(15)-y(12)*params(1)*params(18)-params(18)*(y(8)-y(10));
residual(6)= lhs-rhs;
lhs =y(18);
rhs =y(19)+y(5)-y(10);
residual(7)= lhs-rhs;
lhs =y(14);
rhs =y(15);
residual(8)= lhs-rhs;
lhs =y(11);
rhs =y(16)*params(20)+y(17)*params(19);
residual(9)= lhs-rhs;
lhs =y(13);
rhs =y(14)*params(22)+y(15)*params(21);
residual(10)= lhs-rhs;
lhs =y(11);
rhs =y(13)*(1-params(2));
residual(11)= lhs-rhs;
lhs =y(8);
rhs =y(2)-y(4);
residual(12)= lhs-rhs;
lhs =y(7);
rhs =params(3)*y(1)+x(it_, 1);
residual(13)= lhs-rhs;
lhs =y(20);
rhs =y(9)*4.0;
residual(14)= lhs-rhs;
lhs =y(21);
rhs =y(10)*4.0;
residual(15)= lhs-rhs;
lhs =y(22);
rhs =y(12)*4.0;
residual(16)= lhs-rhs;
lhs =y(23);
rhs =y(19)*4.0;
residual(17)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(17, 27);

  %
  % Jacobian matrix
  %

  g1(1,7)=(-1);
  g1(1,9)=1;
  g1(1,10)=(-params(6));
  g1(1,11)=(-params(8));
  g1(1,19)=(-params(7));
  g1(2,9)=(-1);
  g1(2,24)=1;
  g1(2,12)=1;
  g1(3,3)=(-0.0);
  g1(3,10)=1;
  g1(3,24)=(-(1.0*params(1)));
  g1(3,11)=(-(1.0*params(14)));
  g1(3,18)=(-(1.0*params(13)));
  g1(4,11)=(-(1.0*params(16)));
  g1(4,18)=(-(1.0*(-params(15))));
  g1(4,6)=(-0.0);
  g1(4,19)=1;
  g1(4,26)=(-(1.0*params(1)));
  g1(5,9)=params(23)/params(4);
  g1(5,24)=(-(params(23)/params(4)));
  g1(5,16)=1;
  g1(5,25)=(-1);
  g1(6,8)=params(18);
  g1(6,10)=(-params(18));
  g1(6,12)=params(1)*params(18);
  g1(6,15)=(-1);
  g1(6,17)=1-params(18)*(1-params(1));
  g1(6,18)=(-1);
  g1(7,10)=1;
  g1(7,5)=(-1);
  g1(7,18)=1;
  g1(7,19)=(-1);
  g1(8,14)=1;
  g1(8,15)=(-1);
  g1(9,11)=1;
  g1(9,16)=(-params(20));
  g1(9,17)=(-params(19));
  g1(10,13)=1;
  g1(10,14)=(-params(22));
  g1(10,15)=(-params(21));
  g1(11,11)=1;
  g1(11,13)=(-(1-params(2)));
  g1(12,8)=1;
  g1(12,2)=(-1);
  g1(12,4)=1;
  g1(13,1)=(-params(3));
  g1(13,7)=1;
  g1(13,27)=(-1);
  g1(14,9)=(-4.0);
  g1(14,20)=1;
  g1(15,10)=(-4.0);
  g1(15,21)=1;
  g1(16,12)=(-4.0);
  g1(16,22)=1;
  g1(17,19)=(-4.0);
  g1(17,23)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],17,729);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],17,19683);
end
end
end
end
