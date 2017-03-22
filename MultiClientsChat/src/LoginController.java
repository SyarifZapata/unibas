import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.io.IOException;

/** This is the controller of the login GUI */
public class LoginController {

    @FXML
    private TextField textFieldName;
    @FXML
    private TextField textFieldIP;
    @FXML
    private CheckBox checkBoxConnectAs;
    @FXML
    private TextField textFieldPort;
    @FXML
    private Button connectBtn;
    @FXML
    private Label warning;

    /** Hide warning label */
    public void initialize(){
        warning.setVisible(false);
    }

    /** connect button is pressed, if Checkbox is checked, call the Sever scene,
     *  otherwise client scene will be called
     *  User inputs are validated here.
     *  We pass validated user inputs to the corresponding controller*/
    public void connect() throws Exception {
        Parent root;
        if (checkBoxConnectAs.isSelected()) {
            if(textFieldIP.getText().equals("")){
                warning.setText("Server-Ip cannot be empty");
                warning.setVisible(true);
            }else if(textFieldPort.getText().equals("")){
                warning.setText("Port cannot be empty");
                warning.setVisible(true);
            }else {
                try {
                    FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("Server.fxml"));
                    root = fxmlLoader.load();
                    ServerController controller = fxmlLoader.<ServerController>getController();
                    controller.setPort(Integer.valueOf(textFieldPort.getText()));
                    Stage stage = new Stage();
                    stage.setTitle("Server");
                    stage.setScene(new Scene(root, 600, 400));
                    stage.setResizable(false);
                    stage.show();
                    // Hide this current window (if this is what you want)
                    connectBtn.getScene().getWindow().hide();

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } else {
            if(textFieldIP.getText().equals("")){
                warning.setText("Server-Ip cannot be empty");
                warning.setVisible(true);
            }else if(textFieldPort.getText().equals("")){
                warning.setText("Port cannot be empty");
                warning.setVisible(true);
            }else if(textFieldName.getText().equals("")){
                warning.setText("Username cannot be empty");
                warning.setVisible(true);
            }else {
                try {
                    FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("Client.fxml"));
                    root = fxmlLoader.load();
                    ClientController controller = fxmlLoader.<ClientController>getController();
                    controller.setPort(Integer.valueOf(textFieldPort.getText()));
                    // pass user inputs to the controller
                    controller.setIp(textFieldIP.getText());
                    controller.setUserName(textFieldName.getText());
                    Stage stage = new Stage();
                    stage.setTitle("Client-" + textFieldName.getText());
                    stage.setScene(new Scene(root, 600, 600));
                    stage.setResizable(false);
                    stage.show();
                    // Hide this current window (if this is what you want)
                    connectBtn.getScene().getWindow().hide();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
