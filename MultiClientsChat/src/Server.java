
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashSet;

public class Server{
	ServerSocket server;

	static HashSet<String> clientNames = new HashSet<String>();
	static HashSet<ObjectOutputStream> broadcast = new HashSet<ObjectOutputStream>();

	/** call other constructor with default values */
	public Server(){
		this(9999);
	}

	/** create ServerSocket and listening-loop */
	public Server(int port){
		ServerSocket listener = null;
		try {
			listener = new ServerSocket(port);
			while (true) {
				new Handler(listener.accept()).start();
			}
		} catch(IOException e){
			System.out.println(e);
		}finally {
			try{
				listener.close();
			} catch(IOException f){
				System.out.println(f);
			}
		}
	}

	public static void main(String[] args) {
		new Server();
	}


	/** Handler class that defines how to interact with clients
	 * protocol:
	 * IDENTIFY: invite client to define his username
	 * WELCOME: confirm to client that he is part of the chat
	 * MESSAGE: send chat message
	 * NEWNAME: client request new username
	 * */
	private static class Handler extends Thread{
		private Socket socket;
		private ObjectInputStream in;
		private ObjectOutputStream out;
		private String clientName;


		Handler(Socket socket) {
			this.socket = socket;
		}

		public void run () {
			try{
				out = new ObjectOutputStream(socket.getOutputStream());
				in = new ObjectInputStream(socket.getInputStream());


				while (true) {
					/** fordere Client auf, einen Username anzugeben */
					out.writeObject(new Message(CommandList.IDENTIFY));
					System.out.println("S: IDENTIFY");
					try {
						Message temp = (Message)in.readObject();
						clientName = temp.getMessage();
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}
					if (clientName == null) {
						return;
					}

					/** behandelt Namensduplikate mittels Nummerierung */
					synchronized (clientNames) {
							if (clientName == null) {
									return;
							}
							int c = 0;
							while( clientNames.contains(clientName) ){
									String name = clientName;
									c += 1;
									if (c != 1) {
										name = name.substring(0, name.length()-1) + String.valueOf(c);
									} else {
										name += String.valueOf(c);
									}
									clientName = name;
							}
							clientNames.add(clientName);
							break;
					}
				}

				/** in broadcast aufnehmen */
				out.writeObject(new Message(CommandList.WELCOME,"Welcome to SAND, "+clientName));
				broadcast.add(out);

				/** auf Clients hören und messages broadcasten */
				//TODO neuer timer
				Message input = null;
				while (true) {
					input = null;
					try {
						input = (Message)in.readObject();
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}
					if (input == null) {
						//TODO start timer if not running
						//TODO wenn timer überschritten funktionAusserhalb()
						return;
					}
					else{
						//TODO timer auf 0
					}
					//TODO if input.getCommand == CommandList.MESSAGE..
					//if(input.getMessage().startsWith(CommandList.MESSAGE.toString())){
					if(input.getCommand()==CommandList.MESSAGE){
						//String msg = input.getMessage().substring(8);
						String msg = input.getMessage();
						for (ObjectOutputStream myClient : broadcast) {
							//TODO Nils whitespace/substring(8)
							myClient.writeObject(new Message(CommandList.MESSAGE,clientName + ": " + msg));
						}
						System.out.println("S: "+clientName+": "+msg);
					}
					//else if(input.getMessage().startsWith(CommandList.NEWNAME.toString())){
					else if(input.getCommand()==CommandList.NEWNAME){
						//String newName = input.getMessage().substring(8);
						String newName = input.getMessage();
						System.out.println("S: NEWNAME: "+clientName+" to "+newName);
						String oldName = clientName;
						updateClientName(newName);
						for (ObjectOutputStream myClient : broadcast) {//informiere alle Clients wenn jemand seinen Namen ändert
							myClient.writeObject(new Message(CommandList.MESSAGE," "+oldName+" changed his name to "+newName));
						}
						System.out.println("S: "+oldName+" changed to "+newName);
						out.writeObject(new Message(CommandList.NAMECHANGED));//confirm that the name was changed
					}
				}

			}
			catch(IOException e){
				System.out.println(e);
			}
			// Server zurücksetzen und schliessen
			finally {
				if (clientName != null) {
					clientNames.remove(clientName);
				}
				if (out != null) {
					broadcast.remove(out);
				}
				try {
					socket.close();
				} catch (IOException e) {}
			}
		}

		/** ändere einen Clientnamen in der Hashtable */
		public void updateClientName(String newName){
			//System.out.println(clientNames);
			clientNames.remove(clientName);
			while(clientNames.contains(newName)){
				newName += "C";
			}
			clientNames.add(newName);
			//System.out.println(clientNames);
			clientName = newName;
		}
	}

}