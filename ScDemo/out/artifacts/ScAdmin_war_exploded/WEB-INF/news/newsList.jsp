<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 18-9-12
  Time: 下午12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="z" uri="http://www.js.com/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="/WEB-INF/header.jsp" %>
    <title>单位(部门)列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 工作台 <span class="c-gray en">&gt;</span> 通知公告 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="member_show('发布通知','<%=ctxPath%>/Studio?action=newsAdd','800','500')" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe600;</i> 发布通知公告
            </a>
        </span>&nbsp;&nbsp;
        <span class="l">
            <select class="select" size="1" name="audit" onchange="changNum(this.value)">
                <option value="0" <c:if test="${readType eq '0'}">selected</c:if>>全部</option>
                <option value="1" <c:if test="${readType eq '1'}">selected</c:if>>未读</option>
                <option value="2" <c:if test="${readType eq '2'}">selected</c:if>>已读</option>
            </select>
        </span>
        <span class="r">共有数据：<strong>${totalCount}</strong> 条</span>
    </div>


    <div class="tabCon bk-gray pd-10" role="tabpanel" data-filtered="filtered" style="display: block;">
        <div class="artlistimg">
            <ul>
                <c:forEach items="${newsDS}" var="news">
                    <li>
                        <div class="row">
                            <a href="javascript:void(0);" onclick="member_show('通知公告','<%=ctxPath%>/Studio?action=newsShow&mainid=${news.MAINID}')">

                                <div class="col-xs-12 col-sm-12">
                                    <h3>
                                        ${news.NEWSTITLE}
                                    </h3>
                                    <p style="height: 40px">${news.NEWSCOTENT}</p>
                                    <hr/>
                                    <p >来自&nbsp;${news.SENDERUnit}&nbsp;&nbsp;  ${news.GDATE}</p>
                                </div>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <div style="clear: both"></div>
        </div>
        <z:pager urlFormat="${ctxPath}/Studio?action=newsList&readType=${readType}&pageIndex={pageNum}" pageSize="5" totalCount="${totalCount }" currentPageNum="${pageNo }"/>

    </div>


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
