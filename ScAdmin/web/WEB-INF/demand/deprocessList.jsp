<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 18-9-12
  Time: 下午12:37
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="z" uri="http://www.js.com/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="/WEB-INF/header.jsp" %>
    <title>技术需求管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 技术需求管理 <span class="c-gray en">&gt;</span> 处理进度 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">


    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="department_add('添加进度','<%=ctxPath%>/Studio?action=deprocessAdd&txid=${txid}','800','500')" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe600;</i> 添加进度
            </a>
        </span>

    </div>

    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">

                <th width="90">处理时间</th>
                <th width="100">处理状态</th>
                <th width="40">处理人</th>
                <th width="90">处理人电话</th>
                <th width="90">处理人单位</th>

                <th width="90">处理意见</th>



                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${deprocess}" var="dep"  varStatus="status">
                <tr class="text-c">

                    <td>${dep.GDATE}</td>

                    <td>
                        <c:if test="${dep.STATUS eq '0'}">待处理</c:if>
                        <c:if test="${dep.STATUS eq '1'}">正在处理</c:if>
                        <c:if test="${dep.STATUS eq '2'}">移交上级</c:if>
                        <c:if test="${dep.STATUS eq '3'}">审核未通过</c:if>
                        <c:if test="${dep.STATUS eq '4'}">已处理完成</c:if>
                    </td>
                    <%--<td>${dep.PRESULT}</td>--%>

                    <td>${pNames[status.index]}</td>
                    <td>${pPhones[status.index]}</td>
                    <td>${pUnits[status.index]}</td>

                    <td>${dep.PRESULT}</td>

                    <td class="td-manage">
                        <a title="删除" href="javascript:;" onclick="phmac_del(this,'${dep.PROSSID}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
                    </td>

                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>


</div>

<script type="text/javascript">

    /*改变审核状态*/
    function changNum(Num) {
        location.replace("<%=ctxPath%>/Studio?action=demandList&tid="+Num);

    }

    function phmac_del(obj, id) {
        layer.confirm('确认删除该条需求吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '<%=ctxPath%>/Studio',
                data:{
                    action:'deprocessDelete',
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
    function deprocess_show(title,id,w,h){
        var index = layer.open({
            type: 2,
            title: title,
            content: '<%=ctxPath%>/Studio?action=deprocessList&txid='+id,
        });
        layer.full(index);
    }

    /*添加进度*/
    function department_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

</script>
</body>
</html>