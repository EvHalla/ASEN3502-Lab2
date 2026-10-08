f = @(x) [x(1)^2 + x(2)^2 - 1; x(2) - x(1)];

h = 1e-8;
J = @(x) numjac(f,x,h);

x0 = [1; 1];
atol = 1e-10;
maxit = 100;

[xsol, info] = newton_sys(f, J, x0, atol, maxit);

 xtrue = [1/sqrt(2); 1/sqrt(2)];
  assert(norm(xsol - xtrue) < 1e-8, 'newton_sys failed')
  disp('newton_sys verified.')
