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
	<script language="javaScript" src="../js/login.js"></script>
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
	 
<br>
	<h2 id="h2">Manage CV</h2>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="70%" color=#987cb9 SIZE=3>
	<form method="post" action="./user/rec.do?action=searchCV&cid=<%=userID%>">
	<table class="job_table" border="0">
		<br>
		<tr>
			<td>School</td>
			<td><input type="text" name="school"/></td>
			<td>Major</td>
			<td><input type="text" name="major"/></td>
		</tr>
		<tr>
			<td>sex</td>
			<td>
			<input style="width: 20px;" type="radio" name="sex" value="male"/>male
			<input style="width: 20px;" type="radio" name="sex" value="female" />female
			</td>
			<td>Location</td>
			<td><input type="text" name="location"/></td>
		</tr>
		<tr>
			<td>Technique</td>
			<td><input type="text" name="technique"/></td>
			<td>Language</td>
			<td><input type="text" name="language"/></td>
		</tr>
		<tr>
			<td>education</td>
			<td>
				<select name="education" style="width: 184px; height: 34px;">
					<option></option>
					<option value="HND">HND</option>
              		<option value="Bachelor">Bachelor</option>
             	 	<option value="Master">Master</option>
             	 	<option value="Doctor">Doctor</option>
          		</select>
          		<td colspan="2">
					<input style="width: 120px;" type="submit" value="Search">
				</td>
			</td>
		</tr>
		<tr>
		<td>JobOpeningID</td>
			<td><input type="text" name="joid"/></td>
			<td colspan="2">
				<div>
					<input style="width: 120px;" type="submit" value="Search by JOID">
				</div>
			</td>
		</tr>
	</table>
	</form>
	
	<div style="text-align: center;">
	<br>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1);  margin:auto;" width="70%" color=#987cb9 SIZE=4>
	<table class="result_table">
		<tr>
		<th>Cid</th>
		<th>Name</th>
		<th>Sex</th>
		<th>Age</th>
		<th>Experience</th>
		<th>Education</th>
		<th>School</th>
		<th>Major</th>
		<th>Status</th>
		</tr>
		<c:forEach var="cv" items="${cvs}" varStatus="status">
			<tr>
				<td><a href="user/mcv.do?method=detailCV&cid=${cv.cid}">${cv.cid}</a></td>
				<td>${cv.name}</td>
				<td>${cv.sex}</td>
				<td>${cv.age}</td>
				<td>${cv.experience}</td>
				<td>${cv.education}</td>
				<td>${cv.school}</td>
				<td>${cv.major}</td>
				<td>${cv.status}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>
