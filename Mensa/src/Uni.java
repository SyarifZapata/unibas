/* Rechnerarchitektur und Betriebssysteme �bung 4

    jlottner 200412, ykilcher 201211
    
    Die Uni fasst alles zusammen. Sie erstellt eine Mensa, einen Koch und einige Professoren.
    
    F�r Aufgabe 1 k�nnen hier die Millisekunden ver�ndert werden um ein �berlaufen oder unterlaufen der Mensa zu simulieren. 
    
*/

class Uni {

  public static void main(String argv[]) {

    Mensa mensa = new Mensa ();
    Koch chef = new Koch(mensa, 1900);   //Der Koch braucht 1.9 Sekunden um die Gerichte anzufertigen.
    
    Prof[] prof = new Prof[5];
    prof[0] = new Prof(0, mensa, 0);     //Gieriger Professor
    prof[1] = new Prof(1, mensa, 4000);  //Diese Profs forschen jeweils 4 Sekunden.
    prof[2] = new Prof(2, mensa, 4000);
    prof[3] = new Prof(3, mensa, 4000);
    prof[4] = new Prof(4, mensa, 4000);

    try {
      chef.join();
      prof[0].join();
      prof[1].join();
      prof[2].join();
      prof[4].join();
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
  }
}

