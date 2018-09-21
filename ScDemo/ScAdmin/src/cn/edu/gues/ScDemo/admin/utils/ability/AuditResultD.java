package cn.edu.gues.ScDemo.admin.utils.ability;

public class AuditResultD {
    //{"d":{"__type":"PeopleResult:#WcfService2","Maindid":"bfe8c1e1-fbc1-4c17-b12f-757b85f59566","Msg":"审核成功","s":true}}
    private String __type;
    private String Maindid;
    private String Msg;
    private String s;

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

    public String getS() {
        return s;
    }

    public void setS(String s) {
        this.s = s;
    }
}
