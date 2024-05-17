package userpackage.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class MessagePage
 */
@WebServlet("/InboxMailPageServlet")
public class InboxMailPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InboxMailPageServlet() {
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
//		// TODO Auto-generated method stub
//		
//
	System.out.println("IM IN HERE! InBoxMessageServlet");
		
		
		

		HttpSession session = request.getSession();
		
		ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");
		ArrayList<Message> auctionMessage = new ArrayList();
		
		Message m = null;
		
		String queryMessages = "select auctionID, userEmail, sendMessage, destinationEmail, receiveMessage, messageDateTime, profilePicture from " +
		"(select *, row_number() over(partition by auctionID, userEmail order by messageDateTime DESC) as row_num from AuctionMessages " +
		"where destinationEmail = ?) as subquery where row_num = 1 order by messageDateTime DESC;";
		
//		String queryMessages = "select * from AuctionMessages where destinationEmail = ?;";
		
//		System.out.println("Auction ID: " + auction.getAuctionId());
		System.out.println("User Email: " + users.get(0).getUserEmail());
//		System.out.println("Seller Email: " + sellerEmail);
//		System.out.println("Message: " + message);
		
		
		System.out.println("SQL: " + queryMessages);
		
//		
//		Auction auction = (Auction) session.getAttribute("auction");
//		
//		ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");
//		ArrayList<Message> auctionMessage = new ArrayList();
//		
//		Message m = null;
//		
//		String sellerEmail = (String)session.getAttribute("sellerEmail");
//		String message = request.getParameter("message");
//		
//		
//		System.out.println("Auction ID: " + auction.getAuctionId());
//		System.out.println("User Email: " + users.get(0).getUserEmail());
//		System.out.println("Seller Email: " + sellerEmail);
//		System.out.println("Message: " + message);
//		
////		select * from Messages where userEmail = "AliceSmith@gmail.com" and destinationEmail = "BobJohnson@gmail.com"  ORDER BY messageID DESC;
//		
//		//insert into Messages(userEmail, sendMessage,destinationEmail, receiveMessage, messageDateTime, profilePicture) values
////		("AliceSmith@gmail.com", "Hello my name is Alice Smith and i need help changing my password","admin@gmail.com" ,null, "03/02/2024 @ 17:49:52", 'Images/AliceSmith.jpg');
//
//		
//		
//		String insertMessage = "insert into AuctionMessages(auctionID, userEmail, sendMessage,destinationEmail, receiveMessage, messageDateTime, profilePicture) values(?,?,?,?,null,?,?)";
//		String queryMessages = "select * from AuctionMessages where destinationEmail = ?  order by messageID ASC;";
//		
//		
		try {
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			
			PreparedStatement preparedStatement = connection.prepareStatement(queryMessages);
			preparedStatement.setString(1, users.get(0).getUserEmail());

	
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
        		
//        		if(rs.getString("sendMessage") != null) {
//        			System.out.println(rs.getString("userEmail")+ ": " + rs.getString("sendMessage"));
//        		}
//        		
//        		if(rs.getString("receiveMessage") != null) {
//        			System.out.println(rs.getString("destinationEmail")+ ": " + rs.getString("receiveMessage"));
//        		}
        		
        		auctionMessage.add(m);
        		
        	}
        	
        	System.out.println("auctionMessage: " + auctionMessage.toString());
			
		}catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}
//		
		session.setAttribute("auctionMessage", auctionMessage);
		request.getRequestDispatcher("inboxMailPage.jsp").forward(request,response);
//		request.getRequestDispatcher("productPage.jsp").forward(request,response);
		
	}

}
