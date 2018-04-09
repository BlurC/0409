<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
    <title>My JSP 'xiugaixinxi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
    <div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">闲置信息管理</a></li>
		<li><a href="#">录入闲置信息</a></li>
	</ul>
</div>

<form action="updatems" method="post">
	<div class="formbody">
		<div class="formtitle"><span>基本信息</span></div>
		<ul class="forminfo">
			<li>
				<label>账号</label>
				<input readonly="readonly" name="account" type="text" class="dfinput" value="${map.account}" />
				<i><font color="red">不能修改</font></i>
			</li>
			<li>
				<label>手机号</label>
	     			<input name="phonenum"  type="text" class="dfinput" value="${map.phonenum}" />
			</li>
			
			<li>
				<label>地址</label>
				<input name="address"  type="text" class="dfinput" value="${map.address}" />
			</li>
			
			<li>
				<label>邮箱</label>
				<input name="mailbox" type="text" class="dfinput" value="${map.mailbox}"  />
				<i></i>
			</li>
			<li>
				<label>&nbsp;</label>
				<input name="" type="submit" class="btn" value="确认保存"/>
			</li>

  </body>
</html>
