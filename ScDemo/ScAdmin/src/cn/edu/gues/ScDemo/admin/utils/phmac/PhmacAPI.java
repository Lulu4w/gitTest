package cn.edu.gues.ScDemo.admin.utils.phmac;

import cn.edu.gues.ScDemo.tools.AjaxResult;
import cn.edu.gues.ScDemo.tools.CommonUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.net.URL;

public class PhmacAPI {

    //http://61.159.180.166:8036/Service2.svc/TbPhmacByfid?fid=5224&presult=0&pageNo=1&pageSize=10
    public static PhmacResult TbPhmacByfid(String fid, String presult, int pageNo, int pageSize){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/TbPhmacByfid?fid="+fid+"&presult="+presult+"&pageNo="+pageNo+"&pageSize="+pageSize), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<PhmacResult>(){}.getType();
            return gson.fromJson(json, type);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/AuditTbphmac?phid=9c1cfeb3-1b48-4f09-afbb-41c0f72da610&presult=0&auditid=15186123784
    public static AjaxResult AuditTbphmac(String phid, String presult, String auditid){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/AuditTbphmac?phid="+phid+"&presult="+presult+"&auditid="+auditid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<PhmacAuditResult>(){}.getType();
            PhmacAuditResult result = gson.fromJson(json, type);
            if(result.getD().getS().equals("true")){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error", result.getD().getMsg());
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/DeleteTbPhmac?mainid=9c1cfeb3-1b48-4f09-afbb-41c0f72da610
    public static AjaxResult DeleteTbPhmac(String phid){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/DeleteTbPhmac?mainid="+phid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<DeleteResult>(){}.getType();
            DeleteResult result = gson.fromJson(json, type);
            if(result.isD()){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
