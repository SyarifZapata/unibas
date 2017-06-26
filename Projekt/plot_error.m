function [  ] = plot_error( f, T, t0, y0, levels, exact_solution )

figure;

for i=1:levels
    delta_t = 1/(2^i);
    
    [y_Euler, t_Euler] = Euler( f, T, t0, y0, delta_t );
    [y_Runge_Kutta, t_Runge_Kutta] = Runge_Kutta4( f, T, t0, y0, delta_t );

    delta_ts(i) = delta_t;
    y_final_results_Euler(:,i) = y_Euler(:,end);
    y_final_results_Runge_Kutta(:,i) = y_Runge_Kutta(:,end);
end

differences_Euler = y_final_results_Euler-repmat(exact_solution,1,levels);
errors_Euler = sqrt(sum((differences_Euler.^2),1));
loglog(delta_ts, errors_Euler);

hold on;

loglog(delta_ts, 0.5*delta_ts,'k--');

differences_Runge_Kutta = y_final_results_Runge_Kutta-repmat(exact_solution,1,levels);
errors_Runge_Kutta = sqrt(sum((differences_Runge_Kutta.^2),1));
loglog(delta_ts, errors_Runge_Kutta);

loglog(delta_ts, 0.001*delta_ts.^4,'k:');

xlabel('Zeitschrittweite \Delta t');
ylabel('Fehler zum Zeitpunkt T');
title('Konvergenz der verschiedenen Loesungsverfahren');
legend('Euler-Verfahren', '1. Ordnung', 'klassisches Runge-Kutta-Verfahren', '4. Ordnung', 'Location','SouthEast');

% outfilename = sprintf('convergence.png');
% print(outfilename, '-dpng');
