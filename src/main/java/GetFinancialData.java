

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nfis.it03.solutions.WebServicReport;

/**
 * Servlet implementation class GetFinancialData
 */
@WebServlet("/GetFinancialData")
public class GetFinancialData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFinancialData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String finSym = request.getParameter("finSym");
		WebServicReport wsqo = new WebServicReport();
		String data = null;
		try {
			data = wsqo.getFinancialData(finSym);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("getFinancialData.jsp");
		request.setAttribute("data", data); 
		request.setAttribute("finSym", finSym);
		dispatcher.forward( request, response );
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
