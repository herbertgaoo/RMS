
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
<title>Homepage for Recruiter</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/style.css">
</head>

<body>
	<br><br><br>
	<h2 id="h2">CheckApplication</h2>
	<br>	
	<div style="text-align: center;">
	<br>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="75%" color=#987cb9 SIZE=4>
	<table class="result_table" style="width: 950px; margin-left: 14 %;">
		<tr>
		<th>Name</th>
		<th>Major</th>
		<th>Education</th>
		<th>Position</th>
		<th>Location</th>
		<th>Experience</th>
		<th>Status</th>
		<th>Update</th>
		</tr>
		<c:forEach var="app" items="${apps}" varStatus="status">
			<form action="./user/rec.do" method="get">
			<tr>
				<td>${app.name}</td>
				<td>${app.major}</td>
				<td>${app.education}</td>
				<td>${app.position}</td>
				<td>${app.location}</td>
				<td>${app.experience}</td>
				<td>${app.status}</td>
				<td>
					<select name="status" id="statusRow${status.index}" style="width: 80px;" onChange=>
						<option></option>
						<option value="applying">applying</option>
						<option value="recruiting">recruiting</option>
						<option value="offer">offer</option>
						<option value="closed">closed</option>
					</select>
					
				</td>
				<td>
					<input type="hidden" name="action" value="updateApp"} />
					<input type="hidden" name="cid" value=${app.cid} />
					<input type="hidden" name="joid" value=${app.joid} />
					<input type="submit" value="update" style="width: 60px;"/>
				</td>
			</tr>
			</form>
		</c:forEach>
	</table>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="75%" color=#987cb9 SIZE=4><br><br><br>
	<a href="./user/RecHomepage.jsp"><input style="width: 80px; height:30px; margin: auto; " type="button" value="Come back"/></a>
	</div>
	
</body>
</html>