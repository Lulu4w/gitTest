<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-01-03
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>人才信息</title>

    <%@include file="/WEB-INF/headerLte.jsp"%>
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%@include file="/WEB-INF/navbar.jsp"%>
    <%@include file="/WEB-INF/sidebar.jsp"%>
    <style type="text/css">
        td
        {
            text-align:center;
        }
    </style>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                人才信息
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<%=ctxPath%>/Index?action=index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">人才信息</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary ">
                        <div class="box-header">
                            <!--<h3 class="box-title">Hover Data Table</h3>-->
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
                            <div class="col-xs-1">
                                <button type="button" class="btn btn-block btn-primary" id="btnOk" name="btnOk"><i class="fa fa-fw fa-search"></i> 确定</button>
                            </div>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-hover">

                                <thead class="bg-gray-light">
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
                            <table id="example3" class="table table-bordered table-hover">

                                <thead class="bg-gray-light">
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
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->


        <%@include file="/WEB-INF/ControlSidebar.jsp"%>
        <div class="control-sidebar-bg"></div>
    </div>
    <!-- /.content-wrapper -->



</div>
<!-- ./wrapper -->

<script type="text/javascript">
    $(function () {
        $('#example2').DataTable({
            'paging'      : true,
            'lengthChange': false,
            'searching'   : true,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : true,
            'bStateSave'  : true,
            "pageLength" : 18,

            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索: ",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            }
        })
        layer.config({
            skin:"box box-primary"
        })
    })

    /*单位-增加*/
    function department_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*单位-删除*/
    function department_del(link,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                url:"<%=ctxPath%>/Studio",type:"post",
                data:{action:"delete",mainid:id},
                success:function(obj) {
                    if(obj.status=="ok") {
                        $(link).parents("tr").remove();
                        layer.msg('已删除!',{icon:1,time:1000});
                    }
                    else {
                        alert("删除失败");
                    }
                },
                error:function(){alert("删除处理失败");}
            })
        });
    }

    /*单位-编辑*/
    function department_edit(title,url,w,h){
        layer_show(title,url,w,h);
    }

</script>
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