import java.util.Timer;
import java.util.TimerTask;

/**
 * Created by Arkad on 12/1/2017.
 */
class Loop {
    static long counter;

    public static void main(String[] args) {
        Timer timer = new Timer();
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                System.out.println(counter);
            }
        }, 0, 1000);

        while (true){
            counter++;
        }
    }

}
