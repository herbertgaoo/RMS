
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
		<img src="<%=request.getContextPath()%>/images/AppHome.jpg">
	</div>
	<hr>
	<div class="nav">
	   <ul>
	     <li><a href="user/AppHomepage.jsp">Browse job opening</a></li>
		 <li><a href="./user/app.do?action=modify&cid=<%=userID%>">Update</a></li>
		 <li  class="bgno"><a href="user/CheckResponse.jsp">Check Response</a></li>
		 <li id="username">Welcome,<%=userID%></li>
		 <a href="user/login.jsp" id="logout">Logout</a>
	   </ul>
	 </div>
	<br><br>
	<h1 id="h2">Your Status Info</h1>
	
	<br>
	<form action="post">
		<table class="response_table" border="1" >
			<tr>
				<th width="201" scope="col">Candidate ID</th>
				<th width="138" scope="col">JO ID</th>
				<th width="149" scope="col">Status</th>
				<th width="154" scope="col">Apply Date</th>
			</tr>
			<c:forEach var="res" items="${ress}" varStatus="status">
			<tr>
				<td>${res.cid}</td>
				<td>${res.joid}</td>
				<td>${res.status}</td>
				<td>${res.apply_date}</td>
			</tr>
		</c:forEach>
			
		</table>
		</form>
</body>
</html>