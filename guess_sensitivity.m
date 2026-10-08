gamma = 1.4;
M2 = 2.2549;  M3 = 2.5050;
p2p1 = 2.821; p3p1 = 2.054;
deltaA = deg2rad(15);  deltaB = deg2rad(10);

f = @(x) shock_refraction_residual(x(1), x(2), x(3), M2, M3, deltaA, deltaB, p2p1, p3p1);
J = @(x) numjac(f, x, 1e-8);

%           guess 1   guess 2   guess 3   guess 4
guesses = [  0         0         0         0   ;    % phi
            32.24     80        35        70   ;    % thetaC
            27.38     80        80        70   ];   % thetaD

for k = 1:size(guesses, 2)
    x0 = deg2rad(guesses(:, k));
    try
        x = newton_sys(f, J, x0, 1e-10, 50);
        fprintf('Guess [%g, %g, %g] -> phi = %.4f, thetaC = %.4f, thetaD = %.4f deg\n', ...
                guesses(:,k), rad2deg(x));
    catch
        fprintf('Guess [%g, %g, %g] -> did not converge\n', guesses(:,k));
    end
end