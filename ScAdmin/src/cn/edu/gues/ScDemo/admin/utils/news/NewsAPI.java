package cn.edu.gues.ScDemo.admin.utils.news;

import cn.edu.gues.ScDemo.admin.utils.AdminUtils;
import cn.edu.gues.ScDemo.tools.AjaxResult;
import cn.edu.gues.ScDemo.tools.CommonUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.net.URL;

public class NewsAPI {

    //public Collection<TB_NEWS> TbNewsByPidList(string pid, string ntype, string readtype, int pageNo, int pageSize)
    //http://61.159.180.166:8036/Service2.svc/TbNewsByPidList?pid=13639108097&ntype=0&readtype=0&pageNo=1&pageSize=10
    //readtype-0 全部，1-未读，2-已读；    ntype 0-通知消息，1-群组消息，2-个人消息
    public static NewsResult TbNewsByPidList(String pid, String readtype, int pageNo, int pageSize){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/TbNewsByPidList?pid="+pid+"&ntype=0&readtype="+readtype+"&pageNo="+pageNo+"&pageSize="+pageSize), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<NewsResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/TbNewsNoReadSum?pid=13639108097
    public static int TbNewsNoReadSum(String pid){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/TbNewsNoReadSum?pid=" + pid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<ReadSumResult>(){}.getType();
            ReadSumResult readSumResult = gson.fromJson(json, type);
            return readSumResult.getD().getNEWS0();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/TbNewsByMId?mainid=f5ea368c-1c4e-4ddc-8d7b-a6ce03a54dbe
    public static NewsOneResult TbNewsByMId(String mainid){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/TbNewsByMId?mainid=" + mainid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<NewsOneResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // public PeopleResult AddNews(string sender, string sendertel, string reserver, string reservertel,string ptype,string newstitle,string newscontent,string newstype,string memo,string regionid)//
    //http://61.159.180.166:8036/Service2.svc/AddNews?sender=13639108097&sendertel=13639108097&reserver=&reservertel=&memo=&ptype=all&newstitle=%E6%B5%8B%E8%AF%95&newscontent=%E6%B5%8B%E8%AF%95%E5%86%85%E5%AE%B9&newstype=0&regionid=5224
    public static AjaxResult AddNews(String sender, String sendertel, String ptype, String newstitle, String newscontent, String regionId){

        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/AddNews?sender="+sender+"&sendertel="+sendertel+"&reserver=&reservertel=&memo=&ptype="+ptype+"&newstitle="+newstitle+"&newscontent="+newscontent+"&newstype=0&regionid="+regionId), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<NewsAddResult>(){}.getType();
            NewsAddResult result = gson.fromJson(json, type);
            if(result.getD().isS()){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
