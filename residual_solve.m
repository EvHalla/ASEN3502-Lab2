M2 = 2.2549;
M3 = 2.5050;
thetaA = 32.2404;
thetaB = 27.3827;
p2p1 = 2.821;
p3p1 = 2.054;
gamma = 1.4;

deltaA = deg2rad(15);
deltaB = deg2rad(10);

f = @(x) shock_refraction_residual(x(1), x(2), x(3), M2, M3, deltaA, deltaB, p2p1, p3p1);
J = @(x) numjac(f,x, 1e-8);

x0 = [0; deg2rad(32.24); deg2rad(27.38)];
[x, info] = newton_sys(f, J, x0, 1e-10, 50);

phi = x(1);
thetaC = x(2);
thetaD = x(3);
fprintf('phi = %.4f deg, thetaC = %.4f deg, thetaD = %.4f deg\n', rad2deg(x));

p4p2 = (2*gamma*M2^2*sin(thetaC)^2 - (gamma - 1)) / (gamma + 1);
p4p1 = p2p1 * p4p2;
fprintf('p4/p1 = %.4f\n', p4p1);

p4pp3 = (2*gamma*M3^2*sin(thetaD)^2 - (gamma - 1)) / (gamma + 1);
   fprintf('check: p3/p1 * p4''/p3 = %.4f\n', p3p1 * p4pp3);


