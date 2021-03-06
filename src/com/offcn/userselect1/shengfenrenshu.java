package com.offcn.userselect1;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.offcn.service.*;

import com.offcn.dao.BaseDao;
import com.offcn.service.*;

@WebServlet (urlPatterns="/shengfenrenshu")
public class shengfenrenshu extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Map<String,Object>> list = new IdleService().renshu();
		request.setAttribute("list", list);
		request.getRequestDispatcher("module_idle/shengfennum.jsp").forward(request, response);
	}
}
