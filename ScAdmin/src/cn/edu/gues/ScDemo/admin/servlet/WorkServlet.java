package cn.edu.gues.ScDemo.admin.servlet;

import cn.edu.gues.ScDemo.admin.utils.AdminUtils;
import cn.edu.gues.ScDemo.admin.utils.ability.AbilityAPI;
import cn.edu.gues.ScDemo.admin.utils.ability.AbilityD;
import cn.edu.gues.ScDemo.admin.utils.ability.AbilityResult;
import cn.edu.gues.ScDemo.admin.utils.work.*;
import cn.edu.gues.ScDemo.tools.AjaxResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Work")
public class WorkServlet extends BaseServlet {
    public void workList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int pageNo = Integer.parseInt(req.getParameter("pageIndex"));

        String tel = AbilityAPI.QueryTbPeopleinfoById(AdminUtils.getAdminUserId(req).toString()).getD().getPTEL();
        WorkListResult workListResult = WorkAPI.QueryTbWorkinfoComment(tel, pageNo, 10);
        WorkListD[] workListDS = workListResult.getD().toArray(new WorkListD[workListResult.getD().size()]);
        CommentListResult[] comments = new CommentListResult[workListDS.length];
        int totalCount = 0;
        if(workListResult != null){
            totalCount = workListDS[0].getTotolSum();
        }
        for(int i = 0; i < workListDS.length; i++){
            comments[i] = WorkAPI.TbCommentByWorkidList(workListDS[i].getWorkid());
        }

        req.setAttribute("comments", comments);
        req.setAttribute("tel", tel);
        req.setAttribute("workListDS", workListDS);
        req.setAttribute("ctxPath", req.getContextPath());
        req.setAttribute("pageNo", pageNo);
        req.setAttribute("totalCount", totalCount);

        req.getRequestDispatcher("/WEB-INF/work/workList.jsp").forward(req, resp);
    }

    public void dianzan(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String reserver = req.getParameter("pid");
        String reservertel = req.getParameter("ptel");
        String workid = req.getParameter("workid");

        String sender = AdminUtils.getAdminUserId(req).toString();
        String sendertel = AbilityAPI.QueryTbPeopleinfoById(AdminUtils.getAdminUserId(req).toString()).getD().getPTEL();

        AjaxResult result = WorkAPI.AddFabulou(workid,sender,sendertel,reserver,reservertel);
        writeJson(resp, result);
    }

    public void commentList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String workid = req.getParameter("workid");
        CommentListResult commentListResult = WorkAPI.TbCommentByWorkidList(workid);
        CommentListD[] commentListDS = commentListResult.getD().toArray(new CommentListD[commentListResult.getD().size()]);
        req.setAttribute("comments", commentListDS);
        req.getRequestDispatcher("/WEB-INF/work/workList.jsp").forward(req, resp);
    }

    public void commentAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String workid = req.getParameter("workid");
        req.setAttribute("workid", workid);
        String reserver = req.getParameter("reserver");
        req.setAttribute("reserver", reserver);
        String reservertel = req.getParameter("reservertel");
        req.setAttribute("reservertel", reservertel);
        String remark = req.getParameter("remark");
        req.setAttribute("remark", remark);

        req.getRequestDispatcher("/WEB-INF/work/commentAdd.jsp").forward(req, resp);
    }
    public void commentAdd2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String workid = req.getParameter("workid");
        req.setAttribute("workid", workid);
        String name = req.getParameter("name");
        AbilityResult result = AbilityAPI.QueryTbPeopleShortByNameOrTel(AdminUtils.getAdminUserRegionId(req).toString(), name, 1, 1);


        String reserver = result.getD().get(0).getPID();
        req.setAttribute("reserver", reserver);
        String reservertel = result.getD().get(0).getPTEL();
        req.setAttribute("reservertel", reservertel);
        String remark = req.getParameter("remark");
        req.setAttribute("remark", remark);

        req.getRequestDispatcher("/WEB-INF/work/commentAdd.jsp").forward(req, resp);
    }

    public void commentAddSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String workid = req.getParameter("workid");
        String reserver = req.getParameter("reserver");
        String reservertel = req.getParameter("reservertel");
        String remark = req.getParameter("remark");
        String sender = AdminUtils.getAdminUserId(req).toString();

        String sendertel = AbilityAPI.QueryTbPeopleinfoById(AdminUtils.getAdminUserId(req).toString()).getD().getPTEL();

        String content = req.getParameter("content");

        AjaxResult result = WorkAPI.AddComment(workid, sender, sendertel, reserver,reservertel,content, remark);

        writeJson(resp, result);
    }

}
