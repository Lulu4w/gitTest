package cn.edu.gues.ScDemo.admin.utils.stat;

import cn.edu.gues.ScDemo.tools.CommonUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.net.URL;

public class StatAPI {

        //http://61.159.180.166:8036/Service2.svc/CityTotal?regionid=5224
    //http://61.159.180.166:8036/Service2.svc/QueryRegionTotal?regionid=5224

    public static CityTotalResult GroupByCountyTotal(String regionId){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/GroupByCountyTotal?regionid=" + regionId), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<CityTotalResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static QueryRegionTotalResult QueryRegionTotal(String regionId){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/QueryRegionTotal?regionid=" + regionId), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<QueryRegionTotalResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/PnumByRegion?regionid=5224
    public static PnumByRegionResult PnumByRegion(String regionId){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/PnumByRegion?regionid=" + regionId), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<PnumByRegionResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/ZjzTypeByRegion?regionid=5224
    public static ZjzByRegionResult ZjzTypeByRegion(String regionId){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/ZjzTypeByRegion?regionid=" + regionId), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<ZjzByRegionResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/TrainTotolByRegion?regionid=5224
    public static TrainResult TrainTotolByRegion(String regionId){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/TrainTotolByRegion?regionid=" + regionId), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<TrainResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //http://61.159.180.166:8036/Service2.svc/WorkTotolByRegion?regionid=5224
    public static WorkTotalResult WorkTotolByRegion(String regionId){
        try {
            String json = IOUtils.toString(new URL("http://61.159.180.166:8036/Service2.svc/WorkTotolByRegion?regionid=" + regionId), "UTF-8");
            Gson gson = CommonUtils.createGson();
            java.lang.reflect.Type type = new TypeToken<WorkTotalResult>(){}.getType();
            return gson.fromJson(json, type);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}


