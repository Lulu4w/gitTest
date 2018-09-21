package cn.edu.gues.ScDemo.admin.utils.work;

import java.util.List;

public class CommentListResult {
    //{"d":[{"__type":"commentlist:#WcfService2","chicheng":",,科技副职,","content":"评论测试","gdate":"2018\/9\/15 10:01:16","picUrl":"","pname":"王似超","remark":false,"reservename":"郑德富","workid":"b5dfcebf-0d05-4e28-a1be-2eff51d06d06"}]}
    List<CommentListD> d;

    public List<CommentListD> getD() {
        return d;
    }

    public void setD(List<CommentListD> d) {
        this.d = d;
    }
}
