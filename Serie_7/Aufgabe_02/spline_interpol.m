
function s = spline_interpol(K,x,z)

% Achtung: x und z muessen Spaltenvektoren sein!

n = length(x)-1;

% Extrahiere die einzelnen Koeffizienten aus K
A = K(:,1);
B = K(:,2);
C = K(:,3);
D = K(:,4);

% Finde die Indizes i, sodass x(i) <= z < x(i)
i = zeros(size(z));

for j = 1:length(z)
    i(j) = find(z(j) >= x,1,'last');
    if i(j) == n+1 % (Korrektur falls ind=n+1)
        i(j) = n;
    end
end

% Berechne die Interpolierten Werte s
s = A(i) + (z-x(i))*B(i) + (z - x(i)).^2 * (z-x(i+1))*C(i) + (z - x(i)) * (z-x(i+1)).^2 * D(i);


    
end