package com.offcn.qianduan;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

@WebServlet(urlPatterns="/Select_S1")
public class Select_S1 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mohu = request.getParameter("id");
		String sql = "select * from u_idle_info where fk_idletype ='"+mohu+"'";
		List<Map<String,Object>> list = new BaseDao().executeQuery(sql);
		request.setAttribute("list", list);
		request.getRequestDispatcher("qianduan/zuoshang.jsp").forward(request, response);
	}
}
