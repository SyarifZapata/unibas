import javafx.fxml.FXML;
import javafx.scene.control.TextArea;

import java.awt.*;
import java.io.IOException;
import java.net.*;
import java.util.Enumeration;

/**
 * Created by Nils, Syarif on 3/15/2017.
 * Server side of chat application
 * All messages are sent and receive as objects of Message class.
 */
public class ServerController {
    private int port;


    @FXML
    private TextArea textAreaMessages;


    public void initialize(){
        (new Thread(){
            public void run(){
                textAreaMessages.appendText("You are logged in as a server.\n");
                textAreaMessages.appendText("Your Ip Address is " + getIpAddress()+"\n");
                textAreaMessages.appendText("Waiting for clients...\n");
                new Server(port);
            }
        }).start();
    }

    public void closeConnection(){
        // TODO close connection
    }

    /** This method will automatically call the IP address of the host machine and convert it to String
     *  so we can display it on the Server text area. */
    public String getIpAddress(){
        String address;
        try {
            for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();) {
                NetworkInterface intf = en.nextElement();
                for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();) {
                    InetAddress inetAddress = enumIpAddr.nextElement();
                    address = new String(inetAddress.getHostAddress().toString());
                    if (!inetAddress.isLoopbackAddress() && address.length() < 18) {
                        return inetAddress.getHostAddress().toString();
                    }
                }
            }
        } catch (SocketException ex) {
            String msg = ex.getMessage();
            //do nothing
        }
        return null;
    }

    public void setPort(int port) {
        this.port = port;
    }

		
    /** Open default browser and go to our blog */
    public void link(){
        try {
            Desktop.getDesktop().browse(new URI("http://www.sand-unibas.blogspot.com"));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
    }
}
