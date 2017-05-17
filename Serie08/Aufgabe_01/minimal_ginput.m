% Minimalbeispiel zur Verwendung von ginput
%
% Zeichnet eine Strecke vom Nullpunkt zum angeklickten Punkt, mittels
% rechter Maustaste bricht man die Eingabe ab.

clear
close all

figure

% Zeichne den Nullpunkt.
plot(0,0,'o')
axis([-2 2 -2 2])
axis('square')

% Die Schleife soll erst mit dem Befehl 'break' abbrechen.
while true
    
    % Wenn in das Bild geklickt wird, steht in x die x-Koordiante, in y die
    % y-Koordinate und in button der Mausbutton, der gedrueckt wurde.
    % (1 = linker Mausbutton, 2 = mittlerer Mausbutton, 3 = rechter Mausbutton)
    [x,y,button] = ginput(1);
    
    % Falls nicht der linke Mausbutton gedrueckt wurde, soll die Schleife
    % abbrechen.
    if button ~= 1
        break
    end
    
    % Andernfalls zeichnen wir die Verbindung vom Nullpunkt zu den
    % angeklickten Koordinaten.
    plot([0,x],[0,y],'o-');
    axis([-2 2 -2 2])
    axis('square')
    
end