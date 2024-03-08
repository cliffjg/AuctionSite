package userpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.mysql.cj.Session;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Arrays for storing the auction objects
		ArrayList<Auction> myAuction = new ArrayList();
		ArrayList<Auction> communityAuction = new ArrayList();
		ArrayList<Auction> myBids = new ArrayList();
		

		//Getting the userEmail and Password form the input box
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("pass");
		
		
		//String for sql query to check if field is in database
		String query = "select * from Users where userEmail = '" 
				+ userEmail + "'" + "and password = '" + userPassword +"';";
		

		try {
			
			
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			
			//if Result set returns null or is empty the user
			//is not in the database
			//else if admin -> go to admin page
			if(!(rs.next())) {
            	
				
				System.out.println("The user " + userEmail + "is NOT in the list! False\n");
				
				//send error message to userPageTest.jsp
            	request.setAttribute("success", "error");
            	request.getRequestDispatcher("loginerror.jsp").forward(request,response);

            	
            }else {

            	//checks if either admin or User
            	if(userEmail.equals("admin@gmail.com")) {
            		
            		//set the session and if can be retrieved when forwarded other page
            		HttpSession session = request.getSession();
					session.setAttribute("userEmail", userEmail);
					
            		
					//Forward to the servlet AdminPage.java 
            		RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminPage");
            		dispatcher.forward(request, response);
            		

            	}else {
                	
            		
            		ResultSet rs1 = statement.executeQuery(query);
                	
            		//gets number of columns from the query 
        			//for for loop
        			ResultSetMetaData metadata = rs1.getMetaData();

                	
                	String query2 = "select * from Auction where userEmail = '" 
            				+ userEmail + "';";
                	
                	ResultSet rs2 = statement.executeQuery(query2);
                	
                	//gets number of columns from the query 
        			//for for loop
        			ResultSetMetaData metadata2 = rs2.getMetaData();

        			
//        			int numberOfColumns2 = metadata2.getColumnCount();
        			
        		
        			
        			while(rs2.next()) {
                		
   
        				Auction auction = new Auction(
             					rs2.getString("auctionID"),
             					rs2.getString("userEmail"),
             					rs2.getString("carImage"),
             					rs2.getString("carYear"),
             					rs2.getString("carMake"),
             					rs2.getString("carModel"),
             					rs2.getString("carColor"),
             					rs2.getString("startingBid"),
             					rs2.getString("carPrice"),
             					rs2.getString("startDate"),
             					rs2.getString("expirationDate"),
             					rs2.getString("carDescription"),
             					rs2.getString("imagePath")
             					);
        				
        				auction.setCurrentBid(rs2.getString("currentBid"));
    					auction.setBidderEmail(rs2.getString("bidderEmail"));
        				

    					//add the auction object to the myAuction arrayList
    					//so and can be sent later
        				myAuction.add(auction);	
        				

        				
        			}
        			

                	//Run query to return all auctions
                	String query3 = "select * from Auction;";
                	
                	ResultSet rs3 = statement.executeQuery(query3);
                	
                	
                	//gets number of columns from the query 
        			//for for loop
//        			ResultSetMetaData metadata3 = rs3.getMetaData();
        			
        			
                	
                	while(rs3.next()) {
        				      		
                		
                		Auction auction = new Auction(
             					rs3.getString("auctionID"),
             					rs3.getString("userEmail"),
             					rs3.getString("carImage"),
             					rs3.getString("carYear"),
             					rs3.getString("carMake"),
             					rs3.getString("carModel"),
             					rs3.getString("carColor"),
             					rs3.getString("startingBid"),
             					rs3.getString("carPrice"),
             					rs3.getString("startDate"),
             					rs3.getString("expirationDate"),
             					rs3.getString("carDescription"),
             					rs3.getString("imagePath")
             			);
        				
        				
                		auction.setCurrentBid(rs3.getString("currentBid"));
    					auction.setBidderEmail(rs3.getString("bidderEmail"));

    					
    					//add the auction object to the communityAuction arrayList
    					//so and can be sent later
        				communityAuction.add(auction);
        				     		
                		
                		
        				
        			}
                	
                	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                	LocalDateTime now = LocalDateTime.now();
                	System.out.println("Date: "+  now); 
                	System.out.println(formatter.format(now)); 
                	
                	
                	
                	HttpSession session = request.getSession();

                	response.sendRedirect("userpageTest.jsp");

                	//set all the attributes to be forwarded to userPage.jsp
                	session.setAttribute("userEmail", userEmail);
                	session.setAttribute("myAuction", myAuction);
                	session.setAttribute("communityAuction", communityAuction);
                
            	}
            	

            }
			
			
			 db.closeConnection(connection);

			
		}catch(Exception e){

			 throw new IllegalStateException("Cannot connect the database!", e);
		}
		
		
			
		
	}
	

}
