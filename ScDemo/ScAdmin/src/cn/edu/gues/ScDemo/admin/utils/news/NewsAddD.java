package cn.edu.gues.ScDemo.admin.utils.news;

public class NewsAddD {
    //{"d":{"__type":"PeopleResult:#WcfService2","Maindid":null,"Msg":"添加成功","s":true}}
    private String __type;
    private String Maindid;
    private String Msg;
    private boolean s;

    public String get__type() {
        return __type;
    }

    public void set__type(String __type) {
        this.__type = __type;
    }

    public String getMaindid() {
        return Maindid;
    }

    public void setMaindid(String maindid) {
        Maindid = maindid;
    }

    public String getMsg() {
        return Msg;
    }

    public void setMsg(String msg) {
        Msg = msg;
    }

    public boolean isS() {
        return s;
    }

    public void setS(boolean s) {
        this.s = s;
    }
}
