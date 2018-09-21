package cn.edu.gues.ScDemo.admin.utils.work;

public class CommentListD {
    //{"d":[{"__type":"commentlist:#WcfService2","chicheng":",,科技副职,","content":"评论测试","gdate":"2018\/9\/15 10:01:16","picUrl":"","pname":"王似超","remark":false,"reservename":"郑德富","workid":"b5dfcebf-0d05-4e28-a1be-2eff51d06d06"}]}
    private String __type;
    private String chicheng;
    private String content;
    private String gdate;
    private String picUrl;
    private String pname;
    private String remark;
    private String reservename;
    private String workid;

    public String get__type() {
        return __type;
    }

    public void set__type(String __type) {
        this.__type = __type;
    }

    public String getChicheng() {
        return chicheng;
    }

    public void setChicheng(String chicheng) {
        this.chicheng = chicheng;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getGdate() {
        return gdate;
    }

    public void setGdate(String gdate) {
        this.gdate = gdate;
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getReservename() {
        return reservename;
    }

    public void setReservename(String reservename) {
        this.reservename = reservename;
    }

    public String getWorkid() {
        return workid;
    }

    public void setWorkid(String workid) {
        this.workid = workid;
    }
}
