/* Rechnerarchitektur und Betriebssysteme uebung 4

    jlottner 200412, ykilcher 201211

    Die Mensa bekommt vom Koch frische Gerichte, giesst dann ein wenig Fett darueber (1 Sekunde lang), die Professoren koennen sie abholen, falls es welche hat.

    Falls es nichts mehr hat werden die Profs aufgefordert zu warten.

    Falls es schon 10 Gerichte hat, wird dem Koch befohlen, sich schlafen zu legen. Er wird dann geweckt, wenn es noch weniger als 3 Portionen hat.


    Hier die noetigen Funktionen einfuegen!
    Verwenden sie die vorgegebenen Ausgaben!
*/

import java.util.Arrays;
import java.util.PriorityQueue;

class Mensa {
    private PriorityQueue<String> buffet = new PriorityQueue<>();

    synchronized void put(String[] gerichte){
        // Fett giessen, eine sekunde warten
        System.out.println ("(" + System.currentTimeMillis() + ") Mensa: Ah, der Nachschub ist da. Noch ein bisschen Fett darueber giessen...");
        try {
            wait(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // Essen in auf das Buffet stellen.
        buffet.addAll(Arrays.asList(gerichte));
        System.out.println ("(" + System.currentTimeMillis()+") Mensa: Neue Gerichte bereit. Koennt alle kommen!");


        while (buffet.size() >= 10){
            try {
                System.out.println ("(" + System.currentTimeMillis() + ") Mensa: !Mach mal ne Pause, Koch!");
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (buffet.size()<= 3){
                notify();
                System.out.println ("(" + System.currentTimeMillis() + ") Mensa: !Aufwachen!");
            }
        }
    }

    synchronized String get(int id){

        while (buffet.isEmpty()){
            System.out.println ("(" + System.currentTimeMillis() + ") " +"Mensa: Nichts mehr da, Herr Prof " + id + ", sie muessen warten!");
            try {
                wait(5000);
                return "";
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        notify();

        String gericht=buffet.poll();
        System.out.println ("(" + System.currentTimeMillis() + ") Mensa: Voila, einmal " + gericht + " fuer Prof " + id + ".");
        System.out.println ("(" + System.currentTimeMillis() + ") Mensa: Noch " + buffet.size() + " Gerichte uebrig.");
        return gericht;
    }
}

// get and put methods should be marked synchronized to make them threadsafe. Besides wait and notify can only be called in a synchronized block.

// start() does not call the run method. instead it starts the thread which executes the run method.
// If you call run() directly you don't start the thread, you just execute the method on the same caller method.
// taken from StackOverflow
// So basically we use start() to start a new Thread. The Threads will then call the run() method, to perform their own tasks.

// in case where the buffet is full, we wait until the food is consumed by the professor. If buffet is almost empty, we start to fill the buffet until
// a certain limit is reached.

// The class Mensa is the monitoring entity.

// TASK 2
// This implementation is not necessarily fair, because perfect fairness means: all threads should be advancing their work in almost equal portions;
// We can make achieve fairness by setting priority based on waiting time. Thread that has been waiting the longest will have the highest priority.

