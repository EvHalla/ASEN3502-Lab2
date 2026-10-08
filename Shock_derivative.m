function fprime = Shock_prime(theta, M)
gamma = 1.4;

N = M^2 * sin(2 * theta) - 2 * cot(theta);
D = 2 + M^2 * (gamma + cos(2 * theta));

Np = 2 * M^2 * cos(2 * theta) + 2 * csc(theta)^2;
Dp = -2 * M^2 * sin(2 * theta);

fprime = (Np * D - N * Dp) / D^2;
end
