function [x, info] = incremental_search(f, fprime, interval, atol, maxit)
info = struct('history', struct('funcCount', [], 'x', []));

xmin = interval(1);
xmax = interval(2);

n = maxit;
dx = (xmax - xmin) / n;
brackets = [];

xl = xmin;
funcCount = 0;

historyX = [];
historyFuncCount = [];

for k = 1:n
    xu = xl + dx;

    fl = f(xl);
    fu = f(xu);

    funcCount = funcCount + 2;
    historyX(end + 1) = xu;
    historyFuncCount(end + 1) = funcCount;

    if fl * fu < 0
        brackets = [brackets; xl, xu];
        break
    end

    xl = xu;
end

x = brackets;
info.history.x = historyX;
info.history.funcCount = historyFuncCount;
end
