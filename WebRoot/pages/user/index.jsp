<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
  <head>
	<base href="<%=basePath%>">
    <title>个人中心 -- 桐庐富伟针织厂</title>
	<meta charset="utf-8"/>
	<meta http-equiv="keywords" content="针织厂,针织,富伟,桐庐">
	<meta http-equiv="description" content="富伟桐庐针织厂">


  </head>
  
  <body>
		<%@ include file="../common/head.jsp"%>
	<div id="Content">
	<center>欢迎来到富伟桐庐针织厂</center>
	</div>
		
  </body>
</html>
