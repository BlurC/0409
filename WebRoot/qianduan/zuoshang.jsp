<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'selectkehu.jsp' starting page</title>
    <link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
    
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
		<li><a href="#">首页</a></li>
		<li><a href="#">平台用户</a></li>
		<li><a href="#">用户列表</a></li>
	</ul>
</div>
<div class="formbody">
	<div class="formtitle" style="cursor: pointer;" id="formtitle"><span>条件查询</span></div>
	<form action="usermohu" mothod="post">
	<ul class="forminfo" style="display: none;" id="forminfo">
		<li>
			<label>查询用户</label>
			<input name="keyword" type="text" class="dfinput" />
			<i></i>
		</li>
		<li>
			<label>&nbsp;</label>
			<input name="chaxun" type="submit" class="btn" value="查询"/>
		</li>
	</ul></form>
</div>
<div class="rightinfo">
	<div class="tools">
		<ul class="toolbar">
			<li class="click"><span><img src="images/t01.png"/></span>添加</li>
			<li class="click" onclick="toUpdate()"><span><img src="images/t02.png"/></span>修改</li>
			<li><span><img src="images/t03.png"/></span>删除</li>
			<li><span><img src="images/t04.png"/></span>统计</li>
		</ul>
		<ul class="toolbar1">
			<li><span><img src="images/t05.png"/></span>设置</li>
		</ul>
	</div>
	
	<table class="tablelist">
		<thead>
			<tr>
				<th>编号<i class="sort"><img src="images/px.gif"/></i></th>
				<th>名称</th>
				<th>介绍</th>
				<th>数量</th>
				<th>所在地</th>
				<th>购买时间</th>
				<th>原价</th>
				<th>折扣价</th>
				<th>交易方式</th>
				<th>成色</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="user" items="${list}">
			<tr>
    				<td>
    					<c:out value="${user.id}" />
    				</td>
    				<td>
    					<c:out value="${user.name}" />
    				</td>
    				<td>
    				<!--  <textarea rows="8" cols="25">-->
    					<c:out value="${user.presentation}" />
    					<!--</textarea>-->
    				</td>

    				<td>
    					<c:out value="${user.amount}" />
    				</td>
    				<td>
    					<c:out value="${user.location}" />
    				</td>
    				<td>
    					<c:out value="${user.purchasing_date}" />
    				</td>
    				<td>
    					<c:out value="${user.original_price}" />
    				</td>
    				<td>
    					<c:out value="${user.transfer_price}" />
    				</td>
    				<td>
    					<c:out value="${user.transfer_mode}" />
    				</td>
    				<td>
    					<c:out value="${user.percentage}" />
    				</td>
    				
    				
    				<!--  <td>
    					<a href="deleteda?id=${user.id}">删除</a>
    				</td>-->
    			</tr>
    			</c:forEach>
		</tbody>
	</table>
	<div class="pagin">
		<div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
		<ul class="paginList">
			<li class="paginItem current"><a href="javascript:;">上一页</a></li>
			<li class="paginItem"><a href="javascript:;">下一页</a></li>
		</ul>
	</div>
</div>

<script type="text/javascript" src="<%=basePath %>js/jQuery/jquery.js"></script>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toUpdate(){
		var id = $("input[name='id']:checked").val();
		if(!id){
			alert("请选择要操作的记录");
			return false;
		}else{
			alert( "您操作的值为："+$("input[name='id']:checked").val())
		}
	}
	$(function(){
		$('.tablelist tbody tr:odd').addClass('odd');
		
		$("#formtitle").click(function(){
			$("#forminfo").slideToggle("slow");
		});
	});
</script>

  </body>
</html>
