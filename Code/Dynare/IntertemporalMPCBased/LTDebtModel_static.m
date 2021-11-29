function [residual, g1, g2, g3] = LTDebtModel_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 18, 1);

%
% Model equations
%

T80 = 1/params(4);
lhs =y(1);
rhs =y(11);
residual(1)= lhs-rhs;
lhs =y(1);
rhs =y(12)-y(13);
residual(2)= lhs-rhs;
residual(3) = y(13);
lhs =y(4);
rhs =y(4)-y(1)*0.0;
residual(4)= lhs-rhs;
lhs =y(7);
rhs =y(9)+y(2);
residual(5)= lhs-rhs;
lhs =y(5);
rhs =y(8);
residual(6)= lhs-rhs;
lhs =y(8);
rhs =y(10)+y(3);
residual(7)= lhs-rhs;
lhs =params(6)*y(18);
rhs =y(18)*params(6)*params(4)*params(5)-y(1)*params(4)*(1+params(6)*params(5));
residual(8)= lhs-rhs;
lhs =y(9)*params(7);
rhs =(y(7)*params(8)-y(4)*params(9))/params(6)-y(18)*(params(8)-params(9))/params(6)+y(9)*params(5)*params(7);
residual(9)= lhs-rhs;
lhs =y(10)*params(7);
rhs =(y(8)*params(10)-y(5)*params(11))/params(6)-y(18)*(params(10)-params(11))/params(6)+y(10)*params(5)*params(7);
residual(10)= lhs-rhs;
lhs =y(9);
rhs =(-y(10));
residual(11)= lhs-rhs;
lhs =y(16);
rhs =T80*(y(16)+y(2)+y(1)*params(2));
residual(12)= lhs-rhs;
residual(13) = y(17);
lhs =y(2);
rhs =y(3);
residual(14)= lhs-rhs;
lhs =y(11);
rhs =y(11)*params(1)+x(1);
residual(15)= lhs-rhs;
lhs =y(6);
rhs =y(1)*4.0;
residual(16)= lhs-rhs;
lhs =y(14);
rhs =y(12)*4;
residual(17)= lhs-rhs;
lhs =y(15);
rhs =y(13)*4;
residual(18)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(18, 18);

  %
  % Jacobian matrix
  %

  g1(1,1)=1;
  g1(1,11)=(-1);
  g1(2,1)=1;
  g1(2,12)=(-1);
  g1(2,13)=1;
  g1(3,13)=1;
  g1(4,1)=0.0;
  g1(5,2)=(-1);
  g1(5,7)=1;
  g1(5,9)=(-1);
  g1(6,5)=1;
  g1(6,8)=(-1);
  g1(7,3)=(-1);
  g1(7,8)=1;
  g1(7,10)=(-1);
  g1(8,1)=params(4)*(1+params(6)*params(5));
  g1(8,18)=params(6)-params(6)*params(4)*params(5);
  g1(9,4)=(-((-params(9))/params(6)));
  g1(9,7)=(-(params(8)/params(6)));
  g1(9,9)=params(7)-params(5)*params(7);
  g1(9,18)=(params(8)-params(9))/params(6);
  g1(10,5)=(-((-params(11))/params(6)));
  g1(10,8)=(-(params(10)/params(6)));
  g1(10,10)=params(7)-params(5)*params(7);
  g1(10,18)=(params(10)-params(11))/params(6);
  g1(11,9)=1;
  g1(11,10)=1;
  g1(12,1)=(-(T80*params(2)));
  g1(12,2)=(-T80);
  g1(12,16)=1-T80;
  g1(13,17)=1;
  g1(14,2)=1;
  g1(14,3)=(-1);
  g1(15,11)=1-params(1);
  g1(16,1)=(-4.0);
  g1(16,6)=1;
  g1(17,12)=(-4);
  g1(17,14)=1;
  g1(18,13)=(-4);
  g1(18,15)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,324);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,5832);
end
end
end
end
