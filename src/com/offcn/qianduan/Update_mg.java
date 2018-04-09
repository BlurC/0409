package com.offcn.qianduan;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;
import com.offcn.service.UpdateService;


@WebServlet(urlPatterns="/Update_mg")
@MultipartConfig
public class Update_mg extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int n = new UpdateService().UpdateService2(request, response);
		if(n>0)
		{
			Map<String,Object>map=(Map<String,Object>)request.getSession().getAttribute("map_front");
			String id=map.get("u_id")+"";
			String sql="SELECT * FROM u_idle_user WHERE u_id="+id+"";
			Map<String,Object>map2=new BaseDao().executeQuery(sql).get(0);
			request.getSession().setAttribute("map_front",map2);
			request.getRequestDispatcher("qianduan/UpdateMess.jsp").forward(request, response);
		}
	}
}
