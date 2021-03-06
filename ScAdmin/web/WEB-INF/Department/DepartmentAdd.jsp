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
    <title>添加单位</title>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-add">
        <input type="hidden" name="action" value="departmentAddSubmit"/>

        <%--<div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>单位(部门)名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="UNAME" name="UNAME">
            </div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" id="btnSave" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>--%>


        <div class="col-md-6">
            <div class="box-body">
                <div class="form-group">
                    <label for="UNAME"><span class="c-red">*</span>单位(部门)名称：</label>
                    <input type="text" class="form-control" value="${uname}" id="UNAME" name="UNAME" placeholder="输入单位名称">
                </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <input type="button" id="btnSave" class="btn btn-primary" value="确定"/>
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
                url:"<%=ctxPath%>/Studio",type:"post",
                data:data,
                success:function(result){
                    if(result.status=="ok")
                    {
                        parent.location.reload();//刷新父窗口
                    }
                    else
                    {
                        alert("保存失败"+result.msg);
                    }
                },
                error:function(){alert("保存网络请求失败");}
            });
        });
    });
</script>
</body>
</html>
