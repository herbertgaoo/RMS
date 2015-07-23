package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import sun.util.resources.CalendarData;

import DB.DBBean;
import Entities.AppInfo;
import Entities.JobOpening;

public class AppDAO {
	int b = 0,e = 0;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public int updateInfo(String cid,String name,String phone,String sex,String age,
			String email,String address,String school,String major,String education,String experience,
			String technical,String language,String self_assessment,String cv,String status, String location) {
		int result = 0;
		String sql = "select * from cv where cid=?";
		
		for (int i = 0; i < technical.length(); i++) {
			b = technical.indexOf(" null ");
			e = b + 6;
			if(b != -1){
				technical = (technical.substring(0, b)+" "+technical.substring(e, technical.length()));
			}
		}
		
		for (int i = 0; i < language.length(); i++) {
			b = language.indexOf(" null ");
			e = b + 6;
			if(b != -1){
				language = (language.substring(0, b)+" "+language.substring(e, language.length()));
			}
		}
		System.out.println("**************************"+technical);
		System.out.println("**************************"+language);
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, cid);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				sql = "update cv set" +" name=? ," +" phone=?," +" email=?," +" address=?," +
					  " sex=?," +" age=?," +" school=?," +" major=?," +	" education=?," +				
					  " experience=?," +" technical=?," +" language=?," +" self_assessment=?," +
					  " cv=?," +" status=?," +" location=?" +" where cid=?";
				try {
					con = new DBBean().getConn();
					pst = con.prepareStatement(sql);
					pst.setString(1, name);
					pst.setString(2, phone);
					pst.setString(3, email);
					pst.setString(4, address);
					pst.setString(5, sex);
					pst.setString(6, age);
					pst.setString(7, school);
					pst.setString(8, major);
					pst.setString(9, education);
					pst.setString(10, experience);
					pst.setString(11, technical);
					pst.setString(12, language);
					pst.setString(13, self_assessment);
					pst.setString(14, cv);
					pst.setString(15, status);
					pst.setString(16, location);
					pst.setString(17, cid);
					result = pst.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				sql = "insert into cv values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				try {
					con = new DBBean().getConn();
					pst = con.prepareStatement(sql);
					pst.setString(1, cid);
					pst.setString(2, name);
					pst.setString(3, phone);
					pst.setString(4, sex);
					pst.setString(5, age);
					pst.setString(6, email);
					pst.setString(7, address);
					pst.setString(8, school);
					pst.setString(9, major);
					pst.setString(10, education);
					pst.setString(11, experience);
					pst.setString(12, technical);
					pst.setString(13, language);
					pst.setString(14, self_assessment);
					pst.setString(15, cv);
					pst.setString(16, status);
					pst.setString(17, location);
					pst.setString(18, "");
					result = pst.executeUpdate();
					pst.close();
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List searchJob(String opendate, String deadline, String position,
			String location, String technique, String language) {
		List jobs = new ArrayList();
		JobOpening job = null;
		String sql = "select * from jobopening " 
					+ "where coalesce(opendate>=nullif(?, ''), true) "
					+ "and coalesce(deadline<=nullif(?, ''), true) "
					+ "and position like ? "
					+ "and location like ? "
					+ "and technique_skill like ? "
					+ "and language_skill like ?";
		position = "%"+position+"%";
		technique = "%"+technique+"%";
		language = "%"+language+"%";
		location = "%"+location+"%";
		
		try {
			System.out.println(sql);
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, opendate);
			pst.setString(2, deadline);
			pst.setString(3, position);
			pst.setString(4, location);
			pst.setString(5, technique);
			pst.setString(6, language);
			
			System.out.println(pst.toString());
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()){
				job = new JobOpening();
				job.setJoid(rs.getString("joid"));
				System.out.println(rs.getString("joid"));
				job.setLocation(rs.getString("location"));
				job.setPosition(rs.getString("position"));
				job.setOpendate(rs.getString("opendate").substring(0,10));
				job.setDeadline(rs.getString("deadline").substring(0,10));
				jobs.add(job);
			}
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobs;
	}

	public JobOpening jobDetal(String joid) {
		JobOpening job = null;
		String sql = "select * from jobopening where joid=?";

			try {
				Connection con = new DBBean().getConn();
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, joid);
				ResultSet rs = pst.executeQuery();
				
				while(rs.next()){
					job = new JobOpening();
					job.setJoid(rs.getString("joid"));
					job.setLocation(rs.getString("location"));
					job.setPosition(rs.getString("position"));
					job.setOpendate(rs.getString("opendate").substring(0,10));
					job.setDeadline(rs.getString("deadline").substring(0,10));
					job.setMail(rs.getString("email"));
					job.setSalary(rs.getString("salary"));
					job.setRid(rs.getString("rid"));
					job.setNumber(rs.getString("number"));
					job.setExperience(rs.getString("work_experience"));
					job.setLanguage(rs.getString("language_skill"));
					job.setTechnique(rs.getString("technique_skill"));
					job.setDescription(rs.getString("detail_description"));
				}
				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		return job;
	}

	public int applyJob(String cid, String joid) {
		int result = 0;
		String sql = "insert into application values(?,?,?,?)";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, cid);
			pst.setString(2, joid);
			pst.setString(3, "applying");
			pst.setString(4, sdf.format(new Date()));
			
			result = pst.executeUpdate();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public AppInfo modify(String cid) {
		AppInfo cv = null;
		String sql = "select * from cv where cid=?";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, cid);
		
			System.out.println(pst.toString());
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()){
				cv = new AppInfo();
				cv.setCid(rs.getString("cid"));
				cv.setName(rs.getString("name"));
				cv.setPhone(rs.getString("phone"));
				cv.setSex(rs.getString("sex"));
				cv.setAge(rs.getString("age"));
				cv.setEmail(rs.getString("email"));
				cv.setAddress(rs.getString("address"));
				cv.setExperience(rs.getString("experience"));
				cv.setEducation(rs.getString("education"));
				cv.setSchool(rs.getString("school"));
				cv.setMajor(rs.getString("major"));
				cv.setStatus(rs.getString("status"));
				cv.setLocation(rs.getString("location"));
				cv.setSelf_assessment(rs.getString("self_assessment"));
			}
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cv;
	}
}
