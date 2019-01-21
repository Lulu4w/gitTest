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
<div class="wrapper">

    <%@include file="/WEB-INF/navbar.jsp"%>
    <%@include file="/WEB-INF/sidebar.jsp"%>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                技术需求
                <small>技术需求列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<%=ctxPath%>/Index?action=index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">技术需求</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary ">
                        <div class="box-header">
                            <div class=" row col-xs-1">

                                <span class="l">
                                    <select class="select" size="1" name="audit" onchange="changNum(this.value)">
                                        <option value="0" <c:if test="${presult eq '0'}">selected</c:if>>未审核</option>
                                        <option value="1" <c:if test="${presult eq '1'}">selected</c:if>>审核通过</option>
                                        <option value="2" <c:if test="${presult eq '2'}">selected</c:if>>审核未通过</option>
                                    </select>
                                </span>
                            </div>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-hover">

                                <thead class="bg-gray-light">
                                <tr>
                                    <th width="100">人才名称</th>
                                    <th width="40">工作单位</th>
                                    <th width="90">联系电话</th>
                                    <th width="90">原登录手机型号</th>
                                    <th width="90">原系统版本</th>
                                    <th width="90">新登录手机型号</th>
                                    <th width="90">新系统版本</th>
                                    <th width="90">申请时间</th>
                                    <th width="90">审核人</th>
                                    <th width="90">审核结果</th>
                                    <th width="90">审核时间</th>

                                    <th class="col-xs-1">审核</th>
                                </tr>
                                </thead>


                                <tbody>

                                <c:forEach items="${phmacs}" var="phmac">
                                    <tr>
                                        <td>${phmac.PName}</td>
                                        <td>${phmac.PUnit}</td>
                                        <td>${phmac.PID}</td>
                                        <td>${phmac.DEVICENAMEOLD}</td>
                                        <td>${phmac.OSOLD}&nbsp;${phmac.OSVERSIONOLD}</td>
                                        <td>${phmac.DEVICENAMENEW}</td>
                                        <td>${phmac.OSNEW}&nbsp;${phmac.OSVERSIONNEW}</td>
                                        <td>${phmac.GDATE}</td>
                                        <td>${phmac.AUNAME}</td>
                                        <td>${phmac.PRESULT}</td>
                                        <td>${phmac.AUDATE}</td>
                                        <td class="col-xs-1">

                                            <a style="text-decoration:none" onClick="member_shenheOk(this,'${phmac.PHID}')" href="javascript:;" title="审核">通过</a>&nbsp;&nbsp;
                                            <a style="text-decoration:none" onClick="member_shenheNotOk(this,'${phmac.PHID}')" href="javascript:;" title="审核">不通过</a>&nbsp;&nbsp;

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
            <z:pager urlFormat="${ctxPath}/Studio?action=phmacPageData&presult=${presult}&pageIndex={pageNum}" pageSize="15" totalCount="${totalCount }" currentPageNum="${pageNo }"/>

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
            'paging'      : false,
            'lengthChange': false,
            'searching'   : false,
            'ordering'    : true,
            'info'        : false,
            'autoWidth'   : true,
            'bStateSave'  : true,
            "pageLength" : 10,

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




    /*改变审核状态*/
    function changNum(Num) {
        location.replace("${ctxPath}/Studio?action=phmacPageData&presult="+Num+"&pageIndex=1&pageSize=15");

    }

    function phmac_del(obj, id) {
        layer.confirm('确认删除该条申请吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '<%=ctxPath%>/Studio',
                data:{
                    action:'phmacDelete',
                    phid:id,
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


    /*用户-审核*/
    function member_shenheOk(obj,id){
        layer.confirm('确认审核通过吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '<%=ctxPath%>/Studio',
                data:{
                    action:'phmacAudit',
                    phid:id,
                    presult:1,
                    auditId:${auditId},
                },
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已通过!',{icon:1,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }

    function member_shenheNotOk(obj,id){
        layer.confirm('确认审核不通过吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '<%=ctxPath%>/Studio',
                data:{
                    action:'phmacAudit',
                    phid:id,
                    presult:2,
                    auditId:${auditId},
                },
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('审核未通过!',{icon:1,time:1000});
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