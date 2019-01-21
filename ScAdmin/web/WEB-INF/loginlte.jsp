<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-01-07
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin | 登录</title>
    <%@include file="headerLte.jsp"%>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="#"><b>Admin</b></a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登录&nbsp;&nbsp;|&nbsp;&nbsp;开始你的管理</p>

        <form id="formLogin" method="post">
            <input type="hidden" name="action" value="loginSubmit"/>
            <div class="form-group has-feedback">
                <input type="text" id="phoneNum" name="phoneNum" class="form-control" placeholder="输入账号" value="13639108097"/>
                <span class="glyphicon glyphicon-phone form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" id="password" name="password" class="form-control" placeholder="输入密码" value="123456"/>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
        </form>
        <div class="row">

            <div class="col-xs-12">
                <button type="submit" id="btnLogin" class="btn btn-primary btn-block btn-flat">点击登录</button>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.social-auth-links -->
        <br/>
        <a href="#">忘记密码?</a><br>
        <%--<a href="register.html" class="text-center">Register a new membership</a>--%>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<script type="text/javascript">
    $(function(){
        /*$("#imgVerifyCode").click();*/
        /*$("#imgVerifyCode,#kanbuq").click(function(){
            $("#imgVerifyCode").attr("src","<%=ctxPath%>/Index?action=verifyCode&ts="+Math.random());
		});*/

        $("#btnLogin").click(function(){
            var data = $("#formLogin").serializeArray();
            $.ajax({
                type:"post",
                url:"<%=ctxPath%>/Index",
                data:data,
                success:function(result){
                    if(result.status == "ok"){
                        location.href="<%=ctxPath%>/Index?action=index";
                    } else{

                        alert("登录出错" + result.msg);
                        $("#imgVerifyCode").click();
                    }
                },
                error:function(){
                    alert("登录请求失败");
                }
            });
        });
    });
</script>

</body>
</html>
