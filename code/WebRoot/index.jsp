<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
if(path.contains("//")){
	path = path.substring(1);
}
System.out.println(path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
System.out.println(request.getServerPort());
%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
	<% 
	  //request.getRequestDispatcher("homepage_load.action").forward(request,response);
   	request.getRequestDispatcher("/homepage_load.action").forward(request,response);
   	%>
  </body>
</html>
