

import java.io.DataInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;

public class    ClientThread extends Thread {
    DataInputStream dis = null;
    Socket s = null;

    public ClientThread() {
        try {
            s = new Socket("127.0.0.1", 3003);
            dis = new DataInputStream(s.getInputStream());
        } catch (IOException e) {
            System.out.println("Error in clientThread " + e);
        }
    }

        public void run() {
            while (true) {
                try {
                    sleep(100);
                } catch (Exception er) {
                    System.out.println("BDD " + er);
                }
                try {
                    String message = dis.readLine();
                    if (message == null) break;
                 
                    //TODO change "System out" to what can output in TextArea
                  //  System.out.println(msg);
                    Serverus.appendText("From Client " +message);
                } catch (IOException err) {
                    System.out.println("Error " + err);
                }
            }
        }
    }

