function [x, info] = bisection(f, ~, interval, atol, maxit)
info = struct('history', struct('funcCount', [], 'x', []));

a = interval(1);
b = interval(2);

fa = f(a);
fb = f(b);
funcCount = 2;

assert(fa * fb <= 0, 'Interval does not bracket a root')

for k = 1:maxit
    x = (a + b) / 2;
    fx = f(x);
    funcCount = funcCount + 1;

    info.history.funcCount(end + 1, 1) = funcCount;
    info.history.x(end + 1, 1) = x;

    if abs(fx) <= atol || abs(b - a) / 2 <= atol
        return
    end

    if fa * fx <= 0
        b = x;
        fb = fx;
    else
        a = x;
        fa = fx;
    end
end

error('Bisection did not converge')
end
