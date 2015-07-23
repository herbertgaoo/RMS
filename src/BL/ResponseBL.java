package BL;

import java.util.List;

import DAO.ResponseDAO;

public class ResponseBL {
	ResponseDAO rs = new ResponseDAO();

	public List checkresponse(String cid) {
		return new ResponseDAO().checkresponse(cid);
	}

}
