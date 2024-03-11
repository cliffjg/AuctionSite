package userpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminMessageServlet
 */
@WebServlet("/AdminMessageServlet")
public class AdminMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMessageServlet() {
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
		
		
		
		
		System.out.println("\nIN ADMIN MESSAGE SERVLET");	
		
		
		
		
		
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy @ HH:mm:ss");
		
		
		
		HttpSession session = request.getSession();
		
		
		
		String admin = (String)session.getAttribute("admin");
		
		
		//this has data if user presses button and null if not
		String adminStartChat = (String)request.getParameter("adminStartChat");
		String adminLeaveChat = (String)request.getParameter("adminLeaveChat");
		
		
		//on first pass it captures the data when user presses the message button
		// if null which means it was reloaded 
		//captures the userEmail from the bottom of this file when 
		//when it is set session.setAttribute("userEmail", userEmail);
		String userEmail = (String)request.getParameter("userEmail");
		if(userEmail == null) {

			userEmail = (String)session.getAttribute("userEmail");
		}
		


		
		String formattedDateTime = now.format(formatter);
		
		//grabs message from input 
		String message = (String) request.getParameter("message");
		
		//Query for Admin
		String queryAdmin = "insert into Messages(userEmail, sendMessage, receiveMessage, messageDateTime) values ('" + userEmail + "', null,'" + message + "', '" + formattedDateTime + "');";
				
		String query = null; 
	
				
		ArrayList<Message> messageArrayList = new ArrayList<Message>();
				
		Message messageObject = null;
		
		
		try {	
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			Statement statement = connection.createStatement();
			
			
			//if message field is not empty when user presses send message
			if(message != null && message != "" /*|| !message.equals("null")*/) {
				
					statement.executeUpdate(queryAdmin);
				
			}
			
			//this has data if user presses button and null if not
			if(adminStartChat != null) {
				adminStartChat = "----------Admin started the chat----------";
				String queryAdminStartChat = "insert into Messages(userEmail, sendMessage, receiveMessage, messageDateTime) values ('" + userEmail + "', null,'" + adminStartChat + "', '" + formattedDateTime + "');";
				statement.executeUpdate(queryAdminStartChat);
				
			}
			
			//this has data if user presses button and null if not
			if(adminLeaveChat != null) {
				adminLeaveChat = "----------Admin left the chat----------";
				String queryAdminLogOut = "insert into Messages(userEmail, sendMessage, receiveMessage, messageDateTime) values ('" + userEmail + "', null,'" + adminLeaveChat + "', '" + formattedDateTime + "');";
				statement.executeUpdate(queryAdminLogOut);

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
			session.setAttribute("admin", admin);
			
				
			request.getRequestDispatcher("adminMessagePage.jsp").forward(request,response);


			db.closeConnection(connection);
			
		}catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}
		
		
	}

}
