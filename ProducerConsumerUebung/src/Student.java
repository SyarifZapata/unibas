import java.util.Random;

/**
 * Created by Arkad on 4/3/2017.
 */
public class Student implements Runnable {

    @Override
    public void run() {
        Random random = new Random();

        while (true){
            if (random.nextInt(10)==0){ //simuliert dass nur gegessen wird wenn ein student hunger hat (int == 0)
                Gerichte essen = null;
                try {
                    safePrintln("Ein Portion "+Mensa.buffet.take().getName()+" wurde vom Buffet genommen. Im Buffet gibt es noch "+Mensa.buffet.size()+" Portionen");
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }


            }
        }
    }

    public void safePrintln(String s) {
        synchronized (System.out) {
            System.out.println(s);
        }
    }
}
