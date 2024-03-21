package userpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddAuctionServlet
 */
@WebServlet("/AddAuctionServlet")
public class AddAuctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAuctionServlet() {
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
		
		
		//Date formatter and get current date and time
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();  
		String startDate = formatter.format(now);
		
		
		HttpSession session = request.getSession();
		
		
		//Get all attributes from user 
		String userEmail = (String)session.getAttribute("userEmail");
		String carImage = request.getParameter("carImage");
		String carYear = request.getParameter("carYear"); 
		String carMake = request.getParameter("carMake"); 
		String carModel = request.getParameter("carModel");  
		String carColor = request.getParameter("carColor"); 
		String startingBid = request.getParameter("startingBid");  
		String carPrice = request.getParameter("carPrice"); 
//		String startDate = request.getParameter("startDate"); 
		String expirationDate = request.getParameter("expirationDate"); 
		String carDescription = request.getParameter("carDescription"); 
		String imagePath = request.getParameter("imagePath");
		
		
		
		
		//Get all attributes from user 
//		String userEmail = (String)session.getAttribute("userEmail");
//				String carImage = request.getParameter("carImage").trim();
//				String carYear = request.getParameter("carYear").trim(); 
//				String carMake = request.getParameter("carMake").trim(); 
//				String carModel = request.getParameter("carModel").trim();  
//				String carColor = request.getParameter("carColor").trim(); 
//				String startingBid = request.getParameter("startingBid").trim();  
//				String carPrice = request.getParameter("carPrice").trim(); 
////				String startDate = request.getParameter("startDate"); 
//				String expirationDate = request.getParameter("expirationDate").trim(); 
//				String carDescription = request.getParameter("carDescription").trim(); 
//				String imagePath = request.getParameter("imagePath").trim();
		
		System.out.println("\n");		
//		
		System.out.println("Car Year: " + carYear);		
		System.out.println("Car Make: " + carMake);	
		System.out.println("Car Model: " + carModel);
		System.out.println("Car Color: " + carColor);
		System.out.println("Starting Bid: " + startingBid);
		System.out.println("Car Price: " + carPrice);
		System.out.println("Car Description: " + carDescription);
		System.out.println("Image Path: " + imagePath);
		
//		 String queryAddAuction = "insert into Auction(auctionID, "
//					+ "userEmail, "
//					+ "carImage, "
//					+ "carYear, "
//					+ "carMake, "
//					+ "carModel, "
//					+ "carColor, "
//					+ "startingBid, "
//					+ "carPrice, "
//					+ "startDate, "
//					+ "expirationDate, "
//					+ "carDescription, imagePath) values ("+ userEmail + "'" +","+"'"+carImage+"'," 
//					+ carYear  + "," + "'" + carMake + "'"+ "," +"'" +carModel + "'"+","
//					+ "'" +carColor + "'" + "," + startingBid + "," + carPrice +","+"'"+startDate+"'" + "," + "'"+expirationDate+"'"
//					+ "," + "'" +carDescription + "'," + "'" + imagePath + "'"
//							+ ");";
		
		String queryAddAuction = "insert into Auction(userEmail, carImage, carYear, carMake, carModel, carColor, startingBid, carPrice, startDate, expirationDate, carDescription, imagePath) values ('" + userEmail + "'" +","+"'"+carImage+"'," 
				+ carYear  + "," + "'" + carMake + "'"+ "," +"'" +carModel + "'"+","
				+ "'" +carColor + "'" + "," + startingBid + "," + carPrice +","+"'"+startDate+"'" + "," + "'"+expirationDate+"'"
				+ "," + "'" +carDescription + "'," + "'/Images/" + imagePath + "'"
						+ ");";
		 
//		 String queryAddBidHistory = "insert into BidHistory(auctionID, userEmail, bidPrice, bidDateTime) values
//				 (1, "johnnykane@gmail.com", 2750243, "2024-02-4 17:49:52");
		
		
		 System.out.println(queryAddAuction);	
//		 System.out.println(queryAddBidHistory;	
		 
		 try{
			 DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
				
			Statement statement = connection.createStatement();
			
			statement.executeUpdate(queryAddAuction);
			
			request.getRequestDispatcher("BackToUserPage").forward(request,response);

		 }catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}
		 
		
	}

}
