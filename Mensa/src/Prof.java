/* Rechnerarchitektur und Betriebssysteme Übung 4

    jlottner 200412,ykilcher 201211
    
    Die Professoren forschen einige Zeit (pensum) und gehen dann in die Mensa essen, was es halt gerade hat. Sie merken sich, wie oft sie schon gegessen haben.
    
    Nur Professororen, deren pensum < 1000, die gehen immer direkt in die Mensa.
    
    Hier gar nichts ändern! (gilt nur fŸr Aufgabe 1!)
*/


class Prof extends Thread {
    private int id;
    private int pensum;
    private Mensa mensa;
    private int gegessen;
    
    
    public Prof (int id, Mensa mensa, int pensum) {
        this.id = id;
        this.mensa = mensa;
        this.pensum = pensum;
        this.gegessen = 0;
        start ();
    }

    public void run () {
        String gericht;
        
        System.out.println ("(" + System.currentTimeMillis() + ")" +" Prof " + id + ": gestartet");
        while (true) {
            if (pensum>1000) {
                System.out.println ("(" + System.currentTimeMillis() + ")" +" Prof " + id + ": Ich geh jetzt mal forschen.");
                try {sleep (pensum);} catch (InterruptedException e) {}
            }
            else{
                System.out.println ("(" + System.currentTimeMillis() + ")" +" Prof " + id + ": Forschen ist doof!");
            }
            System.out.println ("(" + System.currentTimeMillis() + ")" +" Prof " + id + ": Ich hab Hunger. ");
            gericht = mensa.get(id);
            gegessen++;
            System.out.println ("(" + System.currentTimeMillis() + ")" +" Prof " + id + ": lecker, " + gericht + ", das gabs schon lange nicht mehr!");
            System.out.println ("(" + System.currentTimeMillis() + ") Prof " + id + ": Das ist jetzt das " + gegessen + "te mal und ich weiss immer noch nicht wo die Gabeln sind.");
        }
    }
}
