function [L,p] = pchol(A, tol)
n = length(A);
p = 1:n;
d = diag(A);
tr = trace(A);
k = 1;
L=zeros(n);
        if tol < 0 
            warning('wrong tolerance input');
            return
        end
 while k <= n && tr >= tol
   [~,pivl] = max(d(k:n));
   p([pivl,k])=p([k,pivl]);
   L(p(k),k) = sqrt(d(p(k)));
   L(p(k+1:n),k)=A(p(k+1:n),p(k))./L(p(k),k);
   Lt = L';
     if k>1
        L(p(k+1:n),k)= L(p(k+1:n),k)-L(p(k+1:n),1:k-1).*(Lt(p(k),1:k-1)/L(p(k),k));
     end
   Lpow2 = [];
   Lpow2 = [Lpow2, (L(p(k:n),k).^2)];
  % Lpow2 = Lpow2';
   d(p(k:n)) = d(p(k:n))- Lpow2;
   tr = trace(A-(L*L'));
   k = k+1;
 end
 


end