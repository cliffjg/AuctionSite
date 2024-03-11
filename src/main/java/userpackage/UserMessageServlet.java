package userpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
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
 * Servlet implementation class UserMessageServlet
 */
@WebServlet("/UserMessageServlet")
public class UserMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMessageServlet() {
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
		

		
		System.out.println("\nIN USER MESSAGE SERVLET");	
		
		
		
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy @ HH:mm:ss");
		
		
		
		HttpSession session = request.getSession();
		

		//on first pass it captures the data when user presses the message button
		// if null which means it was reloaded 
		//captures the userEmail from the bottom of this file when 
		//when it is set session.setAttribute("userEmail", userEmail);
		String userEmail = (String)request.getParameter("messageButton");
		if(userEmail == null) {

			userEmail = (String)session.getAttribute("userEmail");
		}
		
		
		//this has data if user presses button and null if not
		String userStartedChat = request.getParameter("userStartChat");
		String userLeaveChat = (String)request.getParameter("userLeaveChat");
		
		
		String formattedDateTime = now.format(formatter);
		
		//grabs message from input 
		String message = (String) request.getParameter("message");
		
		//Query for User
		String queryUser = "insert into Messages(userEmail, sendMessage, receiveMessage, messageDateTime) values ('" + userEmail + "', '" + message + "', null, '" + formattedDateTime + "');";
	
		String query = null; 
		
		

		ArrayList<Message> messageArrayList = new ArrayList<Message>();
		
		Message messageObject = null;
		
		
		
		
		try {	
			
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			Statement statement = connection.createStatement();
			
			
			//if message field is not empty when user presses send message
			if(message != null && message != "") {
				
					statement.executeUpdate(queryUser);
			}
			
			
			
			//this has data if user presses button and null if not
			if(userStartedChat != null) {
				userStartedChat = "----------User started the chat----------";
				String queryUserStartedChat = "insert into Messages(userEmail, sendMessage, receiveMessage, messageDateTime) values ('" + userEmail + "', '" + userStartedChat + "', null, '" + formattedDateTime + "');";
				statement.executeUpdate(queryUserStartedChat);
		
			}
			
			//this has data if user presses button and null if not
			if(userLeaveChat != null) {
				userLeaveChat = "----------User left the chat----------";
				String queryUserLogOut = "insert into Messages(userEmail, sendMessage, receiveMessage, messageDateTime) values ('" + userEmail + "', '" + userLeaveChat + "', null, '" + formattedDateTime + "');";
				statement.executeUpdate(queryUserLogOut);
	
			}
		
			query = "select * from Messages where userEmail = '" + userEmail + "';";

			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				
				messageObject = new Message(
						rs.getString("userEmail"),
						rs.getString("sendMessage"),
						rs.getString("receiveMessage"),
						rs.getString("messageDateTime")
						);
				
				messageArrayList.add(messageObject);
				
			}
			
			session.setAttribute("messageArrayList", messageArrayList);
			session.setAttribute("userEmail", userEmail);
				
			request.getRequestDispatcher("userMessagePage.jsp").forward(request,response);
		
		}catch(Exception e){

			throw new IllegalStateException("Cannot connect the database!", e);
		}
	
		
	}

}
