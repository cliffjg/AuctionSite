package userpackage;

import java.io.IOException;
import java.sql.Connection;
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

/**
 * Servlet implementation class MessagePage
 */
@WebServlet("/MessagePage")
public class MessagePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessagePage() {
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
		
//		String userEmai = request.getParameter("userEmail");
//		
//		String date = "2024-03-02 17:49:52";
//		
//		String message = request.getParameter("message");
		
//		doGet(request, response);
		
//		response.sendRedirect("productPage.jsp");
		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/MessagePage");
		
		
		System.out.println("In Messages java");
		
		LocalDateTime now = LocalDateTime.now();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy @ HH:mm:ss");
		
//		ArrayList<String> messageArrayList = new ArrayList<String>();
		
		
		HttpSession session = request.getSession();
		
		String userLoggedInAs = (String) session.getAttribute("userEmail");
		
		System.out.println("USER LOGGED IN AS: " + userLoggedInAs);
		
		
		String userEmail = "michaeljackson@gmail.com";
//		
		String formattedDateTime = now.format(formatter);
//		
		String message = (String) request.getParameter("message");
		
		//Query for User
		String queryUser = "insert into Messages(userEmail, sendMessage, receiveMessage, messageDateTime) values ('" + userEmail + "', '" + message + "', null, '" + formattedDateTime + "');";
//		
		
		//Query for Admin
		String queryAdmin = "insert into Messages(userEmail, sendMessage, receiveMessage, messageDateTime) values ('" + userEmail + "', null,'" + message + "', '" + formattedDateTime + "');";
		
		String query = null; 
		
//		System.out.println("Query: " + query);
		
		
		
		ArrayList<Message> messageArrayList = new ArrayList<Message>();
		
		Message messageObject = null;
		
		try {
			
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			Statement statement = connection.createStatement();
			
			if(message != null && message != "" /*|| !message.equals("null")*/) {
				
				
				
				if(userLoggedInAs.equals("admin@gmail.com")) {
					statement.executeUpdate(queryAdmin);
				}else {
					statement.executeUpdate(queryUser);
				}
//				statement.executeUpdate(queryAdmin);
				
			}
			
		
			
			
			query = "select * from Messages where userEmail = '" + userEmail + "';";
			System.out.println("Query: " + query);
			
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				
				messageObject = new Message(
						rs.getString("userEmail"),
						rs.getString("sendMessage"),
						rs.getString("receiveMessage"),
						rs.getString("messageDateTime")
						);
				
				messageArrayList.add(messageObject);
				
				System.out.println("\n" + "UserEmail: " + rs.getString("userEmail"));
				System.out.println("SendMessage: " + rs.getString("sendMessage"));
				System.out.println("ReceiveMessage: " + rs.getString("receiveMessage"));
				System.out.println("TimeStamp: " + rs.getString("messageDateTime") + "\n");
				
				
			}
			
			session.setAttribute("messageArrayList", messageArrayList);
			
			if(userLoggedInAs.equals("admin@gmail.com")) {
				request.getRequestDispatcher("adminMessagePage.jsp").forward(request,response);
			}else {
				request.getRequestDispatcher("userMessagePage.jsp").forward(request,response);
			}
			
			
			
			db.closeConnection(connection);
			
		}catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}
		
		
		
//		request.getRequestDispatcher("messagePage.jsp").forward(request,response);
		
		
	}

}
