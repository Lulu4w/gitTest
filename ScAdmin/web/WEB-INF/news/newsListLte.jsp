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
                通知公告
                <small>通知公告列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<%=ctxPath%>/Index?action=index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">通知公告</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="box-header">

                <div class="cl pd-5 bg-1 bk-gray mt-20">
                    <span class="l">
                        <a href="javascript:;" onclick="member_show('发布通知','<%=ctxPath%>/Studio?action=newsAdd','800','500')" class="btn btn-primary radius">
                            <i class="fa  fa-plus"></i> 发布通知公告
                        </a>
                    </span>&nbsp;&nbsp;
                    <span class="l">
                        <select class="select" size="1" name="audit" onchange="changNum(this.value)">
                            <option value="0" <c:if test="${readType eq '0'}">selected</c:if>>全部</option>
                            <option value="1" <c:if test="${readType eq '1'}">selected</c:if>>未读</option>
                            <option value="2" <c:if test="${readType eq '2'}">selected</c:if>>已读</option>
                        </select>
                    </span>
                </div>
            </div>

            <div class="box-body">

                <ul>
                <c:forEach items="${newsDS}" var="news">
                    <li>
                        <a href="javascript:void(0);" onclick="member_show('通知公告','<%=ctxPath%>/Studio?action=newsShow&mainid=${news.MAINID}')">
                            <div class="callout callout-info">
                                <h4>${news.NEWSTITLE}</h4>
                                    ${news.NEWSCOTENT}
                                <hr/>
                                <p >来自&nbsp;${news.SENDERUnit}&nbsp;&nbsp;  ${news.GDATE}</p>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                </ul>

            </div>



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




    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */
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
    function department_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

    function changNum(Num) {
        location.replace("${ctxPath}/Studio?action=newsList&readType="+Num+"&pageIndex=1&pageSize=5");

    }

    function member_show(title,url,id,w,h){
        var index = layer.open({
            type: 2,
            title: title,
            content: url,
        });
        layer.full(index);
    }

</script>
</body>
</html>