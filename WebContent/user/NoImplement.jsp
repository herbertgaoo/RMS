<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Login failed</title>
    <meta http-equiv="refresh" content="5;url=user/login.jsp">

  </head>
  <body> 
  	<div align="center"><img src="<%=request.getContextPath()%>/images/sorry.jpg"></div>
    <div align="center" style="font-family:'Cooper Black'; font-size:36px; color:blue">
    login failed!<br> 
    Return to homepage after 5 seconds!
     </div><br>
    <a href="user/login.jsp"></a>
  </body>
</html>
