import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.net.Socket;

public class Client {


	Socket mySocket = null;
	ObjectInputStream in = null;
	ObjectOutputStream out = null;
	boolean connected = false;
	String userName = "anonymous";//default
	String myHost = "localhost";//default
	int myPort;

	/** call other constructor with default values */
	public Client() {
		this(9999 );
	}
	public Client(int port){
		connect(port);
		communicate(in,out);
		writeToServer();
	}
	public Client(String _userName, int port){
		userName = _userName;
		connect(port);
		communicate(in,out);
		writeToServer();
	}
	public Client(String _myHost,String _userName, int port){
		myHost = _myHost;
		userName = _userName;
		connect(port);
		communicate(in,out);
		writeToServer();
	}

	public static void main(String[] args) {
		new Client(9999);
	}

	/** establish connection (Socket) with Server
	 * set Streams "in" and "out"
	 */
	public void connect(){
		connect(9999);
	}
	public void connect(int port){
		myPort = port;
		try{
			mySocket = new Socket(myHost,port);
			connected = true;
		} catch (IOException e){
			System.out.println("konnte nicht mit Server verbinden.");
		}

		try{
			out = new ObjectOutputStream(mySocket.getOutputStream());
			in = new ObjectInputStream(mySocket.getInputStream());
		}
		catch(IOException e){
			System.out.println(e);
		}
	}

	/** listen to inputs in console and send them to the server. */
	public void writeToServer(){
		(new Thread(){
			public void run(){
				BufferedReader cons = new BufferedReader(new InputStreamReader(System.in));
				Message message;
				while(true){
					try{
						message = new Message(cons.readLine());
						//out.println("MESSAGE "+incoming);
						out.writeObject(message);
					} catch(IOException e){
						System.out.println(e);
					}

				}
			}
		}).start();
	}
	public void writeToServer(Message message){
		try {
			//out.writeObject(new Message(CommandList.MESSAGE," "+message.getMessage()));
			out.writeObject(message);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void requestNewName(String newName){
		try {
			out.writeObject(new Message(CommandList.NEWNAME,newName));//before: "NEWNAME "+newName
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/** Definition of protocol
	 * IDENTIFY: send userName
	 * WELCOME: confirmation that connected
	 * MESSAGE: incoming message of server
	 * NAMECHANGED: confirm that your username did change
	 * */
	private void communicate(ObjectInputStream in, ObjectOutputStream out) {
		(new Thread(){
			public void run(){
				Message line;
				while(true) {
					line = null;

					try {
						line = (Message)in.readObject();
					} catch (IOException e) {
						e.printStackTrace();
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}

					//if (line.getMessage().startsWith(CommandList.IDENTIFY.toString())) {
					if (line.getCommand()==CommandList.IDENTIFY) {
						//String requestClientName = getClientName();
						try {
							out.writeObject(new Message(CommandList.IDENTIFYING,userName));
						} catch (IOException e) {
							e.printStackTrace();
						}
						//System.out.println("C: IDENTIFY = "+userName);
					}
					//else if (line.getMessage().startsWith(CommandList.WELCOME.toString())) {
					else if (line.getCommand()==CommandList.WELCOME) {
						//textField.setEditable(true);
						//display(CommandList.WELCOME.getDescription(),null);
						//TODO umschreiben
						display(CommandList.WELCOME,line.getMessage());
						//display(CommandList.WELCOME.getDescription(),null);
					}
					//else if (line.getMessage().startsWith(CommandList.MESSAGE.toString())) {
					else if (line.getCommand()==CommandList.MESSAGE) {
						//messageArea.append(line.substring(8) + "\n");
						//display(CommandList.MESSAGE.getDescription(),new Message(line.getMessage().substring(8)));
						display(line.getCommand(),line.getMessage());
					} else if(line.getMessage().startsWith(CommandList.NAMECHANGED.toString())){
						//System.out.println("Your new Username was accepted.");
					}
				}
			}
		}).start();
	}

	/** von ClientController überschrieben durch anonyme Klasse */
	public void display(String command, Message msg){
		switch(command) {
			case "WELCOME":
				//System.out.println("WELCOMED BY SERVER");
				break;
			case "MESSAGE":
				//System.out.println("C: " + msg);
				break;
		}
	}
	public void display(CommandList command, String msg){
		switch(command) {
			case WELCOME:
				//System.out.println("WELCOMED BY SERVER");
				break;
			case MESSAGE:
				//System.out.println("C: " + msg);
				break;
		}
	}
}