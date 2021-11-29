function [residual, g1, g2, g3] = LTDebtModel_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(18, 1);
lhs =y(4);
rhs =y(14);
residual(1)= lhs-rhs;
lhs =y(4);
rhs =y(15)-y(24);
residual(2)= lhs-rhs;
residual(3) = y(16);
lhs =y(7);
rhs =y(23)-y(4)*0.0;
residual(4)= lhs-rhs;
lhs =y(10);
rhs =y(1)+y(5);
residual(5)= lhs-rhs;
lhs =y(8);
rhs =y(11);
residual(6)= lhs-rhs;
lhs =y(11);
rhs =y(2)+y(6);
residual(7)= lhs-rhs;
lhs =params(6)*y(21);
rhs =params(6)*params(4)*params(5)*y(26)-y(4)*params(4)*(1+params(6)*params(5));
residual(8)= lhs-rhs;
lhs =params(7)*y(12);
rhs =(y(10)*params(8)-y(7)*params(9))/params(6)-y(21)*(params(8)-params(9))/params(6)+y(1)*params(5)*params(7);
residual(9)= lhs-rhs;
lhs =params(7)*y(13);
rhs =(y(11)*params(10)-y(8)*params(11))/params(6)-y(21)*(params(10)-params(11))/params(6)+y(2)*params(5)*params(7);
residual(10)= lhs-rhs;
lhs =y(12);
rhs =(-y(13));
residual(11)= lhs-rhs;
lhs =y(19);
rhs =1/params(4)*(y(22)+y(4)*params(2)+y(25));
residual(12)= lhs-rhs;
residual(13) = y(20);
lhs =y(5);
rhs =y(6);
residual(14)= lhs-rhs;
lhs =y(14);
rhs =params(1)*y(3)+x(it_, 1);
residual(15)= lhs-rhs;
lhs =y(9);
rhs =y(4)*4.0;
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(15)*4;
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(16)*4;
residual(18)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(18, 27);

  %
  % Jacobian matrix
  %

  g1(1,4)=1;
  g1(1,14)=(-1);
  g1(2,4)=1;
  g1(2,15)=(-1);
  g1(2,24)=1;
  g1(3,16)=1;
  g1(4,4)=0.0;
  g1(4,7)=1;
  g1(4,23)=(-1);
  g1(5,5)=(-1);
  g1(5,10)=1;
  g1(5,1)=(-1);
  g1(6,8)=1;
  g1(6,11)=(-1);
  g1(7,6)=(-1);
  g1(7,11)=1;
  g1(7,2)=(-1);
  g1(8,4)=params(4)*(1+params(6)*params(5));
  g1(8,21)=params(6);
  g1(8,26)=(-(params(6)*params(4)*params(5)));
  g1(9,7)=(-((-params(9))/params(6)));
  g1(9,10)=(-(params(8)/params(6)));
  g1(9,1)=(-(params(5)*params(7)));
  g1(9,12)=params(7);
  g1(9,21)=(params(8)-params(9))/params(6);
  g1(10,8)=(-((-params(11))/params(6)));
  g1(10,11)=(-(params(10)/params(6)));
  g1(10,2)=(-(params(5)*params(7)));
  g1(10,13)=params(7);
  g1(10,21)=(params(10)-params(11))/params(6);
  g1(11,12)=1;
  g1(11,13)=1;
  g1(12,4)=(-(1/params(4)*params(2)));
  g1(12,22)=(-(1/params(4)));
  g1(12,19)=1;
  g1(12,25)=(-(1/params(4)));
  g1(13,20)=1;
  g1(14,5)=1;
  g1(14,6)=(-1);
  g1(15,3)=(-params(1));
  g1(15,14)=1;
  g1(15,27)=(-1);
  g1(16,4)=(-4.0);
  g1(16,9)=1;
  g1(17,15)=(-4);
  g1(17,17)=1;
  g1(18,16)=(-4);
  g1(18,18)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,729);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,19683);
end
end
end
end
