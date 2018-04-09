package com.offcn.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.offcn.dao.BaseDao;

public class UpdateService {
	public int UpdateService1(HttpServletRequest request , HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String account = request.getParameter("account");
		String phonenum = request.getParameter("phonenum");
		String address = request.getParameter("address");
		String mailbox = request.getParameter("mailbox");
		
		String sql = "UPDATE u_sys_admin SET phonenum = '"+phonenum+"' ,address = '"+address+"',mailbox = '"+mailbox+"' WHERE account = '"+account+"'";
		
		int n = new BaseDao().executeUpdate(sql);
		return n;
	}
	public int UpdateService2(HttpServletRequest request ,HttpServletResponse response)
	{
		try{
		request.setCharacterEncoding("UTF-8");
		}
		catch(UnsupportedEncodingException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*String u_id ="";
		
		Map<String,Object> map= (Map<String,Object>)request.getSession().getAttribute("map");
		if(map!=null&&map.size()>0)
		{
		u_id=map.get("u_id").toString();
		}*/
		String u_account = request.getParameter("u_account");
		String u_nickname = request.getParameter("u_nickname");
		String u_phonenum = request.getParameter("u_phonenum");
		String u_birthday = request.getParameter("u_birthday");
		String u_state = request.getParameter("u_state");
		String u_province = request.getParameter("u_province");
		String u_city = request.getParameter("u_city");
		String u_district = request.getParameter("u_district");
		String u_headimg = request.getParameter("u_headimg");
		String idleimg = saveImg(request, response);
		
		String sql = "update u_idle_user set u_nickname='"+u_nickname+"',u_phonenum='"+u_phonenum+"',u_birthday='"+u_birthday+"',u_state='"+u_state+"',u_province='"+u_province+"',u_city='"+u_city+"',u_district='"+u_district+"',u_headimg='"+idleimg+"' where u_account='"+u_account+"'";
		int s = new BaseDao().executeUpdate(sql);
		
		return s;
	}
	public String saveImg(HttpServletRequest request,HttpServletResponse response)
	{
		Part part = null;
		try {
			//1.获取用户上传图片对应的part对象
			part = request.getPart("idleimg");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
		//2.获取当前时间
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddhhmmss");
		String str = sf.format(date);
		
		//3.获取用户上传的图片的后缀
		String cd = part.getHeader("Content-Disposition");
		//form-data; name="idleimg"; filename="20171108083623.jpg"
		String houzui = cd.substring(cd.lastIndexOf("."), cd.length()-1);
		String fileName = str+houzui;
		
		//4.将图片保存,利用生成的文件名
		try {
			//D:\apache-tomcat-9.0.0.M21\webapps\offcn_idle_sys\idleimg
			String realPath = request.getServletContext().getRealPath("/idleimg")+"\\"+fileName;
			part.write(realPath);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileName;
	}
	
}
