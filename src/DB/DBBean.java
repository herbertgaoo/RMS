package DB;

import java.sql.*;

import javax.naming.InitialContext;

public class DBBean {
	private Connection cn = null;
	private String driver ="com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/team1?useUnicode=true&characterEncoding=UTF8";
	private String username = "root";
	private String password = "123456";
	
	public Connection getConn()throws Exception{	
		
		try
		{
			
			if (cn == null)	{
				Class.forName(driver);			
				cn = DriverManager.getConnection(url, username, password);
    		/*InitialContext rootctx=new InitialContext();
    		javax.sql.DataSource ds=(javax.sql.DataSource)rootctx.lookup("java:comp/env/jdbc/coffeeSales");		
    		cn=ds.getConnection();*/
			}
    	}catch(SQLException e)
		{
    		e.printStackTrace();
    		throw new Exception(e);
    	}
		return cn;
	}
}

