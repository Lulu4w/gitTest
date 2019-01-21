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
    <%@include file="/WEB-INF/header.jsp" %>
    <title>添加单位</title>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-add">
        <input type="hidden" name="action" value="deprocessAddSubmit"/>
        <input type="hidden" name="txid" value="${txid}"/>


        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>处理状态：</label>
            <div class="formControls col-xs-4 col-sm-5">
				<span class="select-box">
				<select name="status" class="select" id="status">
					<option value="0" selected>等待处理</option>
					<option value="1">正在处理</option>
					<option value="2">移交上级</option>
					<option value="3">审核未通过</option>
					<option value="4">已处理完成</option>
				</select>
				</span>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">处理意见：</label>
            <div class="formControls col-xs-4 col-sm-5">
                <textarea name="presult" id="presult" cols="" rows="" class="textarea"  placeholder="请输入处理意见（500字以内）" datatype="*0-100" dragonfly="true" onKeyUp="$.Huitextarealength(this,500)"></textarea>
            </div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" id="btnSave" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
