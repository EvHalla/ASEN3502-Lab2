function M2 = Eqthree(theta, delta)
    gamma = 1.4;
    M1 = 3;

    num = (gamma - 1) * M1^2 * sin(theta)^2 + 2;
    den = 2 * gamma * M1^2 * sin(theta)^2 - (gamma - 1);

    M2 = sqrt(num / den) / sin(theta - delta);
end
