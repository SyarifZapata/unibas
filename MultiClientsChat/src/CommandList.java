public enum CommandList {

    IDENTIFY("Server invites Client to submit his username"),
    IDENTIFYING("Client submits his username"),
    WELCOME("Server confirms that Client has been added"),
    MESSAGE("Messages sent between Server and Clients"),
    NEWNAME("Client requests new name"),
    NAMECHANGED("Confirm that Clientname has changed");
    //QUIT("Quit current program");



    private final String description;

    CommandList(String description){
        this.description = description;
    }

    public String getDescription(){
        return description;
    }

}