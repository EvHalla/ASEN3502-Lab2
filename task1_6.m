
mu = 3.986e14;
R = 1e8;

vcirc = sqrt(mu/R);
T = 2*pi*sqrt(R^3/mu);

x0 = [R; 0; 0; 0; vcirc; 0];

N = [400, 800, 1600, 3200, 4000];

h_values = T ./ N;
errors = zeros(size(N));

for i = 1:length(N)

    h = h_values(i);

    [t, x] = rk4(@two_bp, [0 T], x0, h);

    % Final spacecraft position
    r_final = x(end,1:3);

    % Initial spacecraft position
    r_initial = x0(1:3)';

    % Closure error
    errors(i) = norm(r_final - r_initial);

end

% Calculate convergece slope
p = polyfit(log(h_values), log(errors), 1);
slope = p(1);


figure;
loglog(h_values, errors, 'bo-', 'LineWidth', 1.5);
grid on;

xlabel('Step Size h (s)');
ylabel('Closure Error (m)');
title('Task 1.6: RK4 Position Convergence');

%Print results
fprintf('     N       h (s)       Error (m)\n');

for i = 1:length(N)
    fprintf('%6d   %10.4f   %12.6e\n', ...
        N(i), h_values(i), errors(i));
end

fprintf('\nEstimated convergence slope: %.4f\n', slope);

saveas(gcf, 'task1_6_convergence.png');
