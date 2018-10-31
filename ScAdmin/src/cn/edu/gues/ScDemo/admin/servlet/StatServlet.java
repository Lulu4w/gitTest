package cn.edu.gues.ScDemo.admin.servlet;

import cn.edu.gues.ScDemo.admin.utils.AdminUtils;
import cn.edu.gues.ScDemo.admin.utils.stat.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/Stat")
public class StatServlet  extends BaseServlet{
    private String regionId;
    public void statIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/WEB-INF/stat/abilityStat.jsp").forward(req, resp);
    }


    public void scienceStat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        regionId = AdminUtils.getAdminUserRegionId(req);
        CityTotalResult cityTotalResult = StatAPI.GroupByCountyTotal(regionId);
        QueryRegionTotalResult queryRegionTotalResult = StatAPI.QueryRegionTotal(regionId);

        CityTotalD cityTotalD = cityTotalResult.getD();
        QueryRegionTotalD[] queryRegionTotalDS = queryRegionTotalResult.getD().toArray(new QueryRegionTotalD[queryRegionTotalResult.getD().size()]);

        req.setAttribute("cityTotalD", cityTotalD);
        req.setAttribute("regionD", queryRegionTotalDS);

        req.getRequestDispatcher("/WEB-INF/stat/scienceStat.jsp").forward(req, resp);
    }


    public void createStat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);
        CityTotalResult cityTotalResult = StatAPI.GroupByCountyTotal(regionId);
        QueryRegionTotalResult queryRegionTotalResult = StatAPI.QueryRegionTotal(regionId);

        CityTotalD cityTotalD = cityTotalResult.getD();
        QueryRegionTotalD[] queryRegionTotalDS = queryRegionTotalResult.getD().toArray(new QueryRegionTotalD[queryRegionTotalResult.getD().size()]);

        req.setAttribute("cityTotalD", cityTotalD);
        req.setAttribute("regionD", queryRegionTotalDS);

        req.getRequestDispatcher("/WEB-INF/stat/createStat.jsp").forward(req, resp);
    }
    public void localStat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);
        CityTotalResult cityTotalResult = StatAPI.GroupByCountyTotal(regionId);
        QueryRegionTotalResult queryRegionTotalResult = StatAPI.QueryRegionTotal(regionId);
        CityTotalD cityTotalD = cityTotalResult.getD();
        QueryRegionTotalD[] queryRegionTotalDS = queryRegionTotalResult.getD().toArray(new QueryRegionTotalD[queryRegionTotalResult.getD().size()]);
        req.setAttribute("cityTotalD", cityTotalD);
        req.setAttribute("regionD", queryRegionTotalDS);

        req.getRequestDispatcher("/WEB-INF/stat/localStat.jsp").forward(req, resp);
    }
    public void returnStat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);
        CityTotalResult cityTotalResult = StatAPI.GroupByCountyTotal(regionId);
        QueryRegionTotalResult queryRegionTotalResult = StatAPI.QueryRegionTotal(regionId);
        CityTotalD cityTotalD = cityTotalResult.getD();
        QueryRegionTotalD[] queryRegionTotalDS = queryRegionTotalResult.getD().toArray(new QueryRegionTotalD[queryRegionTotalResult.getD().size()]);
        req.setAttribute("cityTotalD", cityTotalD);
        req.setAttribute("regionD", queryRegionTotalDS);

        req.getRequestDispatcher("/WEB-INF/stat/returnStat.jsp").forward(req, resp);
    }
    public void dreamStat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);
        CityTotalResult cityTotalResult = StatAPI.GroupByCountyTotal(regionId);
        QueryRegionTotalResult queryRegionTotalResult = StatAPI.QueryRegionTotal(regionId);
        CityTotalD cityTotalD = cityTotalResult.getD();
        QueryRegionTotalD[] queryRegionTotalDS = queryRegionTotalResult.getD().toArray(new QueryRegionTotalD[queryRegionTotalResult.getD().size()]);
        req.setAttribute("cityTotalD", cityTotalD);
        req.setAttribute("regionD", queryRegionTotalDS);

        req.getRequestDispatcher("/WEB-INF/stat/dreamStat.jsp").forward(req, resp);
    }
    public void cadreStat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);
        CityTotalResult cityTotalResult = StatAPI.GroupByCountyTotal(regionId);
        QueryRegionTotalResult queryRegionTotalResult = StatAPI.QueryRegionTotal(regionId);
        CityTotalD cityTotalD = cityTotalResult.getD();
        QueryRegionTotalD[] queryRegionTotalDS = queryRegionTotalResult.getD().toArray(new QueryRegionTotalD[queryRegionTotalResult.getD().size()]);
        req.setAttribute("cityTotalD", cityTotalD);
        req.setAttribute("regionD", queryRegionTotalDS);

        req.getRequestDispatcher("/WEB-INF/stat/cadreStat.jsp").forward(req, resp);
    }
    public void areaStat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);

        PnumByRegionResult pnumByRegionResult = StatAPI.PnumByRegion(regionId);
        PnumByRegionD[] pnumByRegionDS = pnumByRegionResult.getD().toArray(new PnumByRegionD[pnumByRegionResult.getD().size()]);
        req.setAttribute("pnumByRegionDs", pnumByRegionDS);

        req.getRequestDispatcher("/WEB-INF/stat/areaStat.jsp").forward(req, resp);
    }


    public void typeStat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);

        CityTotalResult cityTotalResult = StatAPI.GroupByCountyTotal(regionId);
        QueryRegionTotalResult queryRegionTotalResult = StatAPI.QueryRegionTotal(regionId);
        CityTotalD cityTotalD = cityTotalResult.getD();
        req.setAttribute("cityTotal", cityTotalD);

        req.getRequestDispatcher("/WEB-INF/stat/typeStat.jsp").forward(req, resp);
    }


    public void proStat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);

        ZjzByRegionResult zjzByRegionResult = StatAPI.ZjzTypeByRegion(regionId);
        ZjzByRegionD[] zjzByRegionDS = zjzByRegionResult.getD().toArray(new ZjzByRegionD[zjzByRegionResult.getD().size()]);
        req.setAttribute("zjz", zjzByRegionDS);
        req.getRequestDispatcher("/WEB-INF/stat/proStat.jsp").forward(req, resp);
    }


    public void logStat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);

        WorkTotalResult workTotalResult = StatAPI.WorkTotolByRegion(regionId);
        WorkTotalD workTotalD = workTotalResult.getD();
        req.setAttribute("workTotal", workTotalD);

        req.getRequestDispatcher("/WEB-INF/stat/logStat.jsp").forward(req, resp);
    }


    public void trainTypeStat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);

        TrainResult trainResult = StatAPI.TrainTotolByRegion(regionId);
        TrainD trainD = trainResult.getD();
        req.setAttribute("train", trainD);

        req.getRequestDispatcher("/WEB-INF/stat/trainTypeStat.jsp").forward(req, resp);
    }
}
