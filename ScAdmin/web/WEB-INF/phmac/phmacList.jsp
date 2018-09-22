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
    <title>登录设备管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 工作台 <span class="c-gray en">&gt;</span> 登录设备管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <select class="select" size="1" name="audit" onchange="changNum(this.value)">
                <option value="0" <c:if test="${presult eq '0'}">selected</c:if>>未审核</option>
                <option value="1" <c:if test="${presult eq '1'}">selected</c:if>>审核通过</option>
                <option value="2" <c:if test="${presult eq '2'}">selected</c:if>>审核未通过</option>
            </select>
        </span>
        <span class="r">共有数据：<strong>${totalCount }</strong> 条</span>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">

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

                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${phmacs}" var="phmac">
                <tr class="text-c">
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


                    <td class="td-manage">
                        <a style="text-decoration:none" onClick="member_shenheOk(this,'${phmac.PHID}')" href="javascript:;" title="审核">通过</a>&nbsp;&nbsp;
                        <a style="text-decoration:none" onClick="member_shenheNotOk(this,'${phmac.PHID}')" href="javascript:;" title="审核">不通过</a>&nbsp;&nbsp;
                        <a title="删除" href="javascript:;" onclick="phmac_del(this,'${phmac.PHID}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
                    </td>

                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
    <z:pager urlFormat="${ctxPath}/Studio?action=phmacPageData&presult=${presult}&pageIndex={pageNum}" pageSize="15" totalCount="${totalCount }" currentPageNum="${pageNo }"/>
</div>

<script type="text/javascript">

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