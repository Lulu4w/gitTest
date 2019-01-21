package cn.edu.gues.ScDemo.admin.servlet;

import cn.edu.gues.ScDemo.admin.utils.AdminUtils;
import cn.edu.gues.ScDemo.admin.utils.Department.DepartmentAPI;
import cn.edu.gues.ScDemo.admin.utils.Department.DepartmentD;
import cn.edu.gues.ScDemo.admin.utils.Department.DepartmentEditResult;
import cn.edu.gues.ScDemo.admin.utils.Department.DepartmentResult;
import cn.edu.gues.ScDemo.admin.utils.ability.AbilityAPI;
import cn.edu.gues.ScDemo.admin.utils.ability.AbilityD;
import cn.edu.gues.ScDemo.admin.utils.ability.AbilityOneResult;
import cn.edu.gues.ScDemo.admin.utils.ability.AbilityResult;
import cn.edu.gues.ScDemo.admin.utils.demand.*;
import cn.edu.gues.ScDemo.admin.utils.news.NewsAPI;
import cn.edu.gues.ScDemo.admin.utils.news.NewsD;
import cn.edu.gues.ScDemo.admin.utils.news.NewsOneResult;
import cn.edu.gues.ScDemo.admin.utils.news.NewsResult;
import cn.edu.gues.ScDemo.admin.utils.phmac.PhmacAPI;
import cn.edu.gues.ScDemo.admin.utils.phmac.PhmacD;
import cn.edu.gues.ScDemo.admin.utils.phmac.PhmacResult;
import cn.edu.gues.ScDemo.admin.utils.region.RegionAPI;
import cn.edu.gues.ScDemo.admin.utils.region.RegionD;
import cn.edu.gues.ScDemo.admin.utils.region.RegionResult;
import cn.edu.gues.ScDemo.tools.AjaxResult;
import cn.edu.gues.ScDemo.tools.CommonUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URL;

@WebServlet("/Studio")
public class StudioServlet extends BaseServlet {
    private String regionId;
    private String pid;
    public void departmentList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);
        pid = AdminUtils.getAdminUserId(req);
        DepartmentResult departments = DepartmentAPI.TbUnitByqid(regionId);

        DepartmentD[] Departments = departments.getD().toArray(new DepartmentD[departments.getD().size()]);

        req.setAttribute("Departments", Departments);
        req.setAttribute("DepCount", departments.getD().size());

        req.getRequestDispatcher("/WEB-INF/Department/DepartmentList2.jsp").forward(req, resp);
    }

    public void departmentAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/Department/DepartmentAdd.jsp").forward(req, resp);
    }

    public void departmentAddSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);
        pid = AdminUtils.getAdminUserId(req);

        String uname = CommonUtils.urlEncodeUTF8(req.getParameter("UNAME"));

        DepartmentAPI departmentAPI = new DepartmentAPI();
        AjaxResult ajaxResult = departmentAPI.AddTbunit(uname, null, regionId, pid);

        writeJson(resp, ajaxResult);
    }

    public void departmentEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname = req.getParameter("uname");
        req.setAttribute("uname", uname);
        req.getRequestDispatcher("WEB-INF/Department/DepartmentEdit.jsp").forward(req, resp);
    }

    public void departmentEditSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname = req.getParameter("oldUname");
        String newUname = req.getParameter("UNAME");
        newUname = CommonUtils.urlEncodeUTF8(newUname);

        DepartmentEditResult department = DepartmentAPI.TbUnitByName(uname);

        String uno = department.getD().getUNO();
        String funo = department.getD().getFUNO();
        String quno = department.getD().getQUNO();
        String pid = department.getD().getPID();

        AjaxResult ajaxResult = DepartmentAPI.UpdateTbunit(uno,newUname, funo,quno,pid);


        writeJson(resp, ajaxResult);

    }

    /**
     * 单位（部门）删除
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    public void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mainid = req.getParameter("mainid");
        AjaxResult ajaxResult = DepartmentAPI.DeleteTbunit(mainid);
        writeJson(resp, ajaxResult);
    }


    /************************************************************************************************************


                                   以下是人才管理



    ************************************************************************************************************/

    //http://61.159.180.166:8036/Service2.svc/QueryTbPeopleinfoByAuditpage?regionid=522401&audit=1&pageNo=1&pageSize=20
    public void abilityPageData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String regionId = String.valueOf(AdminUtils.getAdminUserRegionId(req));
        int audit = Integer.parseInt(req.getParameter("audit"));
        int pageNo = Integer.parseInt(req.getParameter("pageIndex"));

        AbilityResult abilityResult = AbilityAPI.QueryTbPeopleinfoByAuditpage(regionId, audit, pageNo, 15);

        AbilityD[] abilities = abilityResult.getD().toArray(new AbilityD[abilityResult.getD().size()]);

        int totalCount = 0;
        String phid = "";
        if(abilityResult!= null && abilityResult.getD()!=null && abilityResult.getD().size()!= 0){
            totalCount = abilityResult.getD().get(0).getSumTotl();
            for(int i = 0; i < abilities.length-1; i++){
                phid += abilities[i].getPID()+",";
            }
            phid += abilities[abilities.length-1].getPID();
        }



        req.setAttribute("phid", phid);
        req.setAttribute("regionId", AdminUtils.getAdminUserRegionId(req));
        req.setAttribute("abilities", abilities);
        req.setAttribute("audit", audit);
        req.setAttribute("ctxPath", req.getContextPath());
        req.setAttribute("pageNo", pageNo);
        req.setAttribute("totalCount", totalCount);

        req.getRequestDispatcher("/WEB-INF/ability/abilityListLte.jsp").forward(req, resp);
    }


    public void abilityInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pid = req.getParameter("pid");
        AbilityOneResult ability = AbilityAPI.QueryTbPeopleinfoById(pid);
        req.setAttribute("ability", ability);
        req.getRequestDispatcher("/WEB-INF/ability/abilityInfo.jsp").forward(req, resp);
    }

    public void AuditOne(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String audit = req.getParameter("audit");
        String pid = req.getParameter("pid");
        AjaxResult result = AbilityAPI.UpdateAudit(pid, audit);
        writeJson(resp, result);
    }

    public void AuditAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String audit = req.getParameter("audit");
        String phid = req.getParameter("phid");

        AjaxResult result = AbilityAPI.UpdateAuditAll(phid, audit);
        writeJson(resp, result);
    }

    public void searchNameOrTel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String regionId = String.valueOf(AdminUtils.getAdminUserRegionId(req));
        String nameortel = CommonUtils.urlEncodeUTF8(req.getParameter("nameortel"));

        int pageNo = Integer.parseInt(req.getParameter("pageIndex"));

        AbilityResult abilityResult = AbilityAPI.QueryTbPeopleShortByNameOrTel(regionId, nameortel, pageNo, 15);

        AbilityD[] abilities = abilityResult.getD().toArray(new AbilityD[abilityResult.getD().size()]);
        String phid = "";
        int totalCount = 0;
        if(abilityResult.getD().size() != 0){
            abilityResult.getD().get(0).getSumTotl();
            for(int i = 0; i < abilities.length-1; i++){
                phid += abilities[i].getPID()+",";
            }
            phid += abilities[abilities.length-1].getPID();
        }



        req.setAttribute("phid", phid);
        req.setAttribute("regionId", AdminUtils.getAdminUserRegionId(req));
        req.setAttribute("abilities", abilities);

        req.setAttribute("nameortel", nameortel);
        req.setAttribute("ctxPath", req.getContextPath());
        req.setAttribute("pageNo", pageNo);
        req.setAttribute("totalCount", totalCount);
        req.getRequestDispatcher("/WEB-INF/ability/searchPage.jsp").forward(req, resp);
    }

    /************************************************************************************************************


                                以下是登录设备管理



     ************************************************************************************************************/

    //http://61.159.180.166:8036/Service2.svc/TbPhmacByfid?fid=5224&presult=0&pageNo=1&pageSize=10
    public void phmacPageData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        pid = AdminUtils.getAdminUserId(req);
        String regionId = String.valueOf(AdminUtils.getAdminUserRegionId(req));
        String presult = req.getParameter("presult");
        int pageNo = Integer.parseInt(req.getParameter("pageIndex"));
        PhmacResult phmacResult = PhmacAPI.TbPhmacByfid(regionId, presult, pageNo, 15);
        PhmacD[] phmacs = phmacResult.getD().toArray(new PhmacD[phmacResult.getD().size()]);

        int totalCount = 0;
        if(phmacResult.getD().size() != 0) {
            totalCount = phmacResult.getD().get(0).getSumTotl();
        }

        req.setAttribute("regionId", AdminUtils.getAdminUserRegionId(req));
        req.setAttribute("phmacs", phmacs);
        req.setAttribute("presult", presult);
        req.setAttribute("ctxPath", req.getContextPath());
        req.setAttribute("pageNo", pageNo);
        req.setAttribute("totalCount", totalCount);

        req.setAttribute("auditId", pid);

        req.getRequestDispatcher("/WEB-INF/phmac/phmacListLte.jsp").forward(req, resp);
    }

    // AuditTbphmac(string phid, string presult,string auditid)//0-未审核，1-审核通过，2-审核未通过   phid主键，presult审核结果，处理人id
    public void phmacAudit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phid = req.getParameter("phid");
        String presult = req.getParameter("presult");
        String auditId = req.getParameter("auditId");

        AjaxResult result = PhmacAPI.AuditTbphmac(phid, presult, auditId);
        writeJson(resp, result);
    }

    public void phmacDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phid = req.getParameter("phid");
        AjaxResult result = PhmacAPI.DeleteTbPhmac(phid);
        writeJson(resp, result);
    }


    /************************************************************************************************************


                                    以下是技术需求管理



     ************************************************************************************************************/
    //http://61.159.180.166:8036/Service2.svc/TbTdemandByDTid?tid=01
    public void demandList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tid = req.getParameter("tid");
        DemandResult demandResult = DemandAPI.TbTdemandByDTid(tid);
        DemandD[] demands = demandResult.getD().toArray(new DemandD[demandResult.getD().size()]);

        String[] pNames = new String[demands.length];
        String[] typeNames = new String[demands.length];
        String[] pPhones = new String[demands.length];
        if (demandResult.getD() != null) {
            for(int i = 0; i < demands.length; i++){
                TtypeInfoResult ttypeInfoResult = DemandAPI.TbTtypeByMId(demands[i].getTID());
                if(ttypeInfoResult.getD() != null) {
                    typeNames[i] = ttypeInfoResult.getD().getTNAME();
                }
                AbilityOneResult abilityOneResult = AbilityAPI.QueryTbPeopleinfoById(demands[i].getPID());
                pNames[i] = abilityOneResult.getD().getPNAME();
                pPhones[i] = abilityOneResult.getD().getPTEL();
            }
        }

        int totalCount = 0;
        if(demands.length != 0){
            totalCount = demands[0].getSumTotl();
        }
        req.setAttribute("pPhones",pPhones);
        req.setAttribute("pNames", pNames);
        req.setAttribute("typeNames", typeNames);
        req.setAttribute("demands", demands);
        req.setAttribute("tid", tid);
        //req.setAttribute("totalCount", totalCount);
        req.getRequestDispatcher("/WEB-INF/demand/demandListLte.jsp").forward(req, resp);
    }

    public void demandDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mainid = req.getParameter("mainid");
        AjaxResult result = DemandAPI.DeleteTdemand(mainid);
        writeJson(resp, result);
    }

    public void deprocessList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String txid = req.getParameter("txid");
        DeprocessResult deprocessResult = DemandAPI.TbDeprocessByTxid(txid);
        DeprocessD[] deprocessDs = deprocessResult.getD().toArray(new DeprocessD[deprocessResult.getD().size()]);

        String[] pNames = new String[deprocessDs.length];
        String[] pPhones = new String[deprocessDs.length];
        String[] pUnits = new String[deprocessDs.length];

        if(deprocessResult.getD() != null){
            for(int i = 0; i < deprocessDs.length; i++){
                AbilityOneResult abilityOneResult = AbilityAPI.QueryTbPeopleinfoById(deprocessDs[i].getPID());
                pNames[i] = abilityOneResult.getD().getPNAME();
                pPhones[i] = abilityOneResult.getD().getPTEL();
                pUnits[i] = abilityOneResult.getD().getPJOBPLACE();
            }
        }

        req.setAttribute("deprocess", deprocessDs);
        req.setAttribute("pNames", pNames);
        req.setAttribute("pPhones", pPhones);
        req.setAttribute("pUnits", pUnits);
        req.setAttribute("txid", txid);


        req.getRequestDispatcher("/WEB-INF/demand/deprocessListLte.jsp").forward(req, resp);
    }

    public void deprocessDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mainid = req.getParameter("mainid");
        AjaxResult result = DemandAPI.DeleteTbDeprocess(mainid);
        writeJson(resp, result);
    }

    // txid 技术需求id，Pid 处理人员id，Ftid 处理区域id
    public void deprocessAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String txid = req.getParameter("txid");
        req.setAttribute("txid", txid);

        req.getRequestDispatcher("/WEB-INF/demand/deprocessAdd.jsp").forward(req, resp);

    }
    public void deprocessAddSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //String pid = AdminUtils.getAdminUserId(req).toString();
        //String ftid = AdminUtils.getAdminUserRegionId(req).toString();
        regionId = AdminUtils.getAdminUserRegionId(req);
        pid = AdminUtils.getAdminUserId(req);




        String txid = req.getParameter("txid");
        String presult = req.getParameter("presult");
        String status = req.getParameter("status");

        AjaxResult result = DemandAPI.AddTbDeprocess(txid, pid, regionId, presult, status);
        writeJson(resp, result);
    }

    /************************************************************************************************************


                        以下是通知公告



     ************************************************************************************************************/

    public void newsList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //String pid = AdminUtils.getAdminUserId(req).toString();

        pid = AdminUtils.getAdminUserId(req);

        String readType = req.getParameter("readType");
        int pageNo = Integer.parseInt(req.getParameter("pageIndex"));

        NewsResult newsResult = NewsAPI.TbNewsByPidList(pid, readType, pageNo, 5);
        NewsD[] newsDS = newsResult.getD().toArray(new NewsD[newsResult.getD().size()]);
        int totalCount = 0;
        if(newsDS.length != 0){
            totalCount = newsDS[0].getSumTotol();
        }

        req.setAttribute("newsDS", newsDS);
        req.setAttribute("readType", readType);
        req.setAttribute("pid", pid);
        req.setAttribute("ctxPath", req.getContextPath());
        req.setAttribute("pageNo", pageNo);
        req.setAttribute("totalCount", totalCount);

        req.getRequestDispatcher("/WEB-INF/news/newsListLte.jsp").forward(req, resp);
    }


    public void newsShow(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mainid = req.getParameter("mainid");

        NewsOneResult newsOneResult = NewsAPI.TbNewsByMId(mainid);
        NewsD news = newsOneResult.getD();
        req.setAttribute("news", news);
        req.getRequestDispatcher("/WEB-INF/news/newsShow.jsp").forward(req, resp);
    }

    public void newsAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //RegionD[] region1 = new RegionD[];


        req.getRequestDispatcher("/WEB-INF/news/newsAdd.jsp").forward(req, resp);
    }

    public void getRegions(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fid = req.getParameter("fid");
        RegionResult regionResult = RegionAPI.QueryRegionDictByFid(fid);
        RegionD[] regions = regionResult.getD().toArray(new RegionD[regionResult.getD().size()]);
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        writeJson(resp, new AjaxResult("ok","",regions));
    }

    public void newsAddSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        regionId = AdminUtils.getAdminUserRegionId(req);
        pid = AdminUtils.getAdminUserId(req);
        String ptype = CommonUtils.urlEncodeUTF8(req.getParameter("ptype"));

        String region1 = CommonUtils.urlEncodeUTF8(req.getParameter("region1"));
        String region2 = CommonUtils.urlEncodeUTF8(req.getParameter("region2"));
        String region3 = CommonUtils.urlEncodeUTF8(req.getParameter("region3"));

        String newstitle = CommonUtils.urlEncodeUTF8(req.getParameter("newstitle"));
        String newscontent = CommonUtils.urlEncodeUTF8(req.getParameter("newscontent"));

        //String sender = AdminUtils.getAdminUserId(req).toString();
        String sender = pid;
        String sendertel = AbilityAPI.QueryTbPeopleinfoById(sender).getD().getPTEL();

        if(region1.length() > regionId.length()){
            regionId = region1;
        }
        if(region2.length() > regionId.length()){
            regionId = region2;
        }
        if(region3.length() > regionId.length()){
            regionId = region3;
        }
        AjaxResult result = NewsAPI.AddNews(sender, sendertel, ptype, newstitle, newscontent, regionId);
        writeJson(resp, result);
    }
}
