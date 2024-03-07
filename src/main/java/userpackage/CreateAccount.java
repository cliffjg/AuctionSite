package userpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateAccount
 */
@WebServlet("/CreateAccount")
public class CreateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAccount() {
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
		
		String firstName = request.getParameter("first-name").trim();
		String lastName = request.getParameter("last-name").trim();
		String userEmail = request.getParameter("email").trim();
		String userPassword = request.getParameter("pass").trim();

		System.out.println("First Name: " + firstName);
		System.out.println("Last Name: " + lastName);
		System.out.println("User Email: " + userEmail);
		System.out.println("User Password: " + userPassword);
		
		String query = "select * from Users where userEmail = '" + userEmail + "';";
		
	
		System.out.println("Query: "  + query);
		
		
		if(userEmail.trim() == null || userPassword.trim() == null || userEmail.trim() == "" || userPassword.trim() == "") {
			System.out.println("UserEmail: " + userEmail);
			System.out.println("Password: " + userPassword);
			System.out.println("Name: " + firstName + " " + lastName);
			
			request.setAttribute("checkInput", "errorUserEmailPassword");
			request.getRequestDispatcher("createAccount.jsp").forward(request,response);
			
		}else {
			try {
				DatabaseAccess db = new DatabaseAccess();
				Connection connection = db.getConnection();
				
				Statement statement = connection.createStatement();
				
				ResultSet rs = statement.executeQuery(query);
				
				
				if((rs.next())) {
	            	
					
					System.out.println("The user is in the list! Can't add user!\n");
					System.out.println("!User: " + userEmail + "\n");
					
					
	            	request.setAttribute("checkInput", "error");
	            	request.getRequestDispatcher("createAccount.jsp").forward(request,response);

	            	
	            }else {
	            	String query1 = "insert into Users values ('"+userEmail + "', '"+ userPassword +"' ,'" + firstName + " " + lastName + "', NULL, NULL);";
				
	            	statement.executeUpdate(query1);
	            	
	            	request.setAttribute("checkInput", "success");
	            	request.getRequestDispatcher("createAccount.jsp").forward(request,response);
	            	
	            	
				
	            }
				
				
			}catch(Exception e){

				 throw new IllegalStateException("Cannot connect the database!", e);
			}
		}
		
		


		
		
		
	}

}
