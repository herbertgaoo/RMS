package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DB.DBBean;
import Entities.Response;

public class ResponseDAO {
		
		public List checkresponse(String cid) {
			List ress = new ArrayList();
			Response res;
			String sql = "select * from application where cid=?";
			try {
				Connection con = new DBBean().getConn();
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, cid);
				ResultSet rs = pst.executeQuery();
				
				while(rs.next()){
					res = new Response();
					res.setCid(rs.getString("cid"));
					res.setJoid(rs.getString("joid"));
					res.setStatus(rs.getString("status"));
					res.setApply_date(rs.getString("apply_date"));
					ress.add(res);
				}
					
				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return ress;
		}

}
