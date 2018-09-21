package cn.edu.gues.ScDemo.admin.utils.ability;

import cn.edu.gues.ScDemo.tools.AjaxResult;
import cn.edu.gues.ScDemo.tools.CommonUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.net.URL;

public class AbilityAPI {
    //http://61.159.180.166:8036/Service2.svc/QueryTbPeopleinfoByAuditpage?regionId=5224&audit=0&pageNo=1&pageSize=3
    //0-未审核  1-审核通过   2-审核未通过
    public static AbilityResult QueryTbPeopleinfoByAuditpage(String regionId, int audit, int pageNo, int pageSize){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/QueryTbPeopleinfoByAuditpage?regionid="+regionId+"&audit="+audit+"&pageNo="+pageNo+"&pageSize="+pageSize), "UTF-8");
            Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd HH:mm:ss").create();
            java.lang.reflect.Type type = new TypeToken<AbilityResult>(){}.getType();
            return gson.fromJson(json, type);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/QueryTbPeopleinfoById?pd_id=9057
    public static AbilityOneResult QueryTbPeopleinfoById(String pid){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/QueryTbPeopleinfoById1?pd_id="+pid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<AbilityOneResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/UpdateAudit?pid=bfe8c1e1-fbc1-4c17-b12f-757b85f59566&audit=0&auditid=0
    //{"d":{"__type":"PeopleResult:#WcfService2","Maindid":"bfe8c1e1-fbc1-4c17-b12f-757b85f59566","Msg":"审核成功","s":true}}
    public static AjaxResult UpdateAudit(String pid, String audit){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/UpdateAudit?pid="+pid+"&audit="+audit+"&auditid="+audit), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<AuditResult>(){}.getType();
            AuditResult result = gson.fromJson(json, type);
            if(result.getD().getS().equals("true")){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error", result.getD().getMsg());
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static AjaxResult UpdateAuditAll(String phid, String audit){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/UpdateAuditAll?phid="+phid+"&audit="+audit+"&auditid="+audit), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<AuditResult>(){}.getType();
            AuditResult result = gson.fromJson(json, type);
            if(result.getD().getS().equals("true")){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error", result.getD().getMsg());
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/QueryTbPeopleShortByNameOrTel?regionid=5224&pnameortel=18485709888&pageNo=1&pageSize=10
    public static AbilityResult QueryTbPeopleShortByNameOrTel(String regionid, String pnameortel, int pageNo, int pageSize){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/QueryTbPeopleShortByNameOrTel?regionid="+regionid+"&pnameortel="+pnameortel+"&pageNo="+pageNo+"&pageSize="+pageSize), "UTF-8");
            Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd HH:mm:ss").create();
            java.lang.reflect.Type type = new TypeToken<AbilityResult>(){}.getType();
            return gson.fromJson(json, type);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }



}
