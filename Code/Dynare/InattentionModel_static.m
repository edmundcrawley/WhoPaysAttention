function [residual, g1, g2, g3] = InattentionModel_static(y, x, params)
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

residual = zeros( 17, 1);

%
% Model equations
%

lhs =y(3);
rhs =params(6)*y(4)+params(7)*y(13)+params(8)*y(5)+y(1);
residual(1)= lhs-rhs;
lhs =y(6);
rhs =y(3)-y(4);
residual(2)= lhs-rhs;
lhs =y(4);
rhs =y(4)*0.0+1.0*(y(4)*params(1)+y(5)*params(14)+params(13)*y(12));
residual(3)= lhs-rhs;
lhs =y(13);
rhs =y(13)*0.0+1.0*(y(13)*params(1)+y(5)*params(16)-y(12)*params(15));
residual(4)= lhs-rhs;
lhs =y(10);
rhs =y(10)-(y(3)-y(4))*params(23)/params(4);
residual(5)= lhs-rhs;
lhs =(1-params(18)*(1-params(1)))*y(11);
rhs =y(12)+y(9)-y(6)*params(1)*params(18)-params(18)*(y(2)-y(4));
residual(6)= lhs-rhs;
lhs =y(12);
rhs =y(13)+y(12)-y(4);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(9);
residual(8)= lhs-rhs;
lhs =y(5);
rhs =y(10)*params(20)+y(11)*params(19);
residual(9)= lhs-rhs;
lhs =y(7);
rhs =y(8)*params(22)+y(9)*params(21);
residual(10)= lhs-rhs;
lhs =y(5);
rhs =y(7)*(1-params(2));
residual(11)= lhs-rhs;
lhs =y(2);
rhs =y(3)-y(6);
residual(12)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(3)+x(1);
residual(13)= lhs-rhs;
lhs =y(14);
rhs =y(3)*4.0;
residual(14)= lhs-rhs;
lhs =y(15);
rhs =y(4)*4.0;
residual(15)= lhs-rhs;
lhs =y(16);
rhs =y(6)*4.0;
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(13)*4.0;
residual(17)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(17, 17);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-1);
  g1(1,3)=1;
  g1(1,4)=(-params(6));
  g1(1,5)=(-params(8));
  g1(1,13)=(-params(7));
  g1(2,3)=(-1);
  g1(2,4)=1;
  g1(2,6)=1;
  g1(3,4)=1-(0.0+1.0*params(1));
  g1(3,5)=(-(1.0*params(14)));
  g1(3,12)=(-(1.0*params(13)));
  g1(4,5)=(-(1.0*params(16)));
  g1(4,12)=(-(1.0*(-params(15))));
  g1(4,13)=1-(0.0+1.0*params(1));
  g1(5,3)=params(23)/params(4);
  g1(5,4)=(-(params(23)/params(4)));
  g1(6,2)=params(18);
  g1(6,4)=(-params(18));
  g1(6,6)=params(1)*params(18);
  g1(6,9)=(-1);
  g1(6,11)=1-params(18)*(1-params(1));
  g1(6,12)=(-1);
  g1(7,4)=1;
  g1(7,13)=(-1);
  g1(8,8)=1;
  g1(8,9)=(-1);
  g1(9,5)=1;
  g1(9,10)=(-params(20));
  g1(9,11)=(-params(19));
  g1(10,7)=1;
  g1(10,8)=(-params(22));
  g1(10,9)=(-params(21));
  g1(11,5)=1;
  g1(11,7)=(-(1-params(2)));
  g1(12,2)=1;
  g1(12,3)=(-1);
  g1(12,6)=1;
  g1(13,1)=1-params(3);
  g1(14,3)=(-4.0);
  g1(14,14)=1;
  g1(15,4)=(-4.0);
  g1(15,15)=1;
  g1(16,6)=(-4.0);
  g1(16,16)=1;
  g1(17,13)=(-4.0);
  g1(17,17)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],17,289);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],17,4913);
end
end
end
end
