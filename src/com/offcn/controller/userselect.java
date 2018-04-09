package com.offcn.controller;

import java.util.List;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.offcn.service.IdleService;

@WebServlet (urlPatterns="/userselect")
public class userselect extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Map<String,Object>> list = new IdleService().userchaxun();
		request.setAttribute("list",list);
		request.getRequestDispatcher("module_idle/selectkehu.jsp").forward(request, response);
	}
}
