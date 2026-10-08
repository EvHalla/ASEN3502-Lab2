function [x, info] = secant(f, ~, interval, atol, maxit)

x0 = interval(1);
x1 = interval(2);

f0 = f(x0);
f1 = f(x1);

historyX = [x0, x1];
historyFuncCount = [1, 2];

for k = 1:maxit
    if f1 == f0
        error('Zero denominator in secant update.')
    end

    x2 = x1 - f1 * (x1 - x0) / (f1 - f0);

    historyX(end + 1) = x2;
    historyFuncCount(end + 1) = historyFuncCount(end) + 1;

    if abs(x2 - x1) <= atol
        x = x2;
        info.history.x = historyX;
        info.history.funcCount = historyFuncCount;
        return
    end

    x0 = x1;
    f0 = f1;
    x1 = x2;
    f1 = f(x1);
end

error('Secant method did not converge');
end
