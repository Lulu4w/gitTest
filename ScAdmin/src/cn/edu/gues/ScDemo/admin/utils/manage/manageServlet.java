package cn.edu.gues.ScDemo.admin.utils.manage;

import cn.edu.gues.ScDemo.admin.servlet.BaseServlet;
import cn.edu.gues.ScDemo.admin.utils.stat.*;
import cn.edu.gues.ScDemo.tools.AjaxResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Manage")
public class manageServlet extends BaseServlet {
    public void manageList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String region1 = req.getParameter("region1");
        String region2 = req.getParameter("region2");
        String region3 = req.getParameter("region3");
        String regionId = "5224";
        if(region1.length() > regionId.length()){
            regionId = region1;
        }
        if(region2.length() > regionId.length()){
            regionId = region2;
        }
        if(region3.length() > regionId.length()){
            regionId = region3;
        }

        CityTotalResult cityTotalResult = StatAPI.GroupByCountyTotal(regionId);
        CityTotalD cityTotalD = cityTotalResult.getD();
        req.setAttribute("cityTotalD", cityTotalD);
        /*QueryRegionTotalResult queryRegionTotalResult = StatAPI.QueryRegionTotal("5224");*/
        /*QueryRegionTotalD[] queryRegionTotalDS = queryRegionTotalResult.getD().toArray(new QueryRegionTotalD[queryRegionTotalResult.getD().size()]);*/
       /* req.setAttribute("regionD", queryRegionTotalDS);*/

        //writeJson(resp, new AjaxResult("ok","", cityTotalD));

        req.getRequestDispatcher("/WEB-INF/manage/manageListLte.jsp").forward(req, resp);
    }
}
