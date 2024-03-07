package userpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DatabaseAccess {
	
	
	public DatabaseAccess() {
		
	}
	
	public Connection getConnection() {
		
		String connectionUrl = "jdbc:mysql://localhost:3306/mydb";

		String username = "root";
		String password = "00000000";
			 

		System.out.println("Connecting to database ...\n");
		
		Connection connection = null;
		
		try {
			//Load JDBC driver - the interface standardizing the connection procedure. 
			//Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		try {
			//Create a connection to your DB
			connection = DriverManager.getConnection(connectionUrl,username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
			
	}
	
	
	public void closeConnection(Connection connection){
		try {
			connection.close();
			System.out.println("Connection closed!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	

}
