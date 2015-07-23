package Ctroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BL.CVBL;
import Entities.AppInfo;
import Entities.interview;

public class MCVCtl extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String method;
		method = request.getParameter("method");

		CVBL CVBL = new CVBL();
		AppInfo cv = new AppInfo();
		interview interview = new interview();
		
		if (method.equals("insertCV")) {
			request.getRequestDispatcher("../user/insertCV.jsp").forward(request, response);
		} else if (method.equals("detailCV")) {
			cv = CVBL.getcv(request.getParameter("cid").toString());
			request.setAttribute("cv", cv);
			request.getRequestDispatcher("../user/detailCV.jsp").forward(request, response);
		} else if (method.equals("updateCV")) {
			String rid = request.getParameter("rid");
			String newrid = request.getParameter("newrid");
			if(rid.equals(newrid)){
				cv = CVBL.getcv(request.getParameter("cid").toString());
				request.setAttribute("cv", cv);
				request.getRequestDispatcher("../user/updateCV.jsp").forward(request, response);
			} else {
				System.out.println("***********************************"+rid+newrid);
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('You can not update!');");
				out.println("history.back();");
				out.println("</script>");
			}
		} else if (method.equals("update")) {
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
			String technical = request.getParameter("technical");
			String language = request.getParameter("language");
			String self_assessment = request.getParameter("self_assessment");
			String acv = request.getParameter("acv");
			String status = request.getParameter("status");
			String location = request.getParameter("location");
			r = new CVBL().update(cid,name,phone,sex,age, email, address, school, major,education, experience,
					 technical, language, self_assessment, acv, status,location);
			if(r != 0){
				System.out.println(r);
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('Update CV successful!');");
				out.println("history.back();");
				out.println("</script>");
			}
		} else if (method.equals("interviewList")) {
			String rid = request.getParameter("rid");
			String newrid = request.getParameter("newrid");
			if(rid.equals(newrid)){
			List interviews = CVBL.interviewList(request.getParameter("cid").toString());
			request.setAttribute("interviews", interviews);
			request.getRequestDispatcher("../user/interviewList.jsp").forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('You can not check interview!');");
				out.println("history.back();");
				out.println("</script>");				
			}
		} else if (method.equals("addInterview")) {
			String rid = request.getParameter("rid");
			String newrid = request.getParameter("newrid");
			if(rid.equals(newrid)){
			cv = CVBL.getcv(request.getParameter("cid").toString());
			request.setAttribute("cv", cv);
			request.getRequestDispatcher("../user/addInterview.jsp").forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('You can not add interview!');");
				out.println("history.back();");
				out.println("</script>");
			}
		} else if (method.equals("editInterview")) {
			interview = CVBL.getinterview(request.getParameter("sid").toString());
			request.setAttribute("interview", interview);
			request.getRequestDispatcher("../user/editInterview.jsp").forward(request, response);
		} else if (method.equals("updateInterview")) {
			int r;
			String sid = request.getParameter("sid");
			String place = request.getParameter("place");
			String date = request.getParameter("date");
			String consequence = request.getParameter("consequence");
			String comment = request.getParameter("comment") ;
			System.out.println("MCVCtl"+sid);
			r = new CVBL().updateInterview(sid,place,date,consequence,comment);
			if(r != 0){
				System.out.println(r);
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('Update Interview successful!');");
				out.println("history.back();");
				out.println("</script>");
			}
		} else if (method.equals("insertInterview")) {
			int r;
			String sid = request.getParameter("sid");
			String place = request.getParameter("place");
			String date = request.getParameter("date");
			String consequence = request.getParameter("consequence");
			String comment = request.getParameter("comment") ;
			String cid = request.getParameter("cid");
			String rid = request.getParameter("rid");
//			System.out.println("MCVCtl"+cid);
			r = new CVBL().insertInterview(sid,place,date,consequence,comment,cid,rid);
			if(r != 0){
				System.out.println(r);
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('Create Interview successful!');");
				out.println("history.back();");
				out.println("</script>");
			}
		} else if (method.equals("deleteInterview")) {
			CVBL.deleteInterview(request.getParameter("sid").toString());
			//request.getRequestDispatcher("../user/mcv.do?method=interviewList&cid=${interview.cid}").forward(request, response);
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('Delete Interview successful!');");
			out.println("history.back();");
			out.println("</script>");
		} else if (method.equals("copyTL")){
			int r;
			String cid = request.getParameter("cid");
			String rid = request.getParameter("rid");
			String newrid = request.getParameter("newrid");
			if(rid == ""){
				r = new CVBL().copyTL(cid,newrid);
				if(r != 0){
					cv = CVBL.getcv(request.getParameter("cid").toString());
					request.setAttribute("cv", cv);
					request.getRequestDispatcher("../user/detailCV.jsp").forward(request, response);
				}
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('Already other recruiter offering');");
				out.println("history.back();");
				out.println("</script>");				
			}
		} else if (method.equals("deleteTL")){
			int r;
			String cid = request.getParameter("cid");
			String rid = request.getParameter("rid");
			String newrid = request.getParameter("newrid");
			System.out.println("ridrid"+rid);
			System.out.println("newridnewrid"+newrid);
			if(rid.equals(newrid)){
				rid = "";
				r = new CVBL().deleteTL(cid,rid);
				if(r != 0){
					cv = CVBL.getcv(request.getParameter("cid").toString());
					request.setAttribute("cv", cv);
					request.getRequestDispatcher("../user/detailCV.jsp").forward(request, response);
				}
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('This is not your candidate!');");
				out.println("history.back();");
				out.println("</script>");								
			}
		}
	}
}
