
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
	<h2 id="h2">JobOpening Detial</h2>
	<form><div style="margin-left:70%;">search:<input type="text" name="search"></div><br></form>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="70%" color=#987cb9 SIZE=3>
	<form method="post" action="./user/app.do?action=applyJob&cid=<%=userID%>&joid=${job.joid}">
	<table class="job_table" border="0">
		<br>
		<tr>
			<td>JOID</td>
			<td><input type="text" name="joid" value="${job.joid}" disabled="disabled"/></td>
			<td>OpenDate</td>
			<td>
				<div>
				<input type="text" name="opendate"  value="${job.opendate}" disabled="disabled"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>Position</td>
			<td><input type="text" name="position" value="${job.position}" disabled="disabled"/></td>
			<td>Deadline</td>
			<td>
			<div>
				<input type="text" name="deadline"  value="${job.deadline}" disabled="disabled"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>Location</td>
			<td><input type="text" name="location" value="${job.location}" disabled="disabled"/></td>
			<td>E-mail</td>
			<td><input type="text" name="mail" value="${job.mail}" disabled="disabled"/></td>
		</tr>
		<tr>
			<td>Salary</td>
			<td><input type="text" name="salary" value="${job.salary}" disabled="disabled"/></td>
			<td>Language</td>
			<td><input type="text" name="language" value="${job.language}" disabled="disabled"/></td>
		</tr>
		<tr>
			<td>Number</td>
			<td><input type="text" name="number" value="${job.number}" disabled="disabled"/></td>
			<td>Experience</td>
			<td><input type="text" name="experience" value="${job.experience}" disabled="disabled"/></td>
		</tr>
		<tr>
			<td>Technique</td>
			<td><input type="text" name="technique" value="${job.technique}" disabled="disabled"/></td>
		</tr>
		<tr>
			<td>Job Description</td>
			<td colspan="3">
				<textarea name="description" rows=10 cols=83 disabled="disabled">${job.description}</textarea> 
			</td>
		</tr>
	</table>
	<br>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="70%" color=#987cb9 SIZE=3>
		<input id="update" type="submit" value="apply" />
	 	<input style="width: 80px; height:30px;" type="button" value="back" onclick="javascript:window.history.back();"/>
	</form>
	<!-- 
	<div align="right">
		<marquee direction="up" onMouseOver=stop() onMouseOut=start()
				scrolldelay=40 scrollamount=1 width="100%" height="100%">
			<p>Job1...</p>
			<p>Job2...</p>
			<p>Job3...</p>
			<p>Job4...</p>
			<p>Job5...</p>
			<p>Job6...</p>
			<p>Job7...</p>
			<p>Job8...</p>
		</marquee>
	</div>
	 -->
                                         

</body>
</html>