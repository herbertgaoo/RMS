package BL;

import java.util.List;

import DAO.RecDAO;
import Entities.Report;

public class RecBL {

	public int newJO(String joid, String opendate, String position,
			String deadline, String location, String mail, String rid,
			String number, String experience, String language,
			String description, String salary, String technique) {
		return new RecDAO().newJO(joid,opendate,position,deadline,location,mail,
				rid,number,experience,language,description,salary,technique);
	}
	
	public Report makeReport(String jbid, String rid, String format){
		return new RecDAO().makeReport(jbid,rid,format);
	}

	public List searchCV(String school, String major, String sex,
			String location, String technique, String language, String education, String joid) {
		return new RecDAO().searchCV(school,major,sex,location,technique,language,education,joid);
	}

	public List checkApp() {
		return new RecDAO().checkApp();
	}

	public int updateApp(String cid, String joid, String status) {
		return new RecDAO().updateApp(cid,joid,status);
	}

}
