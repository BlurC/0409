package com.offcn.qianduan;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

import net.sf.json.JSONArray;

@WebServlet(urlPatterns="/IniMaiData1")
public class IniMaiData1 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		String sql_goumaijilu = "select count(1) as 'goumaijilu' from  u_idle_info where fk_fisher="+uid+" and transfer_state='ря╫╩рв'";
		System.out.println(sql_goumaijilu);
		List<Map<String,Object>> list_goumaijilu = new BaseDao().executeQuery(sql_goumaijilu);
		String goumaijilu = list_goumaijilu.get(0).get("goumaijilu")+"";
		Map<String,String> initMaiMap = new HashMap<String,String>();
		initMaiMap.put("goumaijilu", goumaijilu);
		String str1 = JSONArray.fromObject(initMaiMap).toString();
		response.getWriter().write(str1);
	}
}
