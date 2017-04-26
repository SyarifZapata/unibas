function [x, N] = adaptDivDiff(f, a, b, n)
    xp = linspace(a, b, 4097);

    x = [a; b];
    N = divDiff(x, f(x));
    xi = 0.5*(a+b);
    fxi = f(xi);
    pxi = hornerNewton(N, x, xi);

    subplot(2, 1, 1)
    plot(xp, f(xp), 'r-', x, f(x), 'ks', xp, hornerNewton(N, x, xp), 'b--');
    title('Funktionen')
    subplot(2, 1, 2)
    plot(xp, abs(f(xp)-hornerNewton(N, x, xp)), 'r-');
    title('Error')
    pause(1);

    for ii=2:n
        [~, jj] = max(abs(fxi-pxi));
        h = (xi(jj) - x(jj))/2;
        [x, N] = addDivDiff(x, N, xi(jj), fxi(jj));

        xi = [xi(jj)+h; xi(1:jj-1); xi(jj)-h; xi(jj+1:end)];
        fxi = [f(xi(1)); fxi(1:jj-1); f(xi(jj+1)); fxi(jj+1:end)];
        pxi = hornerNewton(N, x, xi);

        subplot(2, 1, 1)
        plot(xp, f(xp), 'r-', x, f(x), 'ks', xp, hornerNewton(N, x, xp), 'b--');
        title('Funktionen')
        subplot(2, 1, 2)
        plot(xp, abs(f(xp)-hornerNewton(N, x, xp)), 'r-');
        title('Error')
        pause(0.1);
    end
end