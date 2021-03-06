
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
</head>

<body>
	<div style="text-align: center;">
		<img src="<%=request.getContextPath()%>/images/RecHome.jpg">
	</div>
	<hr>
	<div class="nav">
	   <ul>
	     <li><a href="user/RecHomepage.jsp">Manage job opening</a></li>
		 <li><a href="user/manageCV.jsp">Manage CV</a></li>
		 <li class="bgno"><a href="user/CreateReport.jsp">Make report</a></li>
		 <li id="username">Welcome,<%=userID%></li>
		 <a href="user/login.jsp" id="logout">Logout</a>
	   </ul>
	 </div>
	 <br>
	<h2 id="h2">Make Report</h2>
    <div style="text-align: left;">
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="70%" color=#987cb9 SIZE=3>
	<form method="post" action="user/rec.do?action=makeRep&rid=<%=userID%>">
	<div align="center">
	<table class="report_table" border="0">
		<tr>
			<td>Type:</td>
            <td colspan="2" style="font-size: 20px; padding-left:80px;">
            <input type="radio" name="range" value="all" checked>All
		</tr>
		<tr>
			<td></td>
			<td colspan="2" style="font-size: 20px; padding-left: 80px;">
			<input type="radio" name="range" value="jb_op" style="padding-right:10px;">JobNo:
			<input type="text" name="jb_id" style="height:30px;">
			</td>
		</tr>
		<tr>
			<td>Export:</td>
			<td style="padding-left:80px;">
				<input type="checkbox" name="export" value="export_on">
				<select name="format" size="1">
		        	<option value="html" label="HTML"selected>HTML</option>
					<option value="csv" label="CSV">CSV</option>
				</select>
		</tr>
		<tr>
			<td colspan="2">
			<input style="width:100px;height: 30px; font-size: 16px; margin-left: 500px;"type="submit" value="make report">
			</td>
		</tr>
	</table>
	</div>
	</form>

	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="70%" color=#987cb9 SIZE=3>
	<p>&nbsp;</p>
	<div style="text-align: center;">
	<table class="response_table" border="0" >
		<tr>
		<th>Job ID</th>
		<th>Number of Job Opening</th>
		<th>Number of CV</th>
		<th>Number of Offer</th>
		<th>Number of Refuse</th>
		<th>Number of Onboard</th>
		</tr>
		<tr>
			<td>${rep.jbid}</td>
			<td>${rep.numJbOp}</td>
			<td>${rep.numCV}</td>
			<td>${rep.numOffer}</td>
			<td>${rep.numRefuse}</td>
			<td>${rep.numOnboard}</td>
		</tr>
	</table>
	</div>
</body>

</html>