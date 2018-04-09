package com.offcn.qianduan;

import java.io.IOException;
import java.util.HashMap;
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

@WebServlet(urlPatterns="/IniMaiData")
public class IniMaiData extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid= request.getParameter("uid");
		
		String sql_chushouzhong = "select count(1) as 'chushouzhong' from  u_idle_info where fk_fisher="+uid+" and transfer_state='未交易'";
		String sql_chengjiaojilu = "select count(1) as 'chengjiaojilu' from  u_idle_info where fk_fisher="+uid+" and transfer_state='已交易'";
		
		
		
		List<Map<String,Object>> list_chushouzhong = new BaseDao().executeQuery(sql_chushouzhong);
		List<Map<String,Object>> list_chengjiaojilu = new BaseDao().executeQuery(sql_chengjiaojilu);
		
		String chushouzhong = list_chushouzhong.get(0).get("chushouzhong")+"";
		String chengjiaojilu = list_chengjiaojilu.get(0).get("chengjiaojilu")+"";
		
		Map<String,String> initMaiMap = new HashMap<String, String>();
		initMaiMap.put("chushouzhong",chushouzhong);
		initMaiMap.put("chengjiaojilu",chengjiaojilu);
		
		String str = JSONArray.fromObject(initMaiMap).toString();
		response.getWriter().write(str);
		
	}
}
