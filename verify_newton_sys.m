f = @(x) [x(1)^2 + x(2)^2 - 1; x(2) - x(1)];

h = 1e-8;
J = @(x) numjac(f,x,h);

x0 = [1,1];
atol = 1e-10;
maxit = 100;

[xsol, info] = newton_sys(f, J, x0, atol, maxit);

disp(1/sqrt(2));
disp(xsol);
