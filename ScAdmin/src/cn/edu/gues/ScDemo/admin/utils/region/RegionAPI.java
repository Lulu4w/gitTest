package cn.edu.gues.ScDemo.admin.utils.region;

import cn.edu.gues.ScDemo.tools.CommonUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.net.URL;

public class RegionAPI {
    public static RegionD QueryRegionDictById(int id){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/QueryRegionDictById?id="+id), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<RegionD>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static RegionResult QueryRegionDictByFid(String pd_id){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/QueryRegionDictByFid?pd_id="+ pd_id), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<RegionResult>(){}.getType();

            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }



}
