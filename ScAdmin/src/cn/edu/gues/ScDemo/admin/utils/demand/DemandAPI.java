package cn.edu.gues.ScDemo.admin.utils.demand;

import cn.edu.gues.ScDemo.tools.AjaxResult;
import cn.edu.gues.ScDemo.tools.CommonUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.net.URL;

public class DemandAPI {
    //http://61.159.180.166:8036/Service2.svc/TbTdemandByDTid?tid=01
    public static DemandResult TbTdemandByDTid(String tid){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/TbTdemandByDTid?tid=" + tid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<DemandResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static TtypeResult tbttypebyall(){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/tbttypebyall"), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<TtypeResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/TbTtypeByMId?mainid=0102
    public static TtypeInfoResult TbTtypeByMId(String mainid){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/TbTtypeByMId?mainid=" + mainid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<TtypeInfoResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/DeleteTdemand?mainid=9444f820-6c75-4641-9167-c675259f82bb
    //{"d":{"__type":"PeopleResult:#WcfService2","Maindid":null,"Msg":"删除成功！","s":true}}
    public static AjaxResult DeleteTdemand(String mainid){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/DeleteTdemand?mainid="+mainid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<DemandDeleteResult>(){}.getType();
            DemandDeleteResult result = gson.fromJson(json, type);
            if(result.getD().getS()){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/TbDeprocessByTxid?txid=103e2009-4c5b-44ad-8da7-460b510fb6d3
    public static DeprocessResult TbDeprocessByTxid(String txid){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/TbDeprocessByTxid?txid=" + txid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<DeprocessResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //public bool DeleteTbDeprocess(string mainid)
    //http://61.159.180.166:8036/Service2.svc/DeleteTbDeprocess?mainid=13ec6e10-713c-408d-8ca9-7765577bd570   PROSSID
    public static AjaxResult DeleteTbDeprocess(String mainid){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/DeleteTbDeprocess?mainid="+mainid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<DeprocessDeleteResult>(){}.getType();
            DeprocessDeleteResult result = gson.fromJson(json, type);
            if(result.isD()){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }



    //public PeopleResult AddTbDeprocess(string txid,string pid, string ftid,string presult,string status)
    // txid 技术需求id，Pid 处理人员id，Ftid 处理区域id，presult 处理结果,status 进度处理状态

    //http://61.159.180.166:8036/Service2.svc/AddTbDeprocess?txid=103e2009-4c5b-44ad-8da7-460b510fb6d3&pid=13639108097&ftid=5224&presult=testtesttest&status=1
    public static AjaxResult AddTbDeprocess(String txid, String pid, String ftid, String presult, String status){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/AddTbDeprocess?txid="+txid+"&pid="+pid+"&ftid="+ftid+"&presult="+presult+"&status="+status), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<DeprocessAddResult>(){}.getType();
            DeprocessAddResult result = gson.fromJson(json, type);
            if(result.getD().getS()){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
