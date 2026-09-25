clear;
%function and varaibles
deltaA = deg2rad(15);
deltaB = deg2rad(10);
M1 = 3;

f1 = @(theta) Shock_residual(deltaA, theta, M1);
fprime1 = @(theta) Shock_prime(theta,M1);

f2 = @(theta) Shock_residual(deltaB, theta, M1);
fprime2 = @(theta) Shock_prime(theta, M1);

atol = 1e-6;
maxit = 100;

%Interval
WeakInterval = [deg2rad(25),deg2rad(40)];
Weak = mean(WeakInterval);

%Newton_Raphson
WeakNewtonA = newton_raphson(f1, fprime1, Weak, atol, maxit);
rad2deg(WeakNewtonA)

WeakNewtonB = newton_raphson(f2, fprime2, Weak, atol, maxit);
rad2deg(WeakNewtonB)