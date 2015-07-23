package DAO;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import DB.DBBean;
import Entities.AppInfo;
import Entities.Application;
import Entities.JobOpening;
import Entities.Report;

public class RecDAO {

	public int newJO(String joid, String opendate, String position,
			String deadline, String location, String mail, String rid,
			String number, String experience, String language,
			String description, String salary, String technique) {
		int result = 0;
		String sql = "insert into jobopening values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, joid);
			pst.setString(2, opendate);
			pst.setString(3, position);
			pst.setString(4, deadline);
			pst.setString(5, location);
			pst.setString(6, mail);
			pst.setString(7, salary);
			pst.setString(8, rid);
			pst.setString(9, number);
			pst.setString(10, experience);
			pst.setString(11, language);
			pst.setString(12, description);
			pst.setString(13, technique);
			result = pst.executeUpdate();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List searchCV(String school, String major, String sex,
			String location, String technique, String language, String education, String joid) {
		List cvs = new ArrayList();
		AppInfo cv = null;
		String sql;
		if(joid.equals("")){
			sql = "select * from cv "
				+ "where coalesce(cv.sex=nullif(?, ''), true) "
				+ "and coalesce(cv.education=nullif(?, ''), true) "
				+ "and school like ? " + "and major like ? "
				+ "and coalesce(cv.location=nullif(?, ''), true) "
				+ "and technical like ? " + "and language like ? ";
		} else {
			sql = "select * from cv join application on cv.cid=application.cid join jobopening on " +
				"application.joid=jobopening.joid "
				+ "where coalesce(cv.sex=nullif(?, ''), true) "
				+ "and coalesce(cv.education=nullif(?, ''), true) "
				+ "and school like ? " + "and major like ? "
				+ "and coalesce(cv.location=nullif(?, ''), true) "
				+ "and technical like ? " + "and language like ? "
				+ "and coalesce(jobopening.joid=nullif(?, ''), true) ";
		}
		
		school = "%" + school + "%";
		major = "%" + major + "%";
		technique = "%" + technique + "%";
		language = "%" + language + "%";

		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, sex);
			pst.setString(2, education);
			pst.setString(3, school);
			pst.setString(4, major);
			pst.setString(5, location);
			pst.setString(6, technique);
			pst.setString(7, language);
			if(!joid.equals(""))
				pst.setString(8, joid);
			System.out.println("**********************************"+pst.toString());

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				cv = new AppInfo();
				cv.setCid(rs.getString("cid"));
				cv.setName(rs.getString("name"));
				cv.setSex(rs.getString("sex"));
				cv.setAge(rs.getString("age"));
				cv.setExperience(rs.getString("experience"));
				cv.setEducation(rs.getString("education"));
				cv.setSchool(rs.getString("school"));
				cv.setMajor(rs.getString("major"));
				cv.setStatus(rs.getString("status"));
				cv.setLocation(rs.getString("cv.location"));
				cv.setRid(rs.getString("rid"));
				System.out.println("***************"+rs.getString("location"));
				cvs.add(cv);
			}
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cvs;
	}

	public Report makeReport(String jbid, String id, String format) {
		Report rep = new Report();
		rep.setRid(id);
		try {
			Connection con = new DBBean().getConn();
			String sql = null;
			PreparedStatement pst = null;
			ResultSet rs = null;
			if (jbid.equals("all")) {
				System.out.println("*****in RecDAO/makeReport(All)*****");
				rep.setRid(id);
				
				System.out.println("*****************************"
						+id);
				
				// get recruiter name
				sql = "select count(*) as numofcv from cv where rid=?";
				pst = con.prepareStatement(sql);
				pst.setString(1, id);
				rs = pst.executeQuery();
				while (rs.next()) {
					rep.setNumCV(rs.getInt("numofcv"));
					System.out.println("*****************************"
							+ rep.getNumCV());
					sql = "select count(*) as numofjo from jobopening where rid=?";
					pst = con.prepareStatement(sql);
					pst.setString(1, id);
					rs = pst.executeQuery();
					while (rs.next()) {
						rep.setNumJbOp(rs.getInt("numofjo"));
						System.out.println("*****************************"
								+ rep.getNumJbOp());
						sql = "select status,COUNT(*) as numofstatus FROM "
								+ "(SELECT * FROM cv where rid=?) AS rs GROUP BY STATUS";
						pst = con.prepareStatement(sql);
						pst.setString(1, id);
						rs = pst.executeQuery();
						while (rs.next()) {
							String tmps = rs.getString("status");
							System.out.println("**********************************"+tmps);
							int tmp = rs.getInt("numofstatus");
							if ("offer".equals(tmps)) {
								rep.setNumOffer(tmp);
							} else if ("onboard".equals(tmps)) {
								rep.setNumOnboard(tmp);
							} else if ("refuse".equals(tmps)){
								rep.setNumRefuse(tmp);
							} //else if("".equals(tmps))
								//continue;
						}
					}
				}
				pst.close();
				rs.close();
				System.out.println("numOfJbOp:"+rep.getNumJbOp());
				System.out.println("numOfCV:"+rep.getNumCV());
				System.out.println("numOfOffer:"+rep.getNumOffer());
				System.out.println("numOfRefuse:"+rep.getNumRefuse());
				System.out.println("numOfOnboard:"+rep.getNumOnboard());
			}else{
				System.out.println("*****in RecDAO/makeReport(jb_no)*****");
				String joid = id;
				rep = new Report();
				// get cid from application
				sql = "select * from application where joid=?";
				PreparedStatement pst_cid = con.prepareStatement(sql);
				pst_cid.setString(1, joid);
				ResultSet rslt = pst_cid.executeQuery();
				while(rslt.next()){
					String cid = rslt.getString("cid");
					pst = null;
					rs = null;
					// count number of offer, refuse, onboard
					sql = "select status,COUNT(*) as numofstatus FROM (SELECT * FROM cv where cid=?) AS rs GROUP BY STATUS";
					pst = con.prepareStatement(sql);
					pst.setString(1, cid);
					rs = pst.executeQuery();
					while(rs.next()){
						String stat = rs.getString("status");
						int i = rs.getInt("numofstatus");
						System.out.println("**********cid:"+cid);
						System.out.println("**********status:"+stat);
						System.out.println("**********i:"+i);
						if("offer".equals(stat))
							rep.addNumOffer(i);
						else if("refuse".equals(stat))
							rep.addNumRefuse(i);
						else if("onboard".equals(stat))
							rep.addNumOnboard(i);
						else;
					}
					pst.close();
					rs.close();
				}
				pst_cid.close();
				rslt.close();
				// count number of job opening
				sql = "select count(*) from jobopening where joid=?";
				PreparedStatement pst_jo = con.prepareStatement(sql);
				pst_jo.setString(1, joid);
				rslt = pst_jo.executeQuery();	
				while(rslt.next()){
					rep.setNumJbOp(rslt.getInt(1));
				}
				pst_jo.close();
				rslt.close();
				// count number of CV
				sql = "select count(*) from application where joid=?";
				PreparedStatement pst_app = con.prepareStatement(sql);
				pst_app.setString(1, joid);
				rslt = pst_app.executeQuery();
				while(rslt.next()){
					rep.setNumCV(rslt.getInt(1));
				}
				pst_app.close();
				rslt.close();
				// set result
				rep.setJbid(joid);
				System.out.println("numOfJbOp:"+rep.getNumJbOp());
				System.out.println("numOfCV:"+rep.getNumCV());
				System.out.println("numOfOffer:"+rep.getNumOffer());
				System.out.println("numOfRefuse:"+rep.getNumRefuse());
				System.out.println("numOfOnboard:"+rep.getNumOnboard());
				System.out.println("jbid:"+rep.getJbid());

			}
			con.close();
			} catch (Exception e) {
			e.printStackTrace();
		}
		// export
		if("html".equals(format)){
			makeHtml(rep);
		}else if("csv".equals(format)){
			makeCsv(rep);
		}
		
		return rep;
	}

	public List checkApp() {
		List apps = new ArrayList();
		Application app;
		String sql = "SELECT * FROM jobopening JOIN application ON jobopening.joid = application.joid "
				+ "JOIN cv ON application.cid = cv.cid where application.status!='closed'";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				app = new Application();
				app.setCid(rs.getString("cv.cid"));
				app.setJoid(rs.getString("jobopening.joid"));
				app.setName(rs.getString("cv.name"));
				app.setMajor(rs.getString("cv.major"));
				app.setExperience(rs.getString("experience"));
				app.setEducation(rs.getString("education"));
				app.setLocation(rs.getString("cv.location"));
				app.setStatus(rs.getString("status"));
				app.setPosition(rs.getString("position"));
				apps.add(app);
			}
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return apps;
	}

	public int updateApp(String cid, String joid, String status) {
		int result = 0;
		String sql = "UPDATE application SET status=? WHERE cid=? and joid=?";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, cid);
			pst.setString(3, joid);

			result = pst.executeUpdate();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private void makeCsv(Report rep){
	    try {
			System.out.println("*****start export csv*****");
            FileWriter fw = new FileWriter("E:\\report_"+rep.getRid()+".csv", false);
            PrintWriter pw = new PrintWriter(new BufferedWriter(fw));
            pw.write("Job ID"+","+
            		 "Number of Job Opening"+","+
            		 "Number of CV"+","+
            		 "Number of Offer"+","+
            		 "Number of Refuse"+","+
            		 "Number of Onboard "
            		);
            pw.println();
            pw.write(rep.getJbid()+","+
            		 rep.getNumJbOp()+","+
            		 rep.getNumCV()+","+
            		 rep.getNumOffer()+","+
            		 rep.getNumRefuse()+","+
            		 rep.getNumOnboard()
            		);
            pw.close();
            System.out.println("*****end export csv*****");
	      } catch (FileNotFoundException e) {
	        e.printStackTrace();
	      } catch (IOException e) {
	        e.printStackTrace();
	      }
	}
	
	private void makeHtml(Report rep){
	    try {
			System.out.println("*****start export html*****");
            FileWriter fw = new FileWriter("E:\\report_"+rep.getRid()+".html", false);
            PrintWriter pw = new PrintWriter(new BufferedWriter(fw));
            pw.write("<table border=\"1\" cellpadding=\"10\" >");
            pw.println();
            pw.write("<caption>report</caption>");
            pw.println();
            pw.write("<tr>");
            pw.write("<th>Job ID</th>");
            pw.write("<th>Number of Job Opening</th>");
            pw.write("<th>Number of CV</th>");
            pw.write("<th>Number of Offer</th>");
            pw.write("<th>Number of Refuse</th>");
            pw.write("<th>Number of Onboard</th>");
            pw.write("</tr>");
            pw.println();
            pw.write("<tr>");
            pw.write("<td>"+rep.getJbid()+"</td>");
            pw.write("<td>"+rep.getNumJbOp()+"</td>");
            pw.write("<td>"+rep.getNumCV()+"</td>");
            pw.write("<td>"+rep.getNumOffer()+"</td>");
            pw.write("<td>"+rep.getNumRefuse()+"</td>");
            pw.write("<td>"+rep.getNumOnboard()+"</td>");
            pw.write("</tr>");
            pw.write("</table>");	
            pw.println();
            pw.close();
            System.out.println("*****end export html*****");
	      } catch (FileNotFoundException e) {
	        e.printStackTrace();
	      } catch (IOException e) {
	        e.printStackTrace();
	      }
	}

}
