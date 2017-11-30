import java.util.concurrent.LinkedBlockingQueue;

/**
 * Created by Arkad on 4/2/2017.
 */
public class Mensa {
    public static LinkedBlockingQueue<Gerichte> buffet = new LinkedBlockingQueue<>(10); // Wenn Buffet voll ist, wartet die Koeche.

    public static void main(String[] args) throws Exception{

        Thread koch1 = new Thread(new Koch());
        Thread koch2 = new Thread(new Koch());
        Thread koch3 = new Thread(new Koch());

        Thread stud1 = new Thread(new Student());
        Thread stud2 = new Thread(new Student());
        Thread stud3 = new Thread(new Student());
        Thread stud4 = new Thread(new Student());
        Thread stud5 = new Thread(new Student());
        Thread stud6 = new Thread(new Student());
        Thread stud7 = new Thread(new Student());
        Thread stud8 = new Thread(new Student());
        Thread stud9 = new Thread(new Student());
        Thread stud10 = new Thread(new Student());

        koch1.start();
        koch2.start();
        koch3.start();

        stud1.start();
        stud2.start();
        stud3.start();
        stud4.start();
        stud5.start();
        stud6.start();
        stud7.start();
        stud8.start();
        stud9.start();
        stud10.start();

    }

}
