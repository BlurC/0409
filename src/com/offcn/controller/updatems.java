package com.offcn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import com.offcn.dao.BaseDao;
import com.offcn.service.UpdateService;


@WebServlet (urlPatterns="/updatems")
public class updatems extends HttpServlet {
	UpdateService ads = new UpdateService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int n = ads.UpdateService1(request, response);
		if(n>0){
		String account = request.getParameter("account");
		String sql = "select * from u_sys_admin WHERE account = '"+account+"'";
		Map<String,Object> map = new BaseDao().executeQuery(sql).get(0);
		request.getSession().setAttribute("map",map);
		request.getRequestDispatcher("module_idle/xiugaixinxi.jsp").forward(request, response);}
	}
}
