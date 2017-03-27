import java.io.Serializable;

/**
 * Created by Syarif on 3/20/2017.
 * Instead of sending String object, we create a message class that contains String field.
 * This make the Socket communication more flexible.
 */

public class Message implements Serializable {
    private String message;
    private CommandList command;

    public Message(String _message) {
        message = _message;
        command = CommandList.MESSAGE;//message as default
    }
    public Message(CommandList _command, String _message){
    	command = _command;
    	message = _message;
	}
	public Message(CommandList _command){
    	//INDENTIFY etc. haben keine Messages dabei
		command = _command;
		message = "";
	}

    public String getMessage() {
        return message;
    }
    public CommandList getCommand(){
    	return command;
	}

    public void setMessage(String _message) {
        message = _message;
    }
	public void setMessage(CommandList _command, String _message) {
		message = _message;
		command = _command;
	}
		
	public String toString() {
		return command.toString()+message;
	}

}