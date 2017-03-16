package sample;

import javafx.fxml.FXML;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;


/**
 * Created by Arkad on 3/15/2017.
 */
public class MainWindowController {

    ServerSocket serverSocket = null;
    Socket socket = null;
    BufferedReader clientBufferedReader = null;
    PrintWriter clientPrintWriter = null;
    BufferedReader serverBufferedReader = null;
    PrintWriter serverPrintWriter = null;
    String message ="";


    @FXML
    private TextArea textAreaMessages;
    @FXML
    private TextField textFieldMessage;

    public void initialize(){
        if(Server.isServer){
            textAreaMessages.appendText("Waiting for clients...");
            try {
                ServerSocket serverSocket = new ServerSocket(Server.port);
            } catch (IOException e) {
                textAreaMessages.appendText("Server failed to run");
                e.printStackTrace();
            }

        }else{
            textAreaMessages.appendText("connecting...");
            try {
                Socket socket = new Socket(Client.ip,Client.port);
                clientBufferedReader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                clientPrintWriter = new PrintWriter(new OutputStreamWriter(socket.getOutputStream()));

                while (true){
                   message = clientBufferedReader.readLine();
                   textAreaMessages.appendText(message);

                }
            } catch (IOException e) {
                textAreaMessages.appendText("Error: failed to connect");
                e.printStackTrace();
            }
        }
    }


    public void send(){
        message = LoginController.userName + ": ";
        message += message;
        clientPrintWriter.println(message);
        textAreaMessages.appendText(message);
    }



}
