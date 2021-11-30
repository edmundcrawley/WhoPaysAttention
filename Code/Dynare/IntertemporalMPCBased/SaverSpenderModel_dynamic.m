function [residual, g1, g2, g3] = SaverSpenderModel_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(11, 1);
lhs =y(4);
rhs =y(10);
residual(1)= lhs-rhs;
lhs =y(12);
rhs =0.4*y(3)+0.6*(0.99*y(16)+0.02*y(6));
residual(2)= lhs-rhs;
lhs =y(4);
rhs =y(11)-y(16);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =y(15)-(y(11)-y(16))*params(5)/params(4);
residual(4)= lhs-rhs;
lhs =(1-params(2)*(params(3)-1))*y(8);
rhs =y(6)-params(2)*params(3)*y(1);
residual(5)= lhs-rhs;
lhs =y(5);
rhs =y(6);
residual(6)= lhs-rhs;
lhs =y(6);
rhs =y(7)*0.5*(1+params(2)*(1-1/params(3)))+y(8)*0.5*(1-params(2)*(1-1/params(3)));
residual(7)= lhs-rhs;
lhs =y(10);
rhs =params(1)*y(2)+x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =y(4)*4.0;
residual(9)= lhs-rhs;
lhs =y(13);
rhs =y(11)*4;
residual(10)= lhs-rhs;
lhs =y(14);
rhs =y(12)*4;
residual(11)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(11, 17);

  %
  % Jacobian matrix
  %

  g1(1,4)=1;
  g1(1,10)=(-1);
  g1(2,6)=(-0.012);
  g1(2,3)=(-0.4);
  g1(2,12)=1;
  g1(2,16)=(-0.594);
  g1(3,4)=1;
  g1(3,11)=(-1);
  g1(3,16)=1;
  g1(4,7)=1;
  g1(4,15)=(-1);
  g1(4,11)=params(5)/params(4);
  g1(4,16)=(-(params(5)/params(4)));
  g1(5,1)=params(2)*params(3);
  g1(5,6)=(-1);
  g1(5,8)=1-params(2)*(params(3)-1);
  g1(6,5)=1;
  g1(6,6)=(-1);
  g1(7,6)=1;
  g1(7,7)=(-(0.5*(1+params(2)*(1-1/params(3)))));
  g1(7,8)=(-(0.5*(1-params(2)*(1-1/params(3)))));
  g1(8,2)=(-params(1));
  g1(8,10)=1;
  g1(8,17)=(-1);
  g1(9,4)=(-4.0);
  g1(9,9)=1;
  g1(10,11)=(-4);
  g1(10,13)=1;
  g1(11,12)=(-4);
  g1(11,14)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],11,289);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],11,4913);
end
end
end
end
