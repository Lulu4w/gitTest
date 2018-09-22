<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 18-9-6
  Time: 下午5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="/WEB-INF/header.jsp" %>
    <title>单位(部门)列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 工作台 <span class="c-gray en">&gt;</span> 单位(部门)列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="department_add('添加单位','<%=ctxPath%>/Studio?action=departmentAdd','800','500')" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe600;</i> 添加单位
            </a>
        </span>
        <span class="r">共有数据：<strong>${DepCount}</strong> 条</span>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">单位(部门)列表</th>
        </tr>
        <tr class="text-c">

            <th width="500">ID</th>
            <th>单位名</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${Departments}" var="dep">
            <tr class="text-c">
                <td>${dep.UNO}</td>
                <td>${dep.UNAME}</td>
                <td class="td-manage">
                    <a title="编辑" href="javascript:;" onclick="department_edit('单位编辑','<%=ctxPath%>/Studio?action=departmentEdit&uname=${dep.UNAME}','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                    <a title="删除" href="javascript:;" onclick="department_del(this,'${dep.UNO}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>




<script type="text/javascript">
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
</script>
</body>
</html>
