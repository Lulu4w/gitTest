<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-01-09
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="z" uri="http://www.js.com/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>技术需求</title>

    <%@include file="/WEB-INF/headerLte.jsp"%>
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="">

    <!-- Content Wrapper. Contains page content -->
    <div class="">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                技术需求
                <small>处理进度</small>
            </h1>

        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary ">
                        <div class="box-header">
                            <div class=" row col-xs-1">


                                <div class="col-xs-3 col-sm-3 col-md-3">
                                    <button type="button" style="width: 100px;" class="btn btn-block btn-primary col-xs-3" href="javascript:;" onclick="department_add('添加进度','<%=ctxPath%>/Studio?action=deprocessAdd&txid=${txid}','800','500')">添加进度</button>
                                </div>

                            </div>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-hover">

                                <thead class="bg-gray-light">
                                <tr>
                                    <th width="90">处理时间</th>
                                    <th width="100">处理状态</th>
                                    <th width="60">处理人</th>
                                    <th width="90">处理人电话</th>
                                    <th width="90">处理人单位</th>
                                    <th width="90">处理意见</th>

                                    <th class="col-xs-1">操作</th>
                                </tr>
                                </thead>


                                <tbody>

                                <c:forEach items="${deprocess}" var="dep"  varStatus="status">
                                    <tr>
                                        <td>${dep.GDATE}</td>
                                        <td>
                                            <c:if test="${dep.STATUS eq '0'}">待处理</c:if>
                                            <c:if test="${dep.STATUS eq '1'}">正在处理</c:if>
                                            <c:if test="${dep.STATUS eq '2'}">移交上级</c:if>
                                            <c:if test="${dep.STATUS eq '3'}">审核未通过</c:if>
                                            <c:if test="${dep.STATUS eq '4'}">已处理完成</c:if>
                                        </td>
                                        <td>${pNames[status.index]}</td>
                                        <td>${pPhones[status.index]}</td>
                                        <td>${pUnits[status.index]}</td>

                                        <td>${dep.PRESULT}</td>
                                        <td class="col-xs-1">
                                            <a title="删除" href="javascript:;" onclick="phmac_del(this,'${dep.PROSSID}')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-trash"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>

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



    </div>
    <!-- /.content-wrapper -->



</div>
<!-- ./wrapper -->

<script type="text/javascript">
    $(function () {
        $('#example2').DataTable({
            'paging'      : false,
            'lengthChange': false,
            'searching'   : false,
            'ordering'    : true,
            'info'        : false,
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




    /*改变状态*/
    function changNum(Num) {
        location.replace("<%=ctxPath%>/Studio?action=demandList&tid="+Num);

    }

    function phmac_del(obj, id) {
        layer.confirm('确认删除该条需求吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '<%=ctxPath%>/Studio',
                data:{
                    action:'demandDelete',
                    mainid:id,
                },
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

    /*处理进度*/
    function deprocess_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

    /*添加进度*/
    function department_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

</script>
</body>
</html>