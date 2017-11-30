import java.util.Random;

/**
 * Created by Arkad on 4/3/2017.
 */
public class Koch implements Runnable {


    @Override
    public void run(){
        Random random = new Random();

        while(true){
            Gerichte essen = null;
            int i = random.nextInt(3);
            switch (i){
                case 0:
                    essen = new Gerichte("Spaghetti", 7.50);
                    break;
                case 1:
                    essen = new Gerichte("Nasi goreng", 12.50);
                    break;
                case 2:
                    essen = new Gerichte("Zuercher Geschnetzeltes", 10.50);
            }
            try {
                Mensa.buffet.put(essen);
                //safePrintln("Koch: Ich habe "+essen.getName()+" gekocht. Im Buffet gibt es insgesamt "+Mensa.buffet.size()+" Portionen");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public void safePrintln(String s) {
        synchronized (System.out) {
            System.out.println(s);
        }
    }
}
