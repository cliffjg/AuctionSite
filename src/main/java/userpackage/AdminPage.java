package userpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminPage
 */
@WebServlet("/AdminPage")
public class AdminPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPage() {
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
		doGet(request, response);
		
		
		
		System.out.println("\nOk I'm in the admin servlet!\n");
		
		HttpSession session = request.getSession();
		
		
		
		
		String query = "select * from Users;";
		
		try {
			
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			ArrayList<Users> usersArrayList = new ArrayList<Users>();
			
			
			
			while(rs.next()) {
				
				
				Users user = new Users(
						rs.getString("userEmail"),
						rs.getString("password"),
						rs.getString("name"),
						rs.getString("address"),
						rs.getString("phoneNumber")
						);
				
				System.out.println(rs.getString("userEmail"));
				System.out.println(rs.getString("password"));
				System.out.println(rs.getString("name"));
				System.out.println(rs.getString("address"));
				System.out.println(rs.getString("phoneNumber"));
				System.out.println("\n");
				
				usersArrayList.add(user);
				
			}
			
			
			session.setAttribute("usersArrayList", usersArrayList);
			
			db.closeConnection(connection);

			
		}catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}
		
		
		
		
		response.sendRedirect("adminPage.jsp");
		
		
		
	}

}
