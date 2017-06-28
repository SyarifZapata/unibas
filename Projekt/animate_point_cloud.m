 function [ ] = animate_point_cloud( X, t )

N = size(X,1)/2;

figure;

for i=1:size(X,2)
    scatter(X(1:N,i),X(N+1:end,i));
    axis([-16 16,-16 16]);
    title(strcat('Agenten-Positionen zum Zeitpunkt t = ',num2str(round(t(i)))));
    pause(0.001);
    if round(t(i)) == 300
         outfilename = sprintf('animation_%05d.png',i);
         print(outfilename, '-dpng');
    end
    
end;

end

