package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		try {
			request.logout();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("pages?error=2");

	}

}