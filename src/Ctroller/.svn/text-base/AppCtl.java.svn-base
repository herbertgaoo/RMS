package Ctroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BL.AppBL;
import BL.CVBL;
import BL.UserBL;
import Entities.AppInfo;
import Entities.JobOpening;
import Entities.User;

public class AppCtl extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		if (action.equals("updateInfo")) {
			int r;
			String cid = request.getParameter("cid");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String sex = request.getParameter("sex");
			String age = request.getParameter("age") ;
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String school = request.getParameter("school");
			String major = request.getParameter("major");
			String education = request.getParameter("education");
			String experience = request.getParameter("experience");
			String technical1 = request.getParameter("technical1");
			String technical2 = request.getParameter("technical2");
			String technical3 = request.getParameter("technical3");
			String technical4 = request.getParameter("technical4");
			String technical = " "+technical1+" "+technical2+" "+technical3+" "+technical4+" ";
			String language1 = request.getParameter("language1");
			String language2 = request.getParameter("language2");
			String language3 = request.getParameter("language3");
			String language4 = request.getParameter("language4");
			String language = " "+language1+" "+language2+" "+language3+" "+language4+" ";
			String self_assessment = request.getParameter("self_assessment");
			String status = request.getParameter("status");
			String location = request.getParameter("location");
			String cv = request.getParameter("cv");
			r = new AppBL().updateInfo(cid,name,phone,sex,age, email, address, school, major,education, experience,
					 technical, language, self_assessment, cv, status,location);
			PrintWriter out = response.getWriter();
			if(r != 0){
				out.println("<script>");
				out.println("alert('Update personal information successful!');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('Sorry you have created a CV');");
				out.println("history.back();");
				out.println("</script>");
			}
		} else if(action.equals("searchJob")){
			String opendate = request.getParameter("opendate");
			String deadline = request.getParameter("deadline");
			String position = request.getParameter("position");
			String location = request.getParameter("location");
			String technique = request.getParameter("technique");
			String language = request.getParameter("language");
			List jobs = new AppBL().searchJob(opendate,deadline,position,location,technique,language);
			request.setAttribute("jobs", jobs);
			request.getRequestDispatcher("../user/AppHomepage.jsp").forward(request, response);
		} else if(action.equals("jobDetal")){
			String joid = request.getParameter("joid");
			JobOpening job = new AppBL().jobDetal(joid);
			request.setAttribute("job", job);
			request.getRequestDispatcher("../user/Applyforjob.jsp").forward(request, response);
		} else if(action.equals("applyJob")){
			String cid = request.getParameter("cid");
			String joid = request.getParameter("joid");
			AppInfo appInfo = new CVBL().getcv(cid);
			if(appInfo.getCid()==null){
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('Please input parsonal information before application.');");
				out.println("history.back();");
				out.println("</script>");
			}else{
				int r = new AppBL().applyJob(cid,joid);
				if(r != 0){
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('Application submit successful!');");
					out.println("history.back();");
					out.println("</script>");
				}
			}
		} else if(action.equals("modify")){
			AppInfo cv =null;
			String cid = request.getParameter("cid");
			cv = new AppBL().modify(cid);
			if(cv != null){
			request.setAttribute("cv",cv);
			request.getRequestDispatcher("../user/UpdatePInfo.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("../user/UpdatePInfo.jsp").forward(request, response);
			}
		}
	}
}
