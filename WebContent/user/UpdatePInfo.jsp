
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

<script>
function myFunction()
{
	var x=document.getElementById("age").value;
	var y=document.getElementById("phone").value;
	var z=document.getElementById("email").value;
	apos=z.indexOf("@");
	dotpos=z.lastIndexOf(".");
	if(x==""||isNaN(x)){
		alert("age must be number");
		if(x)
		alert("Please input the correct age");
		return false;
	} else if(y==""||isNaN(y)){
		alert("phonenumber must be number");
		return false;
	} else if(apos<1||dotpos-apos<2){
		alert("Not a valid e-mail address!");
		return false;
	}
	return true;
		
}
</script>

</head>

<body>
	<div style="text-align: center;">
		<img src="<%=request.getContextPath()%>/images/AppHome.jpg">
	</div>
	<hr>
	<div class="nav">
	   <ul>
	     <li><a href="user/AppHomepage.jsp">Browse job opening</a></li>
		 <li class="bgno"><a href="user/UpdatePInfo.jsp">Update</a></li>
		 <li><a href="./user/Respon.do?action=checkresponse&cid=<%=userID%>">Check Response</a></li>
		 <li id="username">Welcome,<%=userID%></li>
		 <a href="user/login.jsp" id="logout">Logout</a>
	   </ul>
	 </div>
	<br>
	<form method="post" action="./user/app.do?action=updateInfo&cid=<%=userID%>">
	<br><h2 id="h2">Basic information</h2>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="70%" color=#987cb9 SIZE=3>
		<table class="info_table" border="0">
		<br>
		<tr>
			<th>name</th>
			<td><input type="text" name="name" value="${cv.name}"/></td>
			<th>phone</th>
			<td><input type="text" name="phone" id="phone" value="${cv.phone}"/></td>
		</tr>
		<tr>
			<th>sex</th>
			<td>
			<input style="width: 40px;" type="radio" name="sex" value="male" />male
			<input style="width: 40px;" type="radio" name="sex" value="female" />female
			</td>
			<th>age</th>
			<td><input type="text" name="age" id="age" value="${cv.age}"/></td>
		</tr>
		<tr>
			<th>e-mail</th>
			<td><input type="text" name="email" id="email" value="${cv.email}"/></td>
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
					<option value=""></option>
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
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="70%" color=#987cb9 SIZE=3>

	<table class="winfo_table" border="0">
	<br>
	<tr>
		<th>experience</th>
		<td><input type="text" name="experience" value="${cv.experience}"/></td>
	</tr>
	<tr>
		<th>technical</th>
		<td>
			<input type="checkbox" name="technical1" value="java" size="100%" />  java
			<input type="checkbox" name="technical2" value="javascript" size="100%" />  javascript
			<input type="checkbox" name="technical3" value="c++" size="100%" />  c++
			 &nbsp&nbsp other <input type="text" name="technical4"/>
		</td>
		</tr>
		<tr>
		<th>language</th>
			<td>
			<input type="checkbox" name="language1" value="English" size="100%" />  English
			<input type="checkbox" name="language2" value="Chinese" size="100%" />  Chinese
			<input type="checkbox" name="language3" value="Japanese" size="100%" />  Japanese
			 &nbsp&nbsp other <input type="text" name="language4"/>
			</td>
		</tr>
		<tr>
			<th>self assessment</th>
			<td><textarea name="self_assessment" rows="4" cols="40"	>${cv.self_assessment}</textarea></td>
		</tr>
		<tr>
			<th>CV</th>
			<td><input type="file" name="CV" size="80%" /></td>
		</tr>
		<tr>
			<td colspan="2" >
	 			
			 </td>
		</tr>
		</table>
		<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin:auto;" width="70%" color=#987cb9 SIZE=3>
		<input id="update" type="submit" value="submit" onclick="return myFunction();"/>
	 	<input style="width: 80px; height:30px;" type="reset" value="reset" />
	</form>
</body>
</html>
