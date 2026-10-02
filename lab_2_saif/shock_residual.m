function output = shock_residual(delta, M, theta)

gamma = 1.4;

output = ((M^2 * sin(2*theta) - 2*cot(theta))/(2+M^2*(gamma+cos(2*theta)))) - tan(delta);

end
