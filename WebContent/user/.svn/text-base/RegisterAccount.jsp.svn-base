<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% //session delete
  session.invalidate(); %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="../styles/RegisterAccount.css"/>
		<script language="javaScript" src="../js/login.js">
		</script>
		<title>Please register account.</title>
	</head>
	<body>
		<div id="login">
			<div class="register-bg">
				<div class="register-main">
					<div id="register-form">
						<form name="register" method="post" action="../user/user.do?action=newUser" onsubmit ="check(this)">  
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<th>CandidateID:</th>
									<td><input name="userID" type="text" class="input-text-long" /></td>
								</tr>
								<tr>
									<th>Password:</th>
									<td><input name="password" type="password" class="input-text-long" /></td>
								</tr>
								
								<tr>
									<td  class="table-btn"><input type="submit" class="input-btn-login" value="Register"/></a></td>
									<td  class="table-btn"><input type="reset" class="input-btn-login" value="Reset"/></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>