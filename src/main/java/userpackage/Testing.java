package userpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Timer;
import java.util.TimerTask;


public class Testing {

	public static void main(String[] args) throws SQLException {
		
		
		String query = "select * from Users;";
		
		String data = ""; 
		
		try {
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			//gets number of columns from the query 
			//for for loop
			ResultSetMetaData metadata = rs.getMetaData();
			int numberOfColumns = metadata.getColumnCount();
			
			
			while(rs.next()) {
				
				for(int i = 1; i < numberOfColumns+1; i++) {
					data += rs.getString(i) + " ";
				}
				
				
				data += "\n";
				
			}
			
			System.out.println(data);
			System.out.println("Hello");			
			 db.closeConnection(connection);
			
			
		}catch(SQLException e){
			 throw new IllegalStateException("Cannot connect the database!", e);
		}
				

//		Timer timer = new Timer();
//		
//		TimerTask repeatedTask = new TimerTask() {
//			
//			public void run() {
//				
//				System.out.println("Ok");
//				
//			}
//			
//		};
//		
//		
//		
//		timer.schedule(repeatedTask, 0, 1000);
//		
		
	}

}
