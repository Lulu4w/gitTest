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
    <title>单位部门</title>

    <%@include file="/WEB-INF/headerLte.jsp"%>
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%@include file="/WEB-INF/navbar.jsp"%>
    <%@include file="/WEB-INF/sidebar.jsp"%>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                单位(部门)
                <small>单位(部门)列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<%=ctxPath%>/Index?action=index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">单位部门</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary ">
                        <div class="box-header">
                            <!--<h3 class="box-title">Hover Data Table</h3>-->
                            <div class="col-xs-1">
                                <button type="button" class="btn btn-block btn-primary" href="javascript:;" onclick="department_add('添加单位','<%=ctxPath%>/Studio?action=departmentAdd','800','500')">添加单位</button>
                            </div>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-hover">

                                <thead class="bg-gray-light">
                                <tr>
                                    <th>单位名</th>
                                    <th>所属单位</th>
                                    <th class="col-xs-1">操作</th>
                                </tr>
                                </thead>


                                <tbody>

                                    <c:forEach items="${Departments}" var="dep">
                                        <tr>
                                            <td>${dep.UNAME}</td>
                                            <td>毕节市</td>
                                            <td class="col-xs-1">
                                                <a title="编辑" href="javascript:;" onclick="department_edit('单位编辑','<%=ctxPath%>/Studio?action=departmentEdit&uname=${dep.UNAME}','600','400')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-edit"></i></a>
                                                <a title="删除" href="javascript:;" onclick="department_del(this,'${dep.UNO}')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-trash"></i></a>
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
</body>
</html>