package cn.edu.gues.ScDemo.admin.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegionServlet extends BaseServlet {
    public void QueryRegionDictById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("WEB-INF/region/regionList.jsp").forward(req, resp);
    }


}
