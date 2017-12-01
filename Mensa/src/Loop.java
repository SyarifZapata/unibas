import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

/**
 * Created by Syarif on 12/1/2017.
 */
class Loop {
    static long counter;

    public static void main(String[] args) {
        Random random = new Random();
        int id = random.nextInt(10);
    
    	// Print out counter every second
        Timer timer = new Timer();
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                System.out.println("programm " + id+": " + counter);
            }
        }, 0, 1000);

        while (true){
            counter++;
        }
    }

}

// you can manipulate the process priority using nice -n <-19 upto 19>
// The results differ, sometimes the difference is significant, sometimes there is
// only small difference
