package userpackage.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@MultipartConfig
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
		String expirationDate = request.getParameter("expirationDate"); 
		String carDescription = request.getParameter("carDescription"); 
		String imagePath = request.getParameter("imagePath");
		
		
		String filePathes = request.getParameter("filePath");
		System.out.println("This is the filePah:" + filePathes);
		
		
		System.out.println("Image Path: " + imagePath);
		
		if(imagePath == null || imagePath.equals("") || imagePath == "") {
			imagePath = "/Images/AwaitingPhoto.jpeg";
		}else {
			imagePath = "/Images/"+imagePath;
		}
		
		

		System.out.println("\n");		
		
		
		System.out.println("User Email: " + userEmail);
		System.out.println("Car Year: " + carYear);		
		System.out.println("Car Make: " + carMake);	
		System.out.println("Car Model: " + carModel);
		System.out.println("Car Color: " + carColor);
		System.out.println("Starting Bid: " + startingBid);
		System.out.println("Car Price: " + carPrice);
		System.out.println("Car Description: " + carDescription);
		System.out.println("Image Path: " + imagePath);
		
		
		
		
		String queryAddAuction = "insert into Auction(userEmail, carImage, carYear, carMake, carModel, carColor, startingBid, carPrice, startDate, expirationDate, carDescription, imagePath) " 
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?);";
		
		
		String queryAddBidHistory = null;
		String queryAddBidHistory1 = null;
		String auctionID = null;
		
		//query to get last entry in auction by current userEmail
		String queryLastAddAuctionEntry = "select * from Auction where userEmail = '"+ userEmail + "' ORDER BY auctionID DESC LIMIT 1;";
		
		
		 
		 try{
			 DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			
			PreparedStatement preparedStatement = connection.prepareStatement(queryAddAuction);
			preparedStatement.setString(1, userEmail);
			preparedStatement.setString(2, carImage);
			preparedStatement.setString(3, carYear);
			preparedStatement.setString(4, carMake);
			preparedStatement.setString(5, carModel);
			preparedStatement.setString(6, carColor);
			preparedStatement.setString(7, startingBid);
			preparedStatement.setString(8, carPrice);
			preparedStatement.setString(9, startDate);
			preparedStatement.setString(10, expirationDate);
			preparedStatement.setString(11, carDescription);
			preparedStatement.setString(12, imagePath);

	
        	preparedStatement.executeUpdate();
			
        	
			Statement statement = connection.createStatement();
			

			//get last new auction that was inserted by the current user
			ResultSet rs = statement.executeQuery(queryLastAddAuctionEntry);
			
			while(rs.next()) {
				
				auctionID = rs.getString("auctionID");
				
			}
			
			//insert the bid into bidHistory
			queryAddBidHistory = "insert into BidHistory(auctionID, userEmail, bidPrice, bidDateTime) values (?,?,?,?);";
			
			PreparedStatement ps = connection.prepareStatement(queryAddBidHistory);
			ps.setString(1, auctionID);
			ps.setString(2, userEmail);
			ps.setString(3, startingBid);
			ps.setString(4, startDate);
			
			ps.executeUpdate();
			
	

			session.setAttribute("userEmail", userEmail);
			request.getRequestDispatcher("BackToUserPageServlet").forward(request,response);
//			request.getRequestDispatcher("userPage.jsp").forward(request,response);

		 }catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}
		 
		
	}
	
	
	

	
	
	
	
	
	
	
	
	
	

}
