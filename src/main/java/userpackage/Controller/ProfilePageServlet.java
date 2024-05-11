package userpackage.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userpackage.Model.Users;

/**
 * Servlet implementation class ProfilePageServlet
 */
@WebServlet("/ProfilePageServlet")
public class ProfilePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfilePageServlet() {
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
		
	
		//Arrays for storing the user objects
		ArrayList<Users> users = new ArrayList();
		

		//Getting the userEmail and Password form the input box
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("pass");
		
		
		//String for sql query to check if field is in database
		String query = "select * from Users where userEmail = ? and password = ?;";
		
		

		try {
			
			
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userEmail);
			preparedStatement.setString(2, userPassword);
			
			
			ResultSet rs = preparedStatement.executeQuery();
			
			System.out.println("Prepared Statement: " + preparedStatement.toString());
			
			
			//if Result set returns null or is empty the user
			//is not in the database
			//else if admin -> go to admin page
			if(!(rs.next())) {
            	
				
				System.out.println("The user " + userEmail + "is NOT in the list! False\n");
				
				System.out.println("RS: " + rs.next());
				
				//send error message to userPageTest.jsp
            	request.setAttribute("success", "error");
            	request.getRequestDispatcher("loginerror.jsp").forward(request,response);

            	
            }else {

     	
            	rs = preparedStatement.executeQuery();
		
    			while(rs.next()) {
            		

    				Users user = new Users(
    						rs.getString("userEmail"), 
    						rs.getString("password"),
    						rs.getString("firstName"),
    						rs.getString("lastName"),
    						rs.getString("address"),
    						rs.getString("city"),
    						rs.getString("state"),
    						rs.getString("zipCode"),
    						rs.getString("phoneNumber"),
    						rs.getString("profilePicture")
    						);
    				
    				
    				

					//add the user object to the users arrayList
					//so and can be sent later
    				users.add(user);	
 				
    			}
    			
    			
    			System.out.println(users.toString());
    			
    			HttpSession session = request.getSession();


    			//set all the attributes to be forwarded to userPage.jsp
    			session.setAttribute("users", users);
    			

                	response.sendRedirect("profilePage.jsp");
     	

            }
			
			
			 db.closeConnection(connection);

			
		}catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}
		
		
	}

}
