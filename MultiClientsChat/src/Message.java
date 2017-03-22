import java.io.Serializable;

/**
 * Created by Syarif on 3/20/2017.
 * Instead of sending String object, we create a message class that contains String field.
 * This make the Socket communication more flexible.
 */

public class Message implements Serializable {
    private String message;

    public Message(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
