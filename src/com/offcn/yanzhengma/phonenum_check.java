package com.offcn.yanzhengma;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;
@WebServlet(urlPatterns="/phonenum_check")
public class phonenum_check extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone = request.getParameter("phone");
		String sql = "select 1 from u_idle_user where u_phonenum='"+phone+"'";
		System.out.println(phone);
		List<Map<String,Object>> list = new BaseDao().executeQuery(sql);
		if(list!=null&&list.size()>0)
		{
			response.getWriter().write("no");
		}
		else
		{
			response.getWriter().write("yes");
		}
	}
}
