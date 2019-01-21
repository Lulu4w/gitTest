<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 18-9-8
  Time: 下午4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="/WEB-INF/headerLte.jsp" %>
    <title>添加评论</title>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-add">
        <input type="hidden" name="action" value="commentAddSubmit"/>
        <input type="hidden" name="workid" value="${workid}"/>
        <input type="hidden" name="reserver" value="${reserver}"/>
        <input type="hidden" name="reservertel" value="${reservertel}"/>
        <input type="hidden" name="remark" value="${remark}"/>


        <div class="row cl">
            <div class="col-xs-1"></div>
            <div class="col-md-6 col-xs-10">
                <div class="box-body">
                    <div class="form-group">
                        <label for="content"><span class="c-red">*</span>评论内容：</label>
                        <textarea class="form-control col-lg-5" id="content" name="content" placeholder="输入评论内容"></textarea>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" class="btn btn-block btn-primary" id="btnSave" class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>

    </form>
</article>

<script type="text/javascript">
    $(function(){

        //必须放到页面初始化的时候，不能放到按钮点击里面
        var validForm = $("#form-add").Validform({tiptype:2});//初始化校验器
        $("#btnSave").click(function(){
            if(validForm.check(false)==false)//表单校验不通过
            {
                return;
            }

            var data = $("#form-add").serializeArray();//<input type="hidden" name="action" value="addSubmit"/>
            $.ajax({
                url:"<%=ctxPath%>/Work",type:"post",
                data:data,
                success:function(result){
                    if(result.status=="ok")
                    {
                        parent.location.reload();//刷新父窗口
                    }
                    else
                    {
                        alert("评论失败"+result.msg);
                    }
                },
                error:function(){alert("网络请求失败");}
            });
        });
    });
</script>
</body>
</html>
