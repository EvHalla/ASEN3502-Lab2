clear; clc;

M = 3;
deltaDeg = [10 20 30 40];
muDeg = asind(1 / M);
thetaDeg = linspace(muDeg, 90, 1000);
theta = deg2rad(thetaDeg);

figure;
hold on;

for k = 1:numel(deltaDeg)
    f = zeros(size(theta));
    delta = deg2rad(deltaDeg(k));

    for i = 1:numel(theta)
        f(i) = Shock_residual(delta, theta(i), M);
    end

    plot(thetaDeg, f);
end

ylabel("Shock residual");
xlabel("Theta (deg)")
legend("10°", "20°", "30°", "40°", Location="best");
grid on
hold off
