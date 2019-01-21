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
                                        <option value="01" <c:if test="${tid eq '01'}">selected</c:if>>中药材类</option>
                                        <option value="02" <c:if test="${tid eq '02'}">selected</c:if>>茶叶类</option>
                                        <option value="03" <c:if test="${tid eq '03'}">selected</c:if>>蔬菜类</option>
                                        <option value="04" <c:if test="${tid eq '04'}">selected</c:if>>食用菌类</option>
                                        <option value="05" <c:if test="${tid eq '05'}">selected</c:if>>精品水果类</option>
                                        <option value="06" <c:if test="${tid eq '06'}">selected</c:if>>生态养殖类</option>
                                        <option value="07" <c:if test="${tid eq '07'}">selected</c:if>>干果类</option>
                                        <option value="08" <c:if test="${tid eq '08'}">selected</c:if>>马铃薯类</option>
                                        <option value="09" <c:if test="${tid eq '09'}">selected</c:if>>其他</option>
                                    </select>
                                </span>
                            </div>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-hover">

                                <thead class="bg-gray-light">
                                <tr>
                                    <th width="100">需求类型</th>
                                    <th width="40">需求人数</th>
                                    <th width="90">是否有贫困户</th>
                                    <th width="90">是否已有产业支撑</th>
                                    <th width="90">报送人</th>
                                    <th width="90">联系电话</th>
                                    <th width="90">报送时间</th>
                                    <th width="90">需求地点</th>
                                    <th width="90">处理进度</th>
                                    <th width="90">技术需求详细描述</th>

                                    <th class="col-xs-1">审核</th>
                                </tr>
                                </thead>


                                <tbody>

                                <c:forEach items="${demands}" var="demand"  varStatus="status">
                                    <tr>
                                        <td>${typeNames[status.index]}</td>
                                        <td>${demand.TPOP}</td>
                                        <td>${demand.ISPOOR}</td>
                                        <td>${demand.ISDUSTY}</td>
                                        <td>${pNames[status.index]}</td>
                                        <td>${pPhones[status.index]}</td>
                                        <td>${demand.GDATE}</td>
                                        <td>${demand.TADDRESS}</td>
                                        <td>
                                            <c:if test="${demand.TSTATUS eq '0'}">待处理</c:if>
                                            <c:if test="${demand.TSTATUS eq '1'}">正在处理</c:if>
                                            <c:if test="${demand.TSTATUS eq '2'}">移交上级</c:if>
                                            <c:if test="${demand.TSTATUS eq '3'}">审核未通过</c:if>
                                            <c:if test="${demand.TSTATUS eq '4'}">已处理完成</c:if>
                                        </td>
                                        <td>${demand.TXCONTENT}</td>
                                        <td class="col-xs-1">
                                            <a style="text-decoration:none" onClick="deprocess_show('处理进度','<%=ctxPath%>/Studio?action=deprocessList&txid=${demand.TXID}','${demand.TXID}')" href="javascript:;" title="处理进度">处理进度</a>&nbsp;&nbsp;
                                            <a title="删除" href="javascript:;" onclick="phmac_del(this,'${demand.TXID}')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-trash"></i></a>



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
            'paging'      : false,
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

</script>
</body>
</html>