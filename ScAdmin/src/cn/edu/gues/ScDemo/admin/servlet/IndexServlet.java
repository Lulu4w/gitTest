package cn.edu.gues.ScDemo.admin.servlet;

import cn.edu.gues.ScDemo.admin.utils.AdminUtils;
import cn.edu.gues.ScDemo.admin.utils.news.NewsAPI;
import cn.edu.gues.ScDemo.admin.utils.region.RegionAPI;
import cn.edu.gues.ScDemo.admin.utils.region.RegionD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Index")
public class IndexServlet extends BaseServlet {
    public void index(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int regionId = 5224;
        String pid = "13639108097";

        AdminUtils.setAdminUserRegionId(req,regionId);
        RegionD region = RegionAPI.QueryRegionDictById(regionId);
        int newsNum = NewsAPI.TbNewsNoReadSum(pid);

        req.setAttribute("newsNum", newsNum);
        req.setAttribute("regionId", regionId);
        req.setAttribute("regionName", region.getRD_SHORTNAME());
        req.getRequestDispatcher("WEB-INF/index.jsp").forward(req, resp);
    }
}
