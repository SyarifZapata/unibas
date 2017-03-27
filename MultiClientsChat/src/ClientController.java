import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Dialog;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;


import java.awt.*;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Optional;

/**
 * Created by Nils, Syarif on 3/15/2017.
 * Client side of the chat application
 * All messages are Objects of Message class
 */
public class ClientController {

    private Client client;
    private int port;
    private String ip;
    private String userName;


    @FXML
    private TextArea textAreaMessages;
    @FXML
    private TextField textFieldMessage;
    @FXML
    private BorderPane clientBorderPane;


    public void initialize()throws Exception{
        (new Thread() {
            public void run() {
                client = new Client(ip,userName,port){
                    public void display(String command, Message msg){
                        switch(command) {
                            case "WELCOME":
                                textAreaMessages.appendText("Welcome to SAND, "+userName+"\n");
                                //enable text-input in chat
                                break;
                            case "MESSAGE":
                                textAreaMessages.appendText(msg.getMessage()+"\n");
                                break;
                        }
                    }
                    public void display(CommandList command, String msg){
                        switch(command) {
                            case WELCOME:
                                textAreaMessages.appendText("Welcome to SAND, "+userName+"\n");
                                //enable text-input in chat
                                break;
                            case MESSAGE:
                                textAreaMessages.appendText(msg+"\n");
                                break;
                        }
                    }
                };
            }
        }).start();
    }

    /** Send button is pressed, get text from text field, send it via ObjectOutputStream to the server */
    public void send(){
        (new Thread(){
            public void run() {
               Message message = null;
               message = new Message(textFieldMessage.getText());
               client.writeToServer(message);
               textFieldMessage.clear();
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


    @FXML
    public void showUsernameDialog() {
        Dialog<ButtonType> dialog = new Dialog<ButtonType>();
        dialog.initOwner(clientBorderPane.getScene().getWindow());
        FXMLLoader fxmlLoader = new FXMLLoader();
        fxmlLoader.setLocation(getClass().getResource("settingsDialog.fxml"));
        try {
            dialog.getDialogPane().setContent(fxmlLoader.load());

        } catch (IOException e) {
            System.out.println("Couldn't load the dialog");
            e.printStackTrace();
            return;
        }

        dialog.getDialogPane().getButtonTypes().add(ButtonType.OK);
        dialog.getDialogPane().getButtonTypes().add(ButtonType.CANCEL);

        Optional<ButtonType> result = dialog.showAndWait();
        if (result.isPresent() && result.get() == ButtonType.OK) {
            DialogController controller = fxmlLoader.getController();
            System.out.println("OK pressed");
            userName = controller.changeUsername(); // username changed
            client.requestNewName(userName);
            Stage stage = (Stage)clientBorderPane.getScene().getWindow();
            stage.setTitle("Client-" + userName);
        } else {
            System.out.println("Cancel pressed");
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
