
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author moysy
 */
public class MySQL {
    private static String dbURL = "jdbc:mysql://localhost:3306/sqlstud; user=root; password=nagibator3000";
    // private static String tableName = "stud";
    
    private static Connection conn = null;
    private static CallableStatement stmt = null;
    private static String answer;
    public static String get (String arg) {
        
        try{
            //Register JDBC Driver
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            
            //open Connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sqlstud", "root", "nagibator3000");
            
            //Execute a query 
            System.out.println("Creating statement...");
            String sql ="{call findtrans (?,?)}";
            stmt = conn.prepareCall(sql);
            
            //Bind IN parameter first, then bind OUT parameter
            
            stmt.setString(1,arg);
            
            //Because second parameter is OUT so register it
            stmt.registerOutParameter(2, java.sql.Types.VARCHAR);
            
            //Use execute method to run stored procedure.
            System.out.println("Executing stored procedure...");
            stmt.execute();
            
            answer = "" +stmt.getString(2);
           // System.out.println("The group of " +""+ "  is - "+answer);
            
            stmt.close();
            conn.close();
                 
        }catch (SQLException se){
            //Handle errors for JDBC
            se.printStackTrace();
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            //finally block used to close resources
            try{
                if(stmt != null)
                    stmt.close();
                }catch (SQLException se2){
                    se2.printStackTrace();
                }try{
                    if (conn != null)
                    conn.close();
                
        }catch (SQLException se){
            se.printStackTrace();
        }
    }
        return answer;
     
}
}

