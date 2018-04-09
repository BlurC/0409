package com.offcn.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet (urlPatterns="/checkpwd")
public class checkpwd extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理响应乱码
		response.setContentType("text/html;Charset=utf-8");
		
		//用户输入原密码
		String oripwd = request.getParameter("oripwd");
		
		Map<String,Object> map = (Map<String,Object>) request.getSession().getAttribute("map");
		
		//数据库中，真实的原始密码
		String password = map.get("password")+"";
		
		String msg="";
		if(oripwd.equals(password))
		{
			msg="ok";
		}
		else
		{
			msg="error";
		}
		response.getWriter().write(msg);
	}
}
