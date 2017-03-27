import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.TextField;

import java.awt.*;

/**
 * Created by Syarif on 24.03.17.
 */
public class DialogController {

    @FXML
    private TextField username;

    public String changeUsername(){
        String newUsername = username.getText();
        return newUsername;
    }

}
