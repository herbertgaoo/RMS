<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% //session delete
  session.invalidate(); %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="../styles/admin.css"/>
		<script language="javaScript" src="../js/login.js"></script>
		<title>Welcome to HiSoft Recruitment System.</title>
	</head>
	<body>
		<div id="login">
			<div class="login-bg">
				<div class="login-main"> 
					<div id="login-form">
						<form name="login" method="post" action="../user/user.do?action=checkUser" onsubmit ="check(this)"> 
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<th>UserID:</th>
									<td><input name="userID" type="text" class="input-text-long" /></td>
								</tr>
								<tr>
									<th>Password:</th>
									<td><input name="password" type="password" class="input-text-long" /></td>
								</tr>
								
								<tr>
									<th>Role:</th>
									<td>
									<select name="role" class="contact_select">
									    <option value="candidate">candidate</option>
									    <option value="recruiter">recruiter</option>
									</select>
									</td>
								</tr>
								
								<tr>
									<td  class="table-btn"><input type="button" class="input-btn-login" value="Register" onclick="javascript:location.href='RegisterAccount.jsp'"/></td>
									<td  class="table-btn"><input type="submit" class="input-btn-login" value="Login"/></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="footer"><p>©2013 ITI9 Team1. All rights reserved.</p></div>
	</body>
</html>