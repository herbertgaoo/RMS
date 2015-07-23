
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String userID = (String) session.getAttribute("uId");
%>

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
<script language="javaScript" src="./js/Calendar4.js"></script>
</head>

<body>
	<div style="text-align: center;">
		<img src="<%=request.getContextPath()%>/images/RecHome.jpg">
	</div>
	<hr>
	<div class="nav">
	   <ul>
	     <li class="bgno"><a href="user/RecHomepage.jsp">Manage job opening</a></li>
		 <li><a href="user/manageCV.jsp">Manage CV</a></li>
		 <li><a href="user/CreateReport.jsp">Make report</a></li>
		 <li id="username">Welcome,<%=userID%></li>
		 <a href="user/login.jsp" id="logout">Logout</a>
	   </ul>
	 </div>


<br>
	<h2 id="h2">Create JobOpening</h2>
	<div style="margin-left:70%; font-size: 18px;">
		<a href="./user/rec.do?action=checkApplication">CheckApplication</a>
	</div><br>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="70%" color=#987cb9 SIZE=3>
	<form method="post" action="./user/rec.do?action=newJO&rid=<%=userID%>">
	<table class="job_table" border="0">
		<br>
		<tr>
			<td>JobOpeningID</td>
			<td><input type="text" name="joid"/></td>
			<td>OpenDate</td>
			<td>
				<div>
				<input style="width: 120px;" type="text" name="opendate" id="opendate"/>
				<input style="width: 45px;" name="" type="button" onclick="MyCalendar.SetDate(this,document.getElementById('opendate'))" value="Date" />
				</div>
			</td>
		</tr>
		<tr>
			<td>Position</td>
			<td><input type="text" name="position"/></td>
			<td>Deadline</td>
			<td>
			<div>
				<input style="width: 120px;" type="text" name="deadline" id="deadline"/>
				<input style="width: 45px;" name="" type="button" onclick="MyCalendar.SetDate(this,document.getElementById('deadline'))" value="Date" />
				</div>
			</td>
		</tr>
		<tr>
			<td>Location</td>
			<td><input type="text" name="location"/></td>
			<td>E-mail</td>
			<td><input type="text" name="mail"/></td>
		</tr>
		<tr>
			<td>Salary</td>
			<td><input type="text" name="salary"/></td>
			<td>Language</td>
			<td><input type="text" name="language"/></td>
		</tr>
		<tr>
			<td>Number</td>
			<td><input type="text" name="number"/></td>
			<td>Experience</td>
			<td><input type="text" name="experience"/></td>
		</tr>
		<tr>
			<td>Technique</td>
			<td><input type="text" name="technique"/></td>
		</tr>
		<tr>
			<td>Description</td>
			<td colspan="3">
				<textarea name="description" id="textarea" rows=10 cols=83></textarea> 
			</td>
		</tr>
	</table>
	<br>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="70%" color=#987cb9 SIZE=3>
		<input id="update" type="submit" value="submit" />
	 	<input style="width: 80px; height:30px;" type="reset" value="reset" />
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