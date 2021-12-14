function [residual, g1, g2, g3] = BUModel_dynamic(y, x, params, steady_state, it_)
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
T66 = params(6)/params(7);
lhs =y(6);
rhs =y(16);
residual(1)= lhs-rhs;
lhs =y(18);
rhs =0.4*y(5)+0.6*(0.99*y(27)+0.02*y(8));
residual(2)= lhs-rhs;
lhs =y(6);
rhs =y(17)-y(27);
residual(3)= lhs-rhs;
lhs =y(14);
rhs =y(12)-y(9);
residual(4)= lhs-rhs;
lhs =y(15);
rhs =y(13)-y(10);
residual(5)= lhs-rhs;
lhs =y(14);
rhs =(-y(15));
residual(6)= lhs-rhs;
lhs =y(21);
rhs =1/params(5)*(y(23)+y(6)*params(2)+y(28));
residual(7)= lhs-rhs;
lhs =y(22);
rhs =(1-params(4))/40000*(y(24)-y(6)*params(2)+y(29));
residual(8)= lhs-rhs;
lhs =y(9);
rhs =y(25)-(y(17)-y(27))*T66;
residual(9)= lhs-rhs;
lhs =y(12);
rhs =params(5)*y(2)+y(7)+params(2)*y(1);
residual(10)= lhs-rhs;
lhs =y(10);
rhs =0.9*y(26)+y(15)*0.5-(y(17)-y(27))*T66;
residual(11)= lhs-rhs;
lhs =y(13);
rhs =y(8)+params(5)*y(3)-params(2)*y(1);
residual(12)= lhs-rhs;
lhs =y(7);
rhs =y(8);
residual(13)= lhs-rhs;
lhs =y(16);
rhs =params(1)*y(4)+x(it_, 1);
residual(14)= lhs-rhs;
lhs =y(11);
rhs =y(6)*4.0;
residual(15)= lhs-rhs;
lhs =y(19);
rhs =y(17)*4;
residual(16)= lhs-rhs;
lhs =y(20);
rhs =y(18)*4;
residual(17)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(17, 30);

  %
  % Jacobian matrix
  %

  g1(1,6)=1;
  g1(1,16)=(-1);
  g1(2,8)=(-0.012);
  g1(2,5)=(-0.4);
  g1(2,18)=1;
  g1(2,27)=(-0.594);
  g1(3,6)=1;
  g1(3,17)=(-1);
  g1(3,27)=1;
  g1(4,9)=1;
  g1(4,12)=(-1);
  g1(4,14)=1;
  g1(5,10)=1;
  g1(5,13)=(-1);
  g1(5,15)=1;
  g1(6,14)=1;
  g1(6,15)=1;
  g1(7,6)=(-(1/params(5)*params(2)));
  g1(7,23)=(-(1/params(5)));
  g1(7,21)=1;
  g1(7,28)=(-(1/params(5)));
  g1(8,6)=(-((1-params(4))/40000*(-params(2))));
  g1(8,24)=(-((1-params(4))/40000));
  g1(8,22)=1;
  g1(8,29)=(-((1-params(4))/40000));
  g1(9,9)=1;
  g1(9,25)=(-1);
  g1(9,17)=T66;
  g1(9,27)=(-T66);
  g1(10,1)=(-params(2));
  g1(10,7)=(-1);
  g1(10,12)=1;
  g1(10,2)=(-params(5));
  g1(11,10)=1;
  g1(11,26)=(-0.9);
  g1(11,15)=(-0.5);
  g1(11,17)=T66;
  g1(11,27)=(-T66);
  g1(12,1)=params(2);
  g1(12,8)=(-1);
  g1(12,13)=1;
  g1(12,3)=(-params(5));
  g1(13,7)=1;
  g1(13,8)=(-1);
  g1(14,4)=(-params(1));
  g1(14,16)=1;
  g1(14,30)=(-1);
  g1(15,6)=(-4.0);
  g1(15,11)=1;
  g1(16,17)=(-4);
  g1(16,19)=1;
  g1(17,18)=(-4);
  g1(17,20)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],17,900);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],17,27000);
end
end
end
end
