/**
 * Created by Arkad on 3/20/2017.
 */

public enum CommandList {

    CHANGE_USERNAME("Change username"),
    QUIT("Quit current program");



    private final String description;

    CommandList(String description){
        this.description = description;
    }

    public String getDescription(){
        return description;
    }

}
