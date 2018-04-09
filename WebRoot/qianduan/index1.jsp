<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
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
<html>
<head>
    <meta charset="UTF-8">
    <title>U闲交易平台</title>
    <link rel="stylesheet" type="text/css" href="front/css/index.css">
    <link rel="icon" href="front/images/icon.ico">
    <script type="text/javascript" src="js/jquery1.42.min.js"></script>
    <script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript">
    
/*    $(function(){
    var uid='${map_front.u_id}';
    if(uid=='')
    {
    	$('#s1').html('0');
    	$('#s2').html('0');
    	$('#s3').html('0');
    }
    else{

    	$.ajax({
    		url:"IniMaiData",
    		data:'uid='+uid,
    		dataType:"json",
    		success:function(data){
    			var chushouzhong = data[0].chushouzhong;
    			var chengjiaojilu = data[0].chengjiaojilu;
    			$('#s1').html(chushouzhong);
    			$("#s2").html('测试');
    			$('#s3').html(chengjiaojilu);
    		
    		},
    	}
    		error:function()
    		{
    			alert('IniMaiData请求失败')
    		}
    	})
    	
    });*/
    
    //买家
    $(function(){
    	var uid = '${map_front.u_id}'
    	if(uid==''){
    		$('#x1').html('0');
    		$('#x2').html('0');
    		$('#x3').html('0');
    	}
    	else
    	{
    		$.ajax({
    			url:'IniMaiData1',
    			data:'uid='+uid,
    			dataType:'json',
    			success:function(data)
    			{
    					var goumaijilu = data[0].goumaijilu;
    					$("#x1").html('测试');
    					$("#x2").html('测试');
    					$("#x3").html(goumaijilu);
    			},
    			error:function()
    			{
    				alert('IniMaiData1请求失败')
    			}
    		});
    	}
    })
    
    
    //卖家
      	$(function(){
    		var uid = '${map_front.u_id}';
    		if(uid == ''){
    	
    			$("#s1").html('0');
    			$("#s2").html('0');
    			$("#s3").html('0');
    		}else{
    			$.ajax({
    				url:'IniMaiData',
    				data:'uid='+uid,
    				dataType:'json',
    				success:function(data){
    					var chushouzhong = data[0].chushouzhong;
    					var chengjiaojilu = data[0].chengjiaojilu;
    					
    					$("#s1").html(chushouzhong);
    					$("#s2").html('测试');
    					$("#s3").html(chengjiaojilu);
    					
    				},
    				error:function(){
    					alert('InitMaiData请求失败')
    				}
    			});
    		}
    		
    	})
    
    
    $(function(){
   $.ajax({
   url:"qdServlet",
   dataType:"json",
   success:function(data){
	front_return(data)
   },
   error:function()
   {
   		alert("请求失败")
   }
 })
})

$(function(){
	$.ajax({
		url:"downServlet",
		dataType:"json",
		success:function(data)
		{
			front_return1(data)
		},
		error:function()
		{
			alert("请求失败")
		}
	})

});

function front_return(data)
{
	var str="";
   for(var i = 0;i<data.length;i++)
   {
   		str +=
   		'<li>'+
   		 '<a href="Xqservlet?id='+data[i].id+'" target="_blank">'+
                    '<img style="width: 160px; height: 160px;" src="idleimg/'+data[i].idleimg+'">'+
                    '<span>'+data[i].name+'</span>'+
               '</a>'+
         '</li>'
   		/* '<tr>'
   		'<td><img src="images/ad1.jpg"></td>'+
   		'<td><span><span></td>'; */
   }
   $('#yourlike').html(str);
}

function front_return1(data)
{
	var str="";
   for(var i = 0;i<data.length;i++)
   {
   		str +=
   		'<li>'+
   		 '<a href="Xqservlet?id='+data[i].id+'" target="_blank">'+
                    '<img style="width: 200px; height: 200px;" src="idleimg/'+data[i].idleimg+'" alt="">'+
                    '<span class="section_middle_name">'+data[i].name+'</span>'+
                    '<span class="section_middle_price">¥<i>'+data[i].transfer_price+'</i></span>'
               '</a>'+
               '</li>'
   		/* 
   		<img src="front/images/smad.jpg" alt="">
        <span class="section_middle_name">诺基亚c7</span>
        <span class="section_middle_price">¥<i>150</i></span>
				*/
   }
   $('#down_f').html(str);
}
    
    </script>

</head>
<body>
    <!-- header -->
    <div class="header">
        <div class="header_main wrap">
            <h1><a href="#"><img src="front/images/logo-2.png"></a></h1>
            <h2>让你的闲置游起来!</h2>
            <ul class="header_menu clearfix">
                <li><a href="#" class="active">首页</a></li>
                <li><a href="qianduan/list_f.jsp">手机二手</a></li>
                <li><a href="#">二手车估价</a></li>
       
                <li><a href="qianduan/publish.jsp" target="_blank">发布闲置</a></li>
				<li class="header_wdxz">
                    <a href="#">我是买家</a>
                    <ul class="header_xz">  
                        <li><a href="#">等待发货：<span id="x1"></span></a></li>  
                        <li><a href="#">待收货：<span id="x2"></span></a></li>  
                        <li><a href="#">购买记录：<span id="x3"></span></a></li>
                    </ul> 
                </li>
                <li class="header_wdxz">
                    <a href="#">我是卖家</a>
                    <ul class="header_xz">  
                        <li><a href="#">出售中：<span id="s1"></span></a></li>  
                        <li><a href="#">待发货：<span id="s2"></span></a></li>  
                        <li><a href="#">成交记录：<span id="s3"></span></a></li>
                    </ul> 
                </li>
                <li class="header_mycenter">
                    <a href="#">个人中心</a>
                    <ul class="header_center">  
                        <li><a href="qianduan/UpdateMess.jsp">完善个人信息</a></li>  
                        <li><a href="qianduan/UpdatePwd_f.jsp">修改密码</a></li>  
                        <li><a href="#">我的收藏</a></li>  
                    </ul> 
                </li>
                <li class="quit"><a href="exitseleverlet_f">退出</a></li>
            </ul>
        </div>
    </div>

    <!-- section1 -->
    <div class="section1 wrap clearfix">
        <ul class="sec1_list">
            <li>
                <div class="shuma"></div>
                <a href="Select_S1?id=1" class="sec1_list_first">闲置数码</a>
                <a href="Select_S2?id=手机">手机</a>
                <a href="Select_S2?id=相机">相机</a>
                <a href="Select_S2?id=笔记本">笔记本</a>
            </li>
            <li>
                <div class="muying"></div>
                <a href="Select_S1?id=2" class="sec1_list_first">闲置母婴</a>
                <a href="Select_S2?id=童装">童装</a>
                <a href="Select_S2?id=宝宝用品">宝宝用品</a>
                <a href="Select_S2?id=玩具">玩具</a>
            </li>
            <li>
                <div class="riyong"></div>
                <a href="Select_S1?id=3" class="sec1_list_first">家居日用</a>
                <a href="Select_S2?id=家具">家具</a>
                <a href="Select_S2?id=家纺">家纺</a>
                <a href="Select_S2?id=日用">日用</a>
            </li>
            <li>
                <div class="jiadian"></div>
                <a href="Select_S1?id=4" class="sec1_list_first">影音家电</a>
                <a href="Select_S2?id=大家电">大家电</a>
                <a href="Select_S2?id=小家电">小家电</a>
                <a href="Select_S2?id=料理机">料理机</a>
            </li>
            <li>
                <div class="pieshi"></div>
                <a href="Select_S1?id=5" class="sec1_list_first">鞋服配饰</a>
                <a href="Select_S2?id=女鞋">女鞋</a>
                <a href="Select_S2?id=箱包">箱包</a>
                <a href="Select_S2?id=女装">女装</a>
                <a href="Select_S2?id=配饰">配饰</a>
            </li>
            <li>
                <div class="zhubao"></div>
                <a href="Select_S1?id=6" class="sec1_list_first">闲置数码</a>
                <a href="Select_S2?id=手机">手机</a>
                <a href="Select_S2?id=相机">相机</a>
                <a href="Select_S2?id=笔记本">笔记本</a>
            </li>

        </ul>

        <!-- 轮播图 -->
        <div class="lunbo">
            <div class="hd">
                <ul><li></li><li></li></ul>
            </div>
            <div class="lunbo_bd">
                <ul>
                    <li><a href="#" target="_blank"><img src="front/images/lunbo.jpg" /></a></li>
                    <li><a href="#" target="_blank"><img src="front/images/lunbo2.jpg" /></a></li>
                </ul>
            </div>
            <a class="prev" href="javascript:void(0)"></a>
            <a class="next" href="javascript:void(0)"></a>
        </div>
        <script type="text/javascript">
            jQuery(".lunbo").slide({mainCell:".lunbo_bd ul",effect:"leftLoop",autoPlay:true});
        </script>
        <!-- 个人中心 -->
        <div class="personal">
            <div class="clearfix">
                <div class="personal_head"><img src="front/images/danhuang.png"></div>
                <p class="personal_hi">Hi，${map_front.u_nickname}请先<a href="qianduan/login.jsp" class="login" target="_blank">登录</a>吧！<br>这里有更多你感兴趣的！</p>
            </div>
            <div class="clearfix">
                <a href="qianduan/login.jsp" class="personal_login" target="_blank">登录</a>
                <a href="qianduan/register.jsp" class="personal_register" target="_blank">注册</a>
            </div>
            <div class="clearfix fabuzhuanma">
                <a href="publish.html" target="_blank" class="fabuxianzhi">
                    <span class="fabuxianzhi_top">发布闲置</span>
                    <span class="fabuxianzhi_bottom">闲置换钱 快速出手</span>
                </a>
                <a href="#" class="yijianzhuanma">
                    <span class="yijianzhuanma_top">一键转卖</span>
                    <span class="yijianzhuanma_bottom">转卖已买到的宝贝</span>
                </a>
            </div>
        </div>
    </div>
    <!-- 猜你喜欢 -->
    <div class="wrap like">
        <ul class="tabhd clearfix">
            <li class="on">猜你喜欢</li>
            <li>全新闲置</li>
            <li>同城交易</li>
        </ul>
        <div class="tabbd">
            <div id="yourlike" class="tabc clearfix" style="display:block;">
                
                <a href="#" target="_blank">
                    <img src="front/images/ad1.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad2.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad3.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad1.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad2.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad1.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad2.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
            </div>
            <div class="tabc clearfix">
                <a href="#" target="_blank">
                    <img src="front/images/ad3.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad2.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad1.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad3.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad2.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad3.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad1.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
            </div>
            <div class="tabc clearfix">
                <a href="#" target="_blank">
                    <img src="front/images/ad2.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad3.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad2.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad3.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad1.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad3.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
                <a href="#" target="_blank">
                    <img src="front/images/ad2.jpg">
                    <span>puma卫衣 男女 春秋款</span>
                </a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function(){
            $(".tabhd li").click(function(){
                $(".tabhd li").removeClass();
                $(this).addClass("on");
                $(".tabbd .tabc").css("display","none");
                $(".tabbd .tabc").eq($(this).index()).css("display","block");
              
            })
        })
    </script>

    <!-- section -->
    <div class="section wrap">
        <h2>
            <a href="#">
              数码控.3C也性感
            </a>
        </h2>
        <div class="section_main clearfix">
            <div class="section_left fl">
                <div class="section_left_top">
                    <a href="#">
                        显示器
                    </a>
                    <a href="#">
                        内存
                    </a>
                    <a href="#">
                        主板
                    </a>
                    <a href="col-xs-offset-0">
                        硬盘
                    </a>
                    <a href="#">
                        CPU
                    </a>
                    <a href="#">
                        显卡
                    </a>
                    <a href="#">
                        平板
                    </a>
                    <a href="#">
                        无线路由器
                    </a>
                    <a href="#">
                        笔记本
                    </a>
                    <a href="#">
                        无线鼠标
                    </a>
                    <a href="#">
                        充电宝
                    </a>
                    <a href="#">
                        移动硬盘
                    </a>
                    <a href="#">
                        数据线
                    </a>
                </div>
                <div class="section_left_bottom">
                    <a href="#">
                        <img src="front/images/sad.png">
                    </a>
                </div>
            </div>
            <div id="down_f" class="section_middle fl">
                <ul class="clearfix">
                    <li>
                        <a href="#" target="_blank">
                            <img src="front/images/smad.jpg" alt="">
                            <span class="section_middle_name">诺基亚c7</span>
                            <span class="section_middle_price">¥<i>150</i></span>
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="front/images/smad2.jpg" alt="">
                            <span class="section_middle_name">美图手机M8红色 夜间拍照神器</span>
                            <span class="section_middle_price">¥<i>1234</i></span>
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="front/images/smad.jpg" alt="">
                            <span class="section_middle_name">诺基亚c7</span>
                            <span class="section_middle_price">¥<i>150</i></span>
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="front/images/smad2.jpg" alt="">
                            <span class="section_middle_name">美图手机M8红色 夜间拍照神器</span>
                            <span class="section_middle_price">¥<i>1234</i></span>
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="front/images/smad.jpg" alt="">
                            <span class="section_middle_name">诺基亚c7</span>
                            <span class="section_middle_price">¥<i>150</i></span>
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="front/images/smad2.jpg" alt="">
                            <span class="section_middle_name">美图手机M8红色 夜间拍照神器</span>
                            <span class="section_middle_price">¥<i>1234</i></span>
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="front/images/smad.jpg" alt="">
                            <span class="section_middle_name">诺基亚c7</span>
                            <span class="section_middle_price">¥<i>150</i></span>
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="front/images/smad2.jpg" alt="">
                            <span class="section_middle_name">美图手机M8红色 夜间拍照神器</span>
                            <span class="section_middle_price">¥<i>1234</i></span>
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="front/images/smad.jpg" alt="">
                            <span class="section_middle_name">诺基亚c7</span>
                            <span class="section_middle_price">¥<i>150</i></span>
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="front/images/smad2.jpg" alt="">
                            <span class="section_middle_name">美图手机M8红色 夜间拍照神器</span>
                            <span class="section_middle_price">¥<i>1234</i></span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="section_right fl">
                <div class="section_right_part">
                    <a href="#" class="section_right_part_img" target="_blank">
                        <img src="front/images/tututu.png">
                    </a>
                    <h4>戴上耳机，倾听</h4>
                    <p>
                        想要暂时告别千篇一律的生活，踏上没有目的的旅途？记得在行囊里捎上自己心爱的耳机和音乐，有了它们，一路上，不寂寞。
                    </p>
                </div>
                <div class="section_right_part">
                    <a href="#" class="section_right_part_img" target="_blank">
                        <img src="front/images/tututu2.png">
                    </a>
                    <h4>戴上耳机，倾听</h4>
                    <p>
                        想要暂时告别千篇一律的生活，踏上没有目的的旅途？记得在行囊里捎上自己心爱的耳机和音乐，有了它们，一路上，不寂寞。
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <div class="footer">
        <ul class="wrap clearfix">
            <li>
                <img src="front/images/footer_03.png" alt="">
                <span>卖家实名认证</span>
            </li>
            <li>
                <img src="front/images/footer_05.png" alt="">
                <span>支付宝担保交易</span>
            </li>
            <li>
                <img src="front/images/footer_07.png" alt="">
                <span>专业团队支撑</span>
            </li>
            <li>
                <img src="front/images/footer_09.jpg" alt="">
                <span>官方微博</span>
            </li>
        </ul>
    </div>
    <!-- 底部一堆 -->
    <div class="footer_1 wrap">
        <a href="#" target="_blank">关于我们</a>
        <a href="#" target="_blank">合作伙伴</a>
        <a href="#" target="_blank">营销中心</a>
        <a href="#" target="_blank">廉正举报</a>
        <a href="#" target="_blank">联系客服</a>
        <a href="#" target="_blank">开放平台</a>
        <a href="#" target="_blank">诚征英才</a>
        <a href="#" target="_blank">联系我们</a>
        <a href="#" target="_blank">网站地图</a>
        <a href="#" target="_blank">法律声明及隐私权政策</a>
        <a href="#" target="_blank">知识产权</a>
        <span>1999-<i id="year"></i> ujiuye.com 版权所有</span>
        <script type="text/javascript">
            var day = new Date();
            var year = day.getFullYear();
            document.getElementById('year').innerHTML=year;
        </script>
    </div>
    <div class="footer_2 wrap">
        <a href="#" target="_blank"><img src="front/images/ft1.gif"></a>
        <a href="#" target="_blank"><img src="front/images/ft_01.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_03.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_05.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_07.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_09.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_11.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_13.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_15.jpg"></a>
    </div>
</body>
</html>
  </body>
</html>
