function residual = Shock_residual(delta, theta, M)
%frome tables
gamma = 1.4;
%Actual equation
residual = ((M^2*sin(2*theta)-2*cot(theta))/(2+M^2*(gamma+cos(2*theta)))) - tan(delta);

