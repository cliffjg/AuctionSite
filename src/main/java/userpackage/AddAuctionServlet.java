package userpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddAuctionServlet
 */
@WebServlet("/AddAuctionServlet")
public class AddAuctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAuctionServlet() {
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
		
		
		String carImage = request.getParameter("carImage");
		String carYear = request.getParameter("carYear"); 
		String carMake = request.getParameter("carMake"); 
		String carModel = request.getParameter("carModel");  
		String carColor = request.getParameter("carColor"); 
		String startingBid = request.getParameter("startingBid");  
		String carPrice = request.getParameter("carPrice"); 
//		String startDate = request.getParameter("startDate"); 
//		String expirationDate = request.getParameter("expirationDate"); 
		String carDescription = request.getParameter("carDescription"); 
		String imagePath = request.getParameter("imagePath");
		
		System.out.println("\n");		
//		
		System.out.println("Car Year: " + carYear);		
		System.out.println("Car Make: " + carMake);	
		System.out.println("Car Model: " + carModel);
		System.out.println("Car Color: " + carColor);
		System.out.println("Starting Bid: " + startingBid);
		System.out.println("Car Price: " + carPrice);
		System.out.println("Car Description: " + carDescription);
		System.out.println("Image Path: " + imagePath);
		
		
		request.getRequestDispatcher("userPageNew.jsp").forward(request,response);
	}

}
