package userpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BackToUserPage
 */
@WebServlet("/BackToUserPage")
public class BackToUserPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackToUserPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		HttpSession session1 = request.getSession();

		

		ArrayList<Auction> myAuction = new ArrayList();
		ArrayList<Auction> communityAuction = new ArrayList();
//		
		String myAuctions = "";
		String myCommunity = "";
		String data = "";

		
		String userEmail = (String)session1.getAttribute("userEmail");

		
		String query = "select * from Users where userEmail = '" 
				+ userEmail + "';";
		

		try {
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			Statement statement = connection.createStatement();
			

            	

            	ResultSet rs1 = statement.executeQuery(query);
            	
            	//gets number of columns from the query 
    			//for for loop
    			ResultSetMetaData metadata = rs1.getMetaData();
    			

            	
            	String query2 = "select * from Auction where userEmail = '" 
        				+ userEmail + "';";
            	
            	ResultSet rs2 = statement.executeQuery(query2);
            	
            	//gets number of columns from the query 
    			//for for loop
    			ResultSetMetaData metadata2 = rs2.getMetaData();
    			
    			int count = 1; 
    			
    			
    			int numberOfColumns2 = metadata2.getColumnCount();
    			
    			
    			
    			while(rs2.next()) {
            		
            		
            		String myAuctions2 = null;
            		
    				
            		
    				Auction auction = new Auction(
         					rs2.getString("auctionID"),
         					rs2.getString("userEmail"),
         					rs2.getString("carImage"),
         					rs2.getString("carYear"),
         					rs2.getString("carMake"),
         					rs2.getString("carModel"),
         					rs2.getString("carColor"),
         					rs2.getString("startingBid"),
         					rs2.getString("carPrice"),
         					rs2.getString("startDate"),
         					rs2.getString("expirationDate"),
         					rs2.getString("carDescription"),
         					rs2.getString("imagePath")
         					);
    				
    				auction.setCurrentBid(rs2.getString("currentBid"));
					auction.setBidderEmail(rs2.getString("bidderEmail"));
    				
 
    				myAuction.add(auction);	
    				

    				
    			}
    			

            	
            	String query3 = "select * from Auction;";
            	
            	ResultSet rs3 = statement.executeQuery(query3);
            	//gets number of columns from the query 
    			//for for loop
    			ResultSetMetaData metadata3 = rs3.getMetaData();
    			
    			
    			int numberOfColumns3 = metadata3.getColumnCount();
            	
            	while(rs3.next()) {
    				

            		
            		Auction auction = new Auction(
         					rs3.getString("auctionID"),
         					rs3.getString("userEmail"),
         					rs3.getString("carImage"),
         					rs3.getString("carYear"),
         					rs3.getString("carMake"),
         					rs3.getString("carModel"),
         					rs3.getString("carColor"),
         					rs3.getString("startingBid"),
         					rs3.getString("carPrice"),
         					rs3.getString("startDate"),
         					rs3.getString("expirationDate"),
         					rs3.getString("carDescription"),
         					rs3.getString("imagePath")
         			);
    				
    				
            		auction.setCurrentBid(rs3.getString("currentBid"));
					auction.setBidderEmail(rs3.getString("bidderEmail"));
    				
  				

    				communityAuction.add(auction);
    				
    				
    			}
            	
            	
            	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            	LocalDateTime now = LocalDateTime.now();
            	System.out.println("Date: "+  now); 
            	System.out.println(formatter.format(now)); 
            	
            	
            	
            	HttpSession session = request.getSession();
    			
            	response.sendRedirect("userpageTest.jsp");

            	session.setAttribute("userEmail", userEmail);

            	session.setAttribute("myAuction", myAuction);
            	session.setAttribute("communityAuction", communityAuction);
    			
    			
			
			 db.closeConnection(connection);

			
		}catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}
		
		
			
		
	}
	


}
