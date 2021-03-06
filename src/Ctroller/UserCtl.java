package Ctroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BL.UserBL;
import Entities.User;

public class UserCtl extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");//
		HttpSession session = request.getSession();
		if (action.equals("checkUser")) {
			User aUser = null;
			String infoURL = null;
			String passwd = request.getParameter("password");
			String userId = request.getParameter("userID");
			String role = request.getParameter("role");
			aUser = new UserBL().checkUser(userId, passwd, role);
			infoURL = "../user/login.jsp";
			if (aUser != null) {
				session.setAttribute("uId", userId);
				if (role.equals("candidate")) {
					request.getRequestDispatcher("../user/AppHomepage.jsp")
							.forward(request, response);
				} else if (role.equals("recruiter")) {
					request.getRequestDispatcher("../user/RecHomepage.jsp")
							.forward(request, response);
				}
			} else if (!userId.equals("")) {
				System.out.println("login failed! illegal user!");
				request.getRequestDispatcher("../user/NoImplement.jsp")
						.forward(request, response);

			} else {
				request.getRequestDispatcher("../user/login.jsp").forward(
						request, response);
			}
		} else if (action.equals("newUser")) {
			int r;
			String passwd = request.getParameter("password");
			String userId = request.getParameter("userID");
			if (!userId.equals("")) {
				r = new UserBL().newUser(userId, passwd);
				if (r != 0) {
					request.getRequestDispatcher("../user/newUserSuccess.jsp")
							.forward(request, response);
				}else{
					request.getRequestDispatcher("../user/RegisterAccount.jsp")
					.forward(request, response);
				}
			} else {
				request.getRequestDispatcher("../user/RegisterAccount.jsp")
				.forward(request, response);
			}
		}

	}
}
