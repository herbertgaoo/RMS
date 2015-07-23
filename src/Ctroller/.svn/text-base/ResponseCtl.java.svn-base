package Ctroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BL.ResponseBL;

public class ResponseCtl extends HttpServlet {    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String action = request.getParameter("action");
		if(action.equals("checkresponse")){
			String cid = request.getParameter("cid");
			List ress = new ResponseBL().checkresponse(cid);
			request.setAttribute("ress", ress);
			request.getRequestDispatcher("../user/CheckResponse.jsp").forward(request, response);			
		}
		
	}
}
