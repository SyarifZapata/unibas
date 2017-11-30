/* Rechnerarchitektur und Betriebssysteme Übung 4

    jlottner 200412, ykilcher 201211
    
    Die Mensa bekommt vom Koch frische Gerichte, giesst dann ein wenig Fett darueber (1 Sekunde lang), die Professoren können sie abholen, falls es welche hat.
    
    Falls es nichts mehr hat werden die Profs aufgefordert zu warten.
    
    Falls es schon 10 Gerichte hat, wird dem Koch befohlen, sich schlafen zu legen. Er wird dann geweckt, wenn es noch weniger als 3 Portionen hat.
    
    
    Hier die nötigen Funktionen einfügen!
    Verwenden sie die vorgegebenen Ausgaben!
*/

class Mensa {

    System.out.println ("(" + System.currentTimeMillis() + ") " +"Mensa: Nichts mehr da, Herr Prof " + id + ", sie muessen warten!");
    System.out.println ("(" + System.currentTimeMillis() + ") Mensa: Voila, einmal " + "[ausgabe]" + " fuer Prof " + id + ".");
    System.out.println ("(" + System.currentTimeMillis() + ") Mensa: Noch " + "[vorrat.size()]" + " Gerichte uebrig.");
    System.out.println ("(" + System.currentTimeMillis() + ") Mensa: !Aufwachen!");
    System.out.println ("(" + System.currentTimeMillis() + ") Mensa: !Mach mal ne Pause, Koch!");
    System.out.println ("(" + System.currentTimeMillis() + ") Mensa: Ah, der Nachschub ist da. Noch ein bisschen Fett darüber giessen...");
    System.out.println ("(" + System.currentTimeMillis()+") Mensa: Neue Gerichte bereit. Koennt alle kommen!");
}
