package userpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Userpage
 */
@WebServlet("/UserPage")
public class UserPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		System.out.println("This is the query in UserPage: " );
		
		String value = request.getParameter("auctionID");
		
		System.out.println("This is the query in UserPage in Get: " + value );
//		
		
//		input.setAttribute('type', 'hidden');
//        input.setAttribute('name', 'id');
//        input.setAttribute('value', auctionId);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		response.sendRedirect("productPage.jsp");
		
		HttpSession session = request.getSession();
		
		
		
		

		String auctionID = request.getParameter("auctionID"); 
		
//		String auctionID = (String)session.getAttribute("auctionID"); 
		
		String userEmail = (String)session.getAttribute("userEmail");
		
		String data = "";

		
		
		
		
		String query = "select * from Auction where auctionID = '" 
				+ auctionID + "';";

		
		System.out.println("This is the query in UserPage: " + query);
		
		System.out.println("\nuserEmail: " + userEmail + "\n");
		
		session.setAttribute("auctionID", auctionID);
		

		
		try {
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			
			if(!(rs.next())) {
            	
				
				System.out.println("The user is NOT in the list! False\n");
				System.out.println("!User: " + userEmail + "\n");
				
            	request.setAttribute("success", "error");
            	request.getRequestDispatcher("loginerror.jsp").forward(request,response);

            	
            }else {
            	

            	ResultSet rs1 = statement.executeQuery(query);
            	//gets number of columns from the query 
    			//for for loop
    			ResultSetMetaData metadata = rs1.getMetaData();
    			
    			

//            	String query2 = "select * from Auction where userEmail = '" 
//        				+ userEmail + "';";
            	
            	String query2 = "select * from Auction where auctionID = '" 
        				+ auctionID + "';";
            	
            	ResultSet rs2 = statement.executeQuery(query2);
            	//gets number of columns from the query 
    			//for for loop
    			ResultSetMetaData metadata2 = rs2.getMetaData();
    			
    			Auction auction = new Auction(); 
    			
    			
    			while(rs2.next()) {
    				
    				auction = new Auction(
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
    				
//    				System.out.println(auction.auctionID);
//        			System.out.println(auction.userEmail);
//        			System.out.println(auction.carYear);
//        			System.out.println(auction.carMake);
//        			System.out.println(auction.carModel);
//        			System.out.println(auction.carColor);
    				
    				
    			}
    			
    		
    			session.setAttribute("auction", auction);
    			
    			System.out.println(auction.auctionID);
    			System.out.println(auction.userEmail);
    			System.out.println(auction.carYear);
    			System.out.println(auction.carMake);
    			System.out.println(auction.carModel);
    			System.out.println(auction.carColor);
    			
    			
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    			
//    			String countQuery = "select Count(*) as row_count from Bidders where auctionID = " + auctionID +";";
////    			
//    			ResultSet resultSet = statement.executeQuery(countQuery);
//    			int rowCount = 0;
//    			if(resultSet.next()) {
//    				rowCount = resultSet.getInt("row_count");
////        			
//        			System.out.println("Row Count: " + rowCount);
//    			}
////    			
//    			
//    			
//    			query2 = "select * from Bidders where auctionID = '" 
//        				+ auctionID + "';";
//            	
//            	rs2 = statement.executeQuery(query2);
//            	//gets number of columns from the query 
//    			//for for loop
////    			metadata2 = rs2.getMetaData();
//    			
// 			
//
//    			
//    			
//    			
//    			while(rs2.next()) {
//    				
//    				System.out.println("AuctionID: " + rs2.getString("auctionID"));    
//    				System.out.println("\tDetails: " + rs2.getString("bidHistoryDetails" + rowCount) + "\n"); 
//    				
//    				
//    			}
//    			
    		
    			
    			
    			
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    			
////////////////////////////////////////////Lookup Bid History//////////////////////////////////////////////////////////////////////////////////////        	
            	
            	
String queryBidHistory = "select * from BidHistory where AuctionID =" + auctionID +";";

ResultSet resultSet = statement.executeQuery(queryBidHistory);

ArrayList<String> bidHistory = new ArrayList<String>();

while(resultSet.next()) {
//System.out.println(resultSet.getString("auctionID"));
//System.out.println(resultSet.getString("userEmail"));
//System.out.println(resultSet.getString("bidPrice"));
//System.out.println(resultSet.getString("bidDateTime"));

bidHistory.add(resultSet.getString("bidPrice") + " " + resultSet.getString("userEmail") + " " + resultSet.getString("bidDateTime"));

}

session.setAttribute("bidHistory", bidHistory);
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////					

            	
            	

    			
    			
            	
            }
			
			
			 db.closeConnection(connection);

			
		}catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}

  	
		
	}

}
