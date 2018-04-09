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
@WebServlet(urlPatterns="/loginserverlet_q")
public class loginserverlet_q extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String u_phonenum=request.getParameter("u_phonenum");
		String u_password=request.getParameter("u_password");
		String sql = "select * from u_idle_user where u_phonenum='"+u_phonenum+"'and u_password='"+u_password+"'";
		List<Map<String,Object>> list = new BaseDao().executeQuery(sql);
		if(list!=null && list.size()>0)
		{
			Map<String,Object> map=list.get(0);
			request.getSession().setAttribute("map_front",map);
			request.getRequestDispatcher("qianduan/index1.jsp").forward(request, response);
		}
		else{
			System.out.println("1111");
			response.sendRedirect("qianduan/login.jsp");
		}
	}
}
