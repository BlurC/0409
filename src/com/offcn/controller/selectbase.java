package com.offcn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.offcn.service.IdleService;
import java.util.*;

@WebServlet(urlPatterns="/selectbase")
public class selectbase extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Map<String,Object>> list = new IdleService().select1();
		request.setAttribute("list", list);
		request.getRequestDispatcher("module_idle/table.jsp").forward(request, response);
	}
}
