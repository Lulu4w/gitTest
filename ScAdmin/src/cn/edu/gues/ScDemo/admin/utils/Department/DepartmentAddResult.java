package cn.edu.gues.ScDemo.admin.utils.Department;

public class DepartmentAddResult {
    //{"d":{"__type":"PeopleResult:#WcfService2","Maindid":"84b6e65e-4fc9-4495-a98e-2ebcfc226b98","Msg":"添加成功","s":true}}
    private d d;

    public DepartmentAddResult.d getD() {
        return d;
    }

    public void setD(DepartmentAddResult.d d) {
        this.d = d;
    }

    public static class d{
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
}
