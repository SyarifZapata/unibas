import javafx.fxml.FXML;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

import java.awt.*;
import java.io.*;
import java.net.Socket;
import java.net.URI;
import java.net.URISyntaxException;

/**
 * Created by Nils, Syarif on 3/15/2017.
 * Client side of the chat application
 * All messages are Objects of Message class
 */
public class ClientController {
    Socket mySocket = null;
    ObjectInputStream in = null;
    ObjectOutputStream out = null;
    boolean connected = false;

    private int port;
    private String ip;
    private String userName;


    @FXML
    private TextArea textAreaMessages;
    @FXML
    private TextField textFieldMessage;


    public void initialize()throws Exception{
        (new Thread() {
            public void run() {
                connect(port,ip);
                communicate(in,out);
                writeToServer();
            }
        }).start();
    }

    /** Send button is pressed, get text from text field, send it via ObjectOutputStream to the server */
    public void send(){
        (new Thread(){
            public void run() {
                String incoming = "";
                incoming = textFieldMessage.getText();
                Message message = new Message(incoming);
                textFieldMessage.clear();
                try {
                    out.writeObject(message);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    /** call the send method if user hit enter after typed in the message */
    public void hitEnter(){
        send();
    }

    /** These setter method are used to pass user inputs from the login dialog to this controller */
    public void setPort(int port) {
        this.port = port;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    /** establish connection (Socket) with Server
     * set Streams "in" and "out"
     */
    public void connect(int port,String ip){
        try{
            mySocket = new Socket(ip,port);
            connected = true;
        } catch (IOException e){
            textAreaMessages.appendText("konnte nicht mit Server verbinden."+"\n");
        }

        try{
            out = new ObjectOutputStream(mySocket.getOutputStream());
            in = new ObjectInputStream(mySocket.getInputStream());
        }
        catch(IOException e){
            System.out.println(e);
        }
    }


    /** listen to inputs in console or GUI and send them to the server. */
    public void writeToServer(){
        (new Thread(){
            public void run(){
                BufferedReader cons = new BufferedReader(new InputStreamReader(System.in));
                Message message;
                while(true){
                    try{
                        message = new Message(cons.readLine());
                        out.writeObject(message);
                    } catch(IOException e){
                        System.out.println(e);
                    }

                }
            }
        }).start();
    }

    /** Definition of protocol
     * IDENTIFY: send userName
     * WELCOME: confirmation that connected
     * MESSAGE: incoming message of server
     * */
    private void communicate(ObjectInputStream in, ObjectOutputStream out) {
        (new Thread(){
            public void run(){
                while(true) {
                    Message line = null;
                    try {
                        line = (Message)in.readObject();
                    } catch (IOException e) {
                        e.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                    }

                    if (line.getMessage().startsWith("IDENTIFY")) {
                        Message requestClientName = new Message(userName);
                        try {
                            out.writeObject(requestClientName);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }

                        System.out.println("C: IDENTIFY = "+requestClientName);

                    } else if (line.getMessage().startsWith("WELCOME")) {
                        //textField.setEditable(true);
                        System.out.println("WELCOMED BY SERVER:"+line.getMessage());
                        textAreaMessages.appendText("Welcome to SAND, "+userName+"\n");
                    } else if (line.getMessage().startsWith("MESSAGE")) {
                        //messageArea.append(line.substring(8) + "\n");
                        System.out.println("S:"+line.getMessage().substring(8) + "\n");
                        textAreaMessages.appendText(line.getMessage().substring(8) + "\n");
                    }else if(line.getMessage().startsWith("NAMECHANGED")){
                        System.out.println("Your new Username was accepted.");
                    }
                }
            }
        }).start();
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
