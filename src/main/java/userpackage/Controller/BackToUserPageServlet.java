package userpackage.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
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

import userpackage.Model.Auction;
import userpackage.Model.Users;

/**
 * Servlet implementation class BackToUserPage
 */
@WebServlet("/BackToUserPageServlet")
public class BackToUserPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackToUserPageServlet() {
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

		
		//Arrays for storing the auction objects\
		ArrayList<Auction> allAuctions = new ArrayList();
		ArrayList<Auction> myAuction = new ArrayList();
		ArrayList<Auction> communityAuction = new ArrayList();
		ArrayList<Auction> myBids = new ArrayList();
		
		
		HttpSession session = request.getSession();
		
		String userEmail = (String)session.getAttribute("userEmail");
		
		try {
			
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			
			
			String query = "select * from Auction;";
			
			PreparedStatement preparedStatement = connection.prepareStatement(query);

			ResultSet rs = preparedStatement.executeQuery();
			
			System.out.println("Prepared Statement: " + preparedStatement.toString());
			
			
  			
    			while(rs.next()) {
            		

    				Auction auction = new Auction(
         					rs.getString("auctionID"),
         					rs.getString("userEmail"),
         					rs.getString("carImage"),
         					rs.getString("carYear"),
         					rs.getString("carMake"),
         					rs.getString("carModel"),
         					rs.getString("carColor"),
         					rs.getString("startingBid"),
         					rs.getString("carPrice"),
         					rs.getString("startDate"),
         					rs.getString("expirationDate"),
         					rs.getString("carDescription"),
         					rs.getString("imagePath")
         					);
    				
    				auction.setCurrentBid(rs.getString("currentBid"));
					auction.setBidderEmail(rs.getString("bidderEmail"));
    				

					//add the auction object to the myAuction arrayList
					//so and can be sent later
//    				myAuction.add(auction);	
    				
    				allAuctions.add(auction);
    				
    			}
   			
    			System.out.println(allAuctions.toString());

            	response.sendRedirect("userPage.jsp");

            	//set all the attributes to be forwarded to userPage.jsp
            	session.setAttribute("userEmail", userEmail);
            	session.setAttribute("allAuctions", allAuctions);

			
			
			db.closeConnection(connection);

		
		}catch(Exception e){

		 throw new IllegalStateException("Cannot connect the database!", e);
		}

		
		
		
	}
	


}
