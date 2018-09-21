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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 工作台 <span class="c-gray en">&gt;</span> 技术需求管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

    <div class="cl pd-5 bg-1 bk-gray mt-20">
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
        <%--<span class="r">共有数据：<strong>${totalCount }</strong> 条</span>--%>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">

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


                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${demands}" var="demand"  varStatus="status">
                <tr class="text-c">
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


                    <td class="td-manage">
                        <a style="text-decoration:none" onClick="deprocess_show('处理进度','<%=ctxPath%>/Studio?action=deprocessList&txid=${demand.TXID}','${demand.TXID}')" href="javascript:;" title="处理进度">处理进度</a>&nbsp;&nbsp;

                        <a title="删除" href="javascript:;" onclick="phmac_del(this,'${demand.TXID}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
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