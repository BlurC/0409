package com.offcn.qianduan;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

import net.sf.json.JSONArray;
@WebServlet(urlPatterns="/Xqservlet")
public class Xqservlet extends HttpServlet {
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String id = request.getParameter("id");
	String sql = "select * from u_idle_info where id='"+id+"'";
	Map<String,Object> map = new BaseDao().executeQuery(sql).get(0);
	request.setAttribute("map", map);
	request.getRequestDispatcher("qianduan/xiangqing.jsp").forward(request, response);
	
}
}
