
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String userID = (String) session.getAttribute("uId");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
<script language="javaScript" src="./js/Calendar4.js"></script>
</head>

<body>
	<div style="text-align: center;">
		<img src="<%=request.getContextPath()%>/images/AppHome.jpg">
	</div>
	<hr>
	<div class="nav">
	   <ul>
	     <li class="bgno"><a href="user/AppHomepage.jsp">Browse job opening</a></li>
		 <li><a href="./user/app.do?action=modify&cid=<%=userID%>">Update</a></li>
		 <li><a href="./user/Respon.do?action=checkresponse&cid=<%=userID%>">Check Response</a></li>
		 <li id="username">Welcome,<%=userID%></li>
		 <a href="user/login.jsp" id="logout">Logout</a>
	   </ul>
	 </div>
	 
	<br>
	<h2 id="h2">Search Job</h2>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="70%" color=#987cb9 SIZE=3>
	<form method="post" action="./user/app.do?action=searchJob&cid=<%=userID%>">
	<table class="job_table" border="0">
		<br>
		<tr>
			<td>OpenDate</td>
			<td>
				<div>
				<input style="width: 120px;" type="text" name="opendate" id="opendate"/>
				<input style="width: 45px;" name="" type="button" onclick="MyCalendar.SetDate(this,document.getElementById('opendate'))" value="Date" />
				</div>
			</td>
			<td>Deadline</td>
			<td>
			<div>
				<input style="width: 120px;" type="text" name="deadline" id="deadline"/>
				<input style="width: 45px;" name="" type="button" onclick="MyCalendar.SetDate(this,document.getElementById('deadline'))" value="Date" />
				</div>
			</td>
		</tr>
		<tr>
			<td>Position</td>
			<td><input type="text" name="position"/></td>
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
			<td></td>
			<td colspan="3"><input style="width: 120px;" type="submit" value="Search"></td>
		</tr>
	</table>
	</form>
	 
	<div style="text-align: center;">
	<br>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="70%" color=#987cb9 SIZE=4>
	<table class="result_table">
		<tr>
		<th>Job ID</th>
		<th>Location</th>
		<th>Position</th>
		<th>OpenDate</th>
		<th>Deadline</th>
		</tr>
		<c:forEach var="job" items="${jobs}" varStatus="status">
			<tr>
				<td><a href="./user/app.do?action=jobDetal&joid=${job.joid}">${job.joid}</a></td>
				<td>${job.location}</td>
				<td>${job.position}</td>
				<td>${job.opendate}</td>
				<td>${job.deadline}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>
