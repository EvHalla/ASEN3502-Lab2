function [x, info] = incremental_search(f, fprime, interval, atol, maxit)
info = struct('history', struct('funcCount', [], 'x', []));

a = interval(1);
b = interval(2);

nmax = ceil((b - a) / atol) + 1;
hx = zeros(1, nmax);
hn = zeros(1, nmax);

x = a;
fx = f(x);
nf = 1;

for it = 1:nmax
    xn = min(x + atol, b);
    fn = f(xn);
    nf = nf + 1;

    hx(it) = xn;
    hn(it) = nf;

    if sign(fn) ~= sign(fx)
        break
    end

    x = xn;
    fx = fn;
end

if it == nmax
    error('incremental_search no_sign_change_in_interval')
end

x = xn;
info.history.x = hx(1:it);
info.history.funcCount = hn(1:it);
info.iterations = it;
end
