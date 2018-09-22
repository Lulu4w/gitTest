<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 18-9-8
  Time: 下午4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="/WEB-INF/header.jsp" %>
    <title>添加单位</title>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-add">
        <input type="hidden" name="action" value="newsAddSubmit"/>
        <input type="hidden" name="txid" value="${txid}"/>


        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">发送给：</label>
            <div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select name="ptype" class="select" id="ptype">
					<option value="all" selected>发送全部人才</option>
					<option value="0">科级副职</option>
					<option value="1">科技特派员</option>
					<option value="2">农业辅导员</option>
					<option value="3">领办创办人员</option>
					<option value="4">乡土人才</option>
					<option value="5">回乡创业人才</option>
					<option value="6">驻村干部</option>
					<option value="7">村支书</option>
					<option value="8">村主任</option>
					<option value="9">第一书记</option>
					<option value="10">管理员</option>
				</select>
				</span>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">发送地区（默认毕节市）：</label>
            <div class="formControls col-xs-4 col-sm-2">
				<span class="select-box">
                    <select name="region1" class="select" id="region1">
                        <option value="all" selected>请选择地区</option>
                    </select>
                </span>
            </div>
            <div class="formControls col-xs-4 col-sm-2">
				<span class="select-box">
                    <select name="region2" class="select" id="region2">
                        <option value='0' selected>请选择乡(镇)</option>
                    </select>
                </span>
            </div>
            <div class="formControls col-xs-4 col-sm-2">
				<span class="select-box">
                    <select name="region3" class="select" id="region3">
                       <option value='0' selected>请选择村(街道)</option>
                    </select>
                </span>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入标题" id="newstitle" name="newstitle">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">消息内容：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="newscontent" id="newscontent" cols="" rows="" class="textarea"  placeholder="请输入内容（2000字以内）" datatype="*0-2000" dragonfly="true" onKeyUp="$.Huitextarealength(this,2000)"></textarea>
            </div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" id="btnSave" type="button" value="&nbsp;&nbsp;发布&nbsp;&nbsp;">
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
                        alert("发布失败"+result.msg);
                    }
                },
                error:function(){alert("保存网络请求失败");}
            });
        });


        $.ajax({
            url:"<%=ctxPath%>/Studio",type:"post",
            data:{
                action:'getRegions',
                fid:'5224',
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
            },
            success:function(result){

                /*$.each(result.data,function(k,v){
                    alert(k +":"+ v);
                });*/

                var region2Content = "<option value='0' selected>请选择县(区)</option>";

                for(var i = 0; i < result.data.length; i++){

                    region2Content += '<option value="'+result.data[i].RD_ID+'">'+result.data[i].RD_SHORTNAME+'</option>';
                }
                    $('#region1').html(region2Content);
            },
            error:function(){alert("网络请求失败");}
        });


        $("#region1").change(function(){
            var fid = $("#region1").val();
            $.ajax({
                url:"<%=ctxPath%>/Studio",type:"post",
                data:{
                    action:'getRegions',
                    fid:fid,
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                },
                success:function(result){
                    var region2Content = "<option value='0' selected>请选择乡(镇)</option>";
                    if(result.status=="ok")
                    {
                        for(var i = 0; i < result.data.length; i++){

                            region2Content += '<option value="'+result.data[i].RD_ID+'">'+result.data[i].RD_SHORTNAME+'</option>';
                        }
                        $('#region2').html(region2Content);
                    }
                    else
                    {
                        alert("保存失败"+result.msg);
                    }
                },
                error:function(){alert("保存网络请求失败");}
            });
        });

        $("#region2").change(function(){
            var fid = $("#region2").val();
            $.ajax({
                url:"<%=ctxPath%>/Studio",type:"post",
                data:{
                    action:'getRegions',
                    fid:fid,
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                },
                success:function(result){
                    var region2Content = "<option value='0' selected>请选择村(街道)</option>";
                    if(result.status=="ok")
                    {
                        for(var i = 0; i < result.data.length; i++){

                            region2Content += '<option value="'+result.data[i].RD_ID+'">'+result.data[i].RD_SHORTNAME+'</option>';
                        }
                        $('#region3').html(region2Content);
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
