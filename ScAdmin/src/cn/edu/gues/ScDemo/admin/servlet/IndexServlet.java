package cn.edu.gues.ScDemo.admin.servlet;

import cn.edu.gues.ScDemo.admin.utils.AdminUtils;
import cn.edu.gues.ScDemo.admin.utils.index.LoginAPI;
import cn.edu.gues.ScDemo.admin.utils.index.LoginResult;
import cn.edu.gues.ScDemo.admin.utils.news.NewsAPI;
import cn.edu.gues.ScDemo.admin.utils.region.RegionAPI;
import cn.edu.gues.ScDemo.admin.utils.region.RegionD;
import cn.edu.gues.ScDemo.tools.AjaxResult;
import cn.edu.gues.ScDemo.tools.VerifyCodeUtils;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Index")
public class IndexServlet extends BaseServlet {
    @AllowAnonymous
    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/loginlte.jsp").forward(req, resp);
    }

    @AllowAnonymous
    public void loginSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phoneNum = req.getParameter("phoneNum");
        String password = req.getParameter("password");
        //String verifyCode = req.getParameter("verifyCode");

        if(StringUtils.isEmpty(phoneNum)){
            writeJson(resp, new AjaxResult("error", "手机号必填"));
            return;
        }
        if(StringUtils.isEmpty(password)){
            writeJson(resp, new AjaxResult("error", "密码必填"));
            return;
        }
       /* if(StringUtils.isEmpty(verifyCode)){
            writeJson(resp, new AjaxResult("error", "验证码必填"));
            return;
        }*/

        /*String codeInSession = (String)req.getSession().getAttribute("verifyCode");
        if(!verifyCode.equalsIgnoreCase(codeInSession)){
            writeJson(resp, new AjaxResult("error", "verifyCode Error"));
            return;
        }*/

        LoginResult loginResult = LoginAPI.Loadleader(phoneNum, password);

        if(loginResult.getD().isS()){

            AdminUtils.setAdminUserId(req, loginResult.getD().getPeo().getPID());
            AdminUtils.setAdminUserRegionId(req, loginResult.getD().getPeo().getREGIONID());


            writeJson(resp, new AjaxResult("ok"));
        } else{

            writeJson(resp, new AjaxResult("error", "userName or password Error"));
        }
    }

    @AllowAnonymous
    public void verifyCode(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = VerifyCodeUtils.generateVerifyCode(4);
        req.getSession().setAttribute("verifyCode", code);
        resp.setContentType("image/jpeg");
        VerifyCodeUtils.outputImage(100, 50, resp.getOutputStream(), code);
    }

    public void index(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String regionId = AdminUtils.getAdminUserRegionId(req);
        String pid = AdminUtils.getAdminUserId(req);

        RegionD region = RegionAPI.QueryRegionDictById(regionId);
        int newsNum = NewsAPI.TbNewsNoReadSum(pid);

        req.setAttribute("newsNum", newsNum);
        req.setAttribute("regionId", regionId);
        req.setAttribute("regionName", region.getRD_SHORTNAME());
        req.getRequestDispatcher("WEB-INF/indexlte.jsp").forward(req, resp);
    }
}
