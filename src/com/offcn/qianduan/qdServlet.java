package com.offcn.qianduan;

import java.util.List;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

import net.sf.json.JSONArray;
@WebServlet(urlPatterns="/qdServlet")
public class qdServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String sql = "SELECT * FROM u_idle_info";
		List<Map<String,Object>> list = new BaseDao().executeQuery(sql);
		String str = JSONArray.fromObject(list).toString();
		response.getWriter().write(str);
	}
}
