package com.offcn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;

import com.offcn.dao.BaseDao;

@WebServlet (urlPatterns="/deleteda")

public class deleteda extends HttpServlet {
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String id=request.getParameter("id");
	String sql="delete from u_idle_info where id="+id+"";
	int n = new BaseDao().executeUpdate(sql);
	if(n>0)
	{
		request.getRequestDispatcher("selectbase").forward(request, response);
	}
}
}
