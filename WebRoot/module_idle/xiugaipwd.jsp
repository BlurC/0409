<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xiugaipwd.jsp' starting page</title>
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
		<li><a href="#">个人中心</a></li>
		<li><a href="#">修改密码</a></li>
	</ul>
</div>

<form>
	<div class="formbody">
		<div class="formtitle"><span>设置密码</span></div>
		<ul class="forminfo">
			<li>
				<label>原始密码</label>
				<input id="oripwd" onblur="checkOripwd()" name="" type="password" class="dfinput" />
				<i id="m1"></i>
			</li>
			<li>
				<label>新密码</label>
				<input name="pwd1" id="pwd1" readonly="readonly" type="password" class="dfinput" />
				<i></i>
			</li>
			<li>
				<label>确认密码</label>
				<input name="pwd2" id="pwd2" onblur="checkpwdsame()" readonly="readonly" type="password" class="dfinput" />
				<i></i>
			</li>
			
			
			<li>
				<label>&nbsp;</label>
				<input name="" id="sub" disabled="disabled" onclick="updatepwd()" type="button" class="btn" value="确认保存"/>
			</li>
		</ul>
	</div>
</form>
<script src="<%=basePath%>js/upload.js"></script>
<script type="text/javascript"src="<%=basePath %>js/jQuery/jquery.js"></script>

<script>
	function checkOripwd()
	{
		var oripwd = $('#oripwd').val();
		$.ajax({
			url:'checkpwd',
			data:'oripwd='+oripwd+'',
			success:function(data)
			{
				if(data=="ok")
				{
					
					$('#m1').html("<font color='green'>√</font>");
					$('#pwd1').removeAttr('readonly');
					$('#pwd2').removeAttr('readonly');
				}
				else
				{
					$('#m1').html("<font color='red'>×</font>");
				}
			},
			error:function()
			{
				alert('请求失败');
			}
		});
	}
	function updatepwd()
	{
		var pwd = $('#pwd1').val();
		$.ajax({
			url:'updatepwd',
			data:'pwd='+pwd+'',
			success:function(m){
				if(m=='ok'){
					parent.location.href="login.jsp";
				}
				else
				{
					alert('更改失败')
				}
			}
		});
	}
	function checkpwdsame()
	{
		var pwd1 = $('#pwd1').val();
		var pwd2 = $('#pwd2').val();
		if(pwd1==pwd2&&pwd1!=""&&pwd2!="")
		{
			$('#sub').removeAttr('disabled');
		}
		else
		{
			alert('密码不一致或密码不能为空');
		}
	}
</script>

  </body>
</html>
