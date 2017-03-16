package sample;

/**
 * Created by Arkad on 3/15/2017.
 */
public class Server {

    protected static boolean isServer;
    protected static int port;

    public Server(int port) throws Exception{
        this.port=port;
        isServer = true;
    }


}
