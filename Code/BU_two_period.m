
N=100;
C_0s = zeros(N,1);
W = zeros(N,1);
dWdC = zeros(N,1);
d2WdC2 = zeros(N,1);
A_lows = linspace(-0.5,0.5,N);

for i = 1:N
    A_low = A_lows(i);
    obj_fun2 = @(C_0) C_0^(-gamma) - (Y_bar*2 - C_0)^(-gamma) - alpha*(Y_bar - C_0 - A_low)^(-eta) ;

    C_0 = fsolve(obj_fun2, (1-A_low)/2, options);
    C_1 = 2*Y_bar - C_0;
    A = Y_bar - C_0;

    C_0s(i) = C_0;
    dWdC(i) = C_0^(-gamma) -alpha*(A-A_low)^(-eta) - C_1^(-gamma);
    d2WdC2(i) = -gamma*C_0^(-gamma-1) - alpha*eta*(A-A_low)^(-eta-1) - gamma*C_1^(-gamma-1);
    W(i)      = C_0^(1-gamma)/(1-gamma) + alpha*(A-A_low)^(1-eta)/(1-eta) + C_1^(1-gamma)/(1-gamma);
end
figure;
plot(A_lows, C_0s)
title('C0 vs A low')
saveas(gcf,"../Dynare/Figures/BU_two_period_C0.jpg")
figure;
plot(A_lows, W)
title('W vs A low')
saveas(gcf,"../Dynare/Figures/BU_two_period_W.jpg")
figure;
plot(A_lows, d2WdC2/(-2*gamma))
title('d2WdC2 ratio vs A low')
saveas(gcf,"../Dynare/Figures/BU_two_period_welfareratio.jpg")


