package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Entities.User;
import DB.DBBean;

public class UserDAO {
	public User checkUser(String userID, String passwd, String role) {
		System.out.println("********in UserDAO***********");
		User aUser = null;
		String sql = null;
		if (role.equals("candidate")) {
			sql = "select * from candidate where username=? and password=?";
		} else if (role.equals("recruiter")) {
			sql = "select * from recruiter where name=? and password=?";
		}
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, userID);
			pst.setString(2, passwd);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				aUser = new User();
				aUser.setUid(rs.getString("uid"));
				aUser.setPassword(rs.getString("password"));
				aUser.setRole(role);
				System.out.println("********in UserDAO**** find one*******" + aUser.getUid() + "***" + aUser.getPassword() + "***" + aUser.getRole());
			}
			rs.close();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aUser;
	}

	public int newUser(String userId, String passwd) {
		int result = 0;
		String sql = "insert into candidate values(null,?,?)";
		try {
			Connection con = new DBBean().getConn();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, userId);
			pst.setString(2, passwd);
			result = pst.executeUpdate();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
