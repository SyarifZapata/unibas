/* Rechnerarchitektur und Betriebssysteme uebung 4

    jlottner 200412, ykilcher 201211

    Die Mensa bekommt vom Koch frische Gerichte, giesst dann ein wenig Fett darueber (1 Sekunde lang), die Professoren koennen sie abholen, falls es welche hat.

    Falls es nichts mehr hat werden die Profs aufgefordert zu warten.

    Falls es schon 10 Gerichte hat, wird dem Koch befohlen, sich schlafen zu legen. Er wird dann geweckt, wenn es noch weniger als 3 Portionen hat.


    Hier die noetigen Funktionen einfuegen!
    Verwenden sie die vorgegebenen Ausgaben!
*/

import java.util.Arrays;
import java.util.Collection;
import java.util.PriorityQueue;

class Mensa {
    private PriorityQueue<String> buffet;







    void put(String[] gerichte){

        try {
            System.out.println ("(" + System.currentTimeMillis() + ") Mensa: Ah, der Nachschub ist da. Noch ein bisschen Fett darueber giessen...");
            wait(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            notify();
            buffet.addAll(Arrays.asList(gerichte));
        }

        while (buffet.size() >= 10){
            try {
                System.out.println ("(" + System.currentTimeMillis() + ") Mensa: !Mach mal ne Pause, Koch!");
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        notify();


    }

    synchronized String get(int id){
        if (buffet.size()<= 3){
            notify();
            System.out.println ("(" + System.currentTimeMillis() + ") Mensa: !Aufwachen!");
        }
        while (buffet.isEmpty()){
            System.out.println ("(" + System.currentTimeMillis() + ") " +"Mensa: Nichts mehr da, Herr Prof " + id + ", sie muessen warten!");

        }
        notify();
        System.out.println ("(" + System.currentTimeMillis()+") Mensa: Neue Gerichte bereit. Koennt alle kommen!");

        String gericht=buffet.poll();
        System.out.println ("(" + System.currentTimeMillis() + ") Mensa: Voila, einmal " + "[ausgabe]" + " fuer Prof " + id + ".");
        System.out.println ("(" + System.currentTimeMillis() + ") Mensa: Noch " + "[vorrat.size()]" + " Gerichte uebrig.");
        return gericht;


    }
}
