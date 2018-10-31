package cn.edu.gues.ScDemo.admin.utils.index;

import cn.edu.gues.ScDemo.admin.utils.AdminUtils;
import cn.edu.gues.ScDemo.tools.AjaxResult;
import cn.edu.gues.ScDemo.tools.CommonUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.net.URL;

public class LoginAPI {
    //http://61.159.180.166:8036/Service2.svc/Loadleader?lname=13639108097&pass=123456
    public static LoginResult Loadleader(String lname, String pass){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/Loadleader?lname="+lname+"&pass="+pass), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<LoginResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
