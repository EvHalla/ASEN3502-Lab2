%Anonymous function and other variables
delta = deg2rad(20);
M = 3;

f = @(theta) Shock_residual(delta, theta, M);
fprime = @(theta) Shock_prime(theta,M);

atol = deg2rad(1e-6);
maxit = 100;

%Intervals

weakInterval = [deg2rad(35),deg2rad(40)];
strongInterval = [deg2rad(80),deg2rad(85)];

%Means For Newton-Raphson

Weak = mean(weakInterval);
Strong = mean(strongInterval);

%Weak Shock
weakBisection = bisection(f, fprime, weakInterval, atol, maxit);
rad2deg(weakBisection)
weakIncremental = incremental_search(f, fprime, weakInterval, atol, maxit);
rad2deg(weakIncremental)
weakSecant = secant(f, fprime, weakInterval, atol, maxit);
rad2deg(weakSecant)
weakNewton = newton_raphson(f, fprime, Weak, atol, maxit);
rad2deg(weakNewton)

%Strong Shock
strongBisection = bisection(f, fprime, strongInterval, atol, maxit);
rad2deg(strongBisection)
strongIncremental = incremental_search(f, fprime, strongInterval, atol, maxit);
rad2deg(strongIncremental)
strongSecant = secant(f, fprime, strongInterval, atol, maxit);
rad2deg(strongSecant)
strongNewton = newton_raphson(f, fprime, Strong, atol, maxit);
rad2deg(strongNewton)

