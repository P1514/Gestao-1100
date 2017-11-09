package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class redirect extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (request.isUserInRole("admin")) {
			response.sendRedirect("admin");
			return;
		}
		if (request.isUserInRole("elemento")) {
			response.sendRedirect("elemento");
			return;
		}

		HttpSession session=request.getSession();  
		session.invalidate(); 
		response.sendError(402);
	}

}