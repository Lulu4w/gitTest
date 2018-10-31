package cn.edu.gues.ScDemo.admin.utils.Department;

import cn.edu.gues.ScDemo.tools.AjaxResult;
import cn.edu.gues.ScDemo.tools.CommonUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.net.URL;

public class DepartmentAPI {
    public static DepartmentResult TbUnitByqid(String regionId) {
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/TbUnitByqid?qid="+ regionId), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<DepartmentResult>(){}.getType();
            return gson.fromJson(json, type);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static AjaxResult AddTbunit(String uname, String funo, String quno, String pid) {
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/AddTbunit?uname="+ uname +"&funo="+funo+"&quno=5224&pid="+pid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<DepartmentAddResult>(){}.getType();
            DepartmentAddResult result = gson.fromJson(json, type);
            if(result.getD().getS().equals("true")){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error", result.getD().getMsg());
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static DepartmentEditResult TbUnitByName(String uname){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/TbUnitByName?uname="+ uname), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<DepartmentEditResult>(){}.getType();
            return gson.fromJson(json, type);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static AjaxResult UpdateTbunit(String uno, String uname, String funo, String quno, String pid) {
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/UpdateTbunit?uno="+uno+"&uname="+ uname +"&funo="+funo+"&quno=5224&pid="+pid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<DepartmentAddResult>(){}.getType();
            DepartmentAddResult result = gson.fromJson(json, type);
            if(result.getD().getS().equals("true")){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error", result.getD().getMsg());
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static AjaxResult DeleteTbunit(String mainid) {
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/DeleteTbunit?mainid="+mainid), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<DepartmentAddResult>(){}.getType();
            DepartmentAddResult result = gson.fromJson(json, type);
            if(result.getD().getS().equals("true")){
                return new AjaxResult("ok");
            } else{
                return new AjaxResult("error", result.getD().getMsg());
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
