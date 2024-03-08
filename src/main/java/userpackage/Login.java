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
		
//		HttpSession session = request.getSession();
//		
//		session = request.getSession();
//		
//		String userEmail = (String)session.getAttribute("email");
//		
//		System.out.println(userEmail);
		
		
//		String userEmail = request.getParameter("email");
//		String userPassword = request.getParameter("pass");
//		
//		System.out.println("This is Email: " + userEmail);
//		System.out.println("This is Password: " + userPassword);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		
//		
//		session = request.getSession();
		

		ArrayList<Auction> myAuction = new ArrayList();
		ArrayList<Auction> communityAuction = new ArrayList();
		ArrayList<Auction> myBids = new ArrayList();
		
//		
		String myAuctions = "";
		String myCommunity = "";
//		String myBids ="";
		String data = "";
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("pass");
		
//		String query = "select userEmail, password from Users where userEmail = '" 
//				+ userEmail + "'" + "and password = '" + userPassword +"';";
		
		String query = "select * from Users where userEmail = '" 
				+ userEmail + "'" + "and password = '" + userPassword +"';";
		

		try {
			DatabaseAccess db = new DatabaseAccess();
			Connection connection = db.getConnection();
			
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			
			if(!(rs.next())) {
            	
				
				System.out.println("The user is NOT in the list! False\n");
				System.out.println("!User: " + userEmail + "\n");
				
            	request.setAttribute("success", "error");
            	request.getRequestDispatcher("loginerror.jsp").forward(request,response);

            	
            }else {

            	
            	if(userEmail.equals("admin@gmail.com")) {
            		
            		
            		HttpSession session = request.getSession();
					session.setAttribute("userEmail", userEmail);
					
					System.out.println("!User: " + userEmail + "\n");
            		//Forward to the servlet AdminPage.java 
            		RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminPage");
            		dispatcher.forward(request, response);
            		
            		
//            		HttpSession session1 = request.getSession();
//            		
//            		//Send admin@gmail to message page
//            		session1.setAttribute("userEmail", userEmail);
//            		
//            		RequestDispatcher dispatcher = request.getRequestDispatcher("/MessagePage");
//            		dispatcher.forward(request, response);

            	}else {
                	ResultSet rs1 = statement.executeQuery(query);
                	//gets number of columns from the query 
        			//for for loop
        			ResultSetMetaData metadata = rs1.getMetaData();
        			
        			
//        			int numberOfColumns = metadata.getColumnCount();
//                	
//                	while(rs1.next()) {
//        				
//        				for(int i = 1; i < numberOfColumns+1; i++) {
//        					data += rs1.getString(i) + " ";
//        				}
//        				
//        				
//        				data += "\n";
//        				
//        			}
                	
                	String query2 = "select * from Auction where userEmail = '" 
            				+ userEmail + "';";
                	
                	ResultSet rs2 = statement.executeQuery(query2);
                	//gets number of columns from the query 
        			//for for loop
        			ResultSetMetaData metadata2 = rs2.getMetaData();
        			
        			int count = 1; 
        			
        			
        			int numberOfColumns2 = metadata2.getColumnCount();
        			
        			
        			
//        			Auction auction = new Auction();
                	
                	
        			
        			
        			while(rs2.next()) {
                		
                		
                		String myAuctions2 = null;
                		
                		
                		
        				
//        				for(int i = 1; i < numberOfColumns2+1; i++) {
//        					System.out.println("ok: " + myAuctions2);
    //
//        					
//        					myAuctions2 += rs2.getString(i) + " ";
//        					count++;
//        				}
        				
//        			arrayList.add(myAuctions2);	
        				
                		
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
        				
        				
        				
        				
                		
        				
//        				arrayListAuction.add(auction);	
        				myAuction.add(auction);	
        				

        				
        			}
        			
//        			for(int i = 0; i < myAuction.size(); i++){
//        				System.out.println(myAuction.get(i).auctionID);
//        				System.out.println(myAuction.get(i).userEmail);
//        				System.out.println(myAuction.get(i).carImage);
//        				System.out.println(myAuction.get(i).carYear);
//        				System.out.println(myAuction.get(i).carMake);
//        				System.out.println(myAuction.get(i).carModel);
//        				System.out.println(myAuction.get(i).carColor);
//        				System.out.println(myAuction.get(i).startingBid);
//        				System.out.println(myAuction.get(i).carPrice);
//        				System.out.println(myAuction.get(i).startDate);
//        				System.out.println(myAuction.get(i).expirationDate);
//        				System.out.println(myAuction.get(i).carDescription);
//        				System.out.println(myAuction.get(i).imagePath);
//        				
//        				System.out.println("\n");
//        			}
//        			
        			
                	
//                	System.out.println(arrayList);
        			
//        			for(String list: auction)
//        			
//        			System.out.println(arrayListAuction);
                	
                	String query3 = "select * from Auction;";
                	
                	ResultSet rs3 = statement.executeQuery(query3);
                	//gets number of columns from the query 
        			//for for loop
        			ResultSetMetaData metadata3 = rs3.getMetaData();
        			
        			
        			int numberOfColumns3 = metadata3.getColumnCount();
                	
                	while(rs3.next()) {
        				
//        				for(int i = 1; i < numberOfColumns3+1; i++) {
//        					myCommunity += rs3.getString(i) + " ";
//        				}
        				
        				
//        				data += "\n";
                		
                		
                		
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
        				
        				
                		
        				
//        				community.add(auction);
        				communityAuction.add(auction);
        				
        				
//        				for(int i = 0; i < communityAuction.size(); i++){
//            				System.out.println(communityAuction.get(i).auctionID);
//            				System.out.println(communityAuction.get(i).userEmail);
//            				System.out.println(communityAuction.get(i).carImage);
//            				System.out.println(communityAuction.get(i).carYear);
//            				System.out.println(communityAuction.get(i).carMake);
//            				System.out.println(communityAuction.get(i).carModel);
//            				System.out.println(communityAuction.get(i).carColor);
//            				System.out.println(communityAuction.get(i).startingBid);
//            				System.out.println(communityAuction.get(i).carPrice);
//            				System.out.println(communityAuction.get(i).startDate);
//            				System.out.println(communityAuction.get(i).expirationDate);
//            				System.out.println(communityAuction.get(i).carDescription);
//            				System.out.println(communityAuction.get(i).imagePath);
//            				
//            				System.out.println("\n");
//            			}
                		
                		
                		
                		
                		
        				
        			}
                	
                	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                	LocalDateTime now = LocalDateTime.now();
                	System.out.println("Date: "+  now); 
                	System.out.println(formatter.format(now)); 
                	
                	
                	
                	HttpSession session = request.getSession();
//                	session = request.getSession();
//                    String username = (String)request.getAttribute("un");
//                    session.setAttribute("UserName", username);
        			
                	response.sendRedirect("userpageTest.jsp");
//                	session.setAttribute("email", userEmail);
                	session.setAttribute("userEmail", userEmail);
//                	session.setAttribute("myAuctions", myAuctions);
//                	session.setAttribute("myCommunity", myCommunity);
//                	session.setAttribute("arrayList", arrayList);
//                	session.setAttribute("arrayListAuction", arrayListAuction);
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
