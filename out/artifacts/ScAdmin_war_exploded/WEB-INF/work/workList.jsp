<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 18-9-15
  Time: 下午4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="z" uri="http://www.js.com/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/header.jsp" %>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>



    <c:forEach items="${workListDS}" var="work" varStatus="status">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-1">
                        <img style="border-radius: 50px" height="50px" width="50px" src="${work.avatar}" >
                    </div>
                    <div class="col-md-11">
                        <h3 class="panel-title">${work.name}</h3>
                        <div style="color: gray">
                            ${work.rencai_type}
                        </div>
                    </div>
                    <div class="col-md-1" style="text-align: right">${work.create_time}</div>
                </div>
            </div>
            <div class="panel-body">
                ${work.work_content}
                <div>
                    <c:forEach items="${work.do_ImageView}" var="img">
                    <img style="margin: 10px" height="150px" src="${img}" onclick="member_show('图片查看','${img}',800,800)" >
                    </c:forEach>
                </div>

                <div>
                    <span class="glyphicon glyphicon-map-marker" aria-hidden="true" style="color: lightskyblue"/>
                    ${work.address}
                </div>
            </div>
            <div class="panel-footer" style="text-align: right">
                <div>
                    <label onclick="dianzan('<%=ctxPath%>/Work?action=dianzan&pid=${work.pid}&ptel=${work.ptel}&workid=${work.workid}')" >
                    <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true" style="color: gray"/>
                        ${work.dianzan}
                    <c:if test="${work.dianzan_ed eq 'true'}">
                        已点赞
                    </c:if>
                    </label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <label  onclick="member_show('评论','<%=ctxPath%>/Work?action=commentAdd&reserver=${work.pid}&reservertel=${work.ptel}&workid=${work.workid}&remark=0')" >
                    <span class="glyphicon glyphicon-comment" aria-hidden="true" style="color: gray"/>
                        ${work.comment}

                    </label>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


                </div>

            </div>
            <div class="panel-footer" style="text-align: left">
                <div>
                    <c:forEach items="${comments[status.index].d}" var="comment">
                        <c:if test="${comment.remark eq 'false'}">
                            <a href="javascript:;" onclick="member_show('回复评论','<%=ctxPath%>/Work?action=commentAdd&name=${comment.pname}&workid=${comment.workid}&remark=1')">
                                ${comment.pname}&nbsp;回复&nbsp;${comment.reservename}:${comment.content}<br>
                            </a>
                        </c:if>
                        <c:if test="${comment.remark eq 'true'}">
                            <a href="javascript:;" onclick="member_show('回复评论','<%=ctxPath%>/Work?action=commentAdd2&name=${comment.pname}&workid=${comment.workid}&remark=1')">
                                &nbsp;&nbsp;&nbsp;${comment.pname}&nbsp;回复&nbsp;${comment.reservename}:${comment.content}<br>
                            </a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>


        </div>
    </c:forEach>
    <z:pager urlFormat="${ctxPath}/Work?action=workList&pageIndex={pageNum}" pageSize="10" totalCount="${totalCount }" currentPageNum="${pageNo }"/>



<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript">
    function member_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

    function dianzan(url){
        $.ajax({
            type: 'POST',
            url: url,
            success: function(result){


                layer.msg('已点赞!',{icon:1,time:1000});
                // location.replace(location.href);

            },
            error:function(data) {
                console.log(data.msg);
            },
        });
    };




</script>

</body>
</html>