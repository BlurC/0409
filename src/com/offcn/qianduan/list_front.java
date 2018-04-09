package com.offcn.qianduan;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

import net.sf.json.JSONArray;


@WebServlet(urlPatterns="/list_front")
public class list_front extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String sql = "select * from u_idle_info";
		List<Map<String,Object>> list = new BaseDao().executeQuery(sql);
		String str1 = JSONArray.fromObject(list).toString();
		response.getWriter().write(str1);*/
		response.setContentType("text/html;charset=utf-8");
		String sql = "SELECT * FROM u_idle_info";
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		//将list转换成json数据（需求引用jar包）
		String str = JSONArray.fromObject(list).toString();
		response.getWriter().write(str);
	}
}
