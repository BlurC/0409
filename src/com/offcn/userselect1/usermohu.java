package com.offcn.userselect1;

import java.util.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.offcn.service.*;

@WebServlet (urlPatterns="/usermohu")
public class usermohu extends HttpServlet {
 @Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	List<Map<String,Object>> list = new IdleService().yonghu(response, request);
	request.setAttribute("list", list);
	request.getRequestDispatcher("module_idle/selectkehu.jsp").forward(request, response);
}
}
