package com.offcn.keyw;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

import net.sf.json.JSONArray;
@WebServlet (urlPatterns="/addkeyword")
public class addkeyword extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String keywords=request.getParameter("keywords");
		String sql="insert into u_keywords(keywords,createtime) value ('"+keywords+"',now())";
		int n=new BaseDao().executeUpdate(sql);
		if(n>0)
		{
			String xx = "SELECT * FROM u_keywords";
			List<Map<String, Object>> list = new BaseDao().executeQuery(xx);
			//将list转换成json数据（需求引用jar包）
			String str = JSONArray.fromObject(list).toString();
			response.getWriter().write(str);
		}
	}
}
