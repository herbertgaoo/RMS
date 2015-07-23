<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String userID = (String) session.getAttribute("uId");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>Homepage for Applicants</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/style.css">
</head>

<body>
	<div style="text-align: center;">
		<img src="<%=request.getContextPath()%>/images/RecHome.jpg">
	</div>
	<hr>
	<div class="nav">
	   <ul>
	     <li><a href="user/RecHomepage.jsp">Manage job opening</a></li>
		 <li class="bgno"><a href="user/manageCV.jsp">Manage CV</a></li>
		 <li><a href="user/CreateReport.jsp">Make report</a></li>
		 <li id="username">Welcome,<%=userID%></li>
		 <a href="user/login.jsp" id="logout">Logout</a>
	   </ul>
	 </div>
<center><br />
<h1>create a new CV</h1>
<form action="user/mcv.do" enctype="multipart/form-data" method="post">
<input name="method" value="insert" type="hidden" /> <br />
<table class="ums" border='1' cellpadding="0%" width="50%">
	<tr>
		<th>cid</th>
		<td><input type="text" name="cid"  /></td>
	</tr>
	<tr>
		<th>name</th>
		<td><input type="text" name="name"  /></td>
	</tr>
	<tr>
		<th>phone</th>
		<td><input type="text" name="phone"  /></td>
	</tr>
	<tr>
		<th>e-mail</th>
		<td><input type="text" name="email"  /></td>
	</tr>
	<tr>
		<th>address</th>
		<td><input type="text" name="address"  /></td>
	</tr>
	<tr>
		<th>sex</th>
		<td><input type="radio" name="sex" value="male"  />male
		<input type="radio" name="sex" value="female"  />female</td>
	</tr>
	<tr>
		<th>age</th>
		<td><input type="text" name="age"  /></td>
	</tr>
	<tr>
		<th>school</th>
		<td><input type="text" name="school"  /></td>
	</tr>
	<tr>
		<th>major</th>
		<td><input type="text" name="major"  /></td>
	</tr>
	<tr>
		<th>work experience</th>
		<td><input type="text" name="workExperience"  /></td>
	</tr>
	<tr>
		<th>technical level</th>
		<td><input type="checkbox" name="java" value=java  />java
		<input type="checkbox" name="javascript" value=javascript  />javascript
		<input type="checkbox" name="cplusplus" value=cplusplus  />c++</td>
	</tr>
	<tr>
		<th>language level</th>
		<td><input type="checkbox" name="english" value=english  />English
		<input type="checkbox" name="chinese" value=chinese  />Chinese
		<input type="checkbox" name="japanese" value=japanese  />Japanese</td>
	</tr>
	<tr>
		<th>self assessment</th>
		<td><textarea name="selfAssessment" rows="4" cols="40"></textarea></td>
	</tr>
	<tr>
		<th>CV</th>
		<td><input type="file" name="CV"  /></td>
	</tr>
	<tr>
		<th>application status</th>
		<td><select name="applicationStatus">
		<option value="applying">applying</option>
		<option value="recruiting">recruiting</option>
		<option value="offering">offering</option>
		<option value=""></option>
		<option value=""></option>
		</select></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="submit" /> <input type="reset" value="reset" /></td>
	</tr>


</table>


</form>
</center>
</body>
</html>