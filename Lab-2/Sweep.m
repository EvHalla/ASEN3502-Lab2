% Sweep Newton initial guess from mu to 90 deg
mu = asin(1 / M);
theta0Grid = linspace(mu, pi / 2, 200);

weakRoot = weakNewton;
strongRoot = strongNewton;
rootTol = 1e-4;

outcome = strings(numel(theta0Grid), 1);
finalRoot = nan(numel(theta0Grid), 1);
funcCountFinal = nan(numel(theta0Grid), 1);

for i = 1:numel(theta0Grid)
    theta0 = theta0Grid(i);

    try
        [xNR, infoNR] = newton_raphson(f, fprime, [theta0 theta0], atol, maxit);
        finalRoot(i) = xNR;
        funcCountFinal(i) = infoNR.history.funcCount(end);

        if abs(xNR - weakRoot) <= rootTol
            outcome(i) = "Weak";
        elseif abs(xNR - strongRoot) <= rootTol
            outcome(i) = "Strong";
        else
            outcome(i) = "Fail";
        end
    catch
        outcome(i) = "Fail";
    end
end

T = table(rad2deg(theta0Grid(:)), outcome, finalRoot, funcCountFinal, ...
    'VariableNames', {'theta0_deg', 'Outcome', 'FinalRoot_rad', 'FuncCount'});
disp(T)

% Plot outcome vs initial guess
figure
hold on

idxFail = outcome == "Fail";
idxWeak = outcome == "Weak";
idxStrong = outcome == "Strong";

scatter(rad2deg(theta0Grid(idxFail)), zeros(nnz(idxFail), 1), 20, 'r', 'filled', ...
    'DisplayName', 'Fail')
scatter(rad2deg(theta0Grid(idxWeak)), ones(nnz(idxWeak), 1), 20, 'g', 'filled', ...
    'DisplayName', 'Weak')
scatter(rad2deg(theta0Grid(idxStrong)), 2 * ones(nnz(idxStrong), 1), 20, 'b', 'filled', ...
    'DisplayName', 'Strong')

grid on
yticks([0 1 2])
yticklabels({'Fail', 'Weak', 'Strong'})
xlabel('Initial guess \theta_0 (deg)')
ylabel('Convergence outcome')
title('Newton-Raphson basin of attraction')
legend('Location', 'best')
