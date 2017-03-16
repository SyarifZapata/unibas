package sample;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;

public class LoginController {

    protected static String userName;

    @FXML
    private TextField textFieldName;
    @FXML
    private Button connectButton;
    @FXML
    private TextField textFieldIP;
    @FXML
    private CheckBox checkBoxConnectAs;
    @FXML
    private TextField textFieldPort;
    @FXML
    private GridPane loginWindow;




    public void connect() throws Exception{
        if(checkBoxConnectAs.isSelected()){
            userName = textFieldName.getText();
            createNewServer(Integer.valueOf(textFieldPort.getText()));
            BorderPane pane = FXMLLoader.load(getClass().getResource("MainWindow.fxml"));
            pane.setMinSize(600,600);
            loginWindow.getChildren().setAll(pane);

        }else{
            createNewClient(Integer.valueOf(textFieldPort.getText()), textFieldIP.getText());
            userName = textFieldName.getText();
        }
    }

    private Server createNewServer(int port) throws Exception{
        return new Server(port);
    }

    private Client createNewClient(int port, String ip){
        return new Client(port,ip);
    }

}
