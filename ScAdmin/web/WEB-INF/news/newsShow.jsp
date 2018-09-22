<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 18-9-12
  Time: 下午10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="/WEB-INF/header.jsp" %>
    <title>通知公告</title>
</head>
<body>
<center>
<span class="f-18">${news.NEWSTITLE}</span>
</center>
<div class="Hui-article">
    <article class="cl pd-20">
        <div class="panel panel-default mt-20">
            <div class="panel-header">
                <span class="pl-10 f-12">来自&nbsp;${news.SENDERUnit}</span>
                <span class="pl-10 f-12">${news.GDATE}</span>
            </div>
            <div class="panel-body">${news.NEWSCOTENT}</div>
        </div>
    </article>
</div>
</body>
</html>
