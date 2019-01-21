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
    <title>人才管理</title>

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
                人才管理
                <small>人才列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<%=ctxPath%>/Index?action=index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">人才管理</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary ">
                        <div class="box-header">
                            <!--<h3 class="box-title">Hover Data Table</h3>-->
                            <div class="input-group col-xs-2">
                                <input type="text" class="form-control" style="width:250px" placeholder="输入名称或电话" id="nameortel" name="nameortel"/>

                                <span class="input-group-btn">
                                        <a href="javascript:;" onClick="searchAbility()" class="btn btn-info btn-flat"><i class="fa fa-search"></i> 搜索</a>
                                    </span>
                            </div>


                            <br/>
                            <div class=" row col-xs-1">
                                <span class="l">
                                    <c:if test="${audit eq '0'}">
                                        <button type="button" class="btn btn-block btn-primary" href="javascript:;" onclick="member_shenheOkAll(this)">批量审核</button>
                                    </c:if>
                                </span>
                                <span class="l">
                                    <select class="select" size="1" name="audit" onchange="changNum(this.value)">
                                        <option value="0" <c:if test="${audit eq '0'}">selected</c:if>>未审核</option>
                                        <option value="1" <c:if test="${audit eq '1'}">selected</c:if>>已审核</option>
                                        <option value="2" <c:if test="${audit eq '2'}">selected</c:if>>审核未通过</option>
                                    </select>
                                </span>
                            </div>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-hover">

                                <thead class="bg-gray-light">
                                <tr>
                                    <th>用户名</th>
                                    <th>人才类别</th>
                                    <th>工作单位</th>
                                    <th class="col-xs-1">审核</th>
                                </tr>
                                </thead>


                                <tbody>

                                <c:forEach items="${abilities}" var="ability">
                                    <tr>
                                        <td><u style="cursor:pointer" class="text-primary" onclick="member_show('${ability.PNAME}','<%=ctxPath%>/Studio?action=abilityInfo&pid=${ability.PID}','${ability.PID}','360','400')">${ability.PNAME}</u></td>
                                        <td>${ability.PTYPE}</td>
                                        <td>${ability.PJOBPLACE}</td>
                                        <td class="col-xs-2">
                                            <%--<a title="编辑" href="javascript:;" onclick="department_edit('单位编辑','<%=ctxPath%>/Studio?action=departmentEdit&uname=${dep.UNAME}','600','400')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-edit"></i></a>
                                            <a title="删除" href="javascript:;" onclick="department_del(this,'${dep.UNO}')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-trash"></i></a>--%>

                                            <a style="text-decoration:none" onClick="member_shenheOk(this,'${ability.PID}')" href="javascript:;" title="审核"><i class="fa fa-check"></i>通过</a>&nbsp;&nbsp;
                                            <a style="text-decoration:none" onClick="member_shenheNotOk(this,'${ability.PID}')" href="javascript:;" title="审核"><i class="fa fa-close"></i>不通过</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>

                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                    <z:pager urlFormat="${ctxPath}/Studio?action=abilityPageData&regionId=${regionId}&audit=${audit}&pageIndex={pageNum}" pageSize="15" totalCount="${totalCount }" currentPageNum="${pageNo }"/>
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
            'searching'   : false,
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

    /*批量审核*/
    function member_shenheOkAll(obj){
        layer.confirm('确认审核通过当前页面所有人才吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '<%=ctxPath%>/Studio',
                data:{
                    action:'AuditAll',
                    pid:'${phid}',
                    audit:1,
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

    $(function(){


        $("#btnSearch").click(function(){

            var nameortel = $("#nameortel").val();

            layer_show("搜索","${ctxPath}/Studio?action=searchNameOrTel&nameortel="+nameortel+"&pageIndex=1&pageSize=15",800,800);
        });
    });

    function searchAbility() {
        var nameortel = $("#nameortel").val();
        layer_show("搜索","${ctxPath}/Studio?action=searchNameOrTel&nameortel="+nameortel+"&pageIndex=1&pageSize=15",800,800);
    }

    /*改变审核状态*/
    function changNum(Num) {
        location.replace("${ctxPath}/Studio?action=abilityPageData&audit="+Num+"&pageIndex=1&pageSize=15");

    }


    /*用户-查看*/
    function member_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }


    /*用户-审核*/
    function member_shenheOk(obj,id){
        layer.confirm('确认审核通过吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '<%=ctxPath%>/Studio',
                data:{
                    action:'AuditOne',
                    pid:id,
                    audit:1,
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
                    action:'AuditOne',
                    pid:id,
                    audit:2,
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