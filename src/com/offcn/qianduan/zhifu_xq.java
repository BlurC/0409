package com.offcn.qianduan;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;
@WebServlet(urlPatterns="/zhifu_xq")
public class zhifu_xq extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String sql = "select * from u_idle_info where id = '"+id+"'";
		Map<String,Object> map = new BaseDao().executeQuery(sql).get(0);
		request.setAttribute("imap", map);
		request.getRequestDispatcher("qianduan/confirm.jsp").forward(request, response);
	}
}
