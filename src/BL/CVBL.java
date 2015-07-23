package BL;

import java.util.List;

import DAO.CVDAO;
import Entities.AppInfo;
import Entities.interview;

public class CVBL {
/*	public List getCVLists(
			String recruiter,
			String jobOpening,
			String status,
			String school,
			String major,
			String technical,
			String language,
			String name,
			String phone,
			String email) {
		System.out.println("CVBL" + status);
		return CVDAO.getCVLists(
				recruiter,
				jobOpening,
				status,
				school,
				major,
				technical,
				language,
				name,
				phone,
				email);
	}*/	
	public int addCV(AppInfo cv){
		return new CVDAO().addCV(cv);
	}
	public AppInfo getcv(String cid) {
		return new CVDAO().getcv(cid);
	}
/*	public int updateCV(
			String name,
			String phone,
			String email,
			String address,
			String sex,
			String age,
			String school,
			String major,
			String education,
			String experience,
			String technical,
			String language,
			String self_assessment,
			String cv,
			String status) {
		return CVDAO.updateCV(
				name,
				phone,
				email,
				address,
				sex,
				age,
				school,
				major,
				education,
				experience,
				technical,
				language,
				self_assessment,
				cv,
				status);
	}*/
	public int update(String cid,String name,String phone,String sex,String age,
			String email,String address,String school,String major,String education,String experience,
			String technical,String language,String self_assessment,String acv,String status, String location){
		System.out.println("CVBL"+email);
		return new CVDAO().update(cid,name,phone,sex,age,email, address, school, major,education, experience,
				 technical, language, self_assessment, acv, status,location);
	}

	public int deleteCV(String cid,String rid) {
		return new CVDAO().deleteCV(cid,rid);
	}
	public List interviewList(String cid) {
		return new CVDAO().interviewList(cid);
	}
	public interview getinterview(String sid) {
		return new CVDAO().getinterview(sid);
	}
	public int updateInterview(String sid,String place,String date,String consequence,String comment){
		System.out.println("CVBL"+sid);
		return new CVDAO().updateInterview(sid,place,date,consequence,comment);
	}
	public int insertInterview(String sid,String place,String date,String consequence,String comment,String cid,String rid){
//		System.out.println("CVBL"+email);
		return new CVDAO().insertInterview(sid,place,date,consequence,comment,cid,rid);
	}
	public int deleteInterview(String sid) {
		return new CVDAO().deleteInterview(sid);
		
	}
	public int copyTL(String cid,String rid){
//		System.out.println("CVBL"+rid);
		return new CVDAO().copyTL(cid,rid);
	}
	public int deleteTL(String cid,String rid){
		return new CVDAO().deleteTL(cid,rid);
	}

}
