
eta = 2;
gamma = 2;
alpha = 0.005;
A_low = -3;
R = 1.0;
beta = 0.9;
Y_bar = 1.0;

attn_factor = 0.2; %attention on the future is discounted

max_horizon =100;

options = optimoptions('fsolve','MaxFunctionEvaluations',10000,'MaxIterations',10000);
obj_fun = @(A_bar) alpha*(A_bar - A_low)^(-eta) / (A_bar*(R-1) + Y_bar)^(-gamma) + R*beta -1;

A_bar = fsolve(obj_fun, A_low + 0.5*Y_bar, options);
C_bar = A_bar*(R-1) + Y_bar;

%solve quadratic in theta_ca
a_quad = -R*beta*gamma*C_bar/(A_bar-A_low);
b_quad = R^2*beta*gamma - gamma - (1-R*beta)*eta*C_bar/(A_bar-A_low);
c_quad = (1-R*beta)*eta*R;
theta_ca1 = (-b_quad + (b_quad^2 - 4*a_quad*c_quad)^0.5)/(2*a_quad);
theta_ca2 = (-b_quad - (b_quad^2 - 4*a_quad*c_quad)^0.5)/(2*a_quad);
theta_ca = theta_ca2; %take the positive root, since consumption goes up with a. Is there more theory here?

theta_aa = R - C_bar/(A_bar-A_low)*theta_ca;

theta_cr  = A_bar/(A_bar-A_low)*theta_ca;
theta_ar  = A_bar/(A_bar-A_low)*theta_aa;
theta_cy0 = Y_bar/(R*(A_bar-A_low))*theta_ca;
theta_ay0 = Y_bar/(R*(A_bar-A_low))*theta_aa;
theta_cr0 = beta*(-1/gamma + theta_cr)*theta_aa;
theta_ar0 = -C_bar/(A_bar-A_low)*theta_cr0;

theta_crn = (1:max_horizon)*0;
theta_cyn = (1:max_horizon)*0;
theta_crn(1) = theta_cr0;
theta_cyn(1) = theta_cy0;

for i = 2: max_horizon
    theta_crn(i) = beta*theta_aa*theta_crn(i-1);
    theta_cyn(i) = beta*theta_aa*theta_cyn(i-1);
end
theta_arn = -C_bar/(A_bar-A_low) * theta_crn;
theta_ayn = -C_bar/(A_bar-A_low) * theta_cyn;
theta_ayn(1) = theta_ay0;

MPC0 = theta_cyn(1)*C_bar;

% Now calculate responses
c = (1:max_horizon)*0;
a = (1:max_horizon)*0;
c_discount_attn = (1:max_horizon)*0;
a_discount_attn = (1:max_horizon)*0;

%Set exogenous variables
y = (1:max_horizon)*0;
r = (1:max_horizon)*0;
r_m1 = 0.00;
a_m1 = 0;
%y(1:20) = 1;
%r(20)=0.01;
r = 0.01*0.8.^(1:max_horizon);

a_m1_discount_attn = a_m1;
for i = 1:max_horizon
    c(i) = sum(theta_cyn.*y + theta_crn.*r) + theta_cr*r_m1 + theta_ca*a_m1;
    a(i) = sum(theta_ayn.*y + theta_arn.*r) + theta_ar*r_m1 + theta_aa*a_m1;
    a_m1 = a(i);
    c_discount_attn(i) = sum(theta_cyn.*y.*attn_factor.^(0:max_horizon-1) + theta_crn.*r.*attn_factor.^(1:max_horizon)) + theta_cr*r_m1 + theta_ca*a_m1_discount_attn;
    a_discount_attn(i) = sum(theta_ayn.*y.*attn_factor.^(0:max_horizon-1) + theta_arn.*r.*attn_factor.^(1:max_horizon)) + theta_ar*r_m1 + theta_aa*a_m1_discount_attn;
    a_m1_discount_attn = a_discount_attn(i);
    
    r_m1 = r(1);
    y(1:max_horizon-1) = y(2:max_horizon);
    y(max_horizon) = 0;
    r(1:max_horizon-1) = r(2:max_horizon);
    r(max_horizon) = 0;
end
C = C_bar*(1+c);
A = A_low + (A_bar-A_low)*(1+a);
C_discount_attn = C_bar*(1+c_discount_attn);
A_discount_attn = A_low + (A_bar-A_low)*(1+a_discount_attn);
    
plot_length = 24
figure;
plot(C(1:plot_length));
hold on;
plot(C_discount_attn(1:plot_length));
legend('No discounting', 'Future discounting')
title('Bonds in Utility Consumption Response to Interest Rate Shock')
saveas(gcf,"../Dynare/Figures/BU_future_discounting.jpg")

figure;
plot(A);
hold on;
plot(A_discount_attn);

% Old formula that might have useful bits of code to copy from
% 
% theta_cr  = ((R*beta*gamma*theta_ca + (1-R*beta)*eta)*R*A_bar/(A_bar-A_low) )/(gamma + eta*C_bar/(A_bar-A_low) * (1-R*beta));
% theta_ar  = R*A_bar/(A_bar-A_low) - C_bar/(A_bar-A_low)*theta_cr;
% theta_ca  = (eta*R * (1-R*beta))                    /(gamma + eta*C_bar/(A_bar-A_low) * (1-R*beta));
% theta_aa  = R - C_bar/(A_bar-A_low)*theta_ca;
% theta_cy0 = ((R*beta*gamma*theta_ca + (1-R*beta)*eta)*Y_bar/(A_bar-A_low) )  /(gamma + (R*beta*gamma*theta_ca + (1-R*beta)*eta)*C_bar/(A_bar-A_low) );
% theta_ay0 = -C_bar/(A_bar-A_low)*theta_cy0 + Y_bar/(A_bar-A_low);
% theta_cr0 = (beta*R*(-1+gamma*theta_cr))/(gamma + (gamma*theta_ca+(1-beta*R)*eta)*C_bar/(A_bar-A_low) );
% theta_ar0 = -C_bar/(A_bar-A_low)*theta_cr0;
