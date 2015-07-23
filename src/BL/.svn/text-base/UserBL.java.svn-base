package BL;

import DAO.UserDAO;
import Entities.User;

public class UserBL {
		
	public User checkUser(String UserID, String passwd, String role) {
		return new UserDAO().checkUser(UserID, passwd,role);
	}

	public int newUser(String userId, String passwd) {
		return new UserDAO().newUser(userId, passwd);
	}	
}
