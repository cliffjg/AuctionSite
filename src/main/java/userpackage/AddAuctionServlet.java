package userpackage;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import javax.servlet.http.Part;

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
		
//		Path selectedPath = Paths.get(imagePath);
//		
//		Path destinationPath = Paths.get("./Images/" + imagePath);
		
	
		
		
		String queryAddAuction = "insert into Auction(userEmail, carImage, carYear, carMake, carModel, carColor, startingBid, carPrice, startDate, expirationDate, carDescription, imagePath) values ('" + userEmail + "'" +","+"'"+carImage+"'," 
				+ carYear  + "," + "'" + carMake + "'"+ "," +"'" +carModel + "'"+","
				+ "'" +carColor + "'" + "," + startingBid + "," + carPrice +","+"'"+startDate+"'" + "," + "'"+expirationDate+"'"
				+ "," + "'" +carDescription + "'," + "'/Images/" + imagePath + "'"
						+ ");";
		

		String queryAddBidHistory = null;
		String auctionID = null;
		
		//query to get last entry in auction by current userEmail
		String queryLastAddAuctionEntry = "select * from Auction where userEmail = '"+ userEmail + "' ORDER BY auctionID DESC LIMIT 1;";
		
		
		 
		 try{
			 DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
				
			Statement statement = connection.createStatement();
			
			statement.executeUpdate(queryAddAuction);
			
			//get last new auction that was inserted by the current user
			ResultSet rs = statement.executeQuery(queryLastAddAuctionEntry);
			
			while(rs.next()) {
				
				auctionID = rs.getString("auctionID");
				
			}
			
			//insert the bid into bidHistory
			queryAddBidHistory = "insert into BidHistory(auctionID, userEmail, bidPrice, bidDateTime) values (" + 
					auctionID + ", '" + userEmail + "', " + startingBid + ",'" + startDate + "');";
			

			statement.executeUpdate(queryAddBidHistory);
	
//			Files.copy(selectedPath,destinationPath);
			
			request.getRequestDispatcher("BackToUserPage").forward(request,response);

		 }catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}
		 
		
	}

}
