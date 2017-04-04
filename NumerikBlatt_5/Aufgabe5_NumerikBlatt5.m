%% Matrix multiplication by Strassen
%
% Student name: M. Syarif Hidayatullah
%
% Tutor: Ilja Kalmykov
%
% Exercise sheet 5

%%

ns = 2.^(3:8); ts = zeros(size(ns));
    for ii=1:length(ns)
        disp(['n = ' num2str(ns(ii))]);
        A = rand(ns(ii));
        B = rand(ns(ii));
        tic;
        C = strassen(A,B);
        ts(ii) = toc;
        disp(['Error is ' num2str(norm(C-A*B, 'fro')) '.']);
    end
    
    loglog(ns,ts, 'r-s', ns, ts(2)*(ns(2)\ns).^3, 'b-.', ns, ts(2)*(ns(2)\ns).^log2(7), 'k--');
    legend('laufzeit', 'n^3', 'n^{log_2(7)}', 'Location','NorthWest');    

%%
