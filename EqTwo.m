function Pratio = EqTwo(theta)

    gamma = 1.4;
    M = 3;

    num = 2* gamma * M^2 * sin(theta)^2 - (gamma - 1);
    den = gamma + 1;
    Pratio = num / den;
end
