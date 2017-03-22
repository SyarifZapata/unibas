import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.scene.control.TextArea;

import java.awt.*;
import java.io.*;
import java.net.*;
import java.util.Enumeration;
import java.util.HashSet;

/**
 * Created by Nils, Syarif on 3/15/2017.
 * Server side of chat application
 * All messages are sent and receive as objects of Message class.
 */
public class ServerController {

    static HashSet<Message> clientNames = new HashSet<Message>();
    static HashSet<ObjectOutputStream> broadcast = new HashSet<ObjectOutputStream>();

    private int port;

    @FXML
    private TextArea textAreaMessages;

    @FXML
    public void exitApplication() {
        Platform.exit();

    }

    /** create ServerSocket and listening-loop
     *  Show welcome message and display host IP address */
    public void initialize(){
        (new Thread(){
            public void run(){
                ServerSocket listener = null;
                try {
                    listener = new ServerSocket(port);
                    textAreaMessages.appendText("You are logged in as a server.\n");
                    textAreaMessages.appendText("Your Ip Address is " + getIpAddress()+"\n");
                    textAreaMessages.appendText("Waiting for clients...\n");

                    while (true) {
                        new Handler(listener.accept()).start();
                    }
                } catch(IOException e){
                    System.out.println(e);
                }finally {
                    try{
                        listener.close();
                    } catch(IOException f){
                        System.out.println(f);
                    }
                }
            }
        }).start();
    }

    public void closeConnection(){
        // TODO close connection
        Platform.exit();
        (new Thread(){
            public void run(){
                //Todo
            }
        }).start();
    }

    /** This method will automatically call the IP address of the host machine and convert it to String
     *  so we can display it on the Server text area. */
    public String getIpAddress(){
        String address= null;
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

    /** Handler class that defines how to interact with clients
     * protocol:
     * IDENTIFY: invite client to define his username
     * WELCOME: confirm to client that he is part of the chat
     * MESSAGE: send chat message
     * NEWNAME: client request new username
     * */
    private static class Handler extends Thread{
        private Socket socket;
        private ObjectInputStream in;
        private ObjectOutputStream out;
        private Message clientName;


        Handler(Socket socket) {
            this.socket = socket;
        }

        public void run () {
            try{
                out = new ObjectOutputStream(socket.getOutputStream());
                in = new ObjectInputStream(socket.getInputStream());

                while (true) {
                    /** fordere Client auf, einen Username anzugeben */
                    out.writeObject(new Message("IDENTIFY"));
                    System.out.println("S: IDENTIFY");
                    try {
                        clientName = (Message)in.readObject();
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                    }
                    if (clientName == null) {
                        return;
                    }

                    synchronized (clientNames) {
                        //TODO: optimiere neuen Clientnamen zu generieren
                        if (clientName == null) {
                            return;
                        }
                        while(clientNames.contains(clientName)){
                            clientName.setMessage(clientName.getMessage()+"C:");
                        }
                        clientNames.add(clientName);
                        break;
                    }
                }

                /** in broadcast aufnehmen */
                out.writeObject(new Message("WELCOME"+clientNames.size()));
                broadcast.add(out);

                /** auf Clients hören und messages broadcasten */
                while (true) {
                    Message input = null;
                    try {
                        input = (Message)in.readObject();
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                    }
                    if (input == null) {
                        return;
                    }
                    for (ObjectOutputStream myClient : broadcast) {
                        myClient.writeObject(new Message("MESSAGE " + clientName.getMessage() + ": " + input.getMessage()));
                    }
                }

            }
            catch(IOException e){
                System.out.println(e);
            }
            //Server zurücksetzen und schliessen
            finally {
                if (clientName != null) {
                    clientNames.remove(clientName);
                }
                if (out != null) {
                    broadcast.remove(out);
                }
                try {
                    socket.close();
                } catch (IOException e) {}
            }
        }
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
