function output = shock_derivative(delta, M, theta)

gamma = 1.4;

N = M^2 * sin(2*theta) - 2*cot(theta);
Nd = 2*M^2*cos(2*theta) + 2*csc(theta)^2;
D = 2 + M^2*(gamma+cos(2*theta));
Dd = -2*M^2*sin(2*theta);

output = (D * Nd - N * Dd)/D^2;

end