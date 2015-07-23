package BL;

import java.util.List;

import DAO.AppDAO;
import Entities.AppInfo;
import Entities.JobOpening;

public class AppBL {
	public int updateInfo(String cid,String name,String phone,String sex,String age,
			String email,String address,String school,String major,String education,String experience,
			String technical,String language,String self_assessment,String cv,String status, String location){
		return new AppDAO().updateInfo(cid,name,phone,sex,age,email, address, school, major,education, experience,
				 technical, language, self_assessment, cv, status,location);
	}

	public List searchJob(String opendate, String deadline, String position, String location, String technique, String language) {
		return new AppDAO().searchJob(opendate,deadline,position,location,technique,language);
	}

	public JobOpening jobDetal(String joid) {
		return new AppDAO().jobDetal(joid);
	}

	public int applyJob(String cid, String joid) {
		return new AppDAO().applyJob(cid,joid);
	}

	public AppInfo modify(String cid) {
		return new AppDAO().modify(cid);
	}
}
