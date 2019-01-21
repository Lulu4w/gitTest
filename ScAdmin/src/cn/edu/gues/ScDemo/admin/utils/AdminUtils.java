package cn.edu.gues.ScDemo.admin.utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminUtils {

	public static void showError(HttpServletRequest req, HttpServletResponse resp, String errorMsg)
			throws ServletException, IOException
	{
		resp.setStatus(500);//设置响应的状态码!!!!!!!!!!!
		req.setAttribute("errorMsg", errorMsg);
		req.getRequestDispatcher("/WEB-INF/error.jsp").forward(req, resp);
	}
	
	public static void setAdminUserId(HttpServletRequest req,String adminUserId)
	{
		req.getSession().setAttribute("AdminUserId", adminUserId);
	}

	/**
	 * 获取当前登录用户Id，如果返回null则表示取不到
	 * @param req
	 * @return
	 */
	public static String getAdminUserId(HttpServletRequest req)
	{
		String id = (String) req.getSession().getAttribute("AdminUserId");
		return id;
	}

	public static void setAdminUserRegionId(HttpServletRequest req,String regionId)
	{
		req.getSession().setAttribute("regionId", regionId);
	}

	public static String getAdminUserRegionId(HttpServletRequest req)
	{
		String id =  (String)req.getSession().getAttribute("regionId");
		return id;
	}

	public static void setAdminName(HttpServletRequest req, String adminUserName){
		req.getSession().setAttribute("AdminUserName", adminUserName);
	}
	public static String getAdminName(HttpServletRequest req){
		String name = (String)req.getSession().getAttribute("AdminUserName");
		return name;
	}

	public static void setPicName(HttpServletRequest req, String picPath){
		req.getSession().setAttribute("picPath", picPath);
	}
	public static String getPicName(HttpServletRequest req){
		String name = (String)req.getSession().getAttribute("picPath");
		return name;
	}




}
