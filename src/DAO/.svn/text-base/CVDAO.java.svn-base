package DAO;

import Entities.AppInfo;
import Entities.interview;
import DB.DBBean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CVDAO {
	

	public int addCV(AppInfo cv) {
		String sql = "insert into cv(cid,name,phone,email,sex,age,school,major,education,experience,technical,language,self_assessment,attachedCV,status,rid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, cv.getCid());
			pst.setString(2, cv.getName());
			pst.setString(3, cv.getPhone());
			pst.setString(4, cv.getEmail());
			pst.setString(5, cv.getAddress());
			pst.setString(6, cv.getSex());
			pst.setString(7, cv.getAge());
			pst.setString(8, cv.getSchool());
			pst.setString(9, cv.getMajor());
			pst.setString(10, cv.getExperience());
			pst.setString(11, cv.getTechnical());
			pst.setString(12, cv.getLanguage());
			pst.setString(13, cv.getSelf_assessment());
			pst.setString(14, cv.getCv());
			pst.setString(15, cv.getStatus());
			pst.setString(16, cv.getEducation());
			pst.executeUpdate();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
	public AppInfo getcv(String cid) {
		String sql = "select * from cv where cid=?; ";
		AppInfo cv = new AppInfo();
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, cid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				cv.setCid(rs.getString("cid"));
				cv.setName(rs.getString("name"));
				cv.setPhone(rs.getString("phone"));
				cv.setEmail(rs.getString("email"));
				cv.setAddress(rs.getString("address"));
				cv.setSex(rs.getString("sex"));
				cv.setAge(rs.getString("age"));
				cv.setSchool(rs.getString("school"));
				cv.setMajor(rs.getString("major"));
				cv.setExperience(rs.getString("experience"));
				cv.setTechnical(rs.getString("technical"));
				cv.setLanguage(rs.getString("language"));
				cv.setSelf_assessment(rs.getString("self_assessment"));
				cv.setCv(rs.getString("cv"));
				cv.setStatus(rs.getString("status"));
				cv.setEducation(rs.getString("education"));
				cv.setLocation(rs.getString("location"));
				cv.setRid(rs.getString("rid"));
			}
			rs.close();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cv;
	}
	public int update(
			String cid,
			String name,
			String phone,
			String sex,
			String age,
			String email,
			String address,
			String school,
			String major,
			String education,
			String experience,
			String technical,
			String language,
			String self_assessment,
			String acv,
			String status,
			String location) {
		int result = 0;
		System.out.println("CVDAO"+email);
		String sql = "update cv set" +
				" name=? ," +
				" phone=?," +
				" email=?," +
				" address=?," +
				" sex=?," +
				" age=?," +
				" school=?," +
				" major=?," +
				" education=?," +				
				" experience=?," +
				" technical=?," +
				" language=?," +
				" self_assessment=?," +
				" cv=?," +
				" status=?," +
				" location=?" +
				" where cid=?";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
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
			pst.setString(14, acv);
			pst.setString(15, status);
			pst.setString(16, location);
			pst.setString(17, cid);
			result = pst.executeUpdate();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int deleteCV(String cid,String rid) {
		String sql = "update cv set rId=null where cid=?";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, cid);
			pst.executeUpdate();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
	public List interviewList(String cid) {
		List interviews = new ArrayList();
		interview interview= null;
		String sql = "select * from interview where cid=?";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			//System.out.println(name);
			//pst.setString(1, name);
			pst.setString(1, cid);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				interview = new interview();
				interview.setSid(rs.getString("sid"));
				interview.setPlace(rs.getString("place"));
				interview.setDate(rs.getString("date"));
				interview.setConsequence(rs.getString("consequence"));
				interview.setComment(rs.getString("comment"));
				interviews.add(interview);
				//System.out.println(users.size());
			}
			rs.close();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return interviews;
	}
	public interview getinterview(String sid) {
		String sql = "select * from interview where sid=?; ";
		interview interview = new interview();
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, sid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				interview.setSid(rs.getString("sid"));
				interview.setPlace(rs.getString("place"));
				interview.setDate(rs.getString("date"));
				interview.setConsequence(rs.getString("consequence"));
				interview.setComment(rs.getString("comment"));
				interview.setCid(rs.getString("cid"));
				interview.setRid(rs.getString("rid"));
			}
			rs.close();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return interview;
	}
	public int updateInterview(
			String sid,
			String place,
			String date,
			String consequence,
			String comment) {
		int result = 0;
		String sql = "update interview set" +
				" place=? ," +
				" date=?," +
				" consequence=?," +
				" comment=?" +
				" where sid=?";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, place);
			pst.setString(2, date);
			pst.setString(3, consequence);
			pst.setString(4, comment);
			pst.setString(5, sid);
			result = pst.executeUpdate();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int insertInterview(
			String sid,
			String place,
			String date,
			String consequence,
			String comment,
			String cid,
			String rid) {
		int result = 0;
		String sql = "insert into interview values(?,?,?,?,?,?,?)";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, sid);
			pst.setString(2, place);
			pst.setString(3, date);
			pst.setString(4, consequence);
			pst.setString(5, comment);
			pst.setString(6, cid);
			pst.setString(7, rid);
			System.out.println(cid);
			result = pst.executeUpdate();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int deleteInterview(String sid) {
		String sql = "delete from interview where sid=?";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			//System.out.println(name);
			pst.setString(1, sid);

			pst.executeUpdate();
			pst.close();
			con.close();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	public int copyTL(
			String cid,
			String rid) {
		int result = 0;
//		System.out.println("CVDAO"+cid);
		String sql = "update cv set rid=? where cid=?";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, rid);
			pst.setString(2, cid);
			result = pst.executeUpdate();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int deleteTL(
			String cid,String rid) {
		int result = 0;
//		System.out.println("CVDAO"+cid);
		String sql = "update cv set rid=? where cid=?";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, rid);
			pst.setString(2, cid);
			result = pst.executeUpdate();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
