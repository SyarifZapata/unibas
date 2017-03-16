package sample;

import java.io.BufferedReader;
import java.io.PrintWriter;

/**
 * Created by Arkad on 3/15/2017.
 */
public class Client {

    protected static int port;
    protected static String ip;
    protected static BufferedReader bufferedReader;
    protected static PrintWriter printWriter;

    Client(int port, String ip){
        this.port = port;
        this.ip = ip;
    }
}
