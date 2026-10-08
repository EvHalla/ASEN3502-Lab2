e = 10e-6;
h = .000001;

M = 1.5;

for i = 1:4
    theta = pi/2 * i/4;
    delta = pi/4 * i/4;
    check = shock_derivative(delta, theta, M) - ((shock_residual(delta, M, theta + h) - shock_residual(delta, M, theta)) / h);

    if(check > e)
        error("derivative failure")
    else
        disp("works!")
    end

end
