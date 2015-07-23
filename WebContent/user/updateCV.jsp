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
		 <li><a href="user/manageCV.jsp">Manage CV</a></li>
		 <li><a href="user/CreateReport.jsp">Make report</a></li>
		 <li id="username">Welcome,<%=userID%></li>
		 <a href="user/login.jsp" id="logout">Logout</a>
		 
	   </ul>
	 </div>
<br><center></br>
<h1>Update CV</h1>

<form action="user/mcv.do">
  	<input name="method" value="update" type="hidden" />
	<input name="cid" value="${cv.cid}" type="hidden" />
<br /><br/>
<h2 id="h2">Basic information</h2>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin-left: 0px" width="70%" color=#987cb9 SIZE=3>
		<table class="info_table" border="0">
		<br>
		<tr>
			<th>name</th>
			<td><input type="text" name="name" value="${cv.name}"/></td>
			<th>phone</th>
			<td><input type="text" name="phone" value="${cv.phone}"/></td>
		</tr>
		<tr>
			<th>sex</th>
			<td><input type="text" name="sex" value="${cv.sex}"/></td>
			<th>age</th>
			<td><input type="text" name="age" value="${cv.age}"/></td>
		</tr>
		<tr>
			<th>e-mail</th>
			<td><input type="text" name="email" value="${cv.email}"/></td>
			<th>address</th>
			<td><input type="text" name="address" value="${cv.address}"/></td>
		</tr>
		<tr>
			<th>school</th>
			<td><input type="text" name="school" value="${cv.school}"/></td>
			<th>major</th>
			<td><input type="text" name="major" value="${cv.major}"/></td>
		</tr>
		<tr>
			<th>education</th>
			<td>
				<select name="education" style="width: 240px;">
					<option value="HND">HND</option>
              		<option value="Bachelor">Bachelor</option>
             	 	<option value="Master">Master</option>
             	 	<option value="Doctor">Doctor</option>
          		</select>
			</td>
			<th>location</th>
			<td><input type="text" name="location" value="${cv.location}"/></td>
		</tr>
	</table>
	<br><br>
	<h2 id="h2">Work related</h2>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin-left: 0px" width="70%" color=#987cb9 SIZE=3>
	<table class="winfo_table" border="0">
	<br>
	<tr>
		<th>experience</th>
		<td>
			<input type="text" name="experience" value="${cv.experience}" style="width: 240px;"/>
		</td>
		<th>technical</th>
		<td>
			<input type="text" name="technical" value="${cv.technical}" style="width: 240px;"/>
		</td>
	</tr>
	<tr>
		<th>language</th>
			<td>
				<input type="text" name="language" value="${cv.language}" style="width: 240px;"/>
			</td>
		</tr>
		<tr>
			<th>self assessment</th>
			<td colspan="2"><textarea name="self_assessment" rows="4" cols="40"	>${cv.self_assessment}</textarea></td>
		</tr>
		<tr>
			<th>CV</th>
			<td><input type="file" name="CV" size="80%" /></td>
		</tr>
		<tr>
		<th>status</th>
		<td><select name="status">
		<option value=""></option>
		<option value="offer">offer</option>
		<option value="onboard">onboard</option>
		<option value="refuse">refuse</option>
		</select></td>
	</tr>
	<tr>
	<td colspan="3">
	    <input style="width: 80px; height: 30px; margin-left: 230px;" type="submit" value="submit" />
	 	<input style="width: 80px; height: 30px;margin-left: 30px" type="reset" value="reset" />
	 	<input style="width: 80px; height: 30px; margin-left: 30px;" type="button" value="back" onclick="javascript:window.history.back();" />
	 </td>
	</tr>
	
</table>
<br/><br/><br/>

</form>
</center>
</body>
</html>