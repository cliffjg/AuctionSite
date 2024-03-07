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
 * Servlet implementation class ProductPage
 */
@WebServlet("/ProductPage")
public class ProductPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductPage() {
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
		
		HttpSession session = request.getSession();
		
		String auctionID = (String)session.getAttribute("auctionID");
		
//		String auctionID = request.getParameter("auctionID");
		
		String bidderEmail = (String)session.getAttribute("bidderEmail");

		String bidderPrice = request.getParameter("bidderPrice");

//		String auctionID = session.getAttribute("auctionID").toString();
		

		
		System.out.println("\nauctionID: " + auctionID);
		System.out.println("bidderEmail: " + bidderEmail);
		System.out.println("bidderPrice: $"+ bidderPrice);
		
//		select * from Auction where auctionID = 1 
//				and startingBid < 20000000 
//				and currentBid IS NULL
//				or currentBid IS NOT NULL
//				and currentBid < 3000001;
		
		//bidder price has to be greater than the startingBid or currentBid
		String checkBidQuery = "select * from Auction where auctionID = " + auctionID + 
				" and startingBid < " + bidderPrice + 
				" and currentBid IS NULL" + 
				" or auctionID = " + auctionID +
				" and currentBid IS NOT NULL" + 
				" and currentBid < " + bidderPrice + ";";
		

				
				System.out.println("checkBid Query: " + checkBidQuery);
		
//		select * from Auction where auctionID = 1 
//				and startingBid < 20000000 
//				and currentBid IS NULL
//				or currentBid IS NOT NULL
//				and currentBid < 3000001;
//		

		
				
		String query = "update Auction set currentBid = " + bidderPrice + ", bidderEmail = '" + bidderEmail + "' where auctionID = " + auctionID + ";";
		
		
		System.out.println("query: " + query);

		try {
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery(checkBidQuery);
			
			
			if(!(rs.next())) {
            	
				
				System.out.println("\nBid is not greater than both starting Price and current Bid\n");
				response.sendRedirect("productPage.jsp");

            	
            }else {
            	
            	System.out.println("\nALL GOOD PRICE ENTERED!\n");
            	
            	
            	statement.executeUpdate(query);
            	
///////////////////////////////////Insert into BidHistory///////////////////////////////////////////////////////////////////////////
            	
//            	//Count how many rows in Bidders to print History
//            	String countQuery = "select Count(*) as row_count from Bidders where auctionID = " + auctionID +";";
//            	ResultSet resultSet = statement.executeQuery(countQuery);
//            	int rowCount = 0;;
//    			if(resultSet.next()) {
//    				rowCount = resultSet.getInt("row_count");  			
//        			System.out.println("Row Count: " + rowCount);
//    			}
//    			
//    			int addRow = rowCount + 1; 
//    			System.out.println("addRow: " + addRow);
//    			
//    			//alter table Bidders add bidHistoryDetails2 varchar(150);
//    			String addBidHistoryDetailsRow = "alter table Bidders add bidHistoryDetails" + addRow + " varchar(150);";
//    			
//    			System.out.println(addBidHistoryDetailsRow);
//    		
//    			statement.executeUpdate(addBidHistoryDetailsRow);
//    			
//    			
//    			
////    			alter table Bidders add bidHistoryDetails2 varchar(150);
            	
            	LocalDateTime currentDate;
        		LocalDateTime now = LocalDateTime.now();        		
        		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        		currentDate = LocalDateTime.parse(formatter.format(now), formatter);
        		
            	
            	
    			String date = "2024-02-4 17:49:52";
            	
            	String insertBidHistory = "insert into BidHistory(auctionID, userEmail, bidPrice, bidDateTime) values (" + auctionID + 
            			", '" + bidderEmail + "', " + bidderPrice + ", '" + currentDate +  "');";
            	
            	System.out.println("\n\nBid History: " + currentDate + "\n\n");
            	
            	statement.executeUpdate(insertBidHistory);

////////////////////////////////////////////Lookup Bid History//////////////////////////////////////////////////////////////////////////////////////        	
            	
            	
            	String queryBidHistory = "select * from BidHistory where AuctionID =" + auctionID +";";
            	
            	ResultSet resultSet = statement.executeQuery(queryBidHistory);
            	
            	ArrayList<String> bidHistory = new ArrayList<String>();
            	
            	while(resultSet.next()) {
//            		System.out.println(resultSet.getString("auctionID"));
//            		System.out.println(resultSet.getString("userEmail"));
//            		System.out.println(resultSet.getString("bidPrice"));
//            		System.out.println(resultSet.getString("bidDateTime"));
            		
            		bidHistory.add(resultSet.getString("bidPrice") + " " + resultSet.getString("userEmail") + " " + resultSet.getString("bidDateTime"));
            		
            	}

    			session.setAttribute("bidHistory", bidHistory);
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            	
    			
    			String query2 = "select * from Auction where auctionID = '" 
        				+ auctionID + "';";
            	
            	ResultSet rs2 = statement.executeQuery(query2);
            	//gets number of columns from the query 
    			//for for loop
    			ResultSetMetaData metadata2 = rs2.getMetaData();
    			
    			Auction auction = null; 
    			
    			
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
         			);//this end parentheses is for Auction object

    				
    				
//    				//checks to see if bid is greater than previous bid
////    				if(Integer.parseInt(bidderPrice) > Integer.parseInt(auction.startingBid) && 
////    						Integer.parseInt(bidderPrice) > Integer.parseInt(auction.currentBid) ) {
//    				if(Integer.parseInt(bidderPrice) > Integer.parseInt(auction.startingBid) ) {
//    					
    					auction.setCurrentBid(rs2.getString("currentBid"));
        				auction.setBidderEmail(rs2.getString("bidderEmail"));
//        				
//        				System.out.println("Bid added! Bid is greater!");
//    					
//    				}else {
//    					System.out.println("Bid is not greater than both starting Price and current Bid");
//    				}
//    				
//    				
//    				System.out.println("\nBidder: Price: " + Integer.parseInt(bidderPrice));
//    				System.out.println("Starting Bid: " + Integer.parseInt(auction.startingBid) + "\n");
////    				System.out.println("Current Bid: " + Integer.parseInt(auction.currentBid));
    			
    				
    				
    			}
    			
    		
    			session.setAttribute("auction", auction);
    			
    			
    			System.out.println(auction.auctionID);
    			System.out.println(auction.userEmail);
    			System.out.println(auction.carYear);
    			System.out.println(auction.carMake);
    			System.out.println(auction.carModel);
    			System.out.println(auction.carColor);
    			
    			System.out.println("Current Bid: " + auction.currentBid);
    			System.out.println("Bidder Email: " + auction.bidderEmail);
    			
    			
    			response.sendRedirect("productPage.jsp");
    			
    			
//    			int count = 1; 
//    			
//    			
//    			int numberOfColumns2 = metadata2.getColumnCount();
//    			
//            	
//            	String query3 = "select * from Auction;";
//            	
//            	ResultSet rs3 = statement.executeQuery(query3);
//            	//gets number of columns from the query 
//    			//for for loop
//    			ResultSetMetaData metadata3 = rs3.getMetaData();
//    			
//    			
//    			int numberOfColumns3 = metadata3.getColumnCount();
            	
            	
            	
            	

            	
            }

            	

            	
            	
            	
            	

    			
    			
            	
            
			
			
			 db.closeConnection(connection);

			
		}catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}
		
		
			
		
	}
	


}
