function [residual, g1, g2, g3] = IMPCModel_static(y, x, params)
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

T41 = 1/params(5);
T53 = (1-params(4))/4000;
lhs =y(1);
rhs =y(11);
residual(1)= lhs-rhs;
lhs =y(13);
rhs =y(13)*0.4+0.6*(y(13)*0.99+0.02*y(3));
residual(2)= lhs-rhs;
lhs =y(1);
rhs =y(12)-y(13);
residual(3)= lhs-rhs;
lhs =y(9);
rhs =y(7)-y(4);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =y(8)-y(5);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =(-y(10));
residual(6)= lhs-rhs;
lhs =y(16);
rhs =T41*(y(16)+y(2)+y(1)*params(2));
residual(7)= lhs-rhs;
lhs =y(17);
rhs =T53*(y(17)+y(3)-y(1)*params(2));
residual(8)= lhs-rhs;
lhs =y(4);
rhs =params(3)*(y(7)+y(16));
residual(9)= lhs-rhs;
lhs =y(7);
rhs =y(1)*params(2)+y(2)+y(9)*params(5);
residual(10)= lhs-rhs;
lhs =y(5);
rhs =params(4)*(y(8)+y(17))+y(3)*0.3+(y(3)-y(1)*params(2))*0.0;
residual(11)= lhs-rhs;
lhs =y(8);
rhs =y(3)+y(10)*params(5)-y(1)*params(2);
residual(12)= lhs-rhs;
lhs =y(2);
rhs =y(3);
residual(13)= lhs-rhs;
lhs =y(11);
rhs =y(11)*params(1)+x(1);
residual(14)= lhs-rhs;
lhs =y(6);
rhs =y(1)*4.0;
residual(15)= lhs-rhs;
lhs =y(14);
rhs =y(12)*4;
residual(16)= lhs-rhs;
lhs =y(15);
rhs =y(13)*4;
residual(17)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(17, 17);

  %
  % Jacobian matrix
  %

  g1(1,1)=1;
  g1(1,11)=(-1);
  g1(2,3)=(-0.012);
  g1(2,13)=0.006000000000000005;
  g1(3,1)=1;
  g1(3,12)=(-1);
  g1(3,13)=1;
  g1(4,4)=1;
  g1(4,7)=(-1);
  g1(4,9)=1;
  g1(5,5)=1;
  g1(5,8)=(-1);
  g1(5,10)=1;
  g1(6,9)=1;
  g1(6,10)=1;
  g1(7,1)=(-(T41*params(2)));
  g1(7,2)=(-T41);
  g1(7,16)=1-T41;
  g1(8,1)=(-(T53*(-params(2))));
  g1(8,3)=(-T53);
  g1(8,17)=1-T53;
  g1(9,4)=1;
  g1(9,7)=(-params(3));
  g1(9,16)=(-params(3));
  g1(10,1)=(-params(2));
  g1(10,2)=(-1);
  g1(10,7)=1;
  g1(10,9)=(-params(5));
  g1(11,1)=(-(0.0*(-params(2))));
  g1(11,3)=(-0.3);
  g1(11,5)=1;
  g1(11,8)=(-params(4));
  g1(11,17)=(-params(4));
  g1(12,1)=params(2);
  g1(12,3)=(-1);
  g1(12,8)=1;
  g1(12,10)=(-params(5));
  g1(13,2)=1;
  g1(13,3)=(-1);
  g1(14,11)=1-params(1);
  g1(15,1)=(-4.0);
  g1(15,6)=1;
  g1(16,12)=(-4);
  g1(16,14)=1;
  g1(17,13)=(-4);
  g1(17,15)=1;
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
