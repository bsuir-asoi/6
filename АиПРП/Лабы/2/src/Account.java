
import java.io.IOException;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;

public class Account extends Thread {
    static int amount = 200;
    ServerSocket server;
    String amountString;

    @Override
    public void run() {
        try {
            server = new ServerSocket(3003);
        } catch (IOException e) {
            System.out.println("Connection error " + e);
        }
        while (true) {
            Socket s = null;
            try {
                s = server.accept(); //wait
            } catch (IOException e) {
                System.out.println("Error in accept " + e);
            }

            try {
                PrintStream ps = new PrintStream(s.getOutputStream());
                int amountcur = (int) (Math.random() * 1000); // if negative - withdrawals from the account
                if (Math.random() > 0.5)//
                    amount -= amountcur;
                else
                    amount += amountcur;
                Integer x = new Integer(amount);
                amountString = x.toString();
                
                ps.println("Account: " + amountString);
                ps.flush();
                s.close();
            } catch (IOException l) {
                System.out.println("Error " + l);
            }
        }
    }

}
