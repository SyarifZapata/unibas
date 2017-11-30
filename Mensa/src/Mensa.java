/* Rechnerarchitektur und Betriebssysteme �bung 4

    jlottner 200412, ykilcher 201211
    
    Die Mensa bekommt vom Koch frische Gerichte, giesst dann ein wenig Fett darueber (1 Sekunde lang), die Professoren k�nnen sie abholen, falls es welche hat.
    
    Falls es nichts mehr hat werden die Profs aufgefordert zu warten.
    
    Falls es schon 10 Gerichte hat, wird dem Koch befohlen, sich schlafen zu legen. Er wird dann geweckt, wenn es noch weniger als 3 Portionen hat.
    
    
    Hier die n�tigen Funktionen einf�gen!
    Verwenden sie die vorgegebenen Ausgaben!
*/

class Mensa {
    String[] buffet;




        System.out.println ("(" + System.currentTimeMillis() + ") Mensa: !Aufwachen!");
        System.out.println ("(" + System.currentTimeMillis() + ") Mensa: !Mach mal ne Pause, Koch!");
        System.out.println ("(" + System.currentTimeMillis() + ") Mensa: Ah, der Nachschub ist da. Noch ein bisschen Fett dar�ber giessen...");
        System.out.println ("(" + System.currentTimeMillis()+") Mensa: Neue Gerichte bereit. Koennt alle kommen!");


    void put(String[] gerichte){
        buffet gerichte;

    }

    String get(int id){
        if (buffet.length == 0){
            System.out.println ("(" + System.currentTimeMillis() + ") " +"Mensa: Nichts mehr da, Herr Prof " + id + ", sie muessen warten!");
            return "";
        }else {
            String gericht="Tada";
            System.out.println ("(" + System.currentTimeMillis() + ") Mensa: Voila, einmal " + "[ausgabe]" + " fuer Prof " + id + ".");
            System.out.println ("(" + System.currentTimeMillis() + ") Mensa: Noch " + "[vorrat.size()]" + " Gerichte uebrig.");
            return gericht;
        }

    }
}
