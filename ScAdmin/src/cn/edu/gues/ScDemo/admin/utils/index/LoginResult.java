package cn.edu.gues.ScDemo.admin.utils.index;

public class LoginResult {
    //{"d":{"__type":"LeaderResult:#WcfService2","Msg":"登录成功","peo":{"__type":"TB_LEADER:#WcfService2","CID":null,"GDATE":"2018\/8\/31 11:42:42","LDEPART":"贵工程16王似超","LNAME":"王似超","LPASSWORD":"123456","LPOST":"开发人员","LTEL":"18334193638","PID":"13639108097","REGIONID":"5224","REGIONNAME":"毕节市","TID":null,"picPath":""},"s":true}}
    private LoginD d;

    public LoginD getD() {
        return d;
    }

    public void setD(LoginD d) {
        this.d = d;
    }
}
