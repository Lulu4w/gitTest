<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 18-9-16
  Time: 下午8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="/WEB-INF/header.jsp" %>
    <title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 人才管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

    <div class="text-c">
        <button type="button" class="btn btn-success radius" id="btnOk" name="btnOk"><i class="Hui-iconfont">&#xe665;</i> 确定</button>
        <div class="formControls col-xs-4 col-sm-2">
                    <span class="select-box">
                        <select name="region1" class="select" id="region1">
                            <option value="0" selected>请选择地区</option>
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

    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">

        </span>
    </div>


    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <td width="80" colspan="3">科技副职</td>
                <td width="80" colspan="3">科技特派员</td>
                <td width="80" colspan="3">农业辅导员</td>
            </tr>
            </thead>
            <tbody>
            <tr class="text-c">
                <td>省级 ${cityTotalD.skjfz}</td> <td>市级 ${cityTotalD.ckjfz}</td> <td>县级 ${cityTotalD.xkjfz}</td>
                <td>省级 ${cityTotalD.skjtpy}</td> <td>市级 ${cityTotalD.ckjtpy}</td> <td>县级 ${cityTotalD.xkjtpy}</td>
                <td>省级 ${cityTotalD.snyfdy}</td> <td>市级 ${cityTotalD.cnyfdy}</td> <td>县级 ${cityTotalD.xnyfdy}</td>
            </tr>


            </tbody>
        </table>
        <br/><br/>
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <td width="240" colspan="3">重点学科、重点产业人才团队  ${cityTotalD.rctd}</td>
            </tr>
            </thead>
            <tbody>
            <tr class="text-c">
                <td>驻村干部 ${cityTotalD.zcgb}</td> <td>专家服务团 ${cityTotalD.zjfwt}</td> <td>回乡创业人才 ${cityTotalD.hxcy}</td>
            </tr>
            <tr class="text-c">
                <td>乡土人才 ${cityTotalD.xtrc}</td> <td>领办创办人员 ${cityTotalD.lbcbry}</td> <td>领办创办项目 ${cityTotalD.project}</td>
            </tr>
            <tr class="text-c">
                <td>医院 ${cityTotalD.hospital}</td> <td>学校 ${cityTotalD.school}</td> <td>专家组成员数 ${cityTotalD.zjzcy}</td>
            </tr>


            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">
    $(function(){

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
    /*用户-添加*/
    function member_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*用户-查看*/
    function member_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }



    $("#btnOk").click(function(){
        var region1 = $("#region1").val();
        var region2 = $("#region2").val();
        var region3 = $("#region3").val();
        var url = "<%=ctxPath%>/Manage?action=manageList&region1="+region1+"&region2="+region2+"&region3="+region3;
        $.ajax({
            url:url,
            type:"post",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success:function(result){
                location.replace(url);
            },
            error:function(){alert("网络请求失败");}
        });

    });




    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }
</script>
</body>
</html>