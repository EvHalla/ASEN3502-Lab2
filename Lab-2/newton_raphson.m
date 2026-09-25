function [x, info] = newton_raphson(f, fprime, interval, atol, maxit)
info = struct('history', struct('funcCount', [], 'x', []));
funcCount = 0;

x = interval(1);

for k = 1:maxit
    fp = fprime(x);
    funcCount = funcCount + 1;

    if fp == 0
        error('Derivative is zero.')
    end

    fx = f(x);
    funcCount = funcCount + 1;

    xnew = x - fx / fp;

    info.history.funcCount(end + 1, 1) = funcCount;
    info.history.x(end + 1, 1) = xnew;

    if abs(xnew - x) <= atol
        x = xnew;
        return
    end

    x = xnew;
end

error('Newton-Raphson did not converge.')
end
