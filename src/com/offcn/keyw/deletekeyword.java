package com.offcn.keyw;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RespectBinding;

import com.mysql.fabric.Response;
import com.offcn.dao.BaseDao;

import net.sf.json.JSONArray;

@WebServlet(urlPatterns="/deletekeyword")

public class deletekeyword extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id=request.getParameter("id");
		String sql = "delete from u_keywords where id='"+id+"'";
		int n= new BaseDao().executeUpdate(sql);
		if(n>0)
		{
			String ll = "SELECT * FROM u_keywords";
			List<Map<String, Object>> list = new BaseDao().executeQuery(ll);
			//将list转换成json数据（需求引用jar包）
			String str = JSONArray.fromObject(list).toString();
			response.getWriter().write(str);
		}
	}
}
