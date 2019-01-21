<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 18-9-12
  Time: 下午12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="z" uri="http://www.js.com/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="/WEB-INF/header.jsp" %>
    <title>人才管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 工作台 <span class="c-gray en">&gt;</span> 人才管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

    <div class="text-c">
        <input type="text" class="input-text" style="width:250px" placeholder="输入名称或电话" id="nameortel" name="nameortel"/>
        <%--<input type="button" class="btn btn-success radius" id="btnSearch" name="btnSearch><i class="Hui-iconfont">&#xe665;</i> 搜索</input>--%>
        <a href="javascript:;" onClick="searchAbility()" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索</a>
    </div>

    <div class="col-xs-1">
        <span class="col-xs-1">
            <c:if test="${audit eq '0'}">
                <a href="javascript:;"  onClick="member_shenheOkAll(this)"  class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量审核</a>
            </c:if>
        </span>&nbsp;
        <span class="l">
            <select class="select" size="1" name="audit" onchange="changNum(this.value)">
                <option value="0" <c:if test="${audit eq '0'}">selected</c:if>>未审核</option>
                <option value="1" <c:if test="${audit eq '1'}">selected</c:if>>已审核</option>
                <option value="2" <c:if test="${audit eq '2'}">selected</c:if>>审核未通过</option>
            </select>
        </span>
        <span class="r">共有数据：<strong>${totalCount }</strong> 条</span>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">

                <th width="100">用户名</th>
                <th width="40">人才类别</th>
                <th width="90">工作单位</th>
                <th width="100">审核</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${abilities}" var="ability">
                <tr class="text-c">
                    <td><u style="cursor:pointer" class="text-primary" onclick="member_show('${ability.PNAME}','<%=ctxPath%>/Studio?action=abilityInfo&pid=${ability.PID}','${ability.PID}','360','400')">${ability.PNAME}</u></td>
                    <td>${ability.PTYPE}</td>
                    <td>${ability.PJOBPLACE}</td>

                    <td class="td-manage">
                        <a style="text-decoration:none" onClick="member_shenheOk(this,'${ability.PID}')" href="javascript:;" title="审核">通过</a>&nbsp;&nbsp;
                        <a style="text-decoration:none" onClick="member_shenheNotOk(this,'${ability.PID}')" href="javascript:;" title="审核">不通过</a>
                    </td>

                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
    <z:pager urlFormat="${ctxPath}/Studio?action=abilityPageData&regionId=${regionId}&audit=${audit}&pageIndex={pageNum}" pageSize="15" totalCount="${totalCount }" currentPageNum="${pageNo }"/>
</div>

<script type="text/javascript">

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


</script>
</body>
</html>