function s = spline_interpol()

% Achtung: x und z muessen Spaltenvektoren sein!


% Extrahiere die einzelnen Koeffizienten aus K


% Finde die Indizes i, sodass x(i) <= z < x(i)
i = zeros(5);

for j = 1:length(z)
    i(j) = find(z(j) >= x,1,'last');
    if i(j) == n+1 % (Korrektur falls ind=n+1)
        i(j) = n;
    end
end

display(i);
    
end

