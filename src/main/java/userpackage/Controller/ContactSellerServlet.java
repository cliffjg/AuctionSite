package userpackage.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userpackage.Model.Auction;
import userpackage.Model.Message;
import userpackage.Model.Users;

/**
 * Servlet implementation class ContactSellerServlet
 */
@WebServlet("/ContactSellerServlet")
public class ContactSellerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactSellerServlet() {
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
	
		
		HttpSession session = request.getSession();
		
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy @ HH:mm:ss");
//		String formattedDateTime = now.format(formatter);
		
		Auction auction = (Auction) session.getAttribute("auction");
		
		ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");
		ArrayList<Message> auctionMessage = new ArrayList();
		
		Message m = null;
		
		String sellerEmail = (String)session.getAttribute("sellerEmail");
		String message = request.getParameter("message");
		
		
		System.out.println("Auction ID: " + auction.getAuctionId());
		System.out.println("User Email: " + users.get(0).getUserEmail());
		System.out.println("Seller Email: " + sellerEmail);
		System.out.println("Message: " + message);
		

		
		
		String insertMessage = "insert into AuctionMessages(auctionID, userEmail, sendMessage,destinationEmail, receiveMessage, messageDateTime, profilePicture) values(?,?,?,?,null,?,?)";
		String queryMessages = "select * from AuctionMessages where auctionID = ? and userEmail = ? and destinationEmail = ?  order by messageID ASC;";
		
		
		try {
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			
			PreparedStatement preparedStatement = connection.prepareStatement(insertMessage);
			String formattedDateTime = now.format(formatter);
			
			if(message != null) {
				preparedStatement.setString(1, auction.getAuctionId());
				preparedStatement.setString(2, users.get(0).getUserEmail());
				preparedStatement.setString(3, message);
				preparedStatement.setString(4, sellerEmail);
				preparedStatement.setString(5, formattedDateTime);
				preparedStatement.setString(6, users.get(0).getProfilePicture());
				
				preparedStatement.executeUpdate();
			}
			
			
			
			preparedStatement = connection.prepareStatement(queryMessages);
			preparedStatement.setString(1, auction.getAuctionId());
			preparedStatement.setString(2, users.get(0).getUserEmail());
			preparedStatement.setString(3, sellerEmail);
			
	
        	ResultSet rs = preparedStatement.executeQuery();
        	
        	
        	
        	while(rs.next()) {
        		

        		
        		m = new Message(rs.getString("auctionID"),
        				rs.getString("userEmail"),
        				rs.getString("sendMessage"),
        				rs.getString("destinationEmail"),
        				rs.getString("receiveMessage"),
        				rs.getString("messageDateTime"),
        				rs.getString("profilePicture")
        				);
        		
        		if(rs.getString("sendMessage") != null) {
        			System.out.println(rs.getString("userEmail")+ ": " + rs.getString("sendMessage"));
        		}
        		
        		if(rs.getString("receiveMessage") != null) {
        			System.out.println(rs.getString("destinationEmail")+ ": " + rs.getString("receiveMessage"));
        		}
        		
        		auctionMessage.add(m);
        		
        	}
        	
//        	System.out.println("auctionMessage: " + auctionMessage.toString());
			
		}catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}
		
		session.setAttribute("auctionMessage", auctionMessage);
		request.getRequestDispatcher("contactSeller.jsp").forward(request,response);
//		request.getRequestDispatcher("productPage.jsp").forward(request,response);
		
	}

}
