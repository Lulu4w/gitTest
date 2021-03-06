package cn.edu.gues.ScDemo.admin.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.gues.ScDemo.admin.utils.AdminUtils;

import cn.edu.gues.ScDemo.tools.AjaxResult;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


public class BaseServlet extends HttpServlet {
	private static final Logger logger = LogManager.getLogger(BaseServlet.class);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if(StringUtils.isEmpty(action))
		{
			AdminUtils.showError(req, resp, "action不能为空");
			return;
		}
		String userId = AdminUtils.getAdminUserId(req);

		try {
			Method methodAction = this.getClass().getMethod(action, HttpServletRequest.class,HttpServletResponse.class);

			AllowAnonymous allowAnonymous = methodAction.getAnnotation(AllowAnonymous.class);
			if(allowAnonymous==null)//如果为null，就说明方法没有标注AllowAnonymous，则需要检查登录状态
			{

				if (userId == null) {
					String ctxPath = req.getContextPath();
					// target='_top'避免链接在iframe中打开
					AdminUtils.showError(req, resp, "未登录<a target='_top' href='" + ctxPath + "/Index?action=login'>点此登录</a>");
					return;//!!!!!
				}
			}


			if (methodAction == null) {
				AdminUtils.showError(req, resp, "找不到名字为" + action + "的方法");
				return;
			}
			//CompanyDTO frontCompany = FrontUtils.getCurrentCompany(req);
			//req.setAttribute("frontCompany", frontCompany);
			methodAction.invoke(this, req, resp);

			
		} catch (NoSuchMethodException | SecurityException | IllegalAccessException 
				| IllegalArgumentException | InvocationTargetException e) {
			logger.error("action调用出现错误："+action, e);
			AdminUtils.showError(req, resp, "action调用出现错误："+action);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
	protected void writeJson(HttpServletResponse resp,AjaxResult ajaxResult) throws IOException
	{
		resp.setContentType("application/json");
		resp.getWriter().print(ajaxResult.toJson());
	}
}
