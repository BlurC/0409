package com.offcn.qianduan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.offcn.service.IdleService;

@WebServlet(urlPatterns="/AddServlet_f")
@MultipartConfig
public class AddServlet_f extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int n =new IdleService().addIdle(request, response);
		if(n>0)
		{
			System.out.println("y");
			request.getRequestDispatcher("qianduan/publish_success.jsp").forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("qianduan/publish.jsp").forward(request, response);
			System.out.println("x");
		}
		
	}
}
