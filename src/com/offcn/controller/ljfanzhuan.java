package com.offcn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.offcn.dao.BaseDao;

@WebServlet (urlPatterns="/ljfanzhuan")
public class ljfanzhuan extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("u_id");
		String sql = "update u_idle_user set u_state=if(u_state='正常','锁定','正常') where u_id="+id+"";
		int n = new BaseDao().executeUpdate(sql);
		if(n>0)
		{
			request.getRequestDispatcher("userselect").forward(request, response);
		}
	}
}
