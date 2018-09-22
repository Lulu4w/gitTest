package cn.edu.gues.ScDemo.admin.utils.work;

import cn.edu.gues.ScDemo.tools.AjaxResult;
import cn.edu.gues.ScDemo.tools.CommonUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.net.URL;

public class WorkAPI {
    //public Collection<focuslist> TbFabulouByWorkidList(string workid)//根据工作记录id，查询点赞情况,姓名，职称，头像，点赞时间
    //public PeopleResult AddFabulou(string workid, string sender, string sendertel, string reserver, string reservertel)//点赞，若已经点赞，为取消
    //public decimal TbFabulouByWorkid(string workid)//根据工作记录id，查询点赞数,Focused=1,为点赞，=0，为取消点赞
    // public decimal TbSeeByWorkid(string workid)//根据工作记录id，查询浏览数

    // public PeopleResult AddComment(string workid, string sender, string sendertel, string reserver, string reservertel,string content,string remark)//添加评论,remark 是回复标识，若是评论的工作记录的，remark=“0”，若是回复的其他用户的，remark=“1”


    //http://61.159.180.166:8036/Service2.svc/QueryTbWorkinfoComment?tel=13639108097&pageNo=1&pageSize=10
    public static WorkListResult QueryTbWorkinfoComment(String tel, int pageNo, int pageSize){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/QueryTbWorkinfoComment?tel="+tel+"&pageNo="+pageNo+"&pageSize="+pageSize), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<WorkListResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    //http://61.159.180.166:8036/Service2.svc/AddFabulou?workid=9c8add44-00f4-44f7-a858-6c94d273e0e7&sender=13639108097&sendertel=13639108097&reserver=1026&reservertel=13885714788
    public static AjaxResult AddFabulou(String workid, String sender, String sendertel, String reserver, String reservertel){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/AddFabulou?workid="+workid+"&sender="+sender+"&sendertel="+sendertel+"&reserver="+reserver+"&reservertel="+reservertel), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<DianzanResult>(){}.getType();
            DianzanResult result = gson.fromJson(json, type);
            if(result.getD().isS()){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error", result.getD().getMsg());
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //public Collection<commentlist> TbCommentByWorkidList(string workid)//根据工作记录id，查询评论情况,姓名，职称，头像，评论时间，内容，回复标志，被评论人姓名
    //http://61.159.180.166:8036/Service2.svc/TbCommentByWorkidList?workid=b5dfcebf-0d05-4e28-a1be-2eff51d06d06
    public static CommentListResult TbCommentByWorkidList(String workid){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/TbCommentByWorkidList?workid="+workid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<CommentListResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //public PeopleResult AddComment(string workid, string sender, string sendertel, string reserver, string reservertel,string content,string remark)
    //http://61.159.180.166:8036/Service2.svc/AddComment?workid=696cc1fa-71bc-4bf8-a5a7-53097a38a27b&sender=13639108097&sendertel=13639108097&reserver=10527&reservertel=13985353266&content=%E8%AF%84%E8%AE%BA%E6%B5%8B%E8%AF%95&remark=0
    public static AjaxResult AddComment(String workid, String sender, String sendertel, String reserver, String reservertel,String content,String remark){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/AddComment?workid="+workid+"&sender="+sender+"&sendertel="+sendertel+"&reserver="+reserver+"&reservertel="+reservertel+"&content="+content+"&remark="+remark), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<AddCommentResult>(){}.getType();
            AddCommentResult result = gson.fromJson(json, type);
            if(result.getD().isS()){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error", result.getD().getMsg());
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }




}
